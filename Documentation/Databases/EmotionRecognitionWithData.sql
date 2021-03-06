USE [master]
GO
/****** Object:  Database [EmotionRecognition]    Script Date: 25-Jun-20 7:55:44 PM ******/
CREATE DATABASE [EmotionRecognition]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmotionRecognition', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EmotionRecognition.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmotionRecognition_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EmotionRecognition_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmotionRecognition] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmotionRecognition].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmotionRecognition] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmotionRecognition] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmotionRecognition] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmotionRecognition] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmotionRecognition] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmotionRecognition] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EmotionRecognition] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmotionRecognition] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmotionRecognition] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmotionRecognition] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmotionRecognition] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmotionRecognition] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmotionRecognition] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmotionRecognition] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmotionRecognition] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EmotionRecognition] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmotionRecognition] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmotionRecognition] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmotionRecognition] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmotionRecognition] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmotionRecognition] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EmotionRecognition] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmotionRecognition] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmotionRecognition] SET  MULTI_USER 
GO
ALTER DATABASE [EmotionRecognition] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmotionRecognition] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmotionRecognition] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmotionRecognition] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EmotionRecognition] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EmotionRecognition]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 25-Jun-20 7:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 25-Jun-20 7:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Username] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Surname] [nvarchar](max) NULL,
	[Birthdate] [datetime] NOT NULL,
	[NumberOfPhrases] [int] NOT NULL,
	[NumberOfPositivePhrases] [int] NOT NULL,
	[NumberOfNegativePhrases] [int] NOT NULL,
	[NumberOfDistinctEntitiesMentioned] [int] NOT NULL,
	[NumberOfDaysFromFirstPublication] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Authors] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorTimeLapseAlarmAuthors]    Script Date: 25-Jun-20 7:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorTimeLapseAlarmAuthors](
	[AuthorTimeLapseAlarm_Id] [int] NOT NULL,
	[Author_Username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AuthorTimeLapseAlarmAuthors] PRIMARY KEY CLUSTERED 
(
	[AuthorTimeLapseAlarm_Id] ASC,
	[Author_Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorTimeLapseAlarms]    Script Date: 25-Jun-20 7:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorTimeLapseAlarms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TimeSearchMethodType] [int] NOT NULL,
	[QuantityOfTimeToSearchBack] [int] NOT NULL,
	[AlarmPosibleState] [int] NOT NULL,
	[QuantityOfSentimentsNeeded] [int] NOT NULL,
	[IsActivated] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AuthorTimeLapseAlarms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entities]    Script Date: 25-Jun-20 7:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entities](
	[Name] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Entities] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityTimeLapseAlarms]    Script Date: 25-Jun-20 7:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityTimeLapseAlarms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TimeSearchMethodType] [int] NOT NULL,
	[QuantityOfTimeToSearchBack] [int] NOT NULL,
	[AlarmPosibleState] [int] NOT NULL,
	[QuantityOfSentimentsNeeded] [int] NOT NULL,
	[IsActivated] [bit] NOT NULL,
	[Entity_Name] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.EntityTimeLapseAlarms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phrases]    Script Date: 25-Jun-20 7:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phrases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[PhraseState] [int] NOT NULL,
	[Author_Username] [nvarchar](128) NULL,
	[Entity_Name] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.Phrases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sentiments]    Script Date: 25-Jun-20 7:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sentiments](
	[Text] [nvarchar](128) NOT NULL,
	[State] [smallint] NOT NULL,
 CONSTRAINT [PK_dbo.Sentiments] PRIMARY KEY CLUSTERED 
(
	[Text] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Author_Username]    Script Date: 25-Jun-20 7:55:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_Author_Username] ON [dbo].[AuthorTimeLapseAlarmAuthors]
(
	[Author_Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AuthorTimeLapseAlarm_Id]    Script Date: 25-Jun-20 7:55:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_AuthorTimeLapseAlarm_Id] ON [dbo].[AuthorTimeLapseAlarmAuthors]
(
	[AuthorTimeLapseAlarm_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Entity_Name]    Script Date: 25-Jun-20 7:55:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_Entity_Name] ON [dbo].[EntityTimeLapseAlarms]
(
	[Entity_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Author_Username]    Script Date: 25-Jun-20 7:55:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_Author_Username] ON [dbo].[Phrases]
(
	[Author_Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Entity_Name]    Script Date: 25-Jun-20 7:55:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_Entity_Name] ON [dbo].[Phrases]
(
	[Entity_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuthorTimeLapseAlarmAuthors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AuthorTimeLapseAlarmAuthors_dbo.Authors_Author_Username] FOREIGN KEY([Author_Username])
REFERENCES [dbo].[Authors] ([Username])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AuthorTimeLapseAlarmAuthors] CHECK CONSTRAINT [FK_dbo.AuthorTimeLapseAlarmAuthors_dbo.Authors_Author_Username]
GO
ALTER TABLE [dbo].[AuthorTimeLapseAlarmAuthors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AuthorTimeLapseAlarmAuthors_dbo.AuthorTimeLapseAlarms_AuthorTimeLapseAlarm_Id] FOREIGN KEY([AuthorTimeLapseAlarm_Id])
REFERENCES [dbo].[AuthorTimeLapseAlarms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AuthorTimeLapseAlarmAuthors] CHECK CONSTRAINT [FK_dbo.AuthorTimeLapseAlarmAuthors_dbo.AuthorTimeLapseAlarms_AuthorTimeLapseAlarm_Id]
GO
ALTER TABLE [dbo].[EntityTimeLapseAlarms]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EntityTimeLapseAlarms_dbo.Entities_Entity_Name] FOREIGN KEY([Entity_Name])
REFERENCES [dbo].[Entities] ([Name])
GO
ALTER TABLE [dbo].[EntityTimeLapseAlarms] CHECK CONSTRAINT [FK_dbo.EntityTimeLapseAlarms_dbo.Entities_Entity_Name]
GO
ALTER TABLE [dbo].[Phrases]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Phrases_dbo.Authors_Author_Username] FOREIGN KEY([Author_Username])
REFERENCES [dbo].[Authors] ([Username])
GO
ALTER TABLE [dbo].[Phrases] CHECK CONSTRAINT [FK_dbo.Phrases_dbo.Authors_Author_Username]
GO
ALTER TABLE [dbo].[Phrases]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Phrases_dbo.Entities_Entity_Name] FOREIGN KEY([Entity_Name])
REFERENCES [dbo].[Entities] ([Name])
GO
ALTER TABLE [dbo].[Phrases] CHECK CONSTRAINT [FK_dbo.Phrases_dbo.Entities_Entity_Name]
GO
USE [master]
GO
ALTER DATABASE [EmotionRecognition] SET  READ_WRITE 
GO
