USE [MyFirstFullStackApp_DEV]
GO

/**********************************************************************************/
/* 01_CREATE_TABLE_Test.sql */
/**********************************************************************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Test') AND type in (N'U'))
DROP TABLE Test
GO

CREATE TABLE [Test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL

 CONSTRAINT [PK_TestId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/**********************************************************************************/
/* 02_CREATE_TABLE_Candidate.sql */
/**********************************************************************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Candidate') AND type in (N'U'))
DROP TABLE Candidate
GO

CREATE TABLE [Candidate] (
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL

 CONSTRAINT [PK_CandidateId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [Candidate]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_Test] FOREIGN KEY([TestId])
REFERENCES [Test] ([Id])
GO

ALTER TABLE [Candidate] CHECK CONSTRAINT [FK_Candidate_Test]
GO


/**********************************************************************************/
/* 03_CREATE_TABLE _Question.sql */
/**********************************************************************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Question') AND type in (N'U'))
DROP TABLE Question
GO

CREATE TABLE [Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Statement] [varchar](500) NOT NULL

 CONSTRAINT [PK_QuestionId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/**********************************************************************************/
/* 04_CREATE_TABLE_TestQuestion.sql */
/**********************************************************************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'TestQuestion') AND type in (N'U'))
DROP TABLE TestQuestion
GO

CREATE TABLE [TestQuestion] (
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL

 CONSTRAINT [PK_TestQuestionId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [TestQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TestQuestion_Test] FOREIGN KEY([TestId])
REFERENCES [Test] ([Id])
GO

ALTER TABLE [TestQuestion] CHECK CONSTRAINT [FK_TestQuestion_Test]
GO

ALTER TABLE [TestQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TestQuestion_Question] FOREIGN KEY([QuestionId])
REFERENCES [Question] ([Id])
GO

ALTER TABLE [TestQuestion] CHECK CONSTRAINT [FK_TestQuestion_Question]
GO
/**********************************************************************************/
/* 05_CREATE_TABLE_Answer.sql */
/**********************************************************************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Answer') AND type in (N'U'))
DROP TABLE Answer
GO

CREATE TABLE [Answer] (
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Label] [varchar](200) NOT NULL,
	[IsGood] [bit] NOT NULL

 CONSTRAINT [PK_AnswerId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [Answer]  WITH CHECK ADD CONSTRAINT [FK_Answer_Question] FOREIGN KEY([QuestionId])
REFERENCES [Question] ([Id])
GO

ALTER TABLE [Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO


/**********************************************************************************/
/* 06_CREATE_TABLE_Result.sql */
/**********************************************************************************/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Result') AND type in (N'U'))
DROP TABLE Result
GO

CREATE TABLE [Result] (
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CandidateId] [int] NOT NULL,
	[AnswerId] [int] NULL

 CONSTRAINT [PK_ResultId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Candidate] FOREIGN KEY([CandidateId])
REFERENCES [Candidate] ([Id])
GO

ALTER TABLE [Result] CHECK CONSTRAINT [FK_Result_Candidate]
GO

ALTER TABLE [Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Answer] FOREIGN KEY([AnswerId])
REFERENCES [Answer] ([Id])
GO

ALTER TABLE [Result] CHECK CONSTRAINT [FK_Result_Answer]
GO
