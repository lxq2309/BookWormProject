USE [master]
GO
/****** Object:  Database [BookWormDB]    Script Date: 2/21/2024 10:29:46 PM ******/
CREATE DATABASE [BookWormDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookWormDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookWormDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookWormDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookWormDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookWormDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookWormDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookWormDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookWormDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookWormDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookWormDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookWormDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookWormDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookWormDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookWormDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookWormDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookWormDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookWormDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookWormDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookWormDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookWormDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookWormDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookWormDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookWormDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookWormDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookWormDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookWormDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookWormDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookWormDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookWormDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BookWormDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookWormDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookWormDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookWormDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookWormDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookWormDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookWormDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookWormDB', N'ON'
GO
ALTER DATABASE [BookWormDB] SET QUERY_STORE = OFF
GO
USE [BookWormDB]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 2/21/2024 10:29:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CoverImage] [nvarchar](255) NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[ViewCount] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles_Authors]    Script Date: 2/21/2024 10:29:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles_Authors](
	[ArticleID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC,
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles_Genres]    Script Date: 2/21/2024 10:29:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles_Genres](
	[ArticleID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC,
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 2/21/2024 10:29:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Avatar] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookmarks]    Script Date: 2/21/2024 10:29:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookmarks](
	[BookmarkID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[ArticleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookmarkID] ASC,
	[ArticleID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/21/2024 10:29:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Link] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapters]    Script Date: 2/21/2024 10:29:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapters](
	[ChapterID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Index] [int] NOT NULL,
	[ViewCount] [int] NOT NULL,
	[ArticleID] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 2/21/2024 10:29:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Content] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ArticleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC,
	[ArticleID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 2/21/2024 10:29:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[ViewCount] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/21/2024 10:29:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Avatar] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Role] [int] NOT NULL,
	[Password] [varbinary](max) NULL,
	[Gender] [bit] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (5, 2, N'The Art of Programming', N'A comprehensive guide to programming.', 1, CAST(N'2022-02-01T10:30:00.000' AS DateTime), N'https://example.com/images/art-programming.jpg', CAST(N'2024-02-16T23:27:53.643' AS DateTime), 142, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (6, 2, N'Introduction to Machine Learning', N'Learn the basics of machine learning.', 0, CAST(N'2022-02-05T13:20:00.000' AS DateTime), N'https://example.com/images/machine-learning.jpg', CAST(N'2022-03-10T09:15:00.000' AS DateTime), 58, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (7, 2, N'Cooking 101', N'A beginner''s guide to cooking.', 0, CAST(N'2022-02-10T15:40:00.000' AS DateTime), N'https://example.com/images/cooking-101.jpg', CAST(N'2022-03-15T11:45:00.000' AS DateTime), 81, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (8, 2, N'Investing for Beginners', N'Learn the basics of investing in the stock market.', 1, CAST(N'2022-02-15T09:30:00.000' AS DateTime), N'https://example.com/images/investing-for-beginners.jpg', CAST(N'2022-03-20T08:10:00.000' AS DateTime), 124, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (9, 2, N'The History of Art', N'A journey through the history of art.', 0, CAST(N'2022-02-20T12:50:00.000' AS DateTime), N'https://example.com/images/history-of-art.jpg', CAST(N'2022-03-25T15:30:00.000' AS DateTime), 105, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (10, 2, N'Web Development 101', N'A beginner''s guide to web development.', 1, CAST(N'2022-02-25T08:00:00.000' AS DateTime), N'https://example.com/images/web-development-101.jpg', CAST(N'2024-02-16T23:30:52.383' AS DateTime), 116, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (11, 2, N'Digital Marketing Strategies', N'Learn the latest digital marketing strategies.', 0, CAST(N'2022-03-01T11:20:00.000' AS DateTime), N'https://example.com/images/digital-marketing-strategies.jpg', CAST(N'2022-04-04T09:20:00.000' AS DateTime), 70, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (12, 2, N'Healthy Living Habits', N'A guide to healthy living and self-care.', 0, CAST(N'2022-03-05T14:10:00.000' AS DateTime), N'https://example.com/images/healthy-living-habits.jpg', CAST(N'2022-04-08T10:40:00.000' AS DateTime), 66, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (13, 2, N'Python for Data Analysis', N'Learn how to analyze data using Python.', 1, CAST(N'2022-03-10T09:30:00.000' AS DateTime), N'https://example.com/images/python-data-analysis.jpg', CAST(N'2022-04-12T11:20:00.000' AS DateTime), 95, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (14, 2, N'The Art of Public Speaking', N'A guide to public speaking and effective communication.', 1, CAST(N'2022-03-15T12:20:00.000' AS DateTime), N'https://example.com/images/public-speaking.jpg', CAST(N'2022-04-16T13:50:00.000' AS DateTime), 75, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (15, 2, N'Artificial Intelligence Fundamentals', N'Learn the fundamentals of artificial intelligence', 1, CAST(N'2022-04-10T10:30:00.000' AS DateTime), N'https://example.com/images/ai_fundamentals.jpg', CAST(N'2022-04-15T09:15:00.000' AS DateTime), 100, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (16, 2, N'Python Programming for Beginners', N'Discover the basics of Python programming', 1, CAST(N'2022-04-11T13:45:00.000' AS DateTime), N'https://example.com/images/python_beginners.jpg', CAST(N'2022-04-14T11:20:00.000' AS DateTime), 80, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (17, 2, N'Web Development with React', N'Build dynamic web applications with React', 0, CAST(N'2022-04-12T16:10:00.000' AS DateTime), N'https://example.com/images/react_webdev.jpg', CAST(N'2022-04-13T15:00:00.000' AS DateTime), 121, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (18, 2, N'Introduction to Machine Learning', N'Get started with the basics of machine learning', 0, CAST(N'2022-04-13T09:00:00.000' AS DateTime), N'https://example.com/images/ml_intro.jpg', CAST(N'2022-04-13T17:30:00.000' AS DateTime), 70, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (19, 2, N'iOS App Development', N'Learn how to develop iOS applications using Swift', 1, CAST(N'2022-04-14T14:20:00.000' AS DateTime), N'https://example.com/images/ios_dev.jpg', CAST(N'2022-04-14T16:50:00.000' AS DateTime), 90, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (20, 2, N'Introduction to Data Science', N'Discover the field of data science and its applications', 1, CAST(N'2022-04-15T11:30:00.000' AS DateTime), N'https://example.com/images/data_science_intro.jpg', CAST(N'2022-04-15T14:00:00.000' AS DateTime), 112, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (21, 2, N'Deep Learning with TensorFlow', N'Learn how to use TensorFlow for deep learning tasks', 0, CAST(N'2022-04-16T09:10:00.000' AS DateTime), N'https://example.com/images/tensorflow_deep_learning.jpg', CAST(N'2022-04-16T16:30:00.000' AS DateTime), 81, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (22, 2, N'Full Stack Web Development', N'Become a full stack web developer with this comprehensive course', 1, CAST(N'2022-04-17T13:00:00.000' AS DateTime), N'https://example.com/images/fullstack_webdev.jpg', CAST(N'2022-04-17T15:40:00.000' AS DateTime), 100, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (23, 2, N'Game Development with Unity', N'Create your own games using Unity', 0, CAST(N'2022-04-18T10:50:00.000' AS DateTime), N'https://example.com/images/unity_game_dev.jpg', CAST(N'2022-04-18T14:10:00.000' AS DateTime), 75, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (24, 2, N'Data Visualization with Tableau', N'Learn how to create impactful visualizations with Tableau', 1, CAST(N'2022-04-19T11:20:00.000' AS DateTime), N'https://example.com/images/tableau_data_viz.jpg', CAST(N'2022-04-19T17:00:00.000' AS DateTime), 123, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (25, 2, N'Ngày xưa có một dòng sông', N'jfalsjfkasdjkdsjadsjlask', 1, CAST(N'2024-02-16T22:09:21.453' AS DateTime), N'/resource/images/default_cover_image.jpg', CAST(N'2024-02-16T23:28:26.320' AS DateTime), 11, NULL)
INSERT [dbo].[Articles] ([ArticleID], [UserID], [Title], [Description], [IsCompleted], [CreatedAt], [CoverImage], [UpdatedAt], [ViewCount], [IsDeleted]) VALUES (26, 2, N'chuyện người con gái tôi yêu', N'Rất hay và cảm động


Đáng đọc', 1, CAST(N'2024-02-16T22:17:23.300' AS DateTime), N'/resource/images/default_cover_image.jpg', CAST(N'2024-02-16T23:16:15.677' AS DateTime), 12, NULL)
SET IDENTITY_INSERT [dbo].[Articles] OFF
GO
INSERT [dbo].[Articles_Authors] ([ArticleID], [AuthorID]) VALUES (25, 1)
INSERT [dbo].[Articles_Authors] ([ArticleID], [AuthorID]) VALUES (26, 1)
GO
INSERT [dbo].[Articles_Genres] ([ArticleID], [GenreID]) VALUES (25, 5)
INSERT [dbo].[Articles_Genres] ([ArticleID], [GenreID]) VALUES (25, 6)
INSERT [dbo].[Articles_Genres] ([ArticleID], [GenreID]) VALUES (26, 4)
INSERT [dbo].[Articles_Genres] ([ArticleID], [GenreID]) VALUES (26, 5)
INSERT [dbo].[Articles_Genres] ([ArticleID], [GenreID]) VALUES (26, 6)
INSERT [dbo].[Articles_Genres] ([ArticleID], [GenreID]) VALUES (26, 7)
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([AuthorID], [Name], [Avatar], [Description], [IsDeleted]) VALUES (1, N'Nguyễn Ngọc Ngạn', N'/resource/images/default_avatar.jpg', N'fasfasd', NULL)
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Bookmarks] ON 

INSERT [dbo].[Bookmarks] ([BookmarkID], [UserID], [Name], [Description], [IsPublic], [ArticleID]) VALUES (2, 5, N'Investing for Beginners', N'', 0, 8)
INSERT [dbo].[Bookmarks] ([BookmarkID], [UserID], [Name], [Description], [IsPublic], [ArticleID]) VALUES (3, 5, N'Introduction to Data Science', N'', 1, 20)
SET IDENTITY_INSERT [dbo].[Bookmarks] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Link]) VALUES (1, N'Truyện', N'dfjlsdjlfkasds', NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Link]) VALUES (2, N'ABCDE', N'chất chơi', N'/abcde')
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Link]) VALUES (3, N'gprs', N'fjsalfa
', N'/gprs')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Chapters] ON 

INSERT [dbo].[Chapters] ([ChapterID], [Title], [Content], [CreatedAt], [Index], [ViewCount], [ArticleID], [IsDeleted]) VALUES (3, N'Hello World', N'<p>Mãi mãi <b>tuổi 20&nbsp;</b></p><p><b>Tuổi trẻ đáng giá bao nhiêu ?</b></p><p style="font-size: 16px; margin-bottom: 15px; line-height: 1.7; color: rgb(0, 0, 0); font-family: Roboto, sans-serif;">Gia đình luôn là chốn dừng chân cho mỗi người giữa những bộn bề lo toan hàng ngày. Dưới đây là status những câu nói hay về cuộc sống gia đình, để bạn nhận ra nơi quan trọng của riêng mình.</p><blockquote class="wp-block-quote" style="overflow-wrap: break-word; border-left-color: rgb(190, 30, 45); padding-left: 15px; margin-left: 20px; margin-right: 20px; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 15px;"><p style="font-size: 16px; margin-bottom: 15px; line-height: 1.7;">“Gia đình là nơi cuộc sống bắt đầu và tình yêu không bao giờ kết thúc.”</p></blockquote><blockquote class="wp-block-quote" style="overflow-wrap: break-word; border-left-color: rgb(190, 30, 45); padding-left: 15px; margin-left: 20px; margin-right: 20px; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 15px;"><p style="font-size: 16px; margin-bottom: 15px; line-height: 1.7;">“Cuối cùng vẫn chỉ có tình cảm gia đình là thứ tình yêu vô điều kiện duy nhất trong cuộc đời mỗi con người.”</p></blockquote><blockquote class="wp-block-quote" style="overflow-wrap: break-word; border-left-color: rgb(190, 30, 45); padding-left: 15px; margin-left: 20px; margin-right: 20px; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 15px;"><p style="font-size: 16px; margin-bottom: 15px; line-height: 1.7;">“Gia đình là nơi tốt nhất mà bạn tìm về với bình yên, là nơi tốt nhất mà bạn tìm về với bình yên, là nơi có thể giúp bạn nghĩ ngơi khi vấp ngã, là nơi yêu thương mà không cần điều kiện, là nơi có cuộc sống tốt nhất để tao nên vỏ bọc bảo vệ.”</p></blockquote><blockquote class="wp-block-quote" style="overflow-wrap: break-word; border-left-color: rgb(190, 30, 45); padding-left: 15px; margin-left: 20px; margin-right: 20px; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 15px;"><p style="font-size: 16px; margin-bottom: 15px; line-height: 1.7;">“Gia đình người ta có nhiều nơi để đến nhưng chỉ có một chốn để quay về.”</p></blockquote><blockquote class="wp-block-quote" style="overflow-wrap: break-word; border-left-color: rgb(190, 30, 45); padding-left: 15px; margin-left: 20px; margin-right: 20px; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 15px;"><p style="font-size: 16px; margin-bottom: 15px; line-height: 1.7;">“Khi còn trẻ, chúng ta muốn kết thân với một người, thì có thể là vì hai bên cần đến năng lực của nhau, có thể là vì sự hợp tác đó mang đến lợi ích cho cả hai bên. Nhưng thuận theo năm tháng trôi đi, đến một lúc nào đó bạn sẽ chợt nhận ra rằng điều có thể khiến bạn yên tâm qua lại với một người không phải là năng lực hay sự thông minh của người đó, mà là nhân phẩm của anh ta.”</p></blockquote>', CAST(N'2024-02-02T18:45:25.937' AS DateTime), 2, 0, 5, NULL)
INSERT [dbo].[Chapters] ([ChapterID], [Title], [Content], [CreatedAt], [Index], [ViewCount], [ArticleID], [IsDeleted]) VALUES (4, N'dep trai', N'<p>fjaslfjskldfas</p>', CAST(N'2024-02-03T16:14:34.057' AS DateTime), 1, 0, 5, NULL)
INSERT [dbo].[Chapters] ([ChapterID], [Title], [Content], [CreatedAt], [Index], [ViewCount], [ArticleID], [IsDeleted]) VALUES (5, N'abcdef', N'<p>fjlasjfskladjflakas</p>', CAST(N'2024-02-03T16:17:02.357' AS DateTime), 1, 0, 6, NULL)
INSERT [dbo].[Chapters] ([ChapterID], [Title], [Content], [CreatedAt], [Index], [ViewCount], [ArticleID], [IsDeleted]) VALUES (1003, N'hello hell', N'<p>fjlasjfl;ádflas;djfkalsd</p>', CAST(N'2024-02-16T21:59:29.403' AS DateTime), 1, 0, 10, NULL)
INSERT [dbo].[Chapters] ([ChapterID], [Title], [Content], [CreatedAt], [Index], [ViewCount], [ArticleID], [IsDeleted]) VALUES (1004, N'Mãi mãi một tình yêu', N'<p>Đậm chất sát thủ</p><p><br></p><p>fjaslfjadlas</p><p>d</p><p><br></p><p><b>dep trai</b></p>', CAST(N'2024-02-16T22:35:48.363' AS DateTime), 1, 0, 26, NULL)
INSERT [dbo].[Chapters] ([ChapterID], [Title], [Content], [CreatedAt], [Index], [ViewCount], [ArticleID], [IsDeleted]) VALUES (1014, N'À thế à', N'<p>fasfasd</p>', CAST(N'2024-02-16T22:58:32.533' AS DateTime), 2, 0, 26, NULL)
INSERT [dbo].[Chapters] ([ChapterID], [Title], [Content], [CreatedAt], [Index], [ViewCount], [ArticleID], [IsDeleted]) VALUES (1015, N'hehhe éc éc', N'<p>hihih</p>', CAST(N'2024-02-16T22:59:49.867' AS DateTime), 3, 0, 26, NULL)
SET IDENTITY_INSERT [dbo].[Chapters] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [UserID], [Content], [CreatedAt], [ArticleID]) VALUES (52, 2, N'HELLO hell', CAST(N'2024-01-27T21:41:59.200' AS DateTime), 9)
INSERT [dbo].[Comment] ([CommentID], [UserID], [Content], [CreatedAt], [ArticleID]) VALUES (53, 2, N'ancde', CAST(N'2024-01-27T21:42:10.297' AS DateTime), 9)
INSERT [dbo].[Comment] ([CommentID], [UserID], [Content], [CreatedAt], [ArticleID]) VALUES (54, 2, N'xin chao', CAST(N'2024-01-27T21:54:45.927' AS DateTime), 24)
INSERT [dbo].[Comment] ([CommentID], [UserID], [Content], [CreatedAt], [ArticleID]) VALUES (55, 5, N'hell o
', CAST(N'2024-01-27T21:55:10.710' AS DateTime), 24)
INSERT [dbo].[Comment] ([CommentID], [UserID], [Content], [CreatedAt], [ArticleID]) VALUES (56, 2, N'hello
', CAST(N'2024-02-01T16:33:08.710' AS DateTime), 9)
INSERT [dbo].[Comment] ([CommentID], [UserID], [Content], [CreatedAt], [ArticleID]) VALUES (1056, 2, N'hay


vip', CAST(N'2024-02-16T22:17:55.300' AS DateTime), 26)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([GenreID], [Name], [Description], [ViewCount], [IsDeleted]) VALUES (2, N'Truyện ma', N'fdfas', 0, 0)
INSERT [dbo].[Genres] ([GenreID], [Name], [Description], [ViewCount], [IsDeleted]) VALUES (3, N'Truyện ma', N'fjlsdajflkds', 0, 1)
INSERT [dbo].[Genres] ([GenreID], [Name], [Description], [ViewCount], [IsDeleted]) VALUES (4, N'Truyện ma hay 699', N'DGSDGSDFGSDFGSDF', 0, NULL)
INSERT [dbo].[Genres] ([GenreID], [Name], [Description], [ViewCount], [IsDeleted]) VALUES (5, N'Truyện ngôn tình', N'vgbxcvxcv', 0, NULL)
INSERT [dbo].[Genres] ([GenreID], [Name], [Description], [ViewCount], [IsDeleted]) VALUES (6, N'fasf', N'ádfasdf', 0, NULL)
INSERT [dbo].[Genres] ([GenreID], [Name], [Description], [ViewCount], [IsDeleted]) VALUES (7, N'ffasdfsdafsdafadsfasdf', N'dEP TRAI VL
', 0, NULL)
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Name], [Email], [PhoneNumber], [Address], [DateOfBirth], [Avatar], [Description], [CreatedAt], [Role], [Password], [Gender], [IsDeleted]) VALUES (2, N'lxq2309', N'Lê Xuân Quỳnh', N'lxq.2309@gmail.com', N'', N'', CAST(N'2002-09-23' AS Date), N'https://raw.githubusercontent.com/lxq2309/UploadImage/main/2cb401a5-f032-4e04-8c1e-7bb7dd40ffd3-7010cc8f-b727-4865-980b-c0483cda5f2a.jpg', N'', CAST(N'2024-01-27T20:30:35.253' AS DateTime), 1, 0x41514141414145414143635141414141454466594757573364483751497571434166564A52547143556A6B2F56536755394935396B73436C74782B76636C753141342B57784D714F4C396A5A7143422F65413D3D, 0, NULL)
INSERT [dbo].[Users] ([UserID], [UserName], [Name], [Email], [PhoneNumber], [Address], [DateOfBirth], [Avatar], [Description], [CreatedAt], [Role], [Password], [Gender], [IsDeleted]) VALUES (5, N'quynhle', N'Quynh Le', N'quynh@gmail.com', N'', N'', CAST(N'2024-01-27' AS Date), N'/resource/images/default_avatar.jpg', N'', CAST(N'2024-01-27T21:44:23.470' AS DateTime), 0, 0x415141414141454141436351414141414546716D446243306D54752B794D4268555375766871546138586D5762337172312B32774A42387A6161532B2F314B444E466A7755564B4742315A347762577058773D3D, 0, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Articles] ADD  DEFAULT ('/resource/images/default_cover_image.jpg') FOR [CoverImage]
GO
ALTER TABLE [dbo].[Authors] ADD  DEFAULT ('/resource/images/default_avatar.jpg') FOR [Avatar]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('/resource/images/default_avatar.jpg') FOR [Avatar]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Articles_Authors]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Articles] ([ArticleID])
GO
ALTER TABLE [dbo].[Articles_Authors]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[Articles_Genres]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Articles] ([ArticleID])
GO
ALTER TABLE [dbo].[Articles_Genres]  WITH CHECK ADD FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
GO
ALTER TABLE [dbo].[Bookmarks]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Articles] ([ArticleID])
GO
ALTER TABLE [dbo].[Bookmarks]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Chapters]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Articles] ([ArticleID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Articles] ([ArticleID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [BookWormDB] SET  READ_WRITE 
GO
