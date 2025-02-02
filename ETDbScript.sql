USE [master]
GO
/****** Object:  Database [ExpenseTrackerDB]    Script Date: 24/10/2024 8:16:44 PM ******/
CREATE DATABASE [ExpenseTrackerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExpenseTrackerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ExpenseTrackerDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExpenseTrackerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ExpenseTrackerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExpenseTrackerDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExpenseTrackerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExpenseTrackerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExpenseTrackerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExpenseTrackerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExpenseTrackerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExpenseTrackerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExpenseTrackerDB] SET  MULTI_USER 
GO
ALTER DATABASE [ExpenseTrackerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExpenseTrackerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExpenseTrackerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExpenseTrackerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExpenseTrackerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExpenseTrackerDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ExpenseTrackerDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExpenseTrackerDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExpenseTrackerDB]
GO
/****** Object:  Table [dbo].[UserExpense]    Script Date: 24/10/2024 8:16:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserExpense](
	[UserExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseId] [int] NULL,
	[UserId] [int] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_UserExpense] PRIMARY KEY CLUSTERED 
(
	[UserExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expense]    Script Date: 24/10/2024 8:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense](
	[ExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CategoryId] [int] NULL,
	[ExpenseName] [nvarchar](250) NULL,
	[Amount] [decimal](10, 2) NULL,
	[Description] [nvarchar](252) NULL,
	[Date] [date] NULL,
	[CreatedDate] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[SetDay] [bit] NULL,
	[DaysOfWeek] [nvarchar](250) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_Expense] PRIMARY KEY CLUSTERED 
(
	[ExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 24/10/2024 8:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CategoryName] [nvarchar](252) NULL,
	[Description] [nvarchar](252) NULL,
	[CreatedDate] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[SetAmount] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 24/10/2024 8:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](252) NULL,
	[Password] [nvarchar](252) NULL,
	[ConfirmPassword] [nvarchar](252) NULL,
	[Email] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[Agree] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_usersExpensesView]    Script Date: 24/10/2024 8:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_usersExpensesView]
as
SELECT c.CategoryId, u.UserId, ex.ExpenseId ,c.CategoryName, ex.ExpenseName, ex.Amount, ex.Date, ex.Description
FROM            dbo.UserExpense AS ue INNER JOIN
                         dbo.Category AS c ON ue.CategoryId = c.CategoryId INNER JOIN
                         dbo.[User] AS u ON ue.UserId = u.UserId INNER JOIN
                         dbo.Expense AS ex ON ue.ExpenseId = ex.ExpenseId
GO
/****** Object:  Table [dbo].[Balance]    Script Date: 24/10/2024 8:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Balance](
	[BalanceId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[TotalBalance] [decimal](10, 2) NULL,
	[RemainingBalance] [decimal](10, 2) NULL,
	[TodayExpense] [decimal](10, 2) NULL,
	[MonthId] [int] NULL,
	[YearId] [int] NULL,
	[isActive] [bit] NULL,
	[UpdatedBalance] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Balance] PRIMARY KEY CLUSTERED 
(
	[BalanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Month]    Script Date: 24/10/2024 8:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Month](
	[MonthId] [int] IDENTITY(1,1) NOT NULL,
	[MonthName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED 
(
	[MonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 24/10/2024 8:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ReportType] [nvarchar](252) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[GeneratedDate] [datetime] NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 24/10/2024 8:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[UserInfoId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Street] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ZipCode] [nvarchar](255) NULL,
	[Active] [int] NULL,
 CONSTRAINT [PK_UserInformation] PRIMARY KEY CLUSTERED 
(
	[UserInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Year]    Script Date: 24/10/2024 8:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Year](
	[YearId] [int] IDENTITY(1,1) NOT NULL,
	[YearCount] [nvarchar](50) NULL,
 CONSTRAINT [PK_Year] PRIMARY KEY CLUSTERED 
(
	[YearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Balance] ON 

INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (1, 1, CAST(11.00 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), NULL, 1, 1, NULL, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (19, 2, CAST(121.00 AS Decimal(10, 2)), NULL, NULL, 1, 1, NULL, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (20, 2, CAST(666.00 AS Decimal(10, 2)), NULL, NULL, 1, 3, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (21, 2, CAST(77777.00 AS Decimal(10, 2)), NULL, NULL, 2, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (22, 2, CAST(23232.00 AS Decimal(10, 2)), NULL, NULL, 6, 5, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (23, 2, CAST(12121.00 AS Decimal(10, 2)), NULL, NULL, 7, 3, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (24, 2, CAST(12121.00 AS Decimal(10, 2)), NULL, NULL, 7, 3, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (25, 2, CAST(323.00 AS Decimal(10, 2)), NULL, NULL, 1, 2, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (26, 2, CAST(32313131.00 AS Decimal(10, 2)), NULL, NULL, 3, 3, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (27, 2, CAST(998.00 AS Decimal(10, 2)), NULL, NULL, 4, 2, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (28, 2, CAST(9985.00 AS Decimal(10, 2)), NULL, NULL, 2, 5, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (29, 1, CAST(1877.00 AS Decimal(10, 2)), CAST(1877.00 AS Decimal(10, 2)), NULL, 10, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (30, 1, NULL, NULL, NULL, 2, 3, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (31, 1, NULL, NULL, NULL, 1, 3, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (32, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(-4442444.00 AS Decimal(10, 2)), NULL, 4, 3, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (33, 1, CAST(3000.00 AS Decimal(10, 2)), CAST(624.00 AS Decimal(10, 2)), NULL, 5, 4, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (34, 2, CAST(5000.00 AS Decimal(10, 2)), NULL, NULL, 10, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (35, 2, CAST(11111.00 AS Decimal(10, 2)), NULL, NULL, 1, 2, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (36, 2, CAST(1111.00 AS Decimal(10, 2)), NULL, NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (37, 2, CAST(5000.00 AS Decimal(10, 2)), NULL, NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (38, 2, CAST(11111.00 AS Decimal(10, 2)), NULL, NULL, 2, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (39, 2, CAST(5555.00 AS Decimal(10, 2)), NULL, NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (40, 1, CAST(422.00 AS Decimal(10, 2)), NULL, NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (41, 2, CAST(5555.00 AS Decimal(10, 2)), NULL, NULL, 1, 3, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (42, 2, CAST(1111111.00 AS Decimal(10, 2)), NULL, NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (43, 2, CAST(27755.00 AS Decimal(10, 2)), CAST(16755.00 AS Decimal(10, 2)), NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (44, 1, CAST(5222.00 AS Decimal(10, 2)), CAST(757.00 AS Decimal(10, 2)), NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (45, 2, CAST(5000.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (46, 1, CAST(778.00 AS Decimal(10, 2)), CAST(278.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(278.00 AS Decimal(10, 2)))
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (47, 1, CAST(5000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (48, 2, CAST(3000.00 AS Decimal(10, 2)), CAST(833.00 AS Decimal(10, 2)), NULL, 2, 2, 1, CAST(2756.00 AS Decimal(10, 2)))
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (49, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (50, 1, CAST(5000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)), NULL, 1, 1, 0, CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (51, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (52, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(1400.00 AS Decimal(10, 2)), NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (53, 1, CAST(1600.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (54, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(1100.00 AS Decimal(10, 2)), NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (55, 1, CAST(3000.00 AS Decimal(10, 2)), CAST(212.00 AS Decimal(10, 2)), NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (56, 1, CAST(1000.00 AS Decimal(10, 2)), CAST(166.00 AS Decimal(10, 2)), NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (57, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(219.00 AS Decimal(10, 2)), NULL, 10, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (58, 1, CAST(5000.00 AS Decimal(10, 2)), CAST(2300.00 AS Decimal(10, 2)), NULL, 1, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (59, 1, CAST(1000.00 AS Decimal(10, 2)), CAST(320.00 AS Decimal(10, 2)), NULL, 9, 9, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (60, 1, CAST(5000.00 AS Decimal(10, 2)), CAST(3980.00 AS Decimal(10, 2)), NULL, 2, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (61, 1, CAST(5000.00 AS Decimal(10, 2)), CAST(4600.00 AS Decimal(10, 2)), NULL, 10, 1, 0, NULL)
INSERT [dbo].[Balance] ([BalanceId], [UserId], [TotalBalance], [RemainingBalance], [TodayExpense], [MonthId], [YearId], [isActive], [UpdatedBalance]) VALUES (62, 1, CAST(5000.00 AS Decimal(10, 2)), CAST(3200.00 AS Decimal(10, 2)), NULL, 1, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Balance] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [UserId], [CategoryName], [Description], [CreatedDate], [DateModified], [SetAmount]) VALUES (1, 1, N'Grocery', NULL, CAST(N'2024-10-25T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [UserId], [CategoryName], [Description], [CreatedDate], [DateModified], [SetAmount]) VALUES (2, 1, N'School', NULL, CAST(N'2024-10-25T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [UserId], [CategoryName], [Description], [CreatedDate], [DateModified], [SetAmount]) VALUES (3, 2, N'Shopping', NULL, CAST(N'2024-10-25T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Category] ([CategoryId], [UserId], [CategoryName], [Description], [CreatedDate], [DateModified], [SetAmount]) VALUES (4, 2, N'Fare', NULL, CAST(N'2024-10-25T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Expense] ON 

INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (71, NULL, 2, N'fffffffffffffff', CAST(123333.00 AS Decimal(10, 2)), N'23232', CAST(N'2024-10-21' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (72, NULL, 2, N'bvbvb', CAST(232323.00 AS Decimal(10, 2)), N'42424', CAST(N'2024-10-07' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (76, NULL, 4, N'zzzzzzzzzzz', CAST(2323.00 AS Decimal(10, 2)), N'23232', CAST(N'2024-10-08' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (77, NULL, 3, N'12121', CAST(12121.00 AS Decimal(10, 2)), N'414141', CAST(N'2024-10-01' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (78, NULL, 3, N'13131', CAST(1212121.00 AS Decimal(10, 2)), N'1212121', CAST(N'2024-10-08' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (79, NULL, 4, N'1414141', CAST(32323.00 AS Decimal(10, 2)), N'12121', CAST(N'2024-10-21' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (80, NULL, 4, N'vuivuv', CAST(3232.00 AS Decimal(10, 2)), N'12121', CAST(N'2024-10-22' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1184, 2, 3, N'33', CAST(333.00 AS Decimal(10, 2)), N'3232', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23T21:59:46.323' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1185, 2, 3, N'111', CAST(1212.00 AS Decimal(10, 2)), N'23232', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23T22:01:59.517' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1186, 2, 3, N'111', CAST(1212.00 AS Decimal(10, 2)), N'23232', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23T22:02:02.137' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1189, 2, 3, N'12121', CAST(1212.00 AS Decimal(10, 2)), N'1212', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23T22:13:56.897' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1195, 2, 3, N'232', CAST(111.00 AS Decimal(10, 2)), N'232', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23T22:23:56.403' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1196, 2, 3, N'121', CAST(121.00 AS Decimal(10, 2)), N'121', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23T22:25:47.113' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1197, 2, 3, N'121', CAST(121.00 AS Decimal(10, 2)), N'121', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23T22:26:19.463' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1201, 2, 3, N'121', CAST(121.00 AS Decimal(10, 2)), N'121', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23T23:07:25.233' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1202, 2, 4, N'111', CAST(1111.00 AS Decimal(10, 2)), N'12121', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23T23:13:41.883' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1203, 2, 3, N'121', CAST(121.00 AS Decimal(10, 2)), N'121', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23T23:34:03.777' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1205, 2, 3, N'444', CAST(3232.00 AS Decimal(10, 2)), N'23232', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-24T00:06:32.263' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1206, 2, 3, N'5555', CAST(12121.00 AS Decimal(10, 2)), N'23232', NULL, CAST(N'2024-10-24T00:06:51.843' AS DateTime), NULL, 1, N'Sunday,Wednesday,Friday,Saturday', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1207, 2, 3, N'zzzzzzzzzzz', CAST(444.00 AS Decimal(10, 2)), N'23232', NULL, CAST(N'2024-10-24T00:07:33.873' AS DateTime), NULL, 0, N'', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1208, 2, 3, N'1313', CAST(13131.00 AS Decimal(10, 2)), N'13131', NULL, CAST(N'2024-10-24T00:09:31.850' AS DateTime), NULL, 1, N'Monday,Wednesday,Thursday', CAST(N'2024-10-08' AS Date), CAST(N'2024-11-01' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1209, 2, 3, N'1111', CAST(23.00 AS Decimal(10, 2)), N'232', CAST(N'2024-10-09' AS Date), CAST(N'2024-10-24T00:13:38.637' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1210, 2, 3, N'555', CAST(5555.00 AS Decimal(10, 2)), N'23232', CAST(N'2024-10-09' AS Date), CAST(N'2024-10-24T00:13:58.233' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1217, 2, 3, N'1111', CAST(1000.00 AS Decimal(10, 2)), N'12121', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-24T00:23:32.530' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1218, 2, 3, N'444', CAST(10000.00 AS Decimal(10, 2)), N'232', CAST(N'2024-10-15' AS Date), CAST(N'2024-10-24T00:23:53.657' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1219, 2, 3, N'1000', CAST(1000.00 AS Decimal(10, 2)), N'2323', NULL, CAST(N'2024-10-24T00:24:45.647' AS DateTime), NULL, 1, N'Monday,Thursday,Saturday', CAST(N'2024-10-08' AS Date), CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1220, 2, 3, N'111', CAST(111.00 AS Decimal(10, 2)), N'111', CAST(N'2024-10-09' AS Date), CAST(N'2024-10-24T00:26:22.920' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1226, 2, 3, N'4000', CAST(4000.00 AS Decimal(10, 2)), N'232', CAST(N'2024-10-15' AS Date), CAST(N'2024-10-24T00:37:19.323' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1227, 2, 3, N'244', CAST(244.00 AS Decimal(10, 2)), N'244', CAST(N'2024-10-15' AS Date), CAST(N'2024-10-24T00:37:40.770' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1237, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T07:54:09.813' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1238, 1, 1, N'200', CAST(500.00 AS Decimal(10, 2)), N'2002', CAST(N'2024-10-29' AS Date), CAST(N'2024-10-24T07:55:02.827' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1239, 1, 1, N'5123', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T07:56:28.220' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1240, 1, 1, N'010', CAST(100.00 AS Decimal(10, 2)), N'1010', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T07:56:44.960' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1241, 1, 2, N'010', CAST(500.00 AS Decimal(10, 2)), N'0121', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T07:57:09.047' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1242, 1, 1, N'1010', CAST(100.00 AS Decimal(10, 2)), N'1001', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T07:57:32.020' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1243, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'1010', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T08:00:49.853' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1244, 1, 1, N'10', CAST(500.00 AS Decimal(10, 2)), N'1010', CAST(N'2024-10-09' AS Date), CAST(N'2024-10-24T08:01:03.010' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1245, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'1010', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:04:11.100' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1246, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T08:04:23.463' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1247, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T08:04:36.870' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1248, 1, 1, N'200', CAST(200.00 AS Decimal(10, 2)), N'200', CAST(N'2024-10-08' AS Date), CAST(N'2024-10-24T08:04:53.260' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1249, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:08:25.833' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1250, 1, 1, N'10', CAST(10.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T08:08:41.237' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1251, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T08:08:52.243' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1252, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:09:10.027' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1253, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:10:15.433' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1254, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:10:29.877' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1255, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T08:10:38.093' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1256, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T08:10:51.760' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1257, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T08:11:08.313' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1258, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:17:45.763' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1259, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:17:53.720' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1260, 1, 1, N'200', CAST(200.00 AS Decimal(10, 2)), N'20', CAST(N'2024-10-09' AS Date), CAST(N'2024-10-24T08:18:30.347' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1261, 1, 1, N'200', CAST(200.00 AS Decimal(10, 2)), N'200', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:18:42.707' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1262, 1, 2, N'200', CAST(200.00 AS Decimal(10, 2)), N'200', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T08:19:52.983' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1263, 1, 1, N'200', CAST(200.00 AS Decimal(10, 2)), N'200', CAST(N'2024-10-09' AS Date), CAST(N'2024-10-24T08:20:03.013' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1264, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:23:03.387' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1265, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-10' AS Date), CAST(N'2024-10-24T08:23:14.933' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1266, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:23:22.143' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1267, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:24:23.620' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1268, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T08:31:24.137' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1269, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:31:32.117' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1270, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:33:33.980' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1271, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:33:44.180' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1272, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-24T08:33:50.760' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1273, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:33:56.733' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1274, 1, 1, N'100', CAST(500.00 AS Decimal(10, 2)), N'500', CAST(N'2024-10-09' AS Date), CAST(N'2024-10-24T08:34:09.747' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1275, 2, 4, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:35:16.540' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1276, 2, 3, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:35:22.843' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1277, 2, 3, N'100', CAST(1223.00 AS Decimal(10, 2)), N'123213', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T08:47:11.293' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1279, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T10:40:19.357' AS DateTime), NULL, 1, N'Sunday,Tuesday,Thursday', CAST(N'2024-10-08' AS Date), CAST(N'2024-10-14' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1280, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T10:40:36.233' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1281, 1, 1, N'213', CAST(123.00 AS Decimal(10, 2)), N'123', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T11:32:27.087' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1282, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'10', CAST(N'2024-10-16' AS Date), CAST(N'2024-10-24T11:32:38.490' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1283, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-16' AS Date), CAST(N'2024-10-24T11:32:48.983' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1284, 1, 1, N'djjdjdjd', CAST(122.00 AS Decimal(10, 2)), N'232', NULL, CAST(N'2024-10-24T11:39:41.693' AS DateTime), NULL, 1, N'Sunday,Wednesday,Saturday', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-31' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1285, 1, 1, N'2112', CAST(1212.00 AS Decimal(10, 2)), N'1212', NULL, CAST(N'2024-10-24T11:42:57.173' AS DateTime), NULL, 1, N'Sunday,Wednesday,Friday,Saturday', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-31' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1286, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T11:45:29.147' AS DateTime), NULL, 1, N'Sunday,Wednesday,Saturday', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-31' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1287, 1, 1, N'123', CAST(12.00 AS Decimal(10, 2)), N'2323', NULL, CAST(N'2024-10-24T13:16:30.930' AS DateTime), NULL, 1, N'Sunday,Tuesday,Thursday,Friday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1288, 1, 1, N'23', CAST(1.00 AS Decimal(10, 2)), N'1', NULL, CAST(N'2024-10-24T13:17:20.253' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1289, 1, 1, N'1', CAST(1.00 AS Decimal(10, 2)), N'1', NULL, CAST(N'2024-10-24T13:22:27.123' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1290, 1, 1, N'test', CAST(100.00 AS Decimal(10, 2)), N'1', NULL, CAST(N'2024-10-24T13:27:35.743' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1291, 1, 1, N'1', CAST(100.00 AS Decimal(10, 2)), N'1', NULL, CAST(N'2024-10-24T13:28:04.657' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1292, 1, 1, N'1', CAST(1.00 AS Decimal(10, 2)), N'1', NULL, CAST(N'2024-10-24T13:28:31.970' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1293, 1, 1, N'1', CAST(1.00 AS Decimal(10, 2)), N'1', NULL, CAST(N'2024-10-24T13:28:59.887' AS DateTime), NULL, 1, N'Monday,Wednesday,Friday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1294, 1, 1, N'1', CAST(5.00 AS Decimal(10, 2)), N'1', CAST(N'2024-10-24' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1295, 1, 1, N'1', CAST(100.00 AS Decimal(10, 2)), N'1', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T13:43:34.213' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1296, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'1', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T13:43:53.350' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1297, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T13:46:45.370' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1298, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'10', NULL, CAST(N'2024-10-24T13:47:05.760' AS DateTime), NULL, 1, N'Sunday,Wednesday,Saturday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1299, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'10', NULL, CAST(N'2024-10-24T13:47:11.263' AS DateTime), NULL, 1, N'Sunday,Wednesday,Saturday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1300, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'10', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T13:48:13.687' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1301, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T13:48:36.180' AS DateTime), NULL, 0, N'', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1302, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T13:49:49.757' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1303, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T13:52:34.053' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1304, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T13:54:25.973' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1305, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T13:55:04.770' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1306, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T13:55:11.067' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1307, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T13:55:12.383' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
GO
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1308, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T13:55:12.680' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1309, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T13:55:12.840' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1310, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T13:55:12.990' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1311, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T13:55:13.173' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1312, 1, 1, N'10', CAST(1.00 AS Decimal(10, 2)), N'1', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T13:55:50.590' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1313, 1, 1, N'100', CAST(1.00 AS Decimal(10, 2)), N'1', NULL, CAST(N'2024-10-24T13:56:05.950' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1314, 1, 1, N'1', CAST(1.00 AS Decimal(10, 2)), N'1', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T14:04:37.347' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1315, 1, 1, N'1', CAST(1.00 AS Decimal(10, 2)), N'1', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T14:04:53.507' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1316, 1, 1, N'1', CAST(11.00 AS Decimal(10, 2)), N'1', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T14:06:37.947' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1317, 1, 2, N'1', CAST(1.00 AS Decimal(10, 2)), N'1', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T14:06:53.667' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1318, 1, 1, N'1', CAST(1.00 AS Decimal(10, 2)), N'1', NULL, CAST(N'2024-10-24T14:07:07.280' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1319, 1, 1, N'trse', CAST(100.00 AS Decimal(10, 2)), N'121', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T17:01:40.627' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1320, 1, 1, N'121', CAST(100.00 AS Decimal(10, 2)), N'121', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T17:01:50.223' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1321, 1, 1, N'121', CAST(200.00 AS Decimal(10, 2)), N'12', NULL, CAST(N'2024-10-24T17:02:10.307' AS DateTime), NULL, 1, N'Sunday,Monday,Tuesday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1322, 1, 1, N'121', CAST(200.00 AS Decimal(10, 2)), N'12', NULL, CAST(N'2024-10-24T17:02:16.643' AS DateTime), NULL, 1, N'Sunday,Monday,Tuesday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1323, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'121', NULL, CAST(N'2024-10-24T17:03:21.970' AS DateTime), NULL, 1, N'Sunday,Monday,Tuesday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1324, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'121', NULL, CAST(N'2024-10-24T17:03:21.973' AS DateTime), NULL, 1, N'Sunday,Monday,Tuesday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1325, 1, 1, N'10', CAST(10.00 AS Decimal(10, 2)), N'121', NULL, CAST(N'2024-10-24T17:03:59.417' AS DateTime), NULL, 1, N'Sunday,Monday,Tuesday,Wednesday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1326, 1, 1, N'500', CAST(500.00 AS Decimal(10, 2)), N'5525', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T18:43:16.940' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1327, 1, 1, N'23232', CAST(2323.00 AS Decimal(10, 2)), N'2323', CAST(N'2024-10-10' AS Date), CAST(N'2024-10-24T18:44:35.437' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1328, 1, 1, N'111', CAST(111.00 AS Decimal(10, 2)), N'232', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T18:45:59.277' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1329, 1, 1, N'2323', CAST(500.00 AS Decimal(10, 2)), N'2323', CAST(N'2024-10-17' AS Date), CAST(N'2024-10-24T18:46:12.917' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1330, 1, 1, N'2323', CAST(500.00 AS Decimal(10, 2)), N'2323', CAST(N'2024-10-12' AS Date), CAST(N'2024-10-24T18:46:21.060' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1331, 1, 1, N'232', CAST(232.00 AS Decimal(10, 2)), N'232', CAST(N'2024-10-03' AS Date), CAST(N'2024-10-24T18:46:36.007' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1332, 1, 1, N'500', CAST(500.00 AS Decimal(10, 2)), N'500', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T18:49:05.463' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1333, 1, 1, N'500', CAST(500.00 AS Decimal(10, 2)), N'500', CAST(N'2024-10-02' AS Date), CAST(N'2024-10-24T18:49:11.297' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1334, 1, 1, N'500', CAST(500.00 AS Decimal(10, 2)), N'1010', CAST(N'2024-10-09' AS Date), CAST(N'2024-10-24T18:55:33.350' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1335, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T18:55:56.937' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1336, 1, 2, N'500', CAST(500.00 AS Decimal(10, 2)), N'200', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T18:56:12.147' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1337, 1, 2, N'500', CAST(500.00 AS Decimal(10, 2)), N'500', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T18:56:35.650' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1338, 1, 2, N'500', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T18:59:45.377' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1339, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T18:59:55.040' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1340, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T19:03:35.037' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1341, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-04' AS Date), CAST(N'2024-10-24T19:03:44.423' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1342, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:03:57.797' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1343, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:08:26.903' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1344, 1, 1, N'200', CAST(200.00 AS Decimal(10, 2)), N'200', CAST(N'2024-10-03' AS Date), CAST(N'2024-10-24T19:23:18.103' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1345, 1, 2, N'10', CAST(10.00 AS Decimal(10, 2)), N'10', NULL, CAST(N'2024-10-24T19:23:33.193' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1346, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:27:25.127' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1347, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:27:33.123' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1348, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:27:53.480' AS DateTime), NULL, 1, N'Wednesday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1349, 1, 1, N'200', CAST(200.00 AS Decimal(10, 2)), N'0020', NULL, CAST(N'2024-10-24T19:29:01.060' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1350, 1, 1, N'10', CAST(10.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:31:51.687' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1351, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:32:23.493' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1352, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T19:32:46.487' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1353, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:33:15.937' AS DateTime), NULL, 1, N'Wednesday', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1354, 1, 1, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T19:33:33.090' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1355, 1, 1, N'10', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:44:45.000' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1356, 1, 2, N'10', CAST(10.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:45:02.767' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1357, 1, 1, N'10', CAST(10.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:45:21.123' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1358, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T19:45:40.857' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1359, 1, 1, N'10', CAST(10.00 AS Decimal(10, 2)), N'10', NULL, CAST(N'2024-10-24T19:47:41.373' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1360, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T19:49:39.127' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1361, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', CAST(N'2024-10-24' AS Date), CAST(N'2024-10-24T20:10:45.940' AS DateTime), NULL, 0, N'', NULL, NULL)
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1362, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T20:11:00.257' AS DateTime), NULL, 1, N'Monday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
INSERT [dbo].[Expense] ([ExpenseId], [UserId], [CategoryId], [ExpenseName], [Amount], [Description], [Date], [CreatedDate], [DateModified], [SetDay], [DaysOfWeek], [StartDate], [EndDate]) VALUES (1363, 1, 2, N'100', CAST(100.00 AS Decimal(10, 2)), N'100', NULL, CAST(N'2024-10-24T20:11:17.450' AS DateTime), NULL, 1, N'Sunday,Monday,Tuesday', CAST(N'2024-10-24' AS Date), CAST(N'2024-11-24' AS Date))
SET IDENTITY_INSERT [dbo].[Expense] OFF
GO
SET IDENTITY_INSERT [dbo].[Month] ON 

INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (1, N'January')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (2, N'February')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (3, N'March')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (4, N'April')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (5, N'May')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (6, N'June')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (7, N'July')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (8, N'August')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (9, N'September')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (10, N'Octoboer')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (11, N'November')
INSERT [dbo].[Month] ([MonthId], [MonthName]) VALUES (12, N'December')
SET IDENTITY_INSERT [dbo].[Month] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (1, N'kawkaw', N'123', NULL, N'kaw@gmai..com', N'123', 1, NULL, NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (2, N'fawfaw', N'123', NULL, N'fawfaw@gmail.com', N'262780', 0, CAST(N'2024-09-05T11:44:03.927' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (3, N'teste123', N'123', NULL, N'tyeat@gmail.com', N'456503', 0, CAST(N'2024-09-05T11:50:19.610' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (4, N'kawkaw2', N'123', N'123', N'fff', N'335002', 0, CAST(N'2024-09-09T13:47:14.347' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (5, N'fsfs', N'123', N'123', N'fssfs', N'120228', 0, CAST(N'2024-09-09T14:02:21.467' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (6, N'fsfsds', N'123', N'123', N'fsfsds', N'820243', 0, CAST(N'2024-09-09T14:03:29.623' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (7, N'gh123', N'123', N'123', N'ghhhh', N'995709', 0, CAST(N'2024-09-09T14:13:44.523' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (8, N'lex123', N'123', N'123', N'wakwak@gmail.com', N'594232', 0, CAST(N'2024-09-09T15:46:12.860' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (9, N'waf123', N'123', N'123', N'waf@gmail.com', N'366592', 0, CAST(N'2024-09-09T15:47:19.497' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (10, N'test121', N'123', N'123', N'test1234@gmail.com', N'198466', 0, CAST(N'2024-09-09T15:55:00.377' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (11, N'kawkaw5000', N'123', N'123', N'testyser123@gmail.com', N'307785', 0, CAST(N'2024-09-11T14:10:23.370' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (12, N'testeste333', N'123', N'123', N'testAccount@gmail.com', N'218634', 0, CAST(N'2024-10-12T20:31:50.490' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (13, N'awkawk', N'123', N'123', N'awkawk@gmail.com', N'244043', 0, CAST(N'2024-10-13T23:20:57.627' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([UserId], [Username], [Password], [ConfirmPassword], [Email], [Code], [Status], [CreatedDate], [DateModified], [Agree]) VALUES (14, N'sam123', N'123', N'123', N'sampl2@gmail.com', N'382050', 0, CAST(N'2024-10-14T03:06:32.727' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserExpense] ON 

INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (15, 1, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (16, 1, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (17, 1, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (18, 1, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (19, 2, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (20, 1, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (21, 2, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (22, 2, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (23, 1, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (24, 2, 2, 4)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (25, 1, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (80, 74, 2, 4)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (81, 75, 2, 4)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (82, 76, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (83, 77, 2, 4)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (84, 78, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (85, 79, 2, 4)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (86, 80, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (87, 81, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (88, 82, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (89, 83, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (90, 84, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (91, 85, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (92, 86, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (93, 87, 2, 4)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (94, 88, 2, 4)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (95, 89, 2, 4)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (96, 90, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (97, 91, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (98, 92, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (99, 93, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (100, 94, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (101, 95, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (102, 96, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (103, 97, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (104, 98, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (105, 99, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (106, 100, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (107, 101, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (108, 102, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (109, 103, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (110, 104, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (111, 105, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (112, 106, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (113, 107, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (114, 108, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (115, 109, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (116, 110, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (117, 111, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (118, 112, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (119, 113, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (120, 114, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (121, 115, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (122, 116, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (123, 117, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (124, 118, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (125, 119, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (126, 120, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (127, 124, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (128, 125, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (129, 126, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (130, 127, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (131, 128, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (132, 129, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (133, 130, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (134, 131, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (135, 132, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1123, 1125, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1124, 1126, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1125, 1127, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1126, 1128, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1127, 1129, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1128, 1130, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1129, 1132, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1130, 1131, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1131, 1133, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1132, 1134, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1133, 1135, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1134, 1136, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1135, 1137, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1136, 1138, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1137, 1139, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1138, 1140, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1139, 1141, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1140, 1142, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1141, 1143, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1142, 1144, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1143, 1145, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1144, 1146, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1145, 1147, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1146, 1148, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1147, 1149, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1148, 1150, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1149, 1151, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1150, 1152, 2, 4)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1151, 1153, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1152, 1154, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1153, 1155, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1154, 1156, 1, 1)
GO
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1155, 1157, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1156, 1158, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1157, 1159, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1158, 1160, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1159, 1161, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1160, 1162, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1161, 1163, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1162, 1164, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1163, 1165, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1164, 1166, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1165, 1167, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1166, 1168, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1167, 1169, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1168, 1170, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1169, 1171, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1170, 1172, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1171, 1173, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1172, 1174, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1173, 1175, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1174, 1176, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1175, 1177, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1176, 1178, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1177, 1179, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1178, 1180, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1179, 1181, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1180, 1182, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1181, 1183, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1182, 1184, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1183, 1185, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1184, 1186, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1185, 1187, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1186, 1188, 2, 4)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1187, 1189, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1188, 1190, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1189, 1191, 1, 2)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1190, 1192, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1191, 1193, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1192, 1194, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1193, 1195, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1194, 1196, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1195, 1197, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1196, 1198, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1197, 1199, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1198, 1200, 1, 1)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1199, 1201, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1200, 1202, 2, 4)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1201, 1203, 2, 3)
INSERT [dbo].[UserExpense] ([UserExpenseId], [ExpenseId], [UserId], [CategoryId]) VALUES (1202, 1204, 1, 1)
SET IDENTITY_INSERT [dbo].[UserExpense] OFF
GO
SET IDENTITY_INSERT [dbo].[Year] ON 

INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (1, N'2024')
INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (2, N'2025')
INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (3, N'2026')
INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (4, N'2027')
INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (5, N'2028')
INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (6, N'2029')
INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (7, N'2030')
INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (8, N'2031')
INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (9, N'2032')
INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (10, N'2033')
INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (11, N'2034')
INSERT [dbo].[Year] ([YearId], [YearCount]) VALUES (12, N'2035')
SET IDENTITY_INSERT [dbo].[Year] OFF
GO
ALTER TABLE [dbo].[Balance]  WITH CHECK ADD  CONSTRAINT [FK_Balance_Month] FOREIGN KEY([MonthId])
REFERENCES [dbo].[Month] ([MonthId])
GO
ALTER TABLE [dbo].[Balance] CHECK CONSTRAINT [FK_Balance_Month]
GO
ALTER TABLE [dbo].[Balance]  WITH CHECK ADD  CONSTRAINT [FK_Balance_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Balance] CHECK CONSTRAINT [FK_Balance_User]
GO
ALTER TABLE [dbo].[Balance]  WITH CHECK ADD  CONSTRAINT [FK_Balance_Year] FOREIGN KEY([YearId])
REFERENCES [dbo].[Year] ([YearId])
GO
ALTER TABLE [dbo].[Balance] CHECK CONSTRAINT [FK_Balance_Year]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_User]
GO
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_Category]
GO
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_User]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
ALTER TABLE [dbo].[UserExpense]  WITH CHECK ADD  CONSTRAINT [FK_UserExpense_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserExpense] CHECK CONSTRAINT [FK_UserExpense_User]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_User]
GO
/****** Object:  StoredProcedure [dbo].[SearchExpenses]    Script Date: 24/10/2024 8:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchExpenses]
    @SearchTerm NVARCHAR(100)
AS
BEGIN
    SELECT 
        e.ExpenseId,
        e.UserId,
        e.CategoryId,
        e.ExpenseName,
        e.Amount,
        e.Description,
        e.Date,
        e.CreatedDate,
        e.DateModified,
        c.CategoryName  -- Make sure to include this
    FROM 
        Expense e
    INNER JOIN 
        Category c ON e.CategoryId = c.CategoryId
    WHERE 
        (e.ExpenseName LIKE '%' + @SearchTerm + '%' 
         OR c.CategoryName LIKE '%' + @SearchTerm + '%' 
         OR CONVERT(NVARCHAR, e.Amount) LIKE '%' + @SearchTerm + '%' 
         OR e.Description LIKE '%' + @SearchTerm + '%'
         OR CONVERT(NVARCHAR, e.Date, 120) LIKE '%' + @SearchTerm + '%');  -- Adjust date format if needed
END
GO
USE [master]
GO
ALTER DATABASE [ExpenseTrackerDB] SET  READ_WRITE 
GO
