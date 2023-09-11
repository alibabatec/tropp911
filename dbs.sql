USE [master]
GO
/****** Object:  Database [gascomonitor]    Script Date: 2/8/2023 10:16:22 AM ******/
CREATE DATABASE [gascomonitor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gascomonitor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\gascomonitor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gascomonitor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\gascomonitor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [gascomonitor] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gascomonitor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gascomonitor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gascomonitor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gascomonitor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gascomonitor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gascomonitor] SET ARITHABORT OFF 
GO
ALTER DATABASE [gascomonitor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gascomonitor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gascomonitor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gascomonitor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gascomonitor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gascomonitor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gascomonitor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gascomonitor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gascomonitor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gascomonitor] SET  ENABLE_BROKER 
GO
ALTER DATABASE [gascomonitor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gascomonitor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gascomonitor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gascomonitor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gascomonitor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gascomonitor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gascomonitor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gascomonitor] SET RECOVERY FULL 
GO
ALTER DATABASE [gascomonitor] SET  MULTI_USER 
GO
ALTER DATABASE [gascomonitor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gascomonitor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gascomonitor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gascomonitor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gascomonitor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gascomonitor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'gascomonitor', N'ON'
GO
ALTER DATABASE [gascomonitor] SET QUERY_STORE = OFF
GO
USE [gascomonitor]
GO
/****** Object:  Table [dbo].[Target]    Script Date: 2/8/2023 10:16:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Target](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Group] [nvarchar](50) NULL,
	[SubGroup] [nvarchar](50) NULL,
	[MonitorDate] [datetime] NOT NULL,
	[Priority] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](100) NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[Remarks1] [nvarchar](250) NULL,
	[Remarks2] [nvarchar](250) NULL,
 CONSTRAINT [PK_Target] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Target] ADD  DEFAULT ((1)) FOR [Priority]
GO
ALTER TABLE [dbo].[Target] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Target] ADD  DEFAULT ('Admin') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Target] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Target] ADD  CONSTRAINT [DF__Target__Modified__2F10007B]  DEFAULT ('Admin') FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Target] ADD  DEFAULT (getdate()) FOR [ModificationDate]
GO
USE [master]
GO
ALTER DATABASE [gascomonitor] SET  READ_WRITE 
GO
