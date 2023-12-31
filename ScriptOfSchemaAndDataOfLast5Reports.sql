USE [master]
GO
/****** Object:  Database [FreelanceJobDB]    Script Date: 20/11/2023 09:33:58 م ******/
CREATE DATABASE [FreelanceJobDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FreelanceJobDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL19\MSSQL\DATA\FreelanceJobDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FreelanceJobDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL19\MSSQL\DATA\FreelanceJobDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FreelanceJobDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FreelanceJobDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FreelanceJobDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FreelanceJobDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FreelanceJobDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FreelanceJobDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FreelanceJobDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FreelanceJobDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FreelanceJobDB] SET  MULTI_USER 
GO
ALTER DATABASE [FreelanceJobDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FreelanceJobDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FreelanceJobDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FreelanceJobDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FreelanceJobDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FreelanceJobDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FreelanceJobDB', N'ON'
GO
ALTER DATABASE [FreelanceJobDB] SET QUERY_STORE = OFF
GO
USE [FreelanceJobDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccidentCauses]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccidentCauses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AccidentCauses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccidentImages]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccidentImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[AccidentId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AccidentImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accidents]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accidents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RigId] [int] NOT NULL,
	[TimeOfEvent] [time](7) NOT NULL,
	[DateOfEvent] [date] NOT NULL,
	[TypeOfInjuryID] [int] NOT NULL,
	[ViolationCategoryId] [int] NOT NULL,
	[AccidentCausesId] [int] NOT NULL,
	[PreventionCategoryId] [int] NOT NULL,
	[ClassificationOfAccidentId] [int] NOT NULL,
	[AccidentLocation] [nvarchar](max) NOT NULL,
	[QHSEEmpCode] [int] NOT NULL,
	[QHSEPositionName] [nvarchar](max) NOT NULL,
	[QHSEEmpName] [nvarchar](max) NOT NULL,
	[PusherCode] [int] NOT NULL,
	[PusherPositionName] [nvarchar](max) NOT NULL,
	[PusherName] [nvarchar](max) NOT NULL,
	[DrillerCode] [int] NOT NULL,
	[DrillerPositionName] [nvarchar](max) NOT NULL,
	[DrillerName] [nvarchar](max) NOT NULL,
	[InjuredPersonCode] [int] NOT NULL,
	[InjuredPersonPositionName] [nvarchar](max) NOT NULL,
	[InjuredPersonName] [nvarchar](max) NOT NULL,
	[DescriptionOfTheEvent] [nvarchar](max) NOT NULL,
	[ImmediateActionType] [nvarchar](max) NOT NULL,
	[DirectCauses] [nvarchar](max) NOT NULL,
	[RootCauses] [nvarchar](max) NOT NULL,
	[Recommendations] [nvarchar](max) NOT NULL,
	[userID] [nvarchar](450) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Accidents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendances]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendances](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[No] [int] NULL,
	[Position] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[PTSMId] [int] NOT NULL,
 CONSTRAINT [PK_Attendances] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bop]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RigId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[ECDC] [int] NOT NULL,
	[Client] [int] NOT NULL,
	[Service] [int] NOT NULL,
	[Visitors] [int] NOT NULL,
	[Catering] [int] NOT NULL,
	[WatchMen] [int] NOT NULL,
	[inspection] [int] NOT NULL,
	[Rental] [int] NOT NULL,
	[Other] [int] NOT NULL,
	[ManPower] [int] NOT NULL,
	[TotalManHours] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Bop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassificationOfAccidents]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassificationOfAccidents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ClassificationOfAccidents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classifications]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Classifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComminucationMethods]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComminucationMethods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ComminucationMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrewQuizAndQHSEDaily]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrewQuizAndQHSEDaily](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CrewId] [int] NOT NULL,
	[QHSEDailyId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CrewQuizAndQHSEDaily] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crews]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CrewName] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Crews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrewSaftyAlertAndQHSEDaily]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrewSaftyAlertAndQHSEDaily](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CrewId] [int] NOT NULL,
	[QHSEDailyId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CrewSaftyAlertAndQHSEDaily] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DaysSinceNoLTI]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaysSinceNoLTI](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RigId] [int] NOT NULL,
	[Days] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DaysSinceNoLTI] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrillImages]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrillImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[DrillId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DrillImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drills]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RigId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Duration] [nvarchar](max) NOT NULL,
	[DrillTypeId] [int] NOT NULL,
	[TimeInitiated] [time](7) NOT NULL,
	[TimeCompleted] [time](7) NOT NULL,
	[DrillScenario] [nvarchar](max) NOT NULL,
	[EmergencyEquipmentUsed] [nvarchar](max) NOT NULL,
	[EffectivenessPoints] [nvarchar](max) NOT NULL,
	[DeficienciesPoints] [nvarchar](max) NOT NULL,
	[Recommendations] [nvarchar](max) NOT NULL,
	[STPCode] [int] NOT NULL,
	[STPPositionName] [nvarchar](max) NOT NULL,
	[STPName] [nvarchar](max) NOT NULL,
	[QHSEEmpCode] [int] NOT NULL,
	[QHSEPositionName] [nvarchar](max) NOT NULL,
	[QHSEEmpName] [nvarchar](max) NOT NULL,
	[userID] [nvarchar](450) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Drills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrillTypes]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrillTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DrillTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverNames]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverNames](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[LicenceExpireData] [date] NOT NULL,
	[LicenceNumber] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DriverNames] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmergencyResponseTeamMembers]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyResponseTeamMembers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamMemberCode] [int] NULL,
	[TeamMemberPosition] [nvarchar](max) NOT NULL,
	[TeamMemberName] [nvarchar](max) NOT NULL,
	[DrillId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EmergencyResponseTeamMembers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpCodes]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpCodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[PositionId] [int] NOT NULL,
	[RigId] [int] NOT NULL,
 CONSTRAINT [PK_EmpCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeCompetencyEvaluation]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeCompetencyEvaluation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RigId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[QHSEEmpCode] [int] NOT NULL,
	[QHSEPositionName] [nvarchar](max) NOT NULL,
	[QHSEEmpName] [nvarchar](max) NOT NULL,
	[EmployeeCode] [int] NOT NULL,
	[EmployeePositionName] [nvarchar](max) NOT NULL,
	[EmployeeName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[userID] [nvarchar](450) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeCompetencyEvaluation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HazardImages]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HazardImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[PotentialHazardId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_HazardImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JMP_Passengers]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMP_Passengers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[PassengerID] [int] NOT NULL,
	[JMPID] [int] NOT NULL,
 CONSTRAINT [PK_JMP_Passengers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JMPs]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMPs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JournyNumber] [int] NOT NULL,
	[NightDrivingReason] [nvarchar](max) NULL,
	[QHSEManagerMustApprove] [nvarchar](max) NULL,
	[Date] [date] NOT NULL,
	[Destination] [nvarchar](max) NOT NULL,
	[Company] [nvarchar](max) NOT NULL,
	[SpeedLimit] [float] NOT NULL,
	[Distance] [float] NOT NULL,
	[PurposeOfJourny] [nvarchar](max) NOT NULL,
	[ReachBeforeDark] [nvarchar](max) NOT NULL,
	[CommunicationID] [int] NOT NULL,
	[JournyManagerName] [nvarchar](max) NOT NULL,
	[ManagerNumber] [nvarchar](max) NOT NULL,
	[DriverNameId] [int] NOT NULL,
	[InspectionVechile] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[Time] [float] NOT NULL,
	[VehicleId] [int] NOT NULL,
	[EstimatedArriveDate] [date] NOT NULL,
	[EstimatedArriveTime] [time](7) NOT NULL,
	[RestLocationNames] [nvarchar](max) NOT NULL,
	[RouteNameID] [int] NOT NULL,
	[userID] [nvarchar](450) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[EnterTime] [datetime2](7) NOT NULL,
	[notifyStatus] [int] NOT NULL,
	[ArrivalTime] [datetime2](7) NOT NULL,
	[ArrivalStatus] [bit] NOT NULL,
 CONSTRAINT [PK_JMPs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeadershipVisits]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeadershipVisits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeadershipType] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LeadershipVisits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaderShipVisitsAndQHSEDaily]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaderShipVisitsAndQHSEDaily](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeadershipVisitId] [int] NOT NULL,
	[QHSEDailyId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LeaderShipVisitsAndQHSEDaily] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LTIPrevDateAndDays]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LTIPrevDateAndDays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DaysSinceNoLTIId] [int] NOT NULL,
	[PrevDays] [int] NOT NULL,
	[PrevDate] [date] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_LTIPrevDateAndDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NonRecordableAccidents]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NonRecordableAccidents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccidentType] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_NonRecordableAccidents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passengers]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passengers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Telephone] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Passengers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PotentialHazard]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PotentialHazard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RigId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[PR_IssueDate] [date] NOT NULL,
	[PR_No] [int] NOT NULL,
	[PO_No] [int] NOT NULL,
	[ResponibilityId] [int] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[NeededAction] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[userID] [nvarchar](450) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PotentialHazard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPEAndPPEReceivings]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPEAndPPEReceivings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PPEId] [int] NOT NULL,
	[PPEReceivingId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PPEAndPPEReceivings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPEReceivings]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPEReceivings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[EmployeeCode] [int] NOT NULL,
	[EmployeePositionName] [nvarchar](max) NOT NULL,
	[EmployeeName] [nvarchar](max) NOT NULL,
	[QHSEEmpCode] [int] NOT NULL,
	[QHSEPositionName] [nvarchar](max) NOT NULL,
	[QHSEEmpName] [nvarchar](max) NOT NULL,
	[ThermalCoverallsSize] [nvarchar](max) NOT NULL,
	[SafetyBootsSize] [nvarchar](max) NOT NULL,
	[NormalCoverallsSize] [nvarchar](max) NOT NULL,
	[RigId] [int] NOT NULL,
	[userID] [nvarchar](450) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PPEReceivings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPEs]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPEs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PPEs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreventionCategorys]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreventionCategorys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PreventionCategorys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProblemFacedDuringRigMoves]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProblemFacedDuringRigMoves](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Item] [nvarchar](max) NOT NULL,
	[ProblemDescription] [nvarchar](max) NOT NULL,
	[TimeLostProblem] [float] NOT NULL,
	[RecommendationProblemRepeated] [nvarchar](max) NOT NULL,
	[RigMovePerformanceId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProblemFacedDuringRigMoves] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PTSMs]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PTSMs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RigId] [int] NOT NULL,
	[Time] [time](7) NOT NULL,
	[Date] [date] NOT NULL,
	[TrainerName] [nvarchar](max) NOT NULL,
	[NumsofTrainees] [int] NOT NULL,
	[SubjectTitle] [nvarchar](max) NOT NULL,
	[SubjectContent] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_PTSMs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QHSEDailyReport]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QHSEDailyReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RigId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[StopCardsRecords] [int] NOT NULL,
	[PTSMRecords] [int] NOT NULL,
	[DrillsRecords] [int] NOT NULL,
	[ManPowerNumber] [int] NOT NULL,
	[TotalManPowerHours] [int] NOT NULL,
	[WeeklyInspection] [int] NULL,
	[MonthlyInspection] [int] NULL,
	[WallName] [nvarchar](max) NOT NULL,
	[TotalPTW] [int] NOT NULL,
	[SafetyAlertCrewNumber] [int] NOT NULL,
	[QuizCrewNumber] [int] NOT NULL,
	[PTWCold] [int] NOT NULL,
	[PTWHot] [int] NOT NULL,
	[RecordableAccident] [int] NOT NULL,
	[NonRecordableAccident] [int] NOT NULL,
	[RigVehiclesKilometers] [int] NOT NULL,
	[SafetyInduction] [int] NOT NULL,
	[RigTrackingClosedPoints] [int] NOT NULL,
	[RigTrackingOpenPoints] [int] NOT NULL,
	[DaysSinceLastLTI] [int] NOT NULL,
	[DaysSinceNoLTIId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_QHSEDailyReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordableAccidents]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordableAccidents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccidentType] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RecordableAccidents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportedByNames]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportedByNames](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[EmpCode] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[PositionId] [int] NOT NULL,
 CONSTRAINT [PK_ReportedByNames] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportedByPositions]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportedByPositions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ReportedByPositions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Responsibility]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responsibility](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Responsibility] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RigMovePerformances]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RigMovePerformances](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RigId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldWellName] [nvarchar](max) NOT NULL,
	[NewWellName] [nvarchar](max) NOT NULL,
	[MoveDistance] [float] NOT NULL,
	[ReleaseTime] [time](7) NOT NULL,
	[AcceptanceTime] [time](7) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[AcceptanceDate] [date] NOT NULL,
	[ActualMoveTime] [float] NOT NULL,
	[DieselConsumed] [float] NOT NULL,
	[TargetArchived] [nvarchar](max) NOT NULL,
	[BudgetTargetTotalDay] [float] NOT NULL,
	[BudgetTargetTotalMoney] [float] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RigMovePerformances] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rigs]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rigs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Rigs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteNames]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteNames](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RouteNames] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StopCardRegisters]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StopCardRegisters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[EmpCode] [int] NOT NULL,
	[ReportedByPositionID] [int] NOT NULL,
	[ReportedByNameID] [int] NOT NULL,
	[ActionRequired] [nvarchar](max) NOT NULL,
	[TypeOfObservationCategoryID] [int] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[StopWorkAuthorityApplied] [nvarchar](max) NOT NULL,
	[userID] [nvarchar](450) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_StopCardRegisters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectList]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SubjectList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfInjurys]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfInjurys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TypeOfInjurys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfObservationCategorys]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfObservationCategorys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TypeOfObservationCategorys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Color] [nvarchar](max) NOT NULL,
	[PassengerNumber] [int] NOT NULL,
	[LicenceExpireData] [date] NOT NULL,
	[LicenceNumber] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViolationCategorys]    Script Date: 20/11/2023 09:33:58 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViolationCategorys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ViolationCategorys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230620113503_init', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230620120439_init', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230714100349_init', N'7.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231120190416_init', N'7.0.5')
GO
SET IDENTITY_INSERT [dbo].[AccidentCauses] ON 

INSERT [dbo].[AccidentCauses] ([Id], [Name], [IsDeleted]) VALUES (1, N'Bypassing Safety Controls', 0)
INSERT [dbo].[AccidentCauses] ([Id], [Name], [IsDeleted]) VALUES (2, N'Confined Space', 0)
INSERT [dbo].[AccidentCauses] ([Id], [Name], [IsDeleted]) VALUES (3, N'Driving', 0)
INSERT [dbo].[AccidentCauses] ([Id], [Name], [IsDeleted]) VALUES (4, N'Energy Isolation', 0)
INSERT [dbo].[AccidentCauses] ([Id], [Name], [IsDeleted]) VALUES (5, N'Hot Work', 0)
INSERT [dbo].[AccidentCauses] ([Id], [Name], [IsDeleted]) VALUES (6, N'Safe Mechanical Lifting', 0)
INSERT [dbo].[AccidentCauses] ([Id], [Name], [IsDeleted]) VALUES (7, N'Work Authorisation', 0)
INSERT [dbo].[AccidentCauses] ([Id], [Name], [IsDeleted]) VALUES (8, N'Working at Height', 0)
SET IDENTITY_INSERT [dbo].[AccidentCauses] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a6ef1334-84a3-4a03-be41-f74abe3e93c5', N'User', N'USER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'd692b96d-5314-4e07-b4a1-e78a244dad3d', N'Radio', N'RADIO', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ee395e15-ac29-4373-9651-a580afb897ec', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1b09731b-186b-4274-8433-672730d6cd16', N'a6ef1334-84a3-4a03-be41-f74abe3e93c5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'28c071d1-7b39-43d1-b538-0144490d17e8', N'a6ef1334-84a3-4a03-be41-f74abe3e93c5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'29b6c15b-6377-4e53-8afb-e0620964fb97', N'a6ef1334-84a3-4a03-be41-f74abe3e93c5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'41f4157b-ef02-4fc0-85de-5d6107b5d4ab', N'a6ef1334-84a3-4a03-be41-f74abe3e93c5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'485a4d3e-ec25-4b64-b1fd-26fc5eed5fa4', N'a6ef1334-84a3-4a03-be41-f74abe3e93c5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'59430e31-8f21-4c2d-8480-acc6fe9edf1f', N'a6ef1334-84a3-4a03-be41-f74abe3e93c5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c0808555-aa55-4c5e-af3b-c1f7c2203027', N'a6ef1334-84a3-4a03-be41-f74abe3e93c5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd23b69f0-2072-47f5-9c4f-8fe60714f70e', N'a6ef1334-84a3-4a03-be41-f74abe3e93c5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd77e6ba3-f2bf-4912-aa43-29ad41f3304c', N'a6ef1334-84a3-4a03-be41-f74abe3e93c5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fc0da4e7-bb7f-4435-88e4-14c5fe6f7b3e', N'a6ef1334-84a3-4a03-be41-f74abe3e93c5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'714e91c2-fc50-4294-b24c-79bedf35d139', N'ee395e15-ac29-4373-9651-a580afb897ec')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1b09731b-186b-4274-8433-672730d6cd16', N'Rig815', N'RIG815', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEKQbsWiLEP1X6xJcVYn0rDlKXIuZlNq1TZ7m/P0DwFethUiuEHRyReQ1cmNGuTKgFg==', N'U4ILY4I7KER57UXZVPHIRBFP775DE275', N'f6ddb28c-9c08-458f-a590-370bd9838304', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'28c071d1-7b39-43d1-b538-0144490d17e8', N'Rig2', N'RIG2', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEAa72A3X0IOE4G/5wG5kUD0LFs3DUlBcxghE61BXqwbI3NQnj4cfqFCpeeajLD+Tgw==', N'VV7NZM7MHCVYUFX5SEJNGBNP67NQCSBN', N'855b6624-7910-4ec9-943e-7dd662802267', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'29b6c15b-6377-4e53-8afb-e0620964fb97', N'Rig10', N'RIG10', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEP5jGiT4xTGuz1dyUl7vBrfNrKeR6HI6yKcQDNrr4S3P5Nu/sDfxToipi1DqFw5UTw==', N'646L7UG4EDE4L4LY2SEXQMWQCG2MEU3Q', N'57253e63-db1e-4c61-9e62-b8f4f506cd00', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'41f4157b-ef02-4fc0-85de-5d6107b5d4ab', N'Rig3', N'RIG3', NULL, NULL, 0, N'AQAAAAIAAYagAAAAECOwP8V9BaPkdQYiLiRmNXf5TPvRXfqofYPtJ0BdPiXk7Ir0sxhx6b3eFt22ELyFtA==', N'3AHM324SAWVMX5I3S4KP5QZP3QTJ3EMV', N'b125c1ee-276f-4835-a991-28c4bfec7499', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'485a4d3e-ec25-4b64-b1fd-26fc5eed5fa4', N'Rig4', N'RIG4', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEF0FcOIHiZ8P07XsbX9E1Ga7xeRSZJTEcGV0g5kqIWObB3qYTV9UIK8vXZFpfyVAqA==', N'ASPT3RQYDBSWM2E3UXSBG6766MY5U32F', N'fe8608b2-5ec2-4394-93cc-34789e23c07f', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'59430e31-8f21-4c2d-8480-acc6fe9edf1f', N'Rig810', N'RIG810', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEL6bdLN0+Sil+Aqqtv++2L9Aw6O2988MemJz6B62Vv2jp+IE1NNu2wJExKCRWLcLJA==', N'LQFHF2SL6N7W7OJT4H5OBF7W3HBQYYO6', N'b094a77f-fb5d-4a64-86aa-53a0d59c0a8d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'714e91c2-fc50-4294-b24c-79bedf35d139', N'Ayman', N'AYMAN', NULL, NULL, 0, N'AQAAAAIAAYagAAAAENM8hHWIKtI02FzzXrws4ibFkguoT2t2+z5468ikDCalJ0YRLl1rqv9y7bM7L4UJOA==', N'E2GFTLYZSW2W7GGUY7HOBXSLKVS5OD6B', N'c0da2684-e1fc-45d1-ae06-5bc0d914c614', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c0808555-aa55-4c5e-af3b-c1f7c2203027', N'Rig6', N'RIG6', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEGW6OODsijdDm1gQlBBlDjY1AfCABBSms/P/Lh193sCmsQLV/zqR39WoVwWNJO5XBA==', N'HM4W5XJDFURTWO4TCJ6HJFODDGTTNAIW', N'889c20fb-4c91-4572-9a4d-4075aa38c3b2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd23b69f0-2072-47f5-9c4f-8fe60714f70e', N'Rig5', N'RIG5', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEIb1GLs9qLA0fAfzZn84aE5vS26HavWtgHsuTvobv6LcViuxgAAVbqN52HPwgIeq7w==', N'TRMWYQRULZ36GAIQMDV7KGMUPGYGELME', N'ba16496d-b3ef-476c-9b5d-faf46fda4256', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd77e6ba3-f2bf-4912-aa43-29ad41f3304c', N'Rig9', N'RIG9', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEEtdbVfboo/lFGj2WF5ZkYnknMLKsWBVQz6HHyRMQozB/3w3MfUlmNLIs1OAnSEkGg==', N'CUTFCTYNF2MK62DJKUKEXILSCVI5VVGG', N'eb36f4d0-454d-47f6-8c32-ce19208fb0eb', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fc0da4e7-bb7f-4435-88e4-14c5fe6f7b3e', N'Rig1', N'RIG1', NULL, NULL, 0, N'AQAAAAIAAYagAAAAECwbaD6dWPe21d/5OiEAnAZbvdykQfDX2cFSsmePKk9U9cWZoTEsSVPILTS2Wxc/AQ==', N'7L2QQDCZAPNH4HOWITE4YCLQN7HVDYQR', N'0ca89957-9619-4c03-b902-1a33adc2df17', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[ClassificationOfAccidents] ON 

INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (1, N'Near-Miss Event (NM)', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (2, N'First Aid Case (FAC)', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (3, N'Medical Treatment Case (MTC)', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (4, N'Restricted Work Days Case (RWDC)', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (5, N'Lost Time Incident (LTI)', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (6, N'Fatalities (FAT)', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (7, N'Occupational Accident', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (8, N'Property Damage (PD)', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (9, N'Fire Accident', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (10, N'Road Traffic Accident (RTA)', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (11, N'Operational Accident', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (12, N'Security Accident', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (13, N'Oil, Fuel, Chemicals Spill', 0)
INSERT [dbo].[ClassificationOfAccidents] ([Id], [Name], [IsDeleted]) VALUES (14, N'HIPO Near miss', 0)
SET IDENTITY_INSERT [dbo].[ClassificationOfAccidents] OFF
GO
SET IDENTITY_INSERT [dbo].[Classifications] ON 

INSERT [dbo].[Classifications] ([Id], [Name], [IsDeleted]) VALUES (1, N'Unsafe Act', 0)
INSERT [dbo].[Classifications] ([Id], [Name], [IsDeleted]) VALUES (2, N'Unsafe Condition', 0)
INSERT [dbo].[Classifications] ([Id], [Name], [IsDeleted]) VALUES (3, N'Positive Remark', 0)
INSERT [dbo].[Classifications] ([Id], [Name], [IsDeleted]) VALUES (4, N'Other', 0)
INSERT [dbo].[Classifications] ([Id], [Name], [IsDeleted]) VALUES (5, N'hhh', 0)
SET IDENTITY_INSERT [dbo].[Classifications] OFF
GO
SET IDENTITY_INSERT [dbo].[ComminucationMethods] ON 

INSERT [dbo].[ComminucationMethods] ([Id], [Name], [IsDeleted]) VALUES (1, N'Mobile Phone', 0)
INSERT [dbo].[ComminucationMethods] ([Id], [Name], [IsDeleted]) VALUES (2, N'Satellite Phone', 0)
INSERT [dbo].[ComminucationMethods] ([Id], [Name], [IsDeleted]) VALUES (3, N'Others', 0)
SET IDENTITY_INSERT [dbo].[ComminucationMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[Crews] ON 

INSERT [dbo].[Crews] ([Id], [CrewName], [IsDeleted]) VALUES (1, N'A', 0)
INSERT [dbo].[Crews] ([Id], [CrewName], [IsDeleted]) VALUES (2, N'B', 0)
INSERT [dbo].[Crews] ([Id], [CrewName], [IsDeleted]) VALUES (3, N'C', 0)
INSERT [dbo].[Crews] ([Id], [CrewName], [IsDeleted]) VALUES (4, N'D', 0)
SET IDENTITY_INSERT [dbo].[Crews] OFF
GO
SET IDENTITY_INSERT [dbo].[DrillTypes] ON 

INSERT [dbo].[DrillTypes] ([Id], [Name], [IsDeleted]) VALUES (1, N'Kick', 0)
INSERT [dbo].[DrillTypes] ([Id], [Name], [IsDeleted]) VALUES (2, N'Confined space', 0)
INSERT [dbo].[DrillTypes] ([Id], [Name], [IsDeleted]) VALUES (3, N'Spill Drill', 0)
INSERT [dbo].[DrillTypes] ([Id], [Name], [IsDeleted]) VALUES (4, N'H2s', 0)
INSERT [dbo].[DrillTypes] ([Id], [Name], [IsDeleted]) VALUES (5, N'Fire and first aid', 0)
INSERT [dbo].[DrillTypes] ([Id], [Name], [IsDeleted]) VALUES (6, N'First aid', 0)
INSERT [dbo].[DrillTypes] ([Id], [Name], [IsDeleted]) VALUES (7, N'Fire', 0)
INSERT [dbo].[DrillTypes] ([Id], [Name], [IsDeleted]) VALUES (8, N'Evacuation', 0)
INSERT [dbo].[DrillTypes] ([Id], [Name], [IsDeleted]) VALUES (9, N'other', 0)
SET IDENTITY_INSERT [dbo].[DrillTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[DriverNames] ON 

INSERT [dbo].[DriverNames] ([Id], [Name], [IsDeleted], [PhoneNumber], [LicenceExpireData], [LicenceNumber]) VALUES (1, N'Mahmoud Amer', 0, N'0', CAST(N'2023-12-31' AS Date), N'0')
INSERT [dbo].[DriverNames] ([Id], [Name], [IsDeleted], [PhoneNumber], [LicenceExpireData], [LicenceNumber]) VALUES (3, N'Mostafa Mahmoud', 0, N'0', CAST(N'2024-02-03' AS Date), N'0')
INSERT [dbo].[DriverNames] ([Id], [Name], [IsDeleted], [PhoneNumber], [LicenceExpireData], [LicenceNumber]) VALUES (4, N'Saleh Ewas', 0, N'0', CAST(N'2023-01-02' AS Date), N'0')
INSERT [dbo].[DriverNames] ([Id], [Name], [IsDeleted], [PhoneNumber], [LicenceExpireData], [LicenceNumber]) VALUES (5, N'Wafaey', 0, N'0', CAST(N'2023-03-03' AS Date), N'0')
INSERT [dbo].[DriverNames] ([Id], [Name], [IsDeleted], [PhoneNumber], [LicenceExpireData], [LicenceNumber]) VALUES (6, N'Ayman Game3', 0, N'0', CAST(N'2023-03-04' AS Date), N'0')
INSERT [dbo].[DriverNames] ([Id], [Name], [IsDeleted], [PhoneNumber], [LicenceExpireData], [LicenceNumber]) VALUES (7, N'Alaa Game3', 0, N'0', CAST(N'2023-01-02' AS Date), N'0')
INSERT [dbo].[DriverNames] ([Id], [Name], [IsDeleted], [PhoneNumber], [LicenceExpireData], [LicenceNumber]) VALUES (8, N'Galal Ibrahim', 0, N'0', CAST(N'2023-02-02' AS Date), N'0')
INSERT [dbo].[DriverNames] ([Id], [Name], [IsDeleted], [PhoneNumber], [LicenceExpireData], [LicenceNumber]) VALUES (9, N'Mostafa Abdal Kareem', 0, N'0', CAST(N'2023-10-02' AS Date), N'0')
INSERT [dbo].[DriverNames] ([Id], [Name], [IsDeleted], [PhoneNumber], [LicenceExpireData], [LicenceNumber]) VALUES (10, N'Hamdy Ali', 0, N'0', CAST(N'2012-01-03' AS Date), N'0')
INSERT [dbo].[DriverNames] ([Id], [Name], [IsDeleted], [PhoneNumber], [LicenceExpireData], [LicenceNumber]) VALUES (12, N'Ibrahim Hassan', 0, N'0', CAST(N'2023-01-02' AS Date), N'0')
INSERT [dbo].[DriverNames] ([Id], [Name], [IsDeleted], [PhoneNumber], [LicenceExpireData], [LicenceNumber]) VALUES (13, N'Ahmed Salah', 0, N'0', CAST(N'2023-10-02' AS Date), N'0')
SET IDENTITY_INSERT [dbo].[DriverNames] OFF
GO
SET IDENTITY_INSERT [dbo].[LeadershipVisits] ON 

INSERT [dbo].[LeadershipVisits] ([Id], [LeadershipType], [IsDeleted]) VALUES (2, N'General Manager', 0)
INSERT [dbo].[LeadershipVisits] ([Id], [LeadershipType], [IsDeleted]) VALUES (3, N'Operation Manager', 0)
INSERT [dbo].[LeadershipVisits] ([Id], [LeadershipType], [IsDeleted]) VALUES (4, N'QHSE Manager', 0)
INSERT [dbo].[LeadershipVisits] ([Id], [LeadershipType], [IsDeleted]) VALUES (5, N'Maintenance Manager', 0)
INSERT [dbo].[LeadershipVisits] ([Id], [LeadershipType], [IsDeleted]) VALUES (6, N'HR Manager', 0)
INSERT [dbo].[LeadershipVisits] ([Id], [LeadershipType], [IsDeleted]) VALUES (7, N'Supply Chain Manager', 0)
INSERT [dbo].[LeadershipVisits] ([Id], [LeadershipType], [IsDeleted]) VALUES (8, N'Services Manager', 0)
SET IDENTITY_INSERT [dbo].[LeadershipVisits] OFF
GO
SET IDENTITY_INSERT [dbo].[PPEs] ON 

INSERT [dbo].[PPEs] ([Id], [Name], [IsDeleted]) VALUES (1, N'Normal Coveralls', 0)
INSERT [dbo].[PPEs] ([Id], [Name], [IsDeleted]) VALUES (2, N'Thermal Coveralls', 0)
INSERT [dbo].[PPEs] ([Id], [Name], [IsDeleted]) VALUES (3, N'Safety Boot', 0)
INSERT [dbo].[PPEs] ([Id], [Name], [IsDeleted]) VALUES (4, N'Clear Goggles', 0)
INSERT [dbo].[PPEs] ([Id], [Name], [IsDeleted]) VALUES (5, N'Grey Goggles', 0)
INSERT [dbo].[PPEs] ([Id], [Name], [IsDeleted]) VALUES (6, N'Impact Gloves', 0)
INSERT [dbo].[PPEs] ([Id], [Name], [IsDeleted]) VALUES (7, N'Rubber Gloves', 0)
INSERT [dbo].[PPEs] ([Id], [Name], [IsDeleted]) VALUES (8, N'mechanic Gloves', 0)
INSERT [dbo].[PPEs] ([Id], [Name], [IsDeleted]) VALUES (9, N'Electric Gloves', 0)
INSERT [dbo].[PPEs] ([Id], [Name], [IsDeleted]) VALUES (10, N'safety Helmet', 0)
SET IDENTITY_INSERT [dbo].[PPEs] OFF
GO
SET IDENTITY_INSERT [dbo].[PreventionCategorys] ON 

INSERT [dbo].[PreventionCategorys] ([Id], [Name], [IsDeleted]) VALUES (1, N'Eliminate', 0)
INSERT [dbo].[PreventionCategorys] ([Id], [Name], [IsDeleted]) VALUES (2, N'Reduce', 0)
INSERT [dbo].[PreventionCategorys] ([Id], [Name], [IsDeleted]) VALUES (3, N'Isolate', 0)
INSERT [dbo].[PreventionCategorys] ([Id], [Name], [IsDeleted]) VALUES (4, N'Control', 0)
INSERT [dbo].[PreventionCategorys] ([Id], [Name], [IsDeleted]) VALUES (5, N'PPE', 0)
SET IDENTITY_INSERT [dbo].[PreventionCategorys] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportedByNames] ON 

INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (1, N'YOSRY AMIN FAM', 612, 0, 1)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (2, N'RAGAB ALI MOHAMED', 1041, 0, 1)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (3, N'AHMED TAHA ELGAMAL', 1256, 0, 1)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (4, N'AHMED MAGDY AHMED ABDOU', 1745, 0, 1)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (5, N'SHEHAB MAGDY MOHAMED', 1884, 0, 2)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (6, N'MOHAMED ABDO SALEH', 42, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (7, N'WALID A. MAHMOUD', 244, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (8, N'WALID SAEED ABDO', 269, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (9, N'M. IBRAHIM ABDEL GAWAD', 297, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (10, N'AHMED MOHAMED EMAM', 485, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (11, N'ALI ESSAYED MOHAMED', 542, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (12, N'MOHAMED HASAN ALI', 545, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (13, N'HAMADA AHMED SALEEM', 553, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (14, N'M.ABDEL HAMID AHMED', 646, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (15, N'ESSAYED M. ESSAYED ', 660, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (16, N'HAMADA IBRAHIM ELBIALY', 671, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (17, N'YASEEN ABDEL HAMID', 684, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (18, N'ABDEL LATIF FAHEEM', 690, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (19, N'AHMED SAYED HAFEZ', 694, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (20, N'TAMER ADEL ABDEL GHANY', 712, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (21, N'OSAMA ALI SADEK', 780, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (22, N'OSAMA EBID', 912, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (23, N'BASSEM AHMED MOHAMED', 1029, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (24, N'MOSTAFA MOHAMED OTHMAN', 1035, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (25, N'SAEED EZAT MOHAMED', 1089, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (26, N'MAHMOUD HAMDEIN ', 1924, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (27, N'MOHAMED AHMED ABD EL-HAMID HASSAN', 1948, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (28, N'ABD EL-RAHMAN ALI MOHAMED', 1959, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (29, N'SAYED ESSAM SAYED', 2241, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (30, N'WALEID MOSTAFA', 2274, 0, 3)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (31, N'AHMED ALI ABD EL-GHANY ROUBY', 1604, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (32, N'MOHAMED MAGDY MOHAMED MOHAMED', 1825, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (33, N'HAZEIM EL-SAYED ABDOU', 2009, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (34, N'ABDALAAH GABER ABDALLAH', 2098, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (35, N'OSAMA AHMED SELIM', 2112, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (36, N'AHMED HAMDY SAYED MOHAMED', 2186, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (37, N'ALI ABD EL-HAKIM', 2195, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (38, N'MOHAMED RABEE FATTHY', 2196, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (39, N'AMR ABD EL-SAMAD', 2208, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (40, N'KARIM AHMED RAFAT ', 2209, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (41, N'AHMED MOHAMED RASLAN', 2217, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (42, N'MOHAMED IBRAHIM', 2240, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (43, N'MOHAMED AHMED EL-SAEID', 2245, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (44, N'OMAR SHABAAN ABD EL-MOAATY', 2247, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (45, N'MAHMOUD MOHAMED ', 2248, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (46, N'MOHAMED EL-SAYED AL-DAWY', 2249, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (47, N'MOHAMED EL-SAYED IBRAHIM', 2262, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (48, N'AMR SALAH MOHAMED', 2271, 0, 4)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (49, N'YOUSSEF ALI ABD EL-HALIM', 2086, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (50, N'MOHAMED IBRAHIM BAKRY', 2131, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (51, N'ABD EL-RAHMAN MOSTAFA MAHDY', 2140, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (52, N'AHMED MOHAMED MADANY', 2175, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (53, N'SHERIF BELAL ABD EL-HAMID', 2218, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (54, N'ABD EL-KADER KADRY', 2230, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (55, N'MOHAMED ALAA FAROUK', 2237, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (56, N'YASER AHMED MAHMOUD', 2244, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (57, N'ABDALLAH ESSAM', 2246, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (58, N'TAHA MOSTAFA EL-SAYED', 2251, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (59, N'ALI ABDALLAH ABO EL-HASSAN', 2255, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (60, N'SHADY ABD EL-REHIM ALI', 2263, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (61, N'ABD EL-ALIM AHMED MAHR', 2272, 0, 5)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (62, N'ESSAYED SALAH LABIB', 324, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (63, N'HOSAM EDDIN MOHAMED', 615, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (64, N'IBRAHIM EL-DESOKY EL-SHESHTAWY', 717, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (65, N'MOHAMED ABDEL RAHMAN', 759, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (66, N'ABDEL BADEA MAHMOUD', 767, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (67, N'FAT`HY MAHMOUD FAT`HY', 1036, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (68, N'ABDEL AZIM ABDEL ATY TAHA', 1068, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (69, N'MOSTAFA MAHMOUD ESAWY', 1072, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (70, N'ESLAM SABRY SHEHATA', 1213, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (71, N'MOHAMED SALAH KAMEL', 1246, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (72, N'MHAMED RAGAB ALI MOHAMED', 1800, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (73, N'MOHAMED ADEL MOHAMED', 1910, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (74, N'ABDALLAH FATTHY AHMED', 2058, 0, 6)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (75, N'MAHMOUD HASAN ALI ', 272, 0, 7)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (76, N'TAREK HUSSAEN HASAN', 1132, 0, 8)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (77, N'Ibrahim Awad allah', 312, 0, 9)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (78, N'MAHMOUD SAYED AHMED', 636, 0, 9)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (79, N'ALAA SHAABAN ABDEL HAMID', 1702, 0, 9)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (80, N'YOUSEF EL-SAYED YOUSEF', 1724, 0, 9)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (81, N'ABD EL-RAHMAN ABDALLAH ISMAEIL ', 568, 0, 10)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (82, N'MAHMOUD M. ZAGHLOL', 129, 0, 11)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (83, N'MOHAMED A. ABO ZAED', 205, 0, 11)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (84, N'KARAM GABRAEL ALMASLOUB', 987, 0, 11)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (85, N'HUSSAEN AREF MOHAMED', 1330, 0, 11)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (86, N'AHMED SAAD MOHAMED MAHMOUD', 1605, 0, 11)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (87, N'AHMED SAYED MOSTAFA MOHAMED', 1696, 0, 11)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (88, N'TAMER SOLIMAN', 18, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (89, N'SAMEH MAGDY', 148, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (90, N'MAZHER ESSAYED MOSTAFA', 319, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (91, N'SAUDY MAHMOUD AHMED', 393, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (92, N'ABDEL SALAM IBRAHIM', 560, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (93, N'AHMED ESSAYED', 591, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (94, N'NASR A. ABDULLAH', 596, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (95, N'ESLAM MOHAMED MAHMOUD', 728, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (96, N'ALAA KHALIL KHALIL', 745, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (97, N'KHALED M. SAYED REFAEY', 803, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (98, N'REDA ALI ABDULLAH', 849, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (99, N'MAJED YOUSOF ABDO', 858, 0, 12)
GO
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (100, N'ATALLAH NAZEER', 876, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (101, N'HESHAM ALI IBRAHIM', 904, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (102, N'EMAD GOUDA ENNEMS', 913, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (103, N'HANY TAHA ELHOSAENY', 923, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (104, N'MOHAMED NABIL ESSAEYD', 1073, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (105, N'MOSTAFA MOHAMED FEKRY', 1074, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (106, N'MOHAMED MAHMOUD SAYED ', 1084, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (107, N'ABDEL SADEK FATHY  ', 1088, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (108, N' MOHAMED SAAD MOHAMED ', 1103, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (109, N'KHALED TAHER AHMED ELBANNA', 1243, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (110, N'RAMY KHAMIS FOAD', 1251, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (111, N'RAMADAN BASHANDY A. HAMID', 1282, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (112, N'AMR ATTIA ELBAZ', 1307, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (113, N'MOSTAFA AHMED ALMONEER', 1319, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (114, N'MOSTAFA ANWAR BAGHDADY ALI ', 1452, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (115, N'ALAA EDDIN HANAFY SALAMA', 1476, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (116, N'AHMED IBRAHIM ABDELLAH', 1877, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (117, N'MOHAMED FAKRY MOHAMED', 1933, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (118, N'MOBARAK MOHAMED MOSTAFA ', 1971, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (119, N'OSAMA MOHAMED MOSTAFA HUSSEIN', 1972, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (120, N'AHMED MAGDY GOMAA', 2007, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (121, N'AHMED MOHAMED HASSAN', 2065, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (122, N'MAHMOUD KAMEL MAHMOUD', 2066, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (123, N'AYMAN MAHMOUD SAAD', 2157, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (124, N'IBRAHIM AHMED AMER', 2227, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (125, N'ABD EL-HALIM MOHAMED', 2228, 0, 12)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (126, N'HAMDY A. SALEEM', 45, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (127, N'EID AHMED RATB', 60, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (128, N'SAYED ABDEL MOTALEB MOHAMED', 74, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (129, N'ALAA ALI KHALIFA', 84, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (130, N'SAYED A. NAGGAH', 112, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (131, N'NADY EID SAAD', 125, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (132, N'DIAB ALI M. HASAN', 145, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (133, N'ESHAHAT AHMED AHMED', 159, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (134, N'TAMER AMIN M', 167, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (135, N'NASSER OTHMAN', 293, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (136, N'ASHRAF ABDEL HADY', 350, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (137, N'ALI ABO TALEB ABDEL HAMID', 535, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (138, N'M. HAMED MAHMOUD', 548, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (139, N'AHMED ESSAYED A. MOHAMED', 554, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (140, N'HANY SAYED AHMED', 600, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (141, N'ANAS SABER MONEER', 626, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (142, N'MOHAMED ABDEL MONEEM GHAZY', 683, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (143, N'MAMDOUH ABDO MOHAMED', 737, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (144, N'SHAFEY SHOKRY KHALIL', 778, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (145, N'M.LOTFY ABDEL SAMEA', 857, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (146, N'MOHAMED GAMIL', 911, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (147, N'MOHAMED GAMAL MOHAMED OSSMAN', 1761, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (148, N'MAHMOUD AHMED ABD EL-MONEIM', 1873, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (149, N'ADEL ABD EL-WAHED ALI', 1906, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (150, N'AHMED HUSSEIN ABD EL-HALIM', 1907, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (151, N'KHALED MOHAMED MOHAMED', 1916, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (152, N'HAMDY MOHAMED ISMAEIL HASSAN', 1947, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (153, N'ABD EL-HAY GAMAL ABD EL-HAY MOHAMED', 1950, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (154, N'EMAD FAWZY YOUSSEF AFEIFY', 1984, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (155, N'MOHAMED FAROUK FOUAD', 2076, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (156, N'MOHAMED NASSARY MOHAMED', 2146, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (157, N'EMAD ABO EL-HASSAN MOHAMED', 2173, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (158, N'KHALED HAMDY ATTA', 2216, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (159, N'WAHID EZZAT OSMAN', 2222, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (160, N'EL-SAYED MOHAMED', 2235, 0, 13)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (161, N'WAFAAY AHMDY IBRAHIM SALEM', 43, 0, 14)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (162, N'MOHAMED A. ABDEL KAREEM', 522, 0, 14)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (163, N'ALKOTB LOTFY KOTB', 578, 0, 15)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (164, N'ALI ABD EL-AZIZ ABD EL-SAMAD', 814, 0, 16)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (165, N'HOSSAM SALEH AHMED HASSAN', 1432, 0, 16)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (166, N'M. ABDEL SATTAR', 123, 0, 17)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (167, N'NASR AB EL-HAMID MAHMOUD', 2138, 0, 17)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (168, N'SAYED AHMED GAD', 295, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (169, N'Taha A. Kotb', 315, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (170, N'ALAA ABDEL HAKIM', 335, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (171, N'M. HASAN SAAD', 469, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (172, N'MAHMOUD SAYED ABBAS', 502, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (173, N'ABDEL RAHEEM  M. HEBAESH', 512, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (174, N'MOSTAFA IBRAHIM MOHAMED', 519, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (175, N'RABEEA M. SABER', 657, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (176, N'HUSSEIN SAYED MOSTAFA', 692, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (177, N'EHAB ABDEL WAHAB', 703, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (178, N'MOHAMED MAHMOUD A. ALI', 721, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (179, N'MAHMOUD ALI BESHARY', 758, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (180, N'KHALED MOSTAFA HELAL', 848, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (181, N'AHMED M. ABDALLAH', 914, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (182, N'AHMED ABBAS MOHAMED', 990, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (183, N'AHMED GAMAL OTHMAN', 1009, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (184, N'ALI AHMED ALI MOHAMED', 1013, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (185, N'MOHAMED SOBHY ABDULLAH', 1025, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (186, N'KHALED ABBAS OTHMAN', 1069, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (187, N'TAREK KAMEL  MOHAMED', 1071, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (188, N'ALI ELBES ALI', 1075, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (189, N' MOHAMED ABDESSALAM', 1098, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (190, N'MAHMOUD GABER ABD RABOH', 1104, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (191, N'AHMED ADEL ABDEL RAOUF', 1111, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (192, N'MOHAMED KASEM AHMED', 1116, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (193, N'OSAMA ABDEL ALEEM A. AZIZ', 1179, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (194, N'ESHAZLY HASAN ALI', 1182, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (195, N' ESSAYED FATHY IBRAHIM', 1189, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (196, N'AMR AHMED MOSTAFA', 1238, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (197, N'MOHAMED GAMAL TAHA', 1239, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (198, N'MOSTAFA ALI MOSTAFA ALI', 1245, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (199, N'A. RAHMAN ESSAYED MOHAMED', 1247, 0, 18)
GO
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (200, N'WALEED EZZAT ELSHOURA', 1257, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (201, N'MOHAMED NADER MANSOUR', 1299, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (202, N'ALAA EMAD MOHAMED', 1302, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (203, N'MOHAMED ABDEL FATTAH YUOSSOF', 1342, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (204, N'MOHAMED AHMED ABDEL RAZEK', 1344, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (205, N'MOHAMED ALI AHMED MOHAMED', 1351, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (206, N'MAHMOUD IBRAHIM MAHMOUD', 1354, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (207, N'MOHAMED ABDO AHMED', 1444, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (208, N'MOHAMED A.SALAM ABDELRAHMAN', 1459, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (209, N'AHMED ESSAYED AHMED A. HAMID', 1488, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (210, N'.MOHAMED ABOUL FOTTOUH M', 1502, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (211, N'AHMED HASAN M. BADAWY', 1566, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (212, N'MOHAMED TAREK ZAYAN', 1570, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (213, N'MOHAMED AHMED MOBARAK', 1573, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (214, N'MOHAMED ISMAEL ABDEL-RAHMAN ', 1627, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (215, N'MOHAMED SAYED MAGHRABY AHMED ', 1631, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (216, N'MOHAMED ABDEL-HAMED ABDALLAH ', 1632, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (217, N'RAGB MAHMOUD NAGY ABU-TAREF', 1635, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (218, N'MOHAMED ALI AHMED ALI', 1648, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (219, N'RAMY IBRAHIM MOHAMED RAGAB', 1670, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (220, N'MOHAMED SALAH MOHAMED AHMED', 1675, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (221, N'ISMAEIL SHAABAN ISMAEIL', 1679, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (222, N'TAMER ABDEL SALAM ZAKI AHMED', 1695, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (223, N'HAMADA SALAMA YOUNEIS HAMAM', 1697, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (224, N'HAMDY MOHAMED SALAH AHMED', 1763, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (225, N'HUSSEIN ABD EL-HAMID YASSEN TAHA', 1773, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (226, N'MOHAMED MAGDY MOHAMED NASR', 1774, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (227, N'GAMAL EL-DIN HANAFY SALAMA', 1777, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (228, N'AHMED MOHAMED EL-BASTAWESY', 1783, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (229, N'RAGAB ABD EL-RAZIK ALI', 1784, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (230, N'ABD EL-RAHMAN SAYED MOSTAFA ', 1787, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (231, N'MOSTAFA MAHMOUD MEKAWY', 1797, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (232, N'AHMED ALI EL-SAYED MOHAMED', 1798, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (233, N'MOHAMED HAMDY MOHAMED IBRAHIM', 1801, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (234, N'ABD EL-SATAR AHMED ABD EL-SATAR', 1805, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (235, N'AHMED FAWZY MOHAMED HAMID', 1808, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (236, N'ALI  ASHREF MOSTAFA MOHAMED SHAHIN', 1809, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (237, N'MOHAMED ABD EL-HAMID SOLIMAN', 1811, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (238, N'IBRAHIM REDA NADY ABASS', 1826, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (239, N'MOHAMED REDA IBRAHIM MOUSA', 1827, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (240, N'IBRAHIM KHAMIS ALI ABO SHAHIN', 1832, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (241, N'MAHMOUD SAYED AMIN OMAR', 1875, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (242, N'AMR ALI MOHAMED ALI', 1878, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (243, N'ISLAM FARAAG QENAWY', 1889, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (244, N'MAHMOUD REDA MAHMOUD', 1890, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (245, N'GABER HASSAN MOSTAFA MOHAMED', 1899, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (246, N'AHMED MOSTAFA AHMED', 1905, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (247, N'MOHAMED ABD EL-REHIM SABRY AHMED', 1940, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (248, N'HUSSEIN HASSAN GHAREIB MOHAMED', 1941, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (249, N'TAREK ABD EL-AZEIM ALI MAHMOUD', 1943, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (250, N'EL-SAYED ABD EL-SALAM EL-SAYED', 1944, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (251, N'MAHMOUD AHMED EL-SAYED MOHAMED', 1945, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (252, N'TAHA HUSSEIN MOSTAFA HASSAN', 1946, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (253, N'ALAA EL-DIN MOHAMED AHMED RASHED', 1952, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (254, N'AHMED AYMAN FATTHY KAMEL', 1963, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (255, N'GAMAL ABD EL-NASER MOHAMED', 1967, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (256, N'AMAR GALAL ABD EL-AZIZ KHATAB', 1980, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (257, N'AHMED GAMAL EL-DIN', 1999, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (258, N'MAHMOUD MOHAMED', 2005, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (259, N'KHAIRY GARAG ABD EL-GHANY', 2020, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (260, N'AHMED HAMDY AHMED YOUNESS', 2024, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (261, N'MAHMOUD RAGAB MOKHTAR', 2046, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (262, N'AHMED ABD EL-MONGED AHMED', 2054, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (263, N'ZEIN EL-ABDEIN AHMED MOHAMED', 2134, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (264, N'MOHAMED ABD EL-MOHSEIN', 2135, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (265, N'MOAMEN AHMED BADAWY', 2137, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (266, N'MAHMOUD MOHAMED MOHAMED', 2150, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (267, N'AHMED KAMEL MAHMOUD AHMED', 2163, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (268, N'KARIM MOSTAFA ', 2188, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (269, N'ALI MAHMOUD MOHAMED', 2192, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (270, N'AHMED FATTHY ALI', 2194, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (271, N'AHMED MAMDOUH', 2204, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (272, N'IBRAHIM EL-SAYED MOKHTAR', 2231, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (273, N'WALEID MOHAMED', 2276, 0, 18)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (274, N'MAHMOUD MOHAMED MOSTAFA', 1306, 0, 19)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (275, N'MOSTAFA ABD EL-FATTAH IBRAHIM', 663, 0, 20)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (276, N'MOHAMED SABRY A. GAWAD', 892, 0, 20)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (277, N'REDA TAHA AMER AHMED', 1458, 0, 20)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (278, N'OMAR ATEF ALI', 1464, 0, 20)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (279, N'MOHAMED ALAA EL-DIN', 2174, 0, 20)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (280, N'ABD EL-HAKIM MOHAMED', 2243, 0, 20)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (281, N'ALI AHMED ALI', 147, 0, 21)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (282, N'AHMED ISMAEL', 232, 0, 21)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (283, N'SHAHAT ABDEL KADER', 720, 0, 21)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (284, N'MOHAMED MAHMOUD M. HASAN', 768, 0, 21)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (285, N'MAHMOUD SADEK MOHAMED', 1027, 0, 21)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (286, N'GAD ERRAB SALEH ', 1052, 0, 21)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (287, N'HANY HUSSAEN MOSTAFA', 1060, 0, 21)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (288, N'KAREEM GHARIB MOHAMED ', 1087, 0, 21)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (289, N'MOHAMED ABDEL FATTAH AHMED', 1733, 0, 21)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (290, N'AHMED OMAR ', 113, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (291, N'HESHAM M. ELYAN', 172, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (292, N'OTHMAN EDRIS KHAMIS', 421, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (293, N'AMIR SALIM ESSAYED', 718, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (294, N'MOHAMED HAMDY A. ANWAR', 837, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (295, N'AMR TAHER GOUDA', 1100, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (296, N'M. HAMDY AHMED HUSSAEN', 1109, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (297, N'MOHY EL-DIN OMAR MOHAMED', 1333, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (298, N'TAMER MOHAMED MOMTAZ', 1376, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (299, N'AHMED HELMY MOHAMED', 1563, 0, 22)
GO
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (300, N'MOHAMED ATTALA MOBARAK', 1626, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (301, N'ESLAM ASHRAF FAHMY GAFAR', 1756, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (302, N'KHALED FATTHY GAD', 2026, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (303, N'ABDALLAH ESSAM EL-DIN', 2027, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (304, N'ANWER ALAA AHMED', 2028, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (305, N'AHMED ABDALAAH AHMED', 2029, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (306, N'AHMED MEMY MOHAMED', 2190, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (307, N'AHMED SABER', 2232, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (308, N'ABD EL-HAMID EL-BHOHALY', 2233, 0, 22)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (309, N'AHMED ABD EL-SHAFY MOHAMED ', 1766, 0, 23)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (310, N'MOHAMED HAMDY FAKHRY ', 1897, 0, 23)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (311, N'ISLAM ADEL ABD EL-HALIM', 2242, 0, 23)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (312, N'ABD EL-RAHMAN MOTAWE', 2267, 0, 23)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (313, N'MOHAMED HUSSEIN', 2277, 0, 23)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (314, N'EMAD HAMID MOHAMED', 2278, 0, 23)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (315, N'SHADY AHMED', 27, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (316, N'YASSER AMIN', 47, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (317, N'TAMER ABDEL AZIM', 89, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (318, N'M. ALI A. MAJEED', 91, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (319, N'AHMED FOAD SRAG', 144, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (320, N'EL SABBAHY A. NABY', 149, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (321, N'MOSTAFA ERREFAEY', 185, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (322, N'GAMEIL ABD EL-RAHMAN MAHMOUD', 197, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (323, N'ABDULLAH ESSAYED IBRAHIM', 465, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (324, N'RAMY MOHAMED ABD EL-HAMID', 1882, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (325, N'AHMED ABD EL-REHIM MAHMOUD', 1911, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (326, N'ABO ZEID EL-SAYED MOSTAFA MORSY', 1969, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (327, N'HAGAG EL-HASSANIN EL-HASSANINI', 2063, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (328, N' MOHAMED SADEK MOHAMED', 2068, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (329, N'SAMIR ABD EL-HAMID', 2159, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (330, N'MOHAMED FAROUK MAHMOUD', 2166, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (331, N'AHMED M. SAAD ', 2212, 0, 24)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (332, N'MAHMOUD RAGAB AHMED', 812, 0, 25)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (333, N'HANY MOSTAFA MORAD', 940, 0, 25)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (334, N'ABDALLAH MOHAMED SAAD EL-DIN', 1557, 0, 25)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (335, N'MOHAMED SAMY MOUBARAK MEHASEB', 1836, 0, 25)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (336, N'NADER ABO BAKR', 1915, 0, 25)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (337, N'MAHMOUD FAKHRY ALI', 1928, 0, 25)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (338, N'KARIM ABO EL-AZIM', 2226, 0, 25)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (339, N'ABD EL-RAHMAN ABD EL-SALAM', 2256, 0, 25)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (340, N'ISLAM SAMIR ABD EL-HAMID', 2260, 0, 25)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (341, N'MOHAMED ABD EL-HADY', 2273, 0, 25)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (342, N'MOHAMED HASAN ALI', 415, 0, 26)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (343, N'IBRAHIM M. RAGAB', 13, 0, 27)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (344, N'ADEL WED ALHAK', 73, 0, 27)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (345, N'OSAMA HANAFY YOUSSOF', 394, 0, 27)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (346, N'YASER HAMED IBRAHIM', 776, 0, 27)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (347, N'AHMED MAHMOUD ALASMAR', 1122, 0, 27)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (348, N'MOKHTAR KADRY ALI', 1350, 0, 27)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (349, N'MOHAMED RAMADAN ALI', 1480, 0, 28)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (350, N'YOUSEF EL-SAYED ABD EL-FATTAH', 1810, 0, 28)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (351, N'HUSSEIN ABD EL-RAHMAN', 1908, 0, 28)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (352, N'ABD EL-GHANY HAMDY ABD EL-GHANY', 1960, 0, 28)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (353, N'MOHAMED OSAMA HUSSEIN ', 2064, 0, 28)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (354, N'AHMED ATEIF MOHAMED', 2139, 0, 28)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (355, N'AHMED MOHALAL SHAHAT', 2176, 0, 28)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (356, N'MOHAMED MAHMOUD', 2193, 0, 28)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (357, N'MOHAMED KHALED IBRAHIM ESSAYED', 1630, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (358, N'RAMY MOHAMED GAMAL MAHMOUD', 1643, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (359, N'MOHAMED EL-SAYED ABD EL-SAMEA', 1775, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (360, N'MAHMOUD GOMAA IBRAHIM GOMAA', 1785, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (361, N'MOSTAFA MOHAMED ABD EL-WADOUD ', 1786, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (362, N'WAEIL ABD EL-NASER EL-SAYED AWAD', 1838, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (363, N'AHMED MOHAMED AHMED ABD EL-FATTAH', 1841, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (364, N'OMAR RABEI NADY ABASS SALAMA', 1844, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (365, N'AHMED FAWZY ABD EL-NAEIM ', 1848, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (366, N'TAHA MOHAMED IBRAHIM ABDOU', 1849, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (367, N'MOHAMED SAEID SAYED ABD EL-KERIM', 1853, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (368, N'MAHMOUD MOSTAFA AHMED MOHAMED', 1854, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (369, N'HASSAN MOHAMED GHALEB MOHAMED', 1855, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (370, N'AHMED ALI MOSTAFA MOHAMED', 1861, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (371, N'AHMED ABD EL-MONEIM EL-SAYED ', 1866, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (372, N'AHMED GHARIB MOHSEIN', 1870, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (373, N'MOHAMED MOSTAFA SAAD', 1871, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (374, N'AHMED MOHAMED MAHMOUD', 1892, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (375, N'YOUSSEF AHMED YOUSSEF', 1893, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (376, N'MOHAMED HASSAN HELMY', 1912, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (377, N'AHMED HAMDY TAHA ', 1914, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (378, N'AHMED MOHAMED ADLY MOHAMED', 1951, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (379, N'AHMED MOHAMED ABDALLAH NASR', 1954, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (380, N'MOHAMED SAEID BAKR IBRAHIM', 1956, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (381, N'MOHAMED ALAA GHAREIB MOHAMED', 1958, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (382, N'MOHAMED KHAMIS FOUAD', 1964, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (383, N'SHERIF RAAFAT SHARAF EL-DIN', 1966, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (384, N'AHMED ABD EL-NASER MOHAMED TAHA', 1976, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (385, N'MAHMOUD GAMAL MOSTAFA', 1977, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (386, N'AHMED ABD EL-HAKIM MOUSSA MOHAMED', 1978, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (387, N'AHMED HOUSSNY ABD EL-FATTAH', 1979, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (388, N'IBRAHIM EBID AHMED BADAWY', 1981, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (389, N'YASEIN THARWAT ATRABY ALI', 1983, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (390, N'MAHMOUD MOHAMED DAHY', 1989, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (391, N'ALAA MOHMOUD KELANY', 1990, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (392, N'ASHRAF RAMADAN MOSTAFA', 1992, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (393, N'FAHD MOHAMED MOHAMED', 1996, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (394, N'MAHMOUD MOSTAFA', 1997, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (395, N'MOHAMED GAMAL', 2006, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (396, N'SALAH ABD EL-NAEIM SALAH', 2008, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (397, N'ASHRAF MOHAMED EID MOHAMED', 2010, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (398, N'MOSTAFA SAEID MOHIY ABD EL-HAMID', 2016, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (399, N'SAYED WALEID SAYED', 2030, 0, 29)
GO
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (400, N'MOHAMED AHMED MOHAMED', 2031, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (401, N'MOHAMED EL-BESHKAR', 2032, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (402, N'MAHMOUD MOHAMED ABDOU', 2041, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (403, N'ISLAM AHMED IBRAHIM', 2047, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (404, N'ISLAM ABD EL-MONEIM MOHAMED', 2048, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (405, N'MOHAMED ABD EL-FATTAH ', 2049, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (406, N'AHMED ABD EL-SALAM GOMAA', 2052, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (407, N'SHABAN MAHER SHABAN', 2055, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (408, N'YOUSSEF ABD EL-REHIM  MOSTAFA', 2056, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (409, N'KARIM MAHMOUD MAHMOUD', 2059, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (410, N'MOHAMED SELIM SOLIMAN', 2062, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (411, N'AHMED MOHAMED MOHAMED', 2067, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (412, N'MAHMOUD MOHAMED ABASS', 2070, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (413, N'ABD EL-RAHMAN GHAREB MOHAMED', 2071, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (414, N'OMAR FATTHY ABD EL-GHANY', 2073, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (415, N'NAWAR ABD EL-RAZIK', 2075, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (416, N'ALI ABD EL-ATTY RAMADAN', 2082, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (417, N'MAHMOUD MOHAMED', 2084, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (418, N'ATEIF MOHAMED ABO ZEID', 2090, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (419, N'MOHAMED REDA ABD EL-AAL', 2093, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (420, N'NAGAR SHERIF NAGAR', 2094, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (421, N'MOSTAFA MOHAMED MOHAMED ', 2096, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (422, N'AHMED REDA MOHAMED', 2106, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (423, N'IBRAHIM MOHAMED DAHY', 2107, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (424, N'ABD EL-RAHMAN FAWZY', 2109, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (425, N'AHMED EL-SAEID SALAH', 2113, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (426, N'MOHAMED SALAH ABD EL-SAMEE', 2114, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (427, N'MOHAMED GAMAL MOHAMED', 2119, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (428, N'ALI GALAL MOSTAFA', 2121, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (429, N'AHMED HASAB EL-NABY', 2124, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (430, N'MAHMOUD KAMAL SAAD', 2126, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (431, N'SAEID MAHMOUD MOHAMED', 2127, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (432, N'ATTIA FARES ATTIA', 2128, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (433, N'ABD EL-HAMED MOHAMED', 2129, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (434, N'AHMED SAMY ABD EL-HALIM', 2142, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (435, N'ALI SHAHAT ALI', 2143, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (436, N'ISLAM SHAHAT BAYOUMY', 2144, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (437, N'HAMADA ABDDU IBRAHIM', 2145, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (438, N'ABDALLAH MOHAMED ABDALLAH', 2147, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (439, N'ABD EL-HAKAM SHABAN', 2152, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (440, N'KARIM ABD EL-LATEIF MOHAMED', 2153, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (441, N'ABD EL-RAHMAN MAHMOUD', 2154, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (442, N'ALI KAMAL SAAD ABD EL-AZIZ', 2155, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (443, N'MOHAMED KHALED YOUSSEF', 2156, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (444, N'SAIF EL-DIN HANEEY ABD EL-AZIZ', 2158, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (445, N'ISLAM HAMDY MOHAMED', 2160, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (446, N'AHMED YASEIN HUSSEIN TAHA', 2162, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (447, N'MANSOUR YOSSRY MANSOUR', 2164, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (448, N'MOHAMED HUSSEIN AHMED', 2167, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (449, N'ABD EL-HADY AHMED ABD EL-HADY', 2168, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (450, N'AHMED MAHMOUD AHMED ', 2171, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (451, N'HUSSEIN MAHER HUSSEIN', 2172, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (452, N'MOHAMED SAAD ATTA', 2189, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (453, N'MAHMOUD AHMED GAMAL ', 2197, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (454, N'ABDOU MOHAMED ABDOU', 2199, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (455, N'KARIM AKRAM', 2200, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (456, N'MOSTAFA ALI EL-SAYED', 2201, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (457, N'ABD EL-KARIM AHMED', 2202, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (458, N'ABD EL-RAHMAN SAMIR', 2203, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (459, N'ALAA MOHAMED MAHMOUD', 2205, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (460, N'MOSTAFA AHMED MOHAMED', 2206, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (461, N'ALI EL-SAYED ALI', 2207, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (462, N'MAHMOUD MEDHAT ', 2210, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (463, N'NOR EL-DIN GOMAA', 2213, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (464, N'ISLAM MOSTAFA ABDALLAH', 2219, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (465, N'TAHA ABD EL-HAMED YASIN', 2220, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (466, N'AHMED ASHRAF AHMED', 2223, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (467, N'KHALED ABD EL-ATTY', 2224, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (468, N'ALI MOHAMED ALI', 2225, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (469, N'MOSTAFA HOSSAM', 2229, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (470, N'ABDALLAH HANY HASSAN', 2236, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (471, N'AHMED SAEID SAAD', 2238, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (472, N'HOSSAM EL-SAYED', 2239, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (473, N'MOHAMED TAHA MOHAMED', 2254, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (474, N'ABD EL-RAHMAN ALI HAGAG', 2257, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (475, N'MOHAMED AHMED MOHAMED', 2266, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (476, N'HAMED HEISHAM HAMID', 2269, 0, 29)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (477, N'M. MOUSTAFA ALI', 44, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (478, N'ISMAEL MOHAMED', 88, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (479, N'ADEL MANSOUR ALI', 154, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (480, N'ABDEL RAHEEM  MOSTAFA', 216, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (481, N'MAHMOUD MOHAMED ALI', 405, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (482, N'MOHAMED LABIB SHAMS', 532, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (483, N'RAMADAN ABDEL KHALEK', 534, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (484, N'SHABAN GAMAL', 617, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (485, N'M. MOSTAFA HUSSEIN', 658, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (486, N'MOHAMED ABDEL GAWAD', 733, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (487, N'AHMED SHAHAT MOHAMED', 735, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (488, N'M. MAHMOUD ALASMAR', 860, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (489, N'OSAMA REFAAT AHMED', 865, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (490, N'  ISMAEL MOHAMED IBRAHIM', 896, 0, 30)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (491, N'MOHAMED ABD EL-ATY MOHAMED', 1758, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (492, N'ABD EL-RAHMAN EL-SAYED TAWFEIK', 1770, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (493, N'AHMED SALAH MAHMOUD SAMY', 1771, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (494, N'MOHAMED HASSAN MOHAMED', 1828, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (495, N'MOHAMED MAHMOUD FATTHY HAMID', 1851, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (496, N'AHMED ABD EL-HAMID ABD EL-DAIM', 1862, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (497, N'LOUTFY EL-HAAG ARAFA', 1894, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (498, N'MOHAMED HOSSAM MOHAMED', 1895, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (499, N'REFAAT RAGAI REFAAT', 1920, 0, 31)
GO
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (500, N'MOHAMED EMAM AHMED', 1921, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (501, N'MOHAMED HAFEZ AHMED', 2043, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (502, N'AHMED NASER OMAR', 2069, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (503, N'HAZEIM MOHAMED HELMY', 2099, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (504, N'KAREM MOHAMED NAGEIB', 2101, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (505, N'MAHMOUD NABEIL', 2103, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (506, N'MOHAMED WAGEIH ABD EL-LATEIF', 2110, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (507, N'SHERIF AHMED MOHAMED', 2122, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (508, N'MOHAMED HASSAN KHALIL', 2177, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (509, N'ASHRAF MOHAMED EL-SHAHAT', 2178, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (510, N'ABDALLAH AHMED MOHAMED', 2179, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (511, N'ALAA MOHAMED LOTFY', 2181, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (512, N'ABD EL-RAHMAN SHABAN', 2183, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (513, N'AHMED SAAD MAHMOUD', 2184, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (514, N'IBRAHIM HOSNY HAMED', 2185, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (515, N'MOHAMED SAMY HAMID', 2191, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (516, N'FATHY HOSANY', 2211, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (517, N'AHMED GAMAL AHMED', 2214, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (518, N'AHMED KHALED HASANIN', 2221, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (519, N'AMR HAMID HASSAN', 2250, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (520, N'MOHAMED GAMAL MOHAMED', 2252, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (521, N'AHMED MOHAMED AHMED', 2253, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (522, N'MAHMOUD WASEIM SAAD', 2259, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (523, N'KHALED MOHAMED OMAR', 2265, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (524, N'IBRAHIM ZAKY EL-SAADAWY', 2268, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (525, N'ABD EL-RAHMAN SALAH', 2275, 0, 31)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (526, N'MOHAMED IBRAHIM EL-DESOUKY', 1657, 0, 32)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (527, N'AHMED HANAFY ABDEL RAHEEM', 1692, 0, 33)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (528, N'ABDALLAH ISMAEIL ALI IBRAHIM', 1732, 0, 33)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (529, N'MOHAMED WASFY ABDALLAH', 1927, 0, 33)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (530, N'NABAWY FATTHY OMAR EL-GANDY', 1970, 0, 33)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (531, N'MAHMOUD ALI SALEM ', 1995, 0, 33)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (532, N'ABD EL-RAZEK ABDALLAH', 2034, 0, 33)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (533, N'FISAL ABD EL-HAMID IBRAHIM', 2264, 0, 33)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (534, N'Hesham M. M. Ahmed', 314, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (535, N'MOHAMED AHMED MOHAMED', 716, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (536, N'MOHAMED ABDEL FATTAH', 875, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (537, N'AHMED MOHAMED RASHED', 941, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (538, N'RABEA FATHY ', 1001, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (539, N'GAMAL MOHAMED ABBAS AWAD', 1204, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (540, N'IBRAHIM ESSAYED A. FATTAH', 1225, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (541, N'MOHAMED OSAMA ESSAYED', 1284, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (542, N'EMAD ABDEL HAMID ZAKY', 1746, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (543, N'SHERIEF SAYED IBRAHIM MOHAMED', 1792, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (544, N'MOHAMED ABD EL-MONEIM REYAD AHMED', 1864, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (545, N'MOHAMED ABASS ALI MOHAMED', 1876, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (546, N'MOHAMED AHMED ABDOU', 1887, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (547, N'EL-SAYED SHEHATA  ABDO SHEREF', 2018, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (548, N'AHMED MOHAMED KANDEL', 2088, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (549, N'SHERIF MOHSEIN AHMED', 2105, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (550, N'MOHAMED BARBARY ABD EL-GHANY', 2161, 0, 34)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (551, N'ALI AHMED TAHA', 23, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (552, N' HASAN ATALLAH SOLAIMAN', 28, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (553, N'AHMED EL DABA', 57, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (554, N' AHMED M. ALI ASRAN ', 62, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (555, N'ESSAYED IBRAHIM', 85, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (556, N'TAREK ABDALLA HASAN', 90, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (557, N'WALID MAHMOUD EID  ', 168, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (558, N'MAHMOUD A.LATIF M', 343, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (559, N'SAMY FATHY ELGOHARY', 384, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (560, N'MONTASER MOSTAFA HUSSIN', 386, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (561, N'MONTASER MOBARAK', 667, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (562, N'MOHAMED AHMED EL-SAGHER', 1881, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (563, N'BAYOUMY EL-KENAWY BAYOUMY', 2095, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (564, N'MOHAMED MAHMOUD', 2215, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (565, N'KARIM MAHMOUD EL-GAMEIL', 2258, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (566, N'ALI ABD EL-KHALEK MOSTAFA', 2261, 0, 35)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (567, N'M. SABER ABDEL SABOUR', 455, 0, 36)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (568, N'AHMED HANY A. MOHSEN', 574, 0, 36)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (569, N'OSAMA SALEH MAHMOUD', 689, 0, 36)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (570, N'AHMED GOUDA AHMED', 719, 0, 36)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (571, N'.MOHAMED MAHMOUD M', 991, 0, 36)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (572, N'MAHMOUD M. ABDEL KARIM', 1171, 0, 36)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (573, N'IBRAHIM RAMADAN IBRAHIM', 1741, 0, 36)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (574, N'AHMED ABD EL-GHAFAR', 2042, 0, 36)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (575, N'MOURSY GOUDA EL-SAYED', 2120, 0, 36)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (576, N'MOHAMED A. HADY ORABY ', 1176, 0, 37)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (577, N'AHMED ZAMKAN MOHAMED', 1931, 0, 37)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (578, N'MOSTAFA MAHMOUD HUSSAEN', 1008, 0, 38)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (579, N'SHABAN ABDEL AZIZ AOWAD', 1446, 0, 39)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (580, N'AHMED MAHER HELMY ', 1175, 0, 40)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (581, N'AHMED IBRAHIM AHMED ESSAYED', 1483, 0, 41)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (582, N'MOHAMED TAHA ABD EL-WAHAB', 1814, 0, 41)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (583, N'RAMADAN MOSTAFA MAHMOUD MOHAMED', 1833, 0, 41)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (584, N'MOSTAFA MOKHTAR SALEM SALEM', 1843, 0, 41)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (585, N'OMAR HAMID MAHGOUB', 1988, 0, 41)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (586, N'AHMED ABD EL-MONEIM ', 2040, 0, 41)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (587, N'MOHAMED ANWER EMAM', 2081, 0, 41)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (588, N'MOHANAD GAMAL EL-DIN MOSTAFA', 1942, 0, 42)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (589, N'ABD EL-HALIM  FARID ABD EL-HALIM', 2021, 0, 42)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (590, N'M. MOSTAFA AHMED', 524, 0, 43)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (591, N'M.AHMED ABDEL MONEAM', 844, 0, 43)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (592, N'MOHAMED MABROUK MABROUK SALEM', 1729, 0, 44)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (593, N'HASSAN AHMED HASSAN TAHA', 1754, 0, 45)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (594, N'MAHMOUD MOHAMED ABD EL-SATTAR', 1822, 0, 45)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (595, N'ABDEL AZIZ HASAN ABDEL AZIZ ', 1144, 0, 44)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (596, N'EMAH ANWER AHMED GAD', 1865, 0, 47)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (597, N'Hasan Zaen El aabideen', 497, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (598, N'ATEF MOHAMED ABBAS', 551, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (599, N'MOHAMED MOSTAFA SAYED', 783, 0, 48)
GO
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (600, N'WAEL MOHAMED ABBAS', 787, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (601, N'BAHAA EDDIN ABDEL RAHIM', 870, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (602, N'ASHRAF M. SALIM', 871, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (603, N'AHMED A. SATTAR MONOFY', 1083, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (604, N'ALI AHMED MAHMOUD', 1114, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (605, N'HASANEN SHAKER ALI', 1255, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (606, N'OSAMA A. SATTAR MOHAMED', 1353, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (607, N'IBRAHIM ABD EL-FATTAH IBRAHIM ALI', 1788, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (608, N'MOHAMED EL-SAYED HASSANIN ATYIA', 1789, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (609, N'MEDHAT EL-SAYED IBRAHIM', 1902, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (610, N'WAGDY FATTHY SAEID', 1922, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (611, N'HESHAM SOBHY ABO EL-HASSAN', 1973, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (612, N'AHMED ATTA MAHMOUD', 2102, 0, 48)
INSERT [dbo].[ReportedByNames] ([Id], [Name], [EmpCode], [IsDeleted], [PositionId]) VALUES (613, N'OMAR AHMED HASSAN', 2117, 0, 48)
SET IDENTITY_INSERT [dbo].[ReportedByNames] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportedByPositions] ON 

INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (1, N'Camps Electrician', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (2, N'Ass. Supt', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (3, N'Assistant Driller', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (4, N'Assistant Mechanic', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (5, N'Asst. Electrician', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (6, N'Camp Boss', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (7, N'Camps Electrical Supervisor', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (8, N'Camps Maintenance Supervisor', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (9, N'Carpenter', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (10, N'Chief Painter', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (11, N'Crane Op.', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (12, N'Derrick Man', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (13, N'Driller', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (14, N'Driver', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (15, N'Electrician', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (16, N'Field Mechanic', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (17, N'Field Superintendent ', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (18, N'Floor Man', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (19, N'HSE Field S.V', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (20, N' Lifting Officer', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (21, N'Loader Op.', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (22, N'Material Man', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (23, N'Night Electrician', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (24, N'Night Pusher', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (25, N'Night. Mechanic', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (26, N'Painter', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (27, N'Plumber', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (28, N'Radio  Op.', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (29, N'Roustabout', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (30, N'Roustabout Pusher', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (31, N'Safety Engineer', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (32, N'Safety Officer', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (33, N'Senior Electrician', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (34, N'Senior Mechanic', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (35, N'Senior Tool Pusher', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (36, N'Senior Electrician', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (37, N'T. Assistant Driller', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (38, N'T.Assistant Driller', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (39, N'T.Derrick Man', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (40, N'T.Driller', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (41, N'T.Floor Man', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (42, N'T.Night Electrician', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (43, N'T.Roustabout Pusher', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (44, N'T.Senior Electrician', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (45, N'T.Senior Mechanic', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (47, N'Truck Pusher', 0)
INSERT [dbo].[ReportedByPositions] ([Id], [Name], [IsDeleted]) VALUES (48, N'Welder', 0)
SET IDENTITY_INSERT [dbo].[ReportedByPositions] OFF
GO
SET IDENTITY_INSERT [dbo].[Rigs] ON 

INSERT [dbo].[Rigs] ([Id], [Number], [IsDeleted]) VALUES (1, 1, 0)
INSERT [dbo].[Rigs] ([Id], [Number], [IsDeleted]) VALUES (2, 2, 0)
INSERT [dbo].[Rigs] ([Id], [Number], [IsDeleted]) VALUES (3, 3, 0)
INSERT [dbo].[Rigs] ([Id], [Number], [IsDeleted]) VALUES (4, 4, 0)
INSERT [dbo].[Rigs] ([Id], [Number], [IsDeleted]) VALUES (5, 5, 0)
INSERT [dbo].[Rigs] ([Id], [Number], [IsDeleted]) VALUES (6, 6, 0)
INSERT [dbo].[Rigs] ([Id], [Number], [IsDeleted]) VALUES (7, 9, 0)
INSERT [dbo].[Rigs] ([Id], [Number], [IsDeleted]) VALUES (8, 10, 0)
INSERT [dbo].[Rigs] ([Id], [Number], [IsDeleted]) VALUES (9, 810, 0)
INSERT [dbo].[Rigs] ([Id], [Number], [IsDeleted]) VALUES (10, 815, 0)
SET IDENTITY_INSERT [dbo].[Rigs] OFF
GO
SET IDENTITY_INSERT [dbo].[SubjectList] ON 

INSERT [dbo].[SubjectList] ([Id], [Name], [IsDeleted]) VALUES (1, N'Positive Remark', 0)
INSERT [dbo].[SubjectList] ([Id], [Name], [IsDeleted]) VALUES (2, N'Violation ', 0)
INSERT [dbo].[SubjectList] ([Id], [Name], [IsDeleted]) VALUES (3, N'Weekly Safety Award ', 0)
INSERT [dbo].[SubjectList] ([Id], [Name], [IsDeleted]) VALUES (4, N'Safety Exam  Result ', 0)
INSERT [dbo].[SubjectList] ([Id], [Name], [IsDeleted]) VALUES (5, N'Certificates ', 0)
SET IDENTITY_INSERT [dbo].[SubjectList] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfInjurys] ON 

INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (1, N'Head', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (2, N'Neck', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (3, N'Shoulder', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (4, N'Elbow', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (5, N'Wrist', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (6, N'Abdomen', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (7, N'Chest', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (8, N'Back', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (9, N'Foot', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (10, N'Ankle', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (11, N'Knee', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (12, N'Hip', 0)
INSERT [dbo].[TypeOfInjurys] ([Id], [Name], [IsDeleted]) VALUES (13, N'Other', 0)
SET IDENTITY_INSERT [dbo].[TypeOfInjurys] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfObservationCategorys] ON 

INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (1, N'Bypassing Safety Controls', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (2, N'Driving', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (3, N'Energy Isolation', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (4, N'Hot Work', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (5, N'Line of Fire', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (6, N'Safe Mechanical Lifting', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (7, N'Work Authorization', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (8, N'Working at Height', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (9, N'PPE', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (10, N'Housekeeping', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (11, N'Environmental', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (12, N'Health Care', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (13, N'Safety Protection System', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (14, N'HSE IMS', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (15, N'Equipment', 0)
INSERT [dbo].[TypeOfObservationCategorys] ([Id], [Name], [IsDeleted]) VALUES (16, N'Other', 0)
SET IDENTITY_INSERT [dbo].[TypeOfObservationCategorys] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicles] ON 

INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (1, N'2965', N'Toyota', N'Black', 0, CAST(N'2023-01-02' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (3, N'3864', N'Toyota', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (4, N'3796', N'Toyota Prado', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (5, N'5637', N'Toyota Prado', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (6, N'2958', N'Toyota D.c 4x4', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (7, N'825 FAD', N'Toyota D.c 4x4', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (8, N'3785', N'D.c Izuos', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (9, N'3786', N'D.c Nissan', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (10, N'169', N'Toyota Single', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (11, N'425', N'Jumbo 4 Ton', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (12, N'421', N'Jumbo 4 Ton', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (13, N'DSW/856', N'Brilliance', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (14, N'DSW/859', N'Brilliance', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (15, N'DSW/861', N'Brilliance', N'Blue', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (16, N'DSW/972', N'Brilliance', N'Dark Red', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (17, N'DSW/973', N'Brilliance', N'Silver', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (18, N'DSW/975', N'Brilliance', N'Gray', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (19, N'DSW/978', N'Brilliance', N'Brwon', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (20, N'768/ج م د ', N'Micro bus', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (21, N'765/ج م د ', N'Micro bus', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (22, N'769/ج م د ', N'Micro bus', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
INSERT [dbo].[Vehicles] ([Id], [Number], [Type], [Color], [PassengerNumber], [LicenceExpireData], [LicenceNumber], [IsDeleted]) VALUES (23, N'781/ج م د ', N'Micro bus', N'Black', 0, CAST(N'2023-06-06' AS Date), N'0', 0)
SET IDENTITY_INSERT [dbo].[Vehicles] OFF
GO
SET IDENTITY_INSERT [dbo].[ViolationCategorys] ON 

INSERT [dbo].[ViolationCategorys] ([Id], [Name], [IsDeleted]) VALUES (1, N'Human Behaviour', 0)
INSERT [dbo].[ViolationCategorys] ([Id], [Name], [IsDeleted]) VALUES (2, N'Management Reasons', 0)
INSERT [dbo].[ViolationCategorys] ([Id], [Name], [IsDeleted]) VALUES (3, N'Equipment Reasons', 0)
SET IDENTITY_INSERT [dbo].[ViolationCategorys] OFF
GO
/****** Object:  Index [IX_AccidentImages_AccidentId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_AccidentImages_AccidentId] ON [dbo].[AccidentImages]
(
	[AccidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Accidents_AccidentCausesId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Accidents_AccidentCausesId] ON [dbo].[Accidents]
(
	[AccidentCausesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Accidents_ClassificationOfAccidentId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Accidents_ClassificationOfAccidentId] ON [dbo].[Accidents]
(
	[ClassificationOfAccidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Accidents_PreventionCategoryId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Accidents_PreventionCategoryId] ON [dbo].[Accidents]
(
	[PreventionCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Accidents_RigId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Accidents_RigId] ON [dbo].[Accidents]
(
	[RigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Accidents_TypeOfInjuryID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Accidents_TypeOfInjuryID] ON [dbo].[Accidents]
(
	[TypeOfInjuryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Accidents_userID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Accidents_userID] ON [dbo].[Accidents]
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Accidents_ViolationCategoryId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Accidents_ViolationCategoryId] ON [dbo].[Accidents]
(
	[ViolationCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Attendances_PTSMId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Attendances_PTSMId] ON [dbo].[Attendances]
(
	[PTSMId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bop_RigId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Bop_RigId] ON [dbo].[Bop]
(
	[RigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Bop_UserId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Bop_UserId] ON [dbo].[Bop]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CrewQuizAndQHSEDaily_CrewId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_CrewQuizAndQHSEDaily_CrewId] ON [dbo].[CrewQuizAndQHSEDaily]
(
	[CrewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CrewQuizAndQHSEDaily_QHSEDailyId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_CrewQuizAndQHSEDaily_QHSEDailyId] ON [dbo].[CrewQuizAndQHSEDaily]
(
	[QHSEDailyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CrewSaftyAlertAndQHSEDaily_CrewId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_CrewSaftyAlertAndQHSEDaily_CrewId] ON [dbo].[CrewSaftyAlertAndQHSEDaily]
(
	[CrewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CrewSaftyAlertAndQHSEDaily_QHSEDailyId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_CrewSaftyAlertAndQHSEDaily_QHSEDailyId] ON [dbo].[CrewSaftyAlertAndQHSEDaily]
(
	[QHSEDailyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DaysSinceNoLTI_RigId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_DaysSinceNoLTI_RigId] ON [dbo].[DaysSinceNoLTI]
(
	[RigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DrillImages_DrillId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_DrillImages_DrillId] ON [dbo].[DrillImages]
(
	[DrillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Drills_DrillTypeId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Drills_DrillTypeId] ON [dbo].[Drills]
(
	[DrillTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Drills_RigId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Drills_RigId] ON [dbo].[Drills]
(
	[RigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Drills_userID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_Drills_userID] ON [dbo].[Drills]
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmergencyResponseTeamMembers_DrillId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_EmergencyResponseTeamMembers_DrillId] ON [dbo].[EmergencyResponseTeamMembers]
(
	[DrillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmpCodes_PositionId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_EmpCodes_PositionId] ON [dbo].[EmpCodes]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmpCodes_RigId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_EmpCodes_RigId] ON [dbo].[EmpCodes]
(
	[RigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeCompetencyEvaluation_RigId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeCompetencyEvaluation_RigId] ON [dbo].[EmployeeCompetencyEvaluation]
(
	[RigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeCompetencyEvaluation_SubjectId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeCompetencyEvaluation_SubjectId] ON [dbo].[EmployeeCompetencyEvaluation]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_EmployeeCompetencyEvaluation_userID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeCompetencyEvaluation_userID] ON [dbo].[EmployeeCompetencyEvaluation]
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HazardImages_PotentialHazardId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_HazardImages_PotentialHazardId] ON [dbo].[HazardImages]
(
	[PotentialHazardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JMP_Passengers_JMPID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_JMP_Passengers_JMPID] ON [dbo].[JMP_Passengers]
(
	[JMPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JMP_Passengers_PassengerID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_JMP_Passengers_PassengerID] ON [dbo].[JMP_Passengers]
(
	[PassengerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JMPs_CommunicationID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_JMPs_CommunicationID] ON [dbo].[JMPs]
(
	[CommunicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JMPs_DriverNameId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_JMPs_DriverNameId] ON [dbo].[JMPs]
(
	[DriverNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JMPs_RouteNameID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_JMPs_RouteNameID] ON [dbo].[JMPs]
(
	[RouteNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_JMPs_userID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_JMPs_userID] ON [dbo].[JMPs]
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JMPs_VehicleId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_JMPs_VehicleId] ON [dbo].[JMPs]
(
	[VehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LeaderShipVisitsAndQHSEDaily_LeadershipVisitId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_LeaderShipVisitsAndQHSEDaily_LeadershipVisitId] ON [dbo].[LeaderShipVisitsAndQHSEDaily]
(
	[LeadershipVisitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LeaderShipVisitsAndQHSEDaily_QHSEDailyId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_LeaderShipVisitsAndQHSEDaily_QHSEDailyId] ON [dbo].[LeaderShipVisitsAndQHSEDaily]
(
	[QHSEDailyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LTIPrevDateAndDays_DaysSinceNoLTIId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_LTIPrevDateAndDays_DaysSinceNoLTIId] ON [dbo].[LTIPrevDateAndDays]
(
	[DaysSinceNoLTIId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PotentialHazard_ResponibilityId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_PotentialHazard_ResponibilityId] ON [dbo].[PotentialHazard]
(
	[ResponibilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PotentialHazard_RigId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_PotentialHazard_RigId] ON [dbo].[PotentialHazard]
(
	[RigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PotentialHazard_userID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_PotentialHazard_userID] ON [dbo].[PotentialHazard]
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PPEAndPPEReceivings_PPEId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_PPEAndPPEReceivings_PPEId] ON [dbo].[PPEAndPPEReceivings]
(
	[PPEId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PPEAndPPEReceivings_PPEReceivingId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_PPEAndPPEReceivings_PPEReceivingId] ON [dbo].[PPEAndPPEReceivings]
(
	[PPEReceivingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PPEReceivings_RigId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_PPEReceivings_RigId] ON [dbo].[PPEReceivings]
(
	[RigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PPEReceivings_userID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_PPEReceivings_userID] ON [dbo].[PPEReceivings]
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProblemFacedDuringRigMoves_RigMovePerformanceId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_ProblemFacedDuringRigMoves_RigMovePerformanceId] ON [dbo].[ProblemFacedDuringRigMoves]
(
	[RigMovePerformanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PTSMs_RigId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_PTSMs_RigId] ON [dbo].[PTSMs]
(
	[RigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PTSMs_UserId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_PTSMs_UserId] ON [dbo].[PTSMs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_QHSEDailyReport_ClientId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_QHSEDailyReport_ClientId] ON [dbo].[QHSEDailyReport]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_QHSEDailyReport_DaysSinceNoLTIId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_QHSEDailyReport_DaysSinceNoLTIId] ON [dbo].[QHSEDailyReport]
(
	[DaysSinceNoLTIId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_QHSEDailyReport_RigId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_QHSEDailyReport_RigId] ON [dbo].[QHSEDailyReport]
(
	[RigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_QHSEDailyReport_UserId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_QHSEDailyReport_UserId] ON [dbo].[QHSEDailyReport]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReportedByNames_PositionId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_ReportedByNames_PositionId] ON [dbo].[ReportedByNames]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RigMovePerformances_RigId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_RigMovePerformances_RigId] ON [dbo].[RigMovePerformances]
(
	[RigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RigMovePerformances_UserId]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_RigMovePerformances_UserId] ON [dbo].[RigMovePerformances]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StopCardRegisters_ClassificationID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_StopCardRegisters_ClassificationID] ON [dbo].[StopCardRegisters]
(
	[ClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StopCardRegisters_ReportedByNameID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_StopCardRegisters_ReportedByNameID] ON [dbo].[StopCardRegisters]
(
	[ReportedByNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StopCardRegisters_ReportedByPositionID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_StopCardRegisters_ReportedByPositionID] ON [dbo].[StopCardRegisters]
(
	[ReportedByPositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StopCardRegisters_TypeOfObservationCategoryID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_StopCardRegisters_TypeOfObservationCategoryID] ON [dbo].[StopCardRegisters]
(
	[TypeOfObservationCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StopCardRegisters_userID]    Script Date: 20/11/2023 09:33:59 م ******/
CREATE NONCLUSTERED INDEX [IX_StopCardRegisters_userID] ON [dbo].[StopCardRegisters]
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccidentImages]  WITH CHECK ADD  CONSTRAINT [FK_AccidentImages_Accidents_AccidentId] FOREIGN KEY([AccidentId])
REFERENCES [dbo].[Accidents] ([Id])
GO
ALTER TABLE [dbo].[AccidentImages] CHECK CONSTRAINT [FK_AccidentImages_Accidents_AccidentId]
GO
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_AccidentCauses_AccidentCausesId] FOREIGN KEY([AccidentCausesId])
REFERENCES [dbo].[AccidentCauses] ([Id])
GO
ALTER TABLE [dbo].[Accidents] CHECK CONSTRAINT [FK_Accidents_AccidentCauses_AccidentCausesId]
GO
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_AspNetUsers_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Accidents] CHECK CONSTRAINT [FK_Accidents_AspNetUsers_userID]
GO
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_ClassificationOfAccidents_ClassificationOfAccidentId] FOREIGN KEY([ClassificationOfAccidentId])
REFERENCES [dbo].[ClassificationOfAccidents] ([Id])
GO
ALTER TABLE [dbo].[Accidents] CHECK CONSTRAINT [FK_Accidents_ClassificationOfAccidents_ClassificationOfAccidentId]
GO
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_PreventionCategorys_PreventionCategoryId] FOREIGN KEY([PreventionCategoryId])
REFERENCES [dbo].[PreventionCategorys] ([Id])
GO
ALTER TABLE [dbo].[Accidents] CHECK CONSTRAINT [FK_Accidents_PreventionCategorys_PreventionCategoryId]
GO
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_Rigs_RigId] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([Id])
GO
ALTER TABLE [dbo].[Accidents] CHECK CONSTRAINT [FK_Accidents_Rigs_RigId]
GO
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_TypeOfInjurys_TypeOfInjuryID] FOREIGN KEY([TypeOfInjuryID])
REFERENCES [dbo].[TypeOfInjurys] ([Id])
GO
ALTER TABLE [dbo].[Accidents] CHECK CONSTRAINT [FK_Accidents_TypeOfInjurys_TypeOfInjuryID]
GO
ALTER TABLE [dbo].[Accidents]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_ViolationCategorys_ViolationCategoryId] FOREIGN KEY([ViolationCategoryId])
REFERENCES [dbo].[ViolationCategorys] ([Id])
GO
ALTER TABLE [dbo].[Accidents] CHECK CONSTRAINT [FK_Accidents_ViolationCategorys_ViolationCategoryId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Attendances]  WITH CHECK ADD  CONSTRAINT [FK_Attendances_PTSMs_PTSMId] FOREIGN KEY([PTSMId])
REFERENCES [dbo].[PTSMs] ([Id])
GO
ALTER TABLE [dbo].[Attendances] CHECK CONSTRAINT [FK_Attendances_PTSMs_PTSMId]
GO
ALTER TABLE [dbo].[Bop]  WITH CHECK ADD  CONSTRAINT [FK_Bop_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Bop] CHECK CONSTRAINT [FK_Bop_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Bop]  WITH CHECK ADD  CONSTRAINT [FK_Bop_Rigs_RigId] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([Id])
GO
ALTER TABLE [dbo].[Bop] CHECK CONSTRAINT [FK_Bop_Rigs_RigId]
GO
ALTER TABLE [dbo].[CrewQuizAndQHSEDaily]  WITH CHECK ADD  CONSTRAINT [FK_CrewQuizAndQHSEDaily_Crews_CrewId] FOREIGN KEY([CrewId])
REFERENCES [dbo].[Crews] ([Id])
GO
ALTER TABLE [dbo].[CrewQuizAndQHSEDaily] CHECK CONSTRAINT [FK_CrewQuizAndQHSEDaily_Crews_CrewId]
GO
ALTER TABLE [dbo].[CrewQuizAndQHSEDaily]  WITH CHECK ADD  CONSTRAINT [FK_CrewQuizAndQHSEDaily_QHSEDailyReport_QHSEDailyId] FOREIGN KEY([QHSEDailyId])
REFERENCES [dbo].[QHSEDailyReport] ([Id])
GO
ALTER TABLE [dbo].[CrewQuizAndQHSEDaily] CHECK CONSTRAINT [FK_CrewQuizAndQHSEDaily_QHSEDailyReport_QHSEDailyId]
GO
ALTER TABLE [dbo].[CrewSaftyAlertAndQHSEDaily]  WITH CHECK ADD  CONSTRAINT [FK_CrewSaftyAlertAndQHSEDaily_Crews_CrewId] FOREIGN KEY([CrewId])
REFERENCES [dbo].[Crews] ([Id])
GO
ALTER TABLE [dbo].[CrewSaftyAlertAndQHSEDaily] CHECK CONSTRAINT [FK_CrewSaftyAlertAndQHSEDaily_Crews_CrewId]
GO
ALTER TABLE [dbo].[CrewSaftyAlertAndQHSEDaily]  WITH CHECK ADD  CONSTRAINT [FK_CrewSaftyAlertAndQHSEDaily_QHSEDailyReport_QHSEDailyId] FOREIGN KEY([QHSEDailyId])
REFERENCES [dbo].[QHSEDailyReport] ([Id])
GO
ALTER TABLE [dbo].[CrewSaftyAlertAndQHSEDaily] CHECK CONSTRAINT [FK_CrewSaftyAlertAndQHSEDaily_QHSEDailyReport_QHSEDailyId]
GO
ALTER TABLE [dbo].[DaysSinceNoLTI]  WITH CHECK ADD  CONSTRAINT [FK_DaysSinceNoLTI_Rigs_RigId] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([Id])
GO
ALTER TABLE [dbo].[DaysSinceNoLTI] CHECK CONSTRAINT [FK_DaysSinceNoLTI_Rigs_RigId]
GO
ALTER TABLE [dbo].[DrillImages]  WITH CHECK ADD  CONSTRAINT [FK_DrillImages_Drills_DrillId] FOREIGN KEY([DrillId])
REFERENCES [dbo].[Drills] ([Id])
GO
ALTER TABLE [dbo].[DrillImages] CHECK CONSTRAINT [FK_DrillImages_Drills_DrillId]
GO
ALTER TABLE [dbo].[Drills]  WITH CHECK ADD  CONSTRAINT [FK_Drills_AspNetUsers_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Drills] CHECK CONSTRAINT [FK_Drills_AspNetUsers_userID]
GO
ALTER TABLE [dbo].[Drills]  WITH CHECK ADD  CONSTRAINT [FK_Drills_DrillTypes_DrillTypeId] FOREIGN KEY([DrillTypeId])
REFERENCES [dbo].[DrillTypes] ([Id])
GO
ALTER TABLE [dbo].[Drills] CHECK CONSTRAINT [FK_Drills_DrillTypes_DrillTypeId]
GO
ALTER TABLE [dbo].[Drills]  WITH CHECK ADD  CONSTRAINT [FK_Drills_Rigs_RigId] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([Id])
GO
ALTER TABLE [dbo].[Drills] CHECK CONSTRAINT [FK_Drills_Rigs_RigId]
GO
ALTER TABLE [dbo].[EmergencyResponseTeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_EmergencyResponseTeamMembers_Drills_DrillId] FOREIGN KEY([DrillId])
REFERENCES [dbo].[Drills] ([Id])
GO
ALTER TABLE [dbo].[EmergencyResponseTeamMembers] CHECK CONSTRAINT [FK_EmergencyResponseTeamMembers_Drills_DrillId]
GO
ALTER TABLE [dbo].[EmpCodes]  WITH CHECK ADD  CONSTRAINT [FK_EmpCodes_Positions_PositionId] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([Id])
GO
ALTER TABLE [dbo].[EmpCodes] CHECK CONSTRAINT [FK_EmpCodes_Positions_PositionId]
GO
ALTER TABLE [dbo].[EmpCodes]  WITH CHECK ADD  CONSTRAINT [FK_EmpCodes_Rigs_RigId] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([Id])
GO
ALTER TABLE [dbo].[EmpCodes] CHECK CONSTRAINT [FK_EmpCodes_Rigs_RigId]
GO
ALTER TABLE [dbo].[EmployeeCompetencyEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeCompetencyEvaluation_AspNetUsers_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[EmployeeCompetencyEvaluation] CHECK CONSTRAINT [FK_EmployeeCompetencyEvaluation_AspNetUsers_userID]
GO
ALTER TABLE [dbo].[EmployeeCompetencyEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeCompetencyEvaluation_Rigs_RigId] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([Id])
GO
ALTER TABLE [dbo].[EmployeeCompetencyEvaluation] CHECK CONSTRAINT [FK_EmployeeCompetencyEvaluation_Rigs_RigId]
GO
ALTER TABLE [dbo].[EmployeeCompetencyEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeCompetencyEvaluation_SubjectList_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[SubjectList] ([Id])
GO
ALTER TABLE [dbo].[EmployeeCompetencyEvaluation] CHECK CONSTRAINT [FK_EmployeeCompetencyEvaluation_SubjectList_SubjectId]
GO
ALTER TABLE [dbo].[HazardImages]  WITH CHECK ADD  CONSTRAINT [FK_HazardImages_PotentialHazard_PotentialHazardId] FOREIGN KEY([PotentialHazardId])
REFERENCES [dbo].[PotentialHazard] ([Id])
GO
ALTER TABLE [dbo].[HazardImages] CHECK CONSTRAINT [FK_HazardImages_PotentialHazard_PotentialHazardId]
GO
ALTER TABLE [dbo].[JMP_Passengers]  WITH CHECK ADD  CONSTRAINT [FK_JMP_Passengers_JMPs_JMPID] FOREIGN KEY([JMPID])
REFERENCES [dbo].[JMPs] ([Id])
GO
ALTER TABLE [dbo].[JMP_Passengers] CHECK CONSTRAINT [FK_JMP_Passengers_JMPs_JMPID]
GO
ALTER TABLE [dbo].[JMP_Passengers]  WITH CHECK ADD  CONSTRAINT [FK_JMP_Passengers_Passengers_PassengerID] FOREIGN KEY([PassengerID])
REFERENCES [dbo].[Passengers] ([Id])
GO
ALTER TABLE [dbo].[JMP_Passengers] CHECK CONSTRAINT [FK_JMP_Passengers_Passengers_PassengerID]
GO
ALTER TABLE [dbo].[JMPs]  WITH CHECK ADD  CONSTRAINT [FK_JMPs_AspNetUsers_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[JMPs] CHECK CONSTRAINT [FK_JMPs_AspNetUsers_userID]
GO
ALTER TABLE [dbo].[JMPs]  WITH CHECK ADD  CONSTRAINT [FK_JMPs_ComminucationMethods_CommunicationID] FOREIGN KEY([CommunicationID])
REFERENCES [dbo].[ComminucationMethods] ([Id])
GO
ALTER TABLE [dbo].[JMPs] CHECK CONSTRAINT [FK_JMPs_ComminucationMethods_CommunicationID]
GO
ALTER TABLE [dbo].[JMPs]  WITH CHECK ADD  CONSTRAINT [FK_JMPs_DriverNames_DriverNameId] FOREIGN KEY([DriverNameId])
REFERENCES [dbo].[DriverNames] ([Id])
GO
ALTER TABLE [dbo].[JMPs] CHECK CONSTRAINT [FK_JMPs_DriverNames_DriverNameId]
GO
ALTER TABLE [dbo].[JMPs]  WITH CHECK ADD  CONSTRAINT [FK_JMPs_RouteNames_RouteNameID] FOREIGN KEY([RouteNameID])
REFERENCES [dbo].[RouteNames] ([Id])
GO
ALTER TABLE [dbo].[JMPs] CHECK CONSTRAINT [FK_JMPs_RouteNames_RouteNameID]
GO
ALTER TABLE [dbo].[JMPs]  WITH CHECK ADD  CONSTRAINT [FK_JMPs_Vehicles_VehicleId] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([Id])
GO
ALTER TABLE [dbo].[JMPs] CHECK CONSTRAINT [FK_JMPs_Vehicles_VehicleId]
GO
ALTER TABLE [dbo].[LeaderShipVisitsAndQHSEDaily]  WITH CHECK ADD  CONSTRAINT [FK_LeaderShipVisitsAndQHSEDaily_LeadershipVisits_LeadershipVisitId] FOREIGN KEY([LeadershipVisitId])
REFERENCES [dbo].[LeadershipVisits] ([Id])
GO
ALTER TABLE [dbo].[LeaderShipVisitsAndQHSEDaily] CHECK CONSTRAINT [FK_LeaderShipVisitsAndQHSEDaily_LeadershipVisits_LeadershipVisitId]
GO
ALTER TABLE [dbo].[LeaderShipVisitsAndQHSEDaily]  WITH CHECK ADD  CONSTRAINT [FK_LeaderShipVisitsAndQHSEDaily_QHSEDailyReport_QHSEDailyId] FOREIGN KEY([QHSEDailyId])
REFERENCES [dbo].[QHSEDailyReport] ([Id])
GO
ALTER TABLE [dbo].[LeaderShipVisitsAndQHSEDaily] CHECK CONSTRAINT [FK_LeaderShipVisitsAndQHSEDaily_QHSEDailyReport_QHSEDailyId]
GO
ALTER TABLE [dbo].[LTIPrevDateAndDays]  WITH CHECK ADD  CONSTRAINT [FK_LTIPrevDateAndDays_DaysSinceNoLTI_DaysSinceNoLTIId] FOREIGN KEY([DaysSinceNoLTIId])
REFERENCES [dbo].[DaysSinceNoLTI] ([Id])
GO
ALTER TABLE [dbo].[LTIPrevDateAndDays] CHECK CONSTRAINT [FK_LTIPrevDateAndDays_DaysSinceNoLTI_DaysSinceNoLTIId]
GO
ALTER TABLE [dbo].[PotentialHazard]  WITH CHECK ADD  CONSTRAINT [FK_PotentialHazard_AspNetUsers_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PotentialHazard] CHECK CONSTRAINT [FK_PotentialHazard_AspNetUsers_userID]
GO
ALTER TABLE [dbo].[PotentialHazard]  WITH CHECK ADD  CONSTRAINT [FK_PotentialHazard_Responsibility_ResponibilityId] FOREIGN KEY([ResponibilityId])
REFERENCES [dbo].[Responsibility] ([Id])
GO
ALTER TABLE [dbo].[PotentialHazard] CHECK CONSTRAINT [FK_PotentialHazard_Responsibility_ResponibilityId]
GO
ALTER TABLE [dbo].[PotentialHazard]  WITH CHECK ADD  CONSTRAINT [FK_PotentialHazard_Rigs_RigId] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([Id])
GO
ALTER TABLE [dbo].[PotentialHazard] CHECK CONSTRAINT [FK_PotentialHazard_Rigs_RigId]
GO
ALTER TABLE [dbo].[PPEAndPPEReceivings]  WITH CHECK ADD  CONSTRAINT [FK_PPEAndPPEReceivings_PPEReceivings_PPEReceivingId] FOREIGN KEY([PPEReceivingId])
REFERENCES [dbo].[PPEReceivings] ([Id])
GO
ALTER TABLE [dbo].[PPEAndPPEReceivings] CHECK CONSTRAINT [FK_PPEAndPPEReceivings_PPEReceivings_PPEReceivingId]
GO
ALTER TABLE [dbo].[PPEAndPPEReceivings]  WITH CHECK ADD  CONSTRAINT [FK_PPEAndPPEReceivings_PPEs_PPEId] FOREIGN KEY([PPEId])
REFERENCES [dbo].[PPEs] ([Id])
GO
ALTER TABLE [dbo].[PPEAndPPEReceivings] CHECK CONSTRAINT [FK_PPEAndPPEReceivings_PPEs_PPEId]
GO
ALTER TABLE [dbo].[PPEReceivings]  WITH CHECK ADD  CONSTRAINT [FK_PPEReceivings_AspNetUsers_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PPEReceivings] CHECK CONSTRAINT [FK_PPEReceivings_AspNetUsers_userID]
GO
ALTER TABLE [dbo].[PPEReceivings]  WITH CHECK ADD  CONSTRAINT [FK_PPEReceivings_Rigs_RigId] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([Id])
GO
ALTER TABLE [dbo].[PPEReceivings] CHECK CONSTRAINT [FK_PPEReceivings_Rigs_RigId]
GO
ALTER TABLE [dbo].[ProblemFacedDuringRigMoves]  WITH CHECK ADD  CONSTRAINT [FK_ProblemFacedDuringRigMoves_RigMovePerformances_RigMovePerformanceId] FOREIGN KEY([RigMovePerformanceId])
REFERENCES [dbo].[RigMovePerformances] ([Id])
GO
ALTER TABLE [dbo].[ProblemFacedDuringRigMoves] CHECK CONSTRAINT [FK_ProblemFacedDuringRigMoves_RigMovePerformances_RigMovePerformanceId]
GO
ALTER TABLE [dbo].[PTSMs]  WITH CHECK ADD  CONSTRAINT [FK_PTSMs_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PTSMs] CHECK CONSTRAINT [FK_PTSMs_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[PTSMs]  WITH CHECK ADD  CONSTRAINT [FK_PTSMs_Rigs_RigId] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([Id])
GO
ALTER TABLE [dbo].[PTSMs] CHECK CONSTRAINT [FK_PTSMs_Rigs_RigId]
GO
ALTER TABLE [dbo].[QHSEDailyReport]  WITH CHECK ADD  CONSTRAINT [FK_QHSEDailyReport_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[QHSEDailyReport] CHECK CONSTRAINT [FK_QHSEDailyReport_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[QHSEDailyReport]  WITH CHECK ADD  CONSTRAINT [FK_QHSEDailyReport_Client_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[QHSEDailyReport] CHECK CONSTRAINT [FK_QHSEDailyReport_Client_ClientId]
GO
ALTER TABLE [dbo].[QHSEDailyReport]  WITH CHECK ADD  CONSTRAINT [FK_QHSEDailyReport_DaysSinceNoLTI_DaysSinceNoLTIId] FOREIGN KEY([DaysSinceNoLTIId])
REFERENCES [dbo].[DaysSinceNoLTI] ([Id])
GO
ALTER TABLE [dbo].[QHSEDailyReport] CHECK CONSTRAINT [FK_QHSEDailyReport_DaysSinceNoLTI_DaysSinceNoLTIId]
GO
ALTER TABLE [dbo].[QHSEDailyReport]  WITH CHECK ADD  CONSTRAINT [FK_QHSEDailyReport_Rigs_RigId] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([Id])
GO
ALTER TABLE [dbo].[QHSEDailyReport] CHECK CONSTRAINT [FK_QHSEDailyReport_Rigs_RigId]
GO
ALTER TABLE [dbo].[ReportedByNames]  WITH CHECK ADD  CONSTRAINT [FK_ReportedByNames_ReportedByPositions_PositionId] FOREIGN KEY([PositionId])
REFERENCES [dbo].[ReportedByPositions] ([Id])
GO
ALTER TABLE [dbo].[ReportedByNames] CHECK CONSTRAINT [FK_ReportedByNames_ReportedByPositions_PositionId]
GO
ALTER TABLE [dbo].[RigMovePerformances]  WITH CHECK ADD  CONSTRAINT [FK_RigMovePerformances_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[RigMovePerformances] CHECK CONSTRAINT [FK_RigMovePerformances_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[RigMovePerformances]  WITH CHECK ADD  CONSTRAINT [FK_RigMovePerformances_Rigs_RigId] FOREIGN KEY([RigId])
REFERENCES [dbo].[Rigs] ([Id])
GO
ALTER TABLE [dbo].[RigMovePerformances] CHECK CONSTRAINT [FK_RigMovePerformances_Rigs_RigId]
GO
ALTER TABLE [dbo].[StopCardRegisters]  WITH CHECK ADD  CONSTRAINT [FK_StopCardRegisters_AspNetUsers_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[StopCardRegisters] CHECK CONSTRAINT [FK_StopCardRegisters_AspNetUsers_userID]
GO
ALTER TABLE [dbo].[StopCardRegisters]  WITH CHECK ADD  CONSTRAINT [FK_StopCardRegisters_Classifications_ClassificationID] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([Id])
GO
ALTER TABLE [dbo].[StopCardRegisters] CHECK CONSTRAINT [FK_StopCardRegisters_Classifications_ClassificationID]
GO
ALTER TABLE [dbo].[StopCardRegisters]  WITH CHECK ADD  CONSTRAINT [FK_StopCardRegisters_ReportedByNames_ReportedByNameID] FOREIGN KEY([ReportedByNameID])
REFERENCES [dbo].[ReportedByNames] ([Id])
GO
ALTER TABLE [dbo].[StopCardRegisters] CHECK CONSTRAINT [FK_StopCardRegisters_ReportedByNames_ReportedByNameID]
GO
ALTER TABLE [dbo].[StopCardRegisters]  WITH CHECK ADD  CONSTRAINT [FK_StopCardRegisters_ReportedByPositions_ReportedByPositionID] FOREIGN KEY([ReportedByPositionID])
REFERENCES [dbo].[ReportedByPositions] ([Id])
GO
ALTER TABLE [dbo].[StopCardRegisters] CHECK CONSTRAINT [FK_StopCardRegisters_ReportedByPositions_ReportedByPositionID]
GO
ALTER TABLE [dbo].[StopCardRegisters]  WITH CHECK ADD  CONSTRAINT [FK_StopCardRegisters_TypeOfObservationCategorys_TypeOfObservationCategoryID] FOREIGN KEY([TypeOfObservationCategoryID])
REFERENCES [dbo].[TypeOfObservationCategorys] ([Id])
GO
ALTER TABLE [dbo].[StopCardRegisters] CHECK CONSTRAINT [FK_StopCardRegisters_TypeOfObservationCategorys_TypeOfObservationCategoryID]
GO
USE [master]
GO
ALTER DATABASE [FreelanceJobDB] SET  READ_WRITE 
GO
