USE [master]
GO
/****** Object:  Database [quizOnline]    Script Date: 4/22/2021 8:23:32 AM ******/
CREATE DATABASE [quizOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quizOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\quizOnline.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'quizOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\quizOnline_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [quizOnline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quizOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quizOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quizOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quizOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quizOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quizOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [quizOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quizOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quizOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quizOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quizOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quizOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quizOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quizOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quizOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quizOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quizOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quizOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quizOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quizOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quizOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quizOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quizOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quizOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [quizOnline] SET  MULTI_USER 
GO
ALTER DATABASE [quizOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quizOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quizOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quizOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [quizOnline] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'quizOnline', N'ON'
GO
USE [quizOnline]
GO
/****** Object:  Table [dbo].[Choice]    Script Date: 4/22/2021 8:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choice](
	[questionId] [int] NOT NULL,
	[choiceId] [tinyint] NOT NULL,
	[answer] [nvarchar](255) NULL,
 CONSTRAINT [PK_Choice_1] PRIMARY KEY CLUSTERED 
(
	[questionId] ASC,
	[choiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamInSubject]    Script Date: 4/22/2021 8:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExamInSubject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateCreate] [datetime] NOT NULL,
	[timeDoExam] [tinyint] NOT NULL,
	[subjectId] [varchar](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[numQuest] [int] NOT NULL,
 CONSTRAINT [PK_ExamInSubject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member]    Script Date: 4/22/2021 8:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[email] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[password] [varchar](256) NOT NULL,
	[role] [varchar](10) NOT NULL,
	[status] [varchar](10) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 4/22/2021 8:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[questionTitle] [nvarchar](255) NOT NULL,
	[subjectId] [varchar](10) NOT NULL,
	[correctAnswer] [tinyint] NOT NULL,
	[status] [bit] NOT NULL,
	[dateCreate] [datetime] NOT NULL,
	[dateUpdate] [datetime] NULL,
	[userCreate] [varchar](50) NOT NULL,
	[userUpdate] [varchar](50) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionInQuiz]    Script Date: 4/22/2021 8:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionInQuiz](
	[quizId] [int] NOT NULL,
	[questionId] [int] NOT NULL,
	[result] [int] NULL,
 CONSTRAINT [PK_QuestionInQuiz_1] PRIMARY KEY CLUSTERED 
(
	[quizId] ASC,
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Result]    Script Date: 4/22/2021 8:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[total] [float] NULL,
	[timeFinish] [datetime] NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 4/22/2021 8:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[dateCreate] [datetime] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTakeQuiz]    Script Date: 4/22/2021 8:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTakeQuiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[examId] [int] NULL,
	[dateCreate] [datetime] NULL,
	[studentId] [varchar](50) NOT NULL,
	[status] [bit] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_UserTakeQuiz] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (21, 1, N'blaaa1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (21, 2, N'blaaa2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (21, 3, N'blaaa3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (21, 4, N'blaaa4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (22, 1, N'blaaa1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (22, 2, N'blaaa2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (22, 3, N'blaaa3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (22, 4, N'blaaa4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (23, 1, N'blaaa1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (23, 2, N'blaaa2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (23, 3, N'blaaa3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (23, 4, N'blaaa4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (24, 1, N'blaaa1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (24, 2, N'blaaa2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (24, 3, N'blaaa3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (24, 4, N'blaaa4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (25, 1, N'dddddddd1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (25, 2, N'ddddddddd2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (25, 3, N'ddddddddd3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (25, 4, N'ddddddddddd4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (26, 1, N'dddddddd1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (26, 2, N'ddddddddd2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (26, 3, N'ddddddddd3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (26, 4, N'ddddddddddd4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (27, 1, N'dddddddd1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (27, 2, N'ddddddddd2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (27, 3, N'ddddddddd3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (27, 4, N'ddddddddddd4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (28, 1, N'aaaaaaaaaaa1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (28, 2, N'aaaaaaaaaaaa2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (28, 3, N'aaaaaaaaaa3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (28, 4, N'aaaaaaaaaa4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (29, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (29, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (29, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (29, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (30, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (30, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (30, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (30, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (31, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (31, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (31, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (31, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (32, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (32, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (32, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (32, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (33, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (33, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (33, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (33, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (34, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (34, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (34, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (34, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (35, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (35, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (35, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (35, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (36, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (36, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (36, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (36, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (37, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (37, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (37, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (37, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (38, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (38, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (38, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (38, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (39, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (39, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (39, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (39, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (40, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (40, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (40, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (40, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (41, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (41, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (41, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (41, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (42, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (42, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (42, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (42, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (43, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (43, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (43, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (43, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (44, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (44, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (44, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (44, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (45, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (45, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (45, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (45, 4, N'answer4')
GO
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (46, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (46, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (46, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (46, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (47, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (47, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (47, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (47, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (48, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (48, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (48, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (48, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (49, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (49, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (49, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (49, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (50, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (50, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (50, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (50, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (51, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (51, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (51, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (51, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (52, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (52, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (52, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (52, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (53, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (53, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (53, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (53, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (54, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (54, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (54, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (54, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (55, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (55, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (55, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (55, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (56, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (56, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (56, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (56, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (57, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (57, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (57, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (57, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (58, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (58, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (58, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (58, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (59, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (59, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (59, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (59, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (60, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (60, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (60, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (60, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (61, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (61, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (61, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (61, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (62, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (62, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (62, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (62, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (63, 1, N'answer1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (63, 2, N'answer2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (63, 3, N'answer3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (63, 4, N'answer4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (64, 1, N'2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (64, 2, N'1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (64, 3, N'3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (64, 4, N'4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (65, 1, N'2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (65, 2, N'3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (65, 3, N'4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (65, 4, N'5')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (66, 1, N'2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (66, 2, N'4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (66, 3, N'3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (66, 4, N'5')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (67, 1, N'8')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (67, 2, N'7')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (67, 3, N'6')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (67, 4, N'9')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (68, 1, N'8')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (68, 2, N'11')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (68, 3, N'6')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (68, 4, N'9')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (69, 1, N'8')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (69, 2, N'11')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (69, 3, N'15')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (69, 4, N'9')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (70, 1, N'20')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (70, 2, N'21')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (70, 3, N'15')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (70, 4, N'22')
GO
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (71, 1, N'20')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (71, 2, N'21')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (71, 3, N'15')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (71, 4, N'22')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (72, 1, N'20')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (72, 2, N'43')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (72, 3, N'15')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (72, 4, N'22')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (73, 1, N'20')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (73, 2, N'43')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (73, 3, N'15')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (73, 4, N'16')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (74, 1, N'21')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (74, 2, N'22')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (74, 3, N'23')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (74, 4, N'24')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (75, 1, N'21')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (75, 2, N'22')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (75, 3, N'4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (75, 4, N'24')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (76, 1, N'21')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (76, 2, N'6')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (76, 3, N'4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (76, 4, N'24')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (77, 1, N'14')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (77, 2, N'6')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (77, 3, N'4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (77, 4, N'24')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (78, 1, N'8')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (78, 2, N'6')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (78, 3, N'4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (78, 4, N'4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (79, 1, N'8')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (79, 2, N'18')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (79, 3, N'22')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (79, 4, N'4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (80, 1, N'13')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (80, 2, N'18')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (80, 3, N'22')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (80, 4, N'23')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (81, 1, N'3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (81, 2, N'20')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (81, 3, N'7')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (81, 4, N'0')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (82, 1, N'3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (82, 2, N'2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (82, 3, N'10')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (82, 4, N'4')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (83, 1, N'1')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (83, 2, N'93')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (83, 3, N'2')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (83, 4, N'3')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (1064, 1, N'12')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (1064, 2, N'14')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (1064, 3, N'11')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (1064, 4, N'10')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (1065, 1, N'fail')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (1065, 2, N'correct')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (1065, 3, N'fail')
INSERT [dbo].[Choice] ([questionId], [choiceId], [answer]) VALUES (1065, 4, N'fail')
SET IDENTITY_INSERT [dbo].[ExamInSubject] ON 

INSERT [dbo].[ExamInSubject] ([id], [dateCreate], [timeDoExam], [subjectId], [name], [numQuest]) VALUES (2, CAST(N'2021-02-01 20:10:58.103' AS DateTime), 4, N'Prj212', N'exam 2', 4)
INSERT [dbo].[ExamInSubject] ([id], [dateCreate], [timeDoExam], [subjectId], [name], [numQuest]) VALUES (3, CAST(N'2021-02-03 13:06:33.090' AS DateTime), 5, N'Prj113', N'demo Exam', 5)
INSERT [dbo].[ExamInSubject] ([id], [dateCreate], [timeDoExam], [subjectId], [name], [numQuest]) VALUES (8, CAST(N'2021-02-21 17:22:53.200' AS DateTime), 20, N'Prj113', N'demo Exam', 1)
INSERT [dbo].[ExamInSubject] ([id], [dateCreate], [timeDoExam], [subjectId], [name], [numQuest]) VALUES (10, CAST(N'2021-02-22 14:44:37.743' AS DateTime), 10, N'Math111', N'Test math for children', 12)
INSERT [dbo].[ExamInSubject] ([id], [dateCreate], [timeDoExam], [subjectId], [name], [numQuest]) VALUES (11, CAST(N'2021-02-22 16:20:05.210' AS DateTime), 1, N'Math111', N'Quiz auto submit after times up', 1)
INSERT [dbo].[ExamInSubject] ([id], [dateCreate], [timeDoExam], [subjectId], [name], [numQuest]) VALUES (1008, CAST(N'2021-04-19 08:16:21.320' AS DateTime), 5, N'Math111', N'demo Exam', 5)
INSERT [dbo].[ExamInSubject] ([id], [dateCreate], [timeDoExam], [subjectId], [name], [numQuest]) VALUES (1009, CAST(N'2021-04-22 08:02:10.547' AS DateTime), 2, N'NewSubject', N'Demo Exam ', 1)
SET IDENTITY_INSERT [dbo].[ExamInSubject] OFF
INSERT [dbo].[Member] ([email], [name], [password], [role], [status]) VALUES (N'dntlam@gmail.com', N'lam dnt', N'15E2B0D3C33891EBB0F1EF609EC419420C20E320CE94C65FBC8C3312448EB225', N'student', N'New')
INSERT [dbo].[Member] ([email], [name], [password], [role], [status]) VALUES (N'khanhkt@fe.edu.vn', N'khanh dai ca', N'15E2B0D3C33891EBB0F1EF609EC419420C20E320CE94C65FBC8C3312448EB225', N'admin', NULL)
INSERT [dbo].[Member] ([email], [name], [password], [role], [status]) VALUES (N'khanhkt@fpt.edu.vn', N'khanh abc', N'8BB0CF6EB9B17D0F7D22B456F121257DC1254E1F01665370476383EA776DF414', N'student', NULL)
INSERT [dbo].[Member] ([email], [name], [password], [role], [status]) VALUES (N'lamdnt0000@gmail.com', N'lam', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', N'admin', N'Old')
INSERT [dbo].[Member] ([email], [name], [password], [role], [status]) VALUES (N'lamdnt123@gmail.com', N'lam do', N'8BB0CF6EB9B17D0F7D22B456F121257DC1254E1F01665370476383EA776DF414', N'student', N'New')
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (21, N'this is first question', N'Prj212', 2, 1, CAST(N'2021-01-29 11:46:21.437' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (22, N'this is first question 2', N'Prj212', 2, 1, CAST(N'2021-01-29 11:48:05.200' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (23, N'this is first question 2', N'Prj212', 2, 1, CAST(N'2021-01-29 11:50:19.303' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (24, N'this is first question 2', N'Prj212', 3, 1, CAST(N'2021-01-29 11:52:59.573' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (25, N'ddddddd', N'Prj212', 3, 1, CAST(N'2021-01-29 11:53:21.347' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (26, N'ddddddd', N'Prj212', 3, 1, CAST(N'2021-01-29 11:53:44.247' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (27, N'ddddddd', N'Prj212', 4, 1, CAST(N'2021-01-29 11:58:38.390' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (28, N'This is second Question test update 123', N'Prj212', 4, 1, CAST(N'2021-01-29 12:46:24.757' AS DateTime), CAST(N'2021-02-01 13:28:51.993' AS DateTime), N'lamdnt0000@gmail.com', N'lamdnt0000@gmail.com')
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (29, N'demo new question', N'Prj312', 3, 1, CAST(N'2021-02-01 20:17:21.077' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (30, N'This is a question', N'Prj113', 1, 1, CAST(N'2021-02-01 20:22:16.450' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (31, N'This is a question', N'Prj113', 2, 1, CAST(N'2021-02-01 20:22:18.497' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (32, N'This is a question', N'Prj113', 3, 1, CAST(N'2021-02-01 20:22:19.537' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (33, N'This is a question', N'Prj113', 4, 1, CAST(N'2021-02-01 20:22:20.657' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (34, N'This is a question', N'Prj113', 4, 1, CAST(N'2021-02-01 20:22:21.087' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (35, N'This is a question', N'Prj113', 4, 1, CAST(N'2021-02-01 20:22:22.170' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (36, N'This is a question', N'Prj113', 3, 1, CAST(N'2021-02-01 20:22:24.237' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (37, N'This is a question', N'Prj113', 3, 1, CAST(N'2021-02-01 20:22:24.450' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (38, N'This is a question', N'Prj113', 3, 1, CAST(N'2021-02-01 20:22:24.777' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (39, N'This is a question', N'Prj113', 2, 1, CAST(N'2021-02-01 20:22:25.850' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (40, N'This is a question', N'Prj113', 2, 1, CAST(N'2021-02-01 20:22:25.993' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (41, N'This is a question', N'Prj113', 2, 1, CAST(N'2021-02-01 20:22:26.133' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (42, N'This is a question', N'Prj113', 2, 1, CAST(N'2021-02-01 20:22:26.267' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (43, N'This is a question', N'Prj113', 2, 1, CAST(N'2021-02-01 20:22:26.407' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (44, N'This is a question', N'Prj113', 2, 1, CAST(N'2021-02-01 20:22:26.533' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (45, N'This is a question', N'Prj113', 1, 1, CAST(N'2021-02-01 20:22:27.863' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (46, N'This is a question', N'Prj113', 1, 1, CAST(N'2021-02-01 20:22:28.017' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (47, N'This is a question', N'Prj113', 1, 1, CAST(N'2021-02-01 20:22:28.153' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (48, N'This is a question 123', N'Prj113', 1, 1, CAST(N'2021-02-01 20:22:29.893' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (49, N'This is a question 123', N'Prj113', 1, 1, CAST(N'2021-02-01 20:22:30.037' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (50, N'This is a question 123', N'Prj113', 1, 1, CAST(N'2021-02-01 20:22:30.180' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (51, N'This is a question 123', N'Prj113', 1, 1, CAST(N'2021-02-01 20:22:30.327' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (52, N'This is a question 123', N'Prj113', 1, 1, CAST(N'2021-02-01 20:22:30.473' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (53, N'This is a question 123', N'Prj113', 2, 1, CAST(N'2021-02-01 20:22:31.453' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (54, N'This is a question 123', N'Prj113', 2, 1, CAST(N'2021-02-01 20:22:31.593' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (55, N'This is a question 123', N'Prj113', 2, 1, CAST(N'2021-02-01 20:22:31.727' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (56, N'This is a question 123', N'Prj113', 3, 1, CAST(N'2021-02-01 20:22:32.747' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (57, N'This is a question 123', N'Prj113', 3, 1, CAST(N'2021-02-01 20:22:32.890' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (58, N'This is a question 123', N'Prj113', 3, 1, CAST(N'2021-02-01 20:22:33.127' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (59, N'This is a question 123', N'Prj113', 4, 1, CAST(N'2021-02-01 20:22:34.007' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (60, N'This is a question 123', N'Prj113', 4, 1, CAST(N'2021-02-01 20:22:34.160' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (61, N'This is a question 123', N'Prj113', 2, 0, CAST(N'2021-02-01 20:22:34.303' AS DateTime), CAST(N'2021-02-02 20:09:32.127' AS DateTime), N'lamdnt0000@gmail.com', N'lamdnt0000@gmail.com')
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (62, N'This is a question 123', N'Prj113', 1, 0, CAST(N'2021-02-01 20:22:34.443' AS DateTime), CAST(N'2021-02-02 20:09:28.600' AS DateTime), N'lamdnt0000@gmail.com', N'lamdnt0000@gmail.com')
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (63, N'This is a question demmo', N'Prj212', 4, 0, CAST(N'2021-02-01 20:22:34.657' AS DateTime), CAST(N'2021-02-01 20:23:34.120' AS DateTime), N'lamdnt0000@gmail.com', N'lamdnt0000@gmail.com')
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (64, N'1+2=?', N'Demo01', 3, 1, CAST(N'2021-02-21 17:28:09.713' AS DateTime), CAST(N'2021-02-22 10:06:36.020' AS DateTime), N'lamdnt0000@gmail.com', N'lamdnt0000@gmail.com')
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (65, N'1+1=?', N'Math111', 1, 1, CAST(N'2021-02-22 14:31:16.733' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (66, N'2+1=?', N'Math111', 3, 1, CAST(N'2021-02-22 14:31:24.777' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (67, N'4+5=?', N'Math111', 4, 1, CAST(N'2021-02-22 14:32:01.647' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (68, N'6+5=?', N'Math111', 2, 1, CAST(N'2021-02-22 14:32:06.913' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (69, N'8+7=?', N'Math111', 3, 1, CAST(N'2021-02-22 14:32:15.777' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (70, N'9+6=?', N'Math111', 3, 1, CAST(N'2021-02-22 14:32:26.747' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (71, N'8+12=?', N'Math111', 1, 1, CAST(N'2021-02-22 14:32:31.237' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (72, N'22+21=?', N'Math111', 2, 1, CAST(N'2021-02-22 14:32:38.010' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (73, N'8+8=?', N'Math111', 4, 1, CAST(N'2021-02-22 14:32:44.937' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (74, N'21+20=?', N'Math111', 1, 1, CAST(N'2021-02-22 14:33:03.967' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (75, N'2+2=?', N'Math111', 3, 1, CAST(N'2021-02-22 14:33:11.100' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (76, N'3+3=?', N'Math111', 2, 1, CAST(N'2021-02-22 14:33:18.477' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (77, N'7+7=?', N'Math111', 1, 1, CAST(N'2021-02-22 14:33:22.943' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (78, N'4+4=?', N'Math111', 1, 1, CAST(N'2021-02-22 14:37:36.907' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (79, N'9+9=?', N'Math111', 2, 1, CAST(N'2021-02-22 14:37:44.303' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (80, N'4+9=?', N'Math111', 1, 1, CAST(N'2021-02-22 14:38:00.273' AS DateTime), CAST(N'2021-02-22 18:15:40.217' AS DateTime), N'lamdnt0000@gmail.com', N'lamdnt0000@gmail.com')
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (81, N'9+9+2=?', N'Math111', 2, 1, CAST(N'2021-02-22 17:59:43.527' AS DateTime), CAST(N'2021-04-19 08:30:46.860' AS DateTime), N'lamdnt0000@gmail.com', N'lamdnt0000@gmail.com')
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (82, N'1+9=?', N'Math111', 3, 1, CAST(N'2021-02-22 18:02:15.323' AS DateTime), CAST(N'2021-04-19 08:30:37.267' AS DateTime), N'lamdnt0000@gmail.com', N'lamdnt0000@gmail.com')
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (83, N'91+2=?', N'Math111', 2, 1, CAST(N'2021-02-22 18:12:22.420' AS DateTime), CAST(N'2021-04-19 08:30:30.453' AS DateTime), N'lamdnt0000@gmail.com', N'lamdnt0000@gmail.com')
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (1064, N'5+9=?', N'Math111', 2, 1, CAST(N'2021-04-19 08:27:51.720' AS DateTime), CAST(N'2021-04-22 08:22:17.947' AS DateTime), N'lamdnt0000@gmail.com', N'lamdnt0000@gmail.com')
INSERT [dbo].[Question] ([id], [questionTitle], [subjectId], [correctAnswer], [status], [dateCreate], [dateUpdate], [userCreate], [userUpdate]) VALUES (1065, N'demo new question', N'NewSubject', 2, 1, CAST(N'2021-04-22 08:01:48.023' AS DateTime), NULL, N'lamdnt0000@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Question] OFF
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (7, 30, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (7, 47, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (7, 54, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (7, 58, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (7, 59, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 65, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 66, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 67, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 68, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 69, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 70, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 72, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 73, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 75, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 76, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 79, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (13, 80, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (14, 75, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (15, 58, NULL)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 65, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 67, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 68, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 69, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 70, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 71, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 72, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 73, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 76, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 79, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 82, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1013, 83, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 66, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 69, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 70, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 71, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 72, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 73, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 74, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 75, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 77, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 79, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 81, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1014, 1064, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 65, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 66, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 67, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 68, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 72, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 74, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 78, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 79, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 81, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 82, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 83, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1015, 1064, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 69, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 70, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 72, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 73, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 74, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 75, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 76, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 77, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 78, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 79, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 82, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1016, 83, 10)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1017, 65, 1008)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1017, 78, 1008)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1017, 79, 1008)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1017, 81, 1008)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1017, 82, 1008)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1018, 1065, 1009)
INSERT [dbo].[QuestionInQuiz] ([quizId], [questionId], [result]) VALUES (1019, 1065, 2)
INSERT [dbo].[Subject] ([id], [name], [dateCreate]) VALUES (N'Demo01', N'Demo exam', CAST(N'2021-02-21 17:00:21.227' AS DateTime))
INSERT [dbo].[Subject] ([id], [name], [dateCreate]) VALUES (N'Math111', N'math for fun', CAST(N'2021-02-22 14:30:59.787' AS DateTime))
INSERT [dbo].[Subject] ([id], [name], [dateCreate]) VALUES (N'NewSubject', N'create new', CAST(N'2021-04-22 08:01:16.230' AS DateTime))
INSERT [dbo].[Subject] ([id], [name], [dateCreate]) VALUES (N'Prj113', N'hahaah', CAST(N'2021-02-01 20:21:05.053' AS DateTime))
INSERT [dbo].[Subject] ([id], [name], [dateCreate]) VALUES (N'Prj212', N'C Application lab', CAST(N'2021-01-26 16:07:06.910' AS DateTime))
INSERT [dbo].[Subject] ([id], [name], [dateCreate]) VALUES (N'Prj311', N'Web Application', CAST(N'2021-01-26 12:59:47.557' AS DateTime))
INSERT [dbo].[Subject] ([id], [name], [dateCreate]) VALUES (N'Prj312', N'Java Desktop', CAST(N'2021-01-26 13:43:00.777' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserTakeQuiz] ON 

INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (7, 3, CAST(N'2021-02-04 17:10:06.430' AS DateTime), N'lamdnt123@gmail.com', 1, 4)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (13, 10, CAST(N'2021-02-22 14:46:02.173' AS DateTime), N'lamdnt123@gmail.com', 1, 10)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (14, 11, CAST(N'2021-02-22 16:20:15.633' AS DateTime), N'dntlam@gmail.com', 1, 10)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (15, 8, CAST(N'2021-02-22 17:58:41.740' AS DateTime), N'lamdnt123@gmail.com', 1, 0)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1008, 10, CAST(N'2021-04-20 08:06:54.330' AS DateTime), N'lamdnt123@gmail.com', 0, 0)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1009, 10, CAST(N'2021-04-20 08:07:39.630' AS DateTime), N'lamdnt123@gmail.com', 0, 0)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1010, 10, CAST(N'2021-04-20 08:09:23.047' AS DateTime), N'lamdnt123@gmail.com', 0, 0)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1011, 10, CAST(N'2021-04-20 08:15:04.197' AS DateTime), N'lamdnt123@gmail.com', 0, 0)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1012, 10, CAST(N'2021-04-20 08:16:17.470' AS DateTime), N'lamdnt123@gmail.com', 0, 0)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1013, 10, CAST(N'2021-04-20 08:25:39.507' AS DateTime), N'lamdnt123@gmail.com', 1, 0)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1014, 10, CAST(N'2021-04-20 11:04:38.477' AS DateTime), N'lamdnt123@gmail.com', 1, 0)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1015, 10, CAST(N'2021-04-20 11:17:09.683' AS DateTime), N'lamdnt123@gmail.com', 1, 9.1700000762939453)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1016, 10, CAST(N'2021-04-20 11:25:54.560' AS DateTime), N'lamdnt123@gmail.com', 1, 0)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1017, 1008, CAST(N'2021-04-22 07:59:39.827' AS DateTime), N'lamdnt123@gmail.com', 1, 4)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1018, 1009, CAST(N'2021-04-22 08:02:17.447' AS DateTime), N'lamdnt123@gmail.com', 1, 0)
INSERT [dbo].[UserTakeQuiz] ([id], [examId], [dateCreate], [studentId], [status], [total]) VALUES (1019, 1009, CAST(N'2021-04-22 08:14:50.460' AS DateTime), N'lamdnt123@gmail.com', 1, 10)
SET IDENTITY_INSERT [dbo].[UserTakeQuiz] OFF
ALTER TABLE [dbo].[Choice]  WITH CHECK ADD  CONSTRAINT [FK_Choice_Question] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[Choice] CHECK CONSTRAINT [FK_Choice_Question]
GO
ALTER TABLE [dbo].[ExamInSubject]  WITH CHECK ADD  CONSTRAINT [FK_ExamInSubject_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([id])
GO
ALTER TABLE [dbo].[ExamInSubject] CHECK CONSTRAINT [FK_ExamInSubject_Subject]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject]
GO
ALTER TABLE [dbo].[QuestionInQuiz]  WITH CHECK ADD  CONSTRAINT [FK_QuestionInQuiz_Question] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[QuestionInQuiz] CHECK CONSTRAINT [FK_QuestionInQuiz_Question]
GO
ALTER TABLE [dbo].[QuestionInQuiz]  WITH CHECK ADD  CONSTRAINT [FK_QuestionInQuiz_UserTakeQuiz1] FOREIGN KEY([quizId])
REFERENCES [dbo].[UserTakeQuiz] ([id])
GO
ALTER TABLE [dbo].[QuestionInQuiz] CHECK CONSTRAINT [FK_QuestionInQuiz_UserTakeQuiz1]
GO
ALTER TABLE [dbo].[UserTakeQuiz]  WITH CHECK ADD  CONSTRAINT [FK_UserTakeQuiz_ExamInSubject] FOREIGN KEY([examId])
REFERENCES [dbo].[ExamInSubject] ([id])
GO
ALTER TABLE [dbo].[UserTakeQuiz] CHECK CONSTRAINT [FK_UserTakeQuiz_ExamInSubject]
GO
ALTER TABLE [dbo].[UserTakeQuiz]  WITH CHECK ADD  CONSTRAINT [FK_UserTakeQuiz_User] FOREIGN KEY([studentId])
REFERENCES [dbo].[Member] ([email])
GO
ALTER TABLE [dbo].[UserTakeQuiz] CHECK CONSTRAINT [FK_UserTakeQuiz_User]
GO
USE [master]
GO
ALTER DATABASE [quizOnline] SET  READ_WRITE 
GO
