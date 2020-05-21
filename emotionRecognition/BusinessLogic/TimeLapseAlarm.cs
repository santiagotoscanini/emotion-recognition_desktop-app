﻿using System;
using System.Collections.Generic;
using BusinessLogic.Enums;

namespace BusinessLogic
{
    public class TimeLapseAlarm
    {
        public Entity Entity { get; }
        public TimeSearchMethodType TimeSearchMethodType { get; }
        public uint QuantityOfTimeToSearchBack { get; }
        public AlarmPosibleState AlarmPosibleState { get; }
        public uint QuantityOfSentimentsNeeded { get; }
        public bool IsActivated { get; private set; }

        public TimeLapseAlarm(Entity entity, TimeSearchMethodType timeSearchMethodType, uint quantityOfTimeToSearchBack, AlarmPosibleState alarmPosibleState, uint quantityOfSentimentsNeeded)
        {
            if(quantityOfTimeToSearchBack == 0 ) {
                throw new ArgumentException("Cannot create an alarm with quantity of time to search back equals to zero", "quantityOfTimeToSearchBack");
            }
            if(quantityOfSentimentsNeeded == 0) {
                throw new ArgumentException("Cannot create an alarm with quantity of sentiments needed equals to zero", "quantityOfSentimentsNeeded");
            }

            Entity = entity ?? throw new ArgumentNullException("Cannot create an alarm with null entity", "entity");
            TimeSearchMethodType = timeSearchMethodType;
            QuantityOfTimeToSearchBack = quantityOfTimeToSearchBack;
            AlarmPosibleState = alarmPosibleState;
            QuantityOfSentimentsNeeded = quantityOfSentimentsNeeded;
            IsActivated = false;
        }

        public bool CheckIfAlarmIsActivated(List<Phrase> allPhrases)
        {
            DateTime beginDateToSearch = GetBeginDateToSearch();
            List<Phrase> phrasesToBeChecked = FilterPhrasesToBeChecked(allPhrases, beginDateToSearch);
            uint alarmCounter = GetNumberOfPhrases(phrasesToBeChecked);
            IsActivated = alarmCounter >= QuantityOfSentimentsNeeded;
            return IsActivated;
        }

        private DateTime GetBeginDateToSearch()
        {
            DateTime today = DateTime.Now;
            DateTime beginDateToSearch = new DateTime();

            if (TimeSearchMethodType.Equals(TimeSearchMethodType.DAYS))
            {
                beginDateToSearch = today.AddDays(-QuantityOfTimeToSearchBack);
            }
            else if (TimeSearchMethodType.Equals(TimeSearchMethodType.HOURS))
            {
                beginDateToSearch = today.AddHours(-QuantityOfTimeToSearchBack);
            }

            return beginDateToSearch;
        }

        private List<Phrase> FilterPhrasesToBeChecked(List<Phrase> allPhrases, DateTime beginDateToSearch)
        {
            return allPhrases.FindAll(phrase =>
                        phrase.Entity != null &&
                        phrase.Entity.Equals(Entity) &&
                        phrase.CreationDate.Ticks >= beginDateToSearch.Ticks &&
                        phrase.CreationDate.Ticks <= DateTime.Now.Ticks
                    );
        }
        
        private uint GetNumberOfPhrases(List<Phrase> phrasesToBeChecked)
        {
            uint alarmCounter = 0;

            foreach (Phrase phrase in phrasesToBeChecked)
            {
                bool positive = AlarmPosibleState.Equals(AlarmPosibleState.POSITIVE) && phrase.PhraseState > 0;
                bool negative = AlarmPosibleState.Equals(AlarmPosibleState.NEGATIVE) && phrase.PhraseState < 0;
                if (positive || negative) alarmCounter++;
            }
            return alarmCounter;
        }
    }
}