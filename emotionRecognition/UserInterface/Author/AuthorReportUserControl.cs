﻿using System;
using System.Windows.Forms;
using BusinessLogic;

namespace UserInterface
{
    public partial class AuthorReportUserControl : UserControl
    {
        private const string TxtNoSelectionError = "Debe elegir un autor";
        private const string TxtEmpty = "";

        private BusinessLogicController controller;
        private AuthorUserControl authorUserControl;

        public AuthorReportUserControl(BusinessLogicController controller, AuthorUserControl authorUserControl)
        {
            this.controller = controller;
            this.authorUserControl = authorUserControl;
            InitializeComponent();
            LoadAuthorsReport();
        }

        private void LoadAuthorsReport()
        {
            //TODO
        }

        private void BtnDelete_Click(object sender, EventArgs e)
        {
            ClearFields();

            if (CheckData())
            {
                String authorUsername = (string)GrdAuthors.CurrentRow.Cells["UserName"].Value;
                //TODO
                LoadAuthorsReport();
            }
        }

        private void ClearFields()
        {
            LblNoAuthor.Text = TxtEmpty;
        }

        private void BtnModify_Click(object sender, EventArgs e)
        {
            ClearFields();

            if (CheckData())
            {
                String authorUsername = (string)GrdAuthors.CurrentRow.Cells["UserName"].Value;

                authorUserControl.ModifiyAuthor(authorUsername);
            }
        }

        private bool CheckData()
        {
            return !ShowErrorMessage();
        }

        private bool ShowErrorMessage()
        {
            bool areAtLeastOneFieldEmpty = false;
            if (GrdAuthors.CurrentCell == null)
            {
                LblNoAuthor.Text = TxtNoSelectionError;
                areAtLeastOneFieldEmpty = true;
            }

            return areAtLeastOneFieldEmpty;
        }

    }
}
