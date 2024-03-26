USE [master]
GO
/****** Object:  Database [IskhakovLanguage]    Script Date: 26.03.2024 8:20:37 ******/
CREATE DATABASE [IskhakovLanguage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IskhakovLanguage', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\IskhakovLanguage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IskhakovLanguage_log', FILENAME = N'D:\Program File\MSSQL15.SQLEXPRESS\MSSQL\DATA\IskhakovLanguage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IskhakovLanguage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IskhakovLanguage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET ARITHABORT OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IskhakovLanguage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IskhakovLanguage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IskhakovLanguage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IskhakovLanguage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IskhakovLanguage] SET  MULTI_USER 
GO
ALTER DATABASE [IskhakovLanguage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IskhakovLanguage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IskhakovLanguage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IskhakovLanguage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IskhakovLanguage] SET DELAYED_DURABILITY = DISABLED 
GO
USE [IskhakovLanguage]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](255) NULL,
	[RegistrationDate] [date] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[Discount] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 26.03.2024 8:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (101, N'Голубев', N'Иосиф', N'Тимофеевич', N'м', N'7(78)972-73-11 ', N'Клиенты\m18.jpg', CAST(N'1982-05-06' AS Date), N'smcnabb@att.net', CAST(N'2018-08-18' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (102, N'Ермакова', N'Алла', N'Мироновна', N'ж', N'7(06)437-13-73 ', N'Клиенты\48.jpg', CAST(N'1976-01-22' AS Date), N'whimsy@aol.com', CAST(N'2017-02-09' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (103, N'Селиверстов', N'Глеб', N'Максимович', N'м', N'7(20)554-28-68 ', N'Клиенты\m37.jpg', CAST(N'1999-06-20' AS Date), N'jigsaw@sbcglobal.net', CAST(N'2016-01-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (104, N'Агафонов', N'Юстиниан', N'Олегович', N'м', N'7(303)810-28-78 ', N'Клиенты\m1.jpg', CAST(N'1997-02-02' AS Date), N'staffelb@sbcglobal.net', CAST(N'2016-06-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (105, N'Колобова', N'Злата', N'Романовна', N'ж', N'7(50)884-07-35 ', N'Клиенты\18.jpg', CAST(N'1994-08-25' AS Date), N'sinkou@aol.com', CAST(N'2016-12-03' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (106, N'Сысоева', N'Дарина', N'Ярославовна', N'ж', N'7(0698)387-96-04 ', N'Клиенты\32.jpg', CAST(N'1982-02-03' AS Date), N'treit@verizon.net', CAST(N'2016-05-13' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (107, N'Некрасов', N'Варлам', N'Михайлович', N'м', N'7(019)258-06-35 ', N'Клиенты\m42.jpg', CAST(N'2000-11-12' AS Date), N'dogdude@verizon.net', CAST(N'2017-12-03' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (108, N'Крюков', N'Наум', N'Ильяович', N'м', N'7(81)657-88-92 ', N'Клиенты\m30.jpg', CAST(N'1993-11-17' AS Date), N'floxy@hotmail.com', CAST(N'2017-02-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (109, N'Сидорова', N'Татьяна', N'Михайловна', N'ж', N'7(51)732-91-79 ', N'Клиенты\42.jpg', CAST(N'1974-04-24' AS Date), N'tbeck@mac.com', CAST(N'2018-10-03' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (110, N'Трофимова', N'Альжбета', N'Якововна', N'ж', N'7(1084)658-92-95 ', N'Клиенты\25.jpg', CAST(N'1988-10-22' AS Date), N'gbacon@mac.com', CAST(N'2017-09-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (111, N'Новиков', N'Адриан', N'Аркадьевич', N'м', N'7(70)572-33-62 ', N'Клиенты\m40.jpg', CAST(N'1974-01-15' AS Date), N'multiplx@verizon.net', CAST(N'2018-11-23' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (112, N'Мишина', N'Иветта', N'Андреевна', N'ж', N'7(3926)244-81-96 ', N'Клиенты\30.jpg', CAST(N'2002-10-05' AS Date), N'aukjan@yahoo.com', CAST(N'2016-01-24' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (113, N'Шестаков', N'Геннадий', N'Рубенович', N'м', N'7(2066)037-11-60 ', N'Клиенты\m41.jpg', CAST(N'2001-07-01' AS Date), N'tokuhirom@live.com', CAST(N'2018-12-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (114, N'Зуев', N'Матвей', N'Иванович', N'м', N'7(5383)893-04-66 ', N'Клиенты\m38.jpg', CAST(N'1981-03-28' AS Date), N'brickbat@verizon.net', CAST(N'2018-12-18' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (115, N'Турова', N'Георгина', N'Семёновна', N'ж', N'7(555)321-42-99 ', N'Клиенты\27.jpg', CAST(N'1974-05-28' AS Date), N'yruan@optonline.net', CAST(N'2018-02-22' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (116, N'Анисимов', N'Валентин', N'Пантелеймонович', N'м', N'7(700)326-70-24 ', N'Клиенты\m99.jpg', CAST(N'2000-12-10' AS Date), N'aaribaud@hotmail.com', CAST(N'2018-01-20' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (117, N'Анисимова', N'Тамара', N'Витальевна', N'ж', N'7(66)128-04-10 ', N'Клиенты\2.jpg', CAST(N'1988-06-16' AS Date), N'schwaang@mac.com', CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (118, N'Колобов', N'Орест', N'Юлианович', N'м', N'7(1680)508-58-26 ', N'Клиенты\m27.jpg', CAST(N'2001-07-14' AS Date), N'parkes@verizon.net', CAST(N'2017-01-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (119, N'Филатов', N'Аристарх', N'Дмитриевич', N'м', N'7(696)235-29-24 ', N'Клиенты\m43.jpg', CAST(N'1989-05-29' AS Date), N'hampton@att.net', CAST(N'2017-01-11' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (120, N'Орлова', N'Влада', N'Мартыновна', N'ж', N'7(2506)433-38-35 ', N'Клиенты\22.jpg', CAST(N'1990-06-26' AS Date), N'rnelson@yahoo.ca', CAST(N'2016-03-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (121, N'Алексеева', N'Элина', N'Матвеевна', N'ж', N'7(8086)245-64-81 ', N'Клиенты\1.jpg', CAST(N'2002-05-07' AS Date), N'pthomsen@verizon.net', CAST(N'2018-03-28' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (122, N'Бобров', N'Агафон', N'Лаврентьевич', N'м', N'7(2159)507-39-57 ', N'Клиенты\m35.jpg', CAST(N'1995-07-29' AS Date), N'petersen@comcast.net', CAST(N'2017-05-09' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (123, N'Бирюкова', N'Инара', N'Улебовна', N'ж', N'7(098)346-50-58 ', N'Клиенты\5.jpg', CAST(N'1978-07-21' AS Date), N'smpeters@hotmail.com', CAST(N'2017-10-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (124, N'Панфилов', N'Марк', N'Рудольфович', N'м', N'7(764)282-55-22 ', N'Клиенты\m45.jpg', CAST(N'1991-04-13' AS Date), N'cremonini@optonline.net', CAST(N'2016-02-23' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (125, N'Колесникова', N'Алина', N'Еремеевна', N'ж', N'7(74)977-39-71 ', N'Клиенты\40.jpg', CAST(N'2001-04-19' AS Date), N'gfxguy@outlook.com', CAST(N'2017-01-18' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (126, N'Морозов', N'Наум', N'Валерьянович', N'м', N'7(636)050-96-13 ', N'Клиенты\m49.jpg', CAST(N'1985-07-04' AS Date), N'salesgeek@mac.com', CAST(N'2016-05-02' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (127, N'Горбачёв', N'Давид', N'Тимурович', N'м', N'7(53)602-85-41 ', N'Клиенты\m36.jpg', CAST(N'1983-05-22' AS Date), N'hedwig@att.net', CAST(N'2018-12-17' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (128, N'Васильев', N'Оскар', N'Богданович', N'м', N'7(585)801-94-29 ', N'Клиенты\m15.jpg', CAST(N'1971-01-30' AS Date), N'miturria@verizon.net', CAST(N'2017-05-28' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (129, N'Ершова', N'Номи', N'Андреевна', N'ж', N'7(7757)315-90-99 ', N'Клиенты\14.jpg', CAST(N'2001-09-13' AS Date), N'miltchev@mac.com', CAST(N'2016-06-30' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (130, N'Медведев', N'Святослав', N'Юлианович', N'м', N'7(3520)435-21-20 ', N'Клиенты\m13.jpg', CAST(N'1972-10-04' AS Date), N'hllam@comcast.net', CAST(N'2018-10-13' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (131, N'Баранова', N'Эльмира', N'Дмитриевна', N'ж', N'7(9240)643-15-50 ', N'Клиенты\4.jpg', CAST(N'1977-01-15' AS Date), N'jgmyers@comcast.net', CAST(N'2016-07-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (132, N'Попова', N'Харита', N'Якуновна', N'ж', N'7(335)386-81-06 ', N'Клиенты\36.jpg', CAST(N'1997-12-16' AS Date), N'firstpr@verizon.net', CAST(N'2016-07-05' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (133, N'Кудряшов', N'Аверкий', N'Константинович', N'м', N'7(88)732-96-30 ', N'Клиенты\m33.jpg', CAST(N'1991-07-26' AS Date), N'nanop@msn.com', CAST(N'2018-03-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (134, N'Горшкова', N'Марта', N'Иосифовна', N'ж', N'7(544)650-59-03', N'Клиенты\9.jpg', CAST(N'2001-02-13' AS Date), N'gbacon@mac.com', CAST(N'2016-08-04' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (135, N'Кудрявцев', N'Богдан', N'Христофорович', N'м', N'7(20)131-84-09 ', N'Клиенты\m31.jpg', CAST(N'1988-02-27' AS Date), N'lukka@hotmail.com', CAST(N'2016-10-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (136, N'Гусев', N'Яков', N'Авксентьевич', N'м', N'7(0972)781-11-37 ', N'Клиенты\m20.jpg', CAST(N'1995-12-10' AS Date), N'jdhedden@icloud.com', CAST(N'2017-11-20' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (137, N'Крюкова', N'Авигея', N'Святославовна', N'ж', N'7(499)318-88-53 ', N'Клиенты\19.jpg', CAST(N'2000-08-10' AS Date), N'simone@gmail.com', CAST(N'2018-01-03' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (138, N'Степанова', N'Амелия', N'Робертовна', N'ж', N'7(1217)441-28-42 ', N'Клиенты\15.jpg', CAST(N'1970-06-06' AS Date), N'rasca@hotmail.com', CAST(N'2017-09-27' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (139, N'Суворова', N'Божена', N'Анатольевна', N'ж', N'7(347)895-86-57 ', N'Клиенты\34.jpg', CAST(N'1981-03-09' AS Date), N'attwood@aol.com', CAST(N'2016-01-28' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (140, N'Борисов', N'Аввакум', N'Артемович', N'м', N'7(2296)930-08-88 ', N'Клиенты\m12.jpg', CAST(N'1974-04-25' AS Date), N'chlim@live.com', CAST(N'2017-03-11' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (141, N'Бобылёв', N'Георгий', N'Витальевич', N'м', N'7(88)685-13-51 ', N'Клиенты\m11.jpg', CAST(N'1983-12-19' AS Date), N'csilvers@mac.com', CAST(N'2018-04-06' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (142, N'Дроздов', N'Вольдемар', N'Артемович', N'м', N'7(307)456-99-05 ', N'Клиенты\m21.jpg', CAST(N'1976-02-07' AS Date), N'smpeters@me.com', CAST(N'2017-07-18' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (143, N'Беляева', N'Сабрина', N'Федосеевна', N'ж', N'7(6580)534-32-58 ', N'Клиенты\47.jpg', CAST(N'1972-07-26' AS Date), N'agapow@gmail.com', CAST(N'2017-06-14' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (144, N'Блохин', N'Пантелеймон', N'Феликсович', N'м', N'7(9524)556-48-98 ', N'Клиенты\m8.jpg', CAST(N'1978-03-06' AS Date), N'balchen@comcast.net', CAST(N'2018-02-14' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (145, N'Шашкова', N'Гелла', N'Эдуардовна', N'ж', N'7(57)446-21-04 ', N'Клиенты\43.jpg', CAST(N'1979-02-24' AS Date), N'jadavis@mac.com', CAST(N'2016-11-16' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (146, N'Калашников', N'Артур', N'Юрьевич', N'м', N'7(147)947-47-21 ', N'Клиенты\m10.jpg', CAST(N'1972-12-13' AS Date), N'oevans@aol.com', CAST(N'2017-08-20' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (147, N'Корнилова', N'Анэля', N'Михайловна', N'ж', N'7(20)980-01-60 ', N'Клиенты\26.jpg', CAST(N'1973-04-02' AS Date), N'jonathan@aol.com', CAST(N'2016-05-22' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (148, N'Гущина', N'Янита', N'Федоровна', N'ж', N'7(4544)716-68-96 ', N'Клиенты\11.jpg', CAST(N'1999-03-02' AS Date), N'lishoy@att.net', CAST(N'2018-02-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (149, N'Волков', N'Людвиг', N'Витальевич', N'м', N'7(8459)592-05-58 ', N'Клиенты\m50.jpg', CAST(N'1977-12-27' AS Date), N'jrkorson@msn.com', CAST(N'2016-04-27' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (150, N'Князев', N'Терентий', N'Валерьевич', N'м', N'7(98)397-23-23 ', N'Клиенты\m26.jpg', CAST(N'1991-06-19' AS Date), N'rjones@aol.com', CAST(N'2018-06-25' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (151, N'Силин', N'Гаянэ', N'Анатольевич', N'м', N'7(4547)615-22-69 ', N'Клиенты\m46.jpg', CAST(N'1976-05-27' AS Date), N'multiplx@comcast.net', CAST(N'2017-05-05' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (152, N'Казаков', N'Дмитрий', N'Русланович', N'м', N'7(51)682-19-40 ', N'Клиенты\m44.jpg', CAST(N'1978-12-15' AS Date), N'ozawa@verizon.net', CAST(N'2016-05-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (153, N'Гусева', N'Роза', N'Дмитриевна', N'ж', N'7(23)064-51-84 ', N'Клиенты\10.jpg', CAST(N'1999-02-13' AS Date), N'martyloo@live.com', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (154, N'Мамонтова', N'Марфа', N'Мироновна', N'ж', N'7(38)095-64-18 ', N'Клиенты\29.jpg', CAST(N'1984-10-19' AS Date), N'rfoley@verizon.net', CAST(N'2018-02-27' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (155, N'Галкин', N'Эрик', N'Онисимович', N'м', N'7(759)873-77-39 ', N'Клиенты\m16.jpg', CAST(N'1975-01-18' AS Date), N'snunez@verizon.net', CAST(N'2016-07-19' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (156, N'Архипова', N'Прасковья', N'Валерьевна', N'ж', N'7(86)540-10-21 ', N'Клиенты\33.jpg', CAST(N'1979-01-09' AS Date), N'cgcra@live.com', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (157, N'Овчинникова', N'Лаура', N'Еремеевна', N'ж', N'7(85)829-33-79 ', N'Клиенты\35.jpg', CAST(N'1992-04-03' AS Date), N'carcus@yahoo.ca', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (158, N'Андреева', N'Патрисия', N'Валерьевна', N'ж', N'7(9648)953-81-26 ', N'Клиенты\37.jpg', CAST(N'1993-11-18' AS Date), N'jigsaw@aol.com', CAST(N'2016-07-17' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (159, N'Авдеев', N'Самуил', N'Улебович', N'м', N'7(3168)043-63-31 ', N'Клиенты\m96.jpg', CAST(N'1996-07-04' AS Date), N'cliffordj@mac.com', CAST(N'2016-02-11' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (160, N'Бурова', N'Светлана', N'Лукьевна', N'ж', N'7(358)173-82-21 ', N'Клиенты\39.jpg', CAST(N'1979-01-04' AS Date), N'wsnyder@aol.com', CAST(N'2016-10-13' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (161, N'Ершов', N'Глеб', N'Федорович', N'м', N'7(2608)298-40-82 ', N'Клиенты\m23.jpg', CAST(N'1970-06-14' AS Date), N'sjava@aol.com', CAST(N'2016-09-14' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (162, N'Игнатов', N'Захар', N'Павлович', N'м', N'7(578)574-73-36 ', N'Клиенты\m98.jpg', CAST(N'1998-10-07' AS Date), N'dieman@icloud.com', CAST(N'2017-11-10' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (163, N'Комиссарова', N'Амалия', N'Робертовна', N'ж', N'7(22)647-46-32 ', N'Клиенты\17.jpg', CAST(N'1971-08-18' AS Date), N'jorgb@msn.com', CAST(N'2017-08-04' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (164, N'Быков', N'Трофим', N'Константинович', N'м', N'7(3414)460-12-05 ', N'Клиенты\m14.jpg', CAST(N'1994-12-20' AS Date), N'jguyer@aol.com', CAST(N'2016-04-17' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (165, N'Кузьмин', N'Леонтий', N'Валерьянович', N'м', N'7(1340)148-90-68 ', N'Клиенты\m17.jpg', CAST(N'2000-05-05' AS Date), N'msloan@hotmail.com', CAST(N'2017-10-12' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (166, N'Белозёрова', N'Диана', N'Антоновна', N'ж', N'7(9900)174-59-87 ', N'Клиенты\7.jpg', CAST(N'1989-02-27' AS Date), N'dialworld@aol.com', CAST(N'2017-01-30' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (167, N'Блинов', N'Евгений', N'Мэлсович', N'м', N'7(0852)321-82-64 ', N'Клиенты\m7.jpg', CAST(N'1994-01-05' AS Date), N'moxfulder@outlook.com', CAST(N'2017-05-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (168, N'Лазарев', N'Алексей', N'Богданович', N'м', N'7(0055)737-37-48 ', N'Клиенты\m48.jpg', CAST(N'1977-03-10' AS Date), N'claesjac@me.com', CAST(N'2017-01-02' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (169, N'Афанасьева', N'Розалия', N'Макаровна', N'ж', N'7(0661)413-23-32 ', N'Клиенты\31.jpg', CAST(N'1977-05-01' AS Date), N'malattia@hotmail.com', CAST(N'2017-09-06' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (170, N'Дементьева', N'Эдита', N'Онисимовна', N'ж', N'7(198)922-28-76 ', N'Клиенты\38.jpg', CAST(N'1975-09-17' AS Date), N'frosal@hotmail.com', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (171, N'Калинин', N'Петр', N'Иванович', N'м', N'7(90)316-07-17 ', N'Клиенты\m47.jpg', CAST(N'1993-09-08' AS Date), N'aschmitz@hotmail.com', CAST(N'2016-05-26' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (172, N'Андреев', N'Станислав', N'Максович', N'м', N'7(02)993-91-28 ', N'Клиенты\m3.jpg', CAST(N'1975-10-10' AS Date), N'budinger@mac.com', CAST(N'2017-12-26' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (173, N'Киселёв', N'Устин', N'Яковлевич', N'м', N'7(83)334-52-76 ', N'Клиенты\m25.jpg', CAST(N'1985-01-08' AS Date), N'dalamb@verizon.net', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (174, N'Гордеев', N'Павел', N'Семенович', N'м', N'7(5243)599-66-72 ', N'Клиенты\m19.jpg', CAST(N'1984-09-06' AS Date), N'dawnsong@verizon.net', CAST(N'2016-07-19' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (175, N'Горбачёва', N'Никки', N'Еремеевна', N'ж', N'7(94)789-69-20 ', N'Клиенты\8.jpg', CAST(N'1987-04-21' AS Date), N'chinthaka@att.net', CAST(N'2018-08-16' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (176, N'Копылов', N'Касьян', N'Робертович', N'м', N'7(5774)679-82-06 ', N'Клиенты\m29.jpg', CAST(N'1983-08-04' AS Date), N'crobles@sbcglobal.net', CAST(N'2018-03-18' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (177, N'Ефремов', N'Витольд', N'Авксентьевич', N'м', N'7(93)922-14-03 ', N'Клиенты\m28.jpg', CAST(N'1975-12-02' AS Date), N'kwilliams@yahoo.ca', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (178, N'Баранов', N'Михаил', N'Романович', N'м', N'7(750)985-94-13 ', N'Клиенты\m5.jpg', CAST(N'1997-07-12' AS Date), N'bigmauler@outlook.com', CAST(N'2018-10-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (179, N'Дмитриева', N'Элина', N'Даниловна', N'ж', N'7(787)140-48-84 ', N'Клиенты\12.jpg', CAST(N'1988-12-10' AS Date), N'vmalik@live.com', CAST(N'2017-02-11' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (180, N'Федотов', N'Осип', N'Анатольевич', N'м', N'7(590)702-33-06 ', N'Клиенты\m9.jpg', CAST(N'1971-04-13' AS Date), N'breegster@hotmail.com', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (181, N'Быкова', N'Тала', N'Георгьевна', N'ж', N'7(13)915-53-53 ', N'Клиенты\6.jpg', CAST(N'2000-02-22' AS Date), N'ganter@optonline.net', CAST(N'2016-08-13' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (182, N'Дементьев', N'Вадим', N'Ростиславович', N'м', N'7(79)330-46-15 ', N'Клиенты\m39.jpg', CAST(N'1993-07-10' AS Date), N'jacks@aol.com', CAST(N'2018-03-05' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (183, N'Евсеев', N'Макар', N'Васильевич', N'м', N'7(2141)077-85-70 ', N'Клиенты\m22.jpg', CAST(N'1977-09-13' AS Date), N'parsimony@sbcglobal.net', CAST(N'2018-12-05' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (184, N'Абрамов', N'Станислав', N'Филатович', N'м', N'7(6545)478-87-79 ', N'Клиенты\m32.jpg', CAST(N'1989-05-18' AS Date), N'solomon@att.net', CAST(N'2016-12-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (185, N'Артемьева', N'Лиза', N'Максимовна', N'ж', N'7(696)972-70-21 ', N'Клиенты\3.jpg', CAST(N'1996-05-17' AS Date), N'snunez@yahoo.ca', CAST(N'2018-10-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (186, N'Кузьмина', N'Дэнна', N'Витальевна', N'ж', N'7(9940)977-45-73 ', N'Клиенты\20.jpg', CAST(N'1993-08-24' AS Date), N'nichoj@mac.com', CAST(N'2016-03-27' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (187, N'Ефимова', N'Магда', N'Платоновна', N'ж', N'7(9261)386-15-92 ', N'Клиенты\16.jpg', CAST(N'1995-08-16' AS Date), N'rbarreira@me.com', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (188, N'Ефимов', N'Альберт', N'Проклович', N'м', N'7(416)375-97-19 ', N'Клиенты\m6.jpg', CAST(N'1997-10-29' AS Date), N'houle@live.com', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (189, N'Лазарева', N'Эльвина', N'Робертовна', N'ж', N'7(5564)609-81-37 ', N'Клиенты\28.jpg', CAST(N'1996-02-16' AS Date), N'ahuillet@comcast.net', CAST(N'2018-04-11' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (190, N'Воронова', N'Изабелла', N'Вячеславовна', N'ж', N'7(17)433-44-98 ', N'Клиенты\21.jpg', CAST(N'1999-09-24' AS Date), N'kildjean@sbcglobal.net', CAST(N'2017-12-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (191, N'Куликова', N'Эвелина', N'Вячеславовна', N'ж', N'7(0236)682-42-78 ', N'Клиенты\23.jpg', CAST(N'1997-11-14' AS Date), N'ilikered@hotmail.com', CAST(N'2018-02-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (192, N'Егорова', N'Амалия', N'Дамировна', N'ж', N'7(7486)408-12-26 ', N'Клиенты\13.jpg', CAST(N'1999-09-28' AS Date), N'drezet@yahoo.com', CAST(N'2016-06-30' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (193, N'Александров', N'Станислав', N'Эдуардович', N'м', N'7(18)164-05-12 ', N'Клиенты\m2.jpg', CAST(N'1981-07-04' AS Date), N'bigmauler@aol.com', CAST(N'2018-11-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (194, N'Цветков', N'Демьян', N'Львович', N'м', N'7(93)546-43-73 ', N'Клиенты\m4.jpg', CAST(N'1996-03-29' AS Date), N'hauma@icloud.com', CAST(N'2016-02-12' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (195, N'Устинова', N'Юнона', N'Валентиновна', N'ж', N'7(33)367-13-07', N'Клиенты\44.jpg', CAST(N'1982-08-08' AS Date), N'kempsonc@live.com', CAST(N'2017-05-28' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (196, N'Костина', N'Любава', N'Авксентьевна', N'ж', N'7(6419)959-21-87 ', N'Клиенты\41.jpg', CAST(N'1972-07-13' AS Date), N'gordonjcp@hotmail.com', CAST(N'2016-02-26' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (197, N'Смирнов', N'Мартын', N'Арсеньевич', N'м', N'7(6251)589-02-43 ', N'Клиенты\m34.jpg', CAST(N'1996-06-25' AS Date), N'haddawy@live.com', CAST(N'2017-02-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (198, N'Федотова', N'Сандра', N'Владленовна', N'ж', N'7(126)195-25-86 ', N'Клиенты\24.jpg', CAST(N'1985-03-29' AS Date), N'penna@verizon.net', CAST(N'2016-11-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (199, N'Журавлёв', N'Леонтий', N'Яковлевич', N'м', N'7(4403)308-56-96 ', N'Клиенты\m24.jpg', CAST(N'2000-03-02' AS Date), N'cmdrgravy@me.com', CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (200, N'Большаков', N'Вадим', N'Данилович', N'м', N'7(386)641-13-37 ', N'Клиенты\m97.jpg', CAST(N'1970-05-15' AS Date), N'uncle@gmail.com', CAST(N'2018-08-04' AS Date))
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (101, 187, 48, CAST(N'2019-12-22T15:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (102, 141, 46, CAST(N'2019-06-07T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (103, 114, 42, CAST(N'2019-03-04T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (104, 105, 3, CAST(N'2019-12-01T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (105, 146, 24, CAST(N'2019-06-26T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (106, 101, 41, CAST(N'2019-12-05T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (107, 139, 4, CAST(N'2019-11-16T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (108, 171, 16, CAST(N'2019-01-01T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (109, 146, 25, CAST(N'2019-02-01T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (110, 104, 28, CAST(N'2019-06-23T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (111, 132, 6, CAST(N'2019-08-18T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (112, 126, 37, CAST(N'2019-11-27T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (113, 130, 47, CAST(N'2019-09-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (114, 146, 25, CAST(N'2019-12-31T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (115, 127, 35, CAST(N'2019-12-28T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (116, 198, 17, CAST(N'2019-01-29T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (117, 122, 10, CAST(N'2019-11-12T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (118, 146, 36, CAST(N'2019-01-10T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (119, 192, 24, CAST(N'2019-09-29T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (120, 193, 46, CAST(N'2019-03-23T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (121, 198, 48, CAST(N'2019-04-29T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (122, 196, 15, CAST(N'2019-09-04T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (123, 152, 44, CAST(N'2019-01-23T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (124, 122, 49, CAST(N'2019-01-16T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (125, 183, 45, CAST(N'2019-07-15T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (126, 141, 40, CAST(N'2019-04-04T09:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (127, 190, 22, CAST(N'2019-04-30T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (128, 107, 15, CAST(N'2019-05-25T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (129, 101, 40, CAST(N'2019-08-11T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (130, 161, 24, CAST(N'2019-01-09T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (131, 127, 27, CAST(N'2019-04-09T11:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (132, 138, 22, CAST(N'2019-05-22T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (133, 115, 37, CAST(N'2019-09-28T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (134, 161, 30, CAST(N'2019-01-05T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (135, 177, 7, CAST(N'2019-05-08T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (136, 198, 6, CAST(N'2019-11-09T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (137, 163, 48, CAST(N'2019-01-16T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (138, 105, 26, CAST(N'2019-01-11T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (139, 163, 42, CAST(N'2019-08-29T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (140, 187, 28, CAST(N'2019-12-31T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (141, 190, 24, CAST(N'2019-05-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (142, 173, 47, CAST(N'2019-10-02T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (143, 147, 6, CAST(N'2019-11-27T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (144, 147, 45, CAST(N'2019-07-10T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (145, 167, 30, CAST(N'2019-04-16T13:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (146, 172, 25, CAST(N'2019-11-19T15:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (147, 184, 34, CAST(N'2019-06-13T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (148, 173, 17, CAST(N'2019-12-31T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (149, 122, 25, CAST(N'2019-12-19T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (150, 196, 26, CAST(N'2019-03-16T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (151, 126, 17, CAST(N'2019-11-23T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (152, 128, 16, CAST(N'2019-12-14T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (153, 131, 19, CAST(N'2019-07-04T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (154, 191, 30, CAST(N'2019-02-13T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (155, 171, 7, CAST(N'2019-08-29T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (156, 200, 45, CAST(N'2019-01-11T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (157, 148, 20, CAST(N'2019-03-01T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (158, 191, 33, CAST(N'2019-02-12T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (159, 127, 49, CAST(N'2019-12-26T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (160, 148, 37, CAST(N'2019-12-22T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (161, 183, 15, CAST(N'2019-11-09T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (162, 104, 2, CAST(N'2019-08-27T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (163, 144, 45, CAST(N'2019-01-22T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (164, 186, 4, CAST(N'2019-07-31T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (165, 168, 44, CAST(N'2019-08-15T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (166, 105, 8, CAST(N'2019-02-11T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (167, 122, 47, CAST(N'2019-01-05T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (168, 191, 18, CAST(N'2019-06-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (169, 179, 47, CAST(N'2019-01-06T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (170, 149, 40, CAST(N'2019-03-20T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (171, 198, 40, CAST(N'2019-08-06T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (172, 168, 3, CAST(N'2019-10-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (173, 162, 26, CAST(N'2019-04-07T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (174, 114, 11, CAST(N'2019-06-28T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (175, 138, 3, CAST(N'2019-01-03T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (176, 187, 32, CAST(N'2019-01-22T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (177, 158, 26, CAST(N'2019-01-31T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (178, 198, 47, CAST(N'2019-07-17T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (179, 147, 4, CAST(N'2019-04-29T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (180, 200, 43, CAST(N'2019-02-18T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (181, 152, 48, CAST(N'2019-03-15T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (182, 103, 27, CAST(N'2019-09-10T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (183, 173, 26, CAST(N'2019-08-06T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (184, 132, 30, CAST(N'2019-08-20T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (185, 148, 2, CAST(N'2019-11-15T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (186, 161, 24, CAST(N'2019-03-03T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (187, 187, 42, CAST(N'2019-10-21T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (188, 104, 6, CAST(N'2019-10-12T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (189, 139, 43, CAST(N'2019-11-11T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (190, 120, 47, CAST(N'2019-01-03T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (191, 144, 9, CAST(N'2019-07-06T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (192, 115, 23, CAST(N'2019-03-25T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (193, 143, 34, CAST(N'2019-10-27T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (194, 173, 7, CAST(N'2019-05-15T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (195, 172, 45, CAST(N'2019-08-30T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (196, 141, 38, CAST(N'2019-02-16T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (197, 190, 41, CAST(N'2019-09-24T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (198, 105, 23, CAST(N'2019-06-09T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (199, 191, 4, CAST(N'2019-04-13T09:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (200, 103, 30, CAST(N'2019-04-05T13:20:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', N'женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', N'мужской')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (1, N'Коррекция нарощенных ресниц', 2700, CAST(1310.00 AS Decimal(18, 2)), 5, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (2, N'Подготовка к экзамену ACT', 3000, CAST(1440.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (3, N'Киноклуб итальянского языка для студентов', 1800, CAST(1760.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (4, N'Урок в группе французского языка для школьников', 6000, CAST(1970.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (5, N'Ультразвуковой пилинг', 2700, CAST(1440.00 AS Decimal(18, 2)), 20, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (6, N'Киноклуб немецкого языка для детей', 7200, CAST(1670.00 AS Decimal(18, 2)), 5, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (7, N'Урок в группе испанского языка для взрослых', 1800, CAST(1730.00 AS Decimal(18, 2)), 5, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (8, N'Интенсивный онлайн-курс португальского языка для компаний по Skype', 4200, CAST(1610.00 AS Decimal(18, 2)), 5, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (9, N'Киноклуб английского языка для студентов', 4800, CAST(980.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (10, N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', 7200, CAST(1180.00 AS Decimal(18, 2)), 20, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (11, N'Подготовка к экзамену IELTS Speaking Club', 5400, CAST(1430.00 AS Decimal(18, 2)), 20, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (12, N'Ремонт подвески (ходовой)', 10800, CAST(680.00 AS Decimal(18, 2)), 5, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (13, N'Химический пилинг', 1500, CAST(1880.00 AS Decimal(18, 2)), 15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (14, N'Киноклуб немецкого языка для студентов', 3000, CAST(1140.00 AS Decimal(18, 2)), 15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (15, N'Интенсивный курс с преподавателем-носителем английского языка для компаний', 6600, CAST(1670.00 AS Decimal(18, 2)), 10, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (16, N'Киноклуб итальянского языка для детей', 4200, CAST(1480.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (17, N'Урок в группе японского языка для школьников', 4800, CAST(1300.00 AS Decimal(18, 2)), 5, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (18, N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', 6600, CAST(900.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (19, N'Индивидуальный урок французского языка с преподавателем-носителем языка', 2400, CAST(1410.00 AS Decimal(18, 2)), 20, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (20, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', 1800, CAST(1580.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (21, N'Снятие и установка колес', 23400, CAST(3130.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (22, N'Урок в группе английского языка для школьников', 6600, CAST(900.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (23, N'Занятие с русскоязычным репетитором японского языка', 2400, CAST(1260.00 AS Decimal(18, 2)), 10, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (24, N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', 1800, CAST(990.00 AS Decimal(18, 2)), 5, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (25, N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', 4200, CAST(1840.00 AS Decimal(18, 2)), 10, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (26, N'Индивидуальный онлайн-урок немецкого языка по Skype', 5400, CAST(970.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (27, N'Урок в группе китайского языка для взрослых', 4200, CAST(1730.00 AS Decimal(18, 2)), 25, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (28, N'Киноклуб французского языка для взрослых', 5400, CAST(1770.00 AS Decimal(18, 2)), 10, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (29, N'Ремонт автоэлектрики', 27000, CAST(4230.00 AS Decimal(18, 2)), 10, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (30, N'Урок в группе китайского языка для школьников', 3000, CAST(1180.00 AS Decimal(18, 2)), 15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (31, N'Удаление катализатора', 30600, CAST(1930.00 AS Decimal(18, 2)), 10, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (32, N'Киноклуб китайского языка для студентов', 6000, CAST(1990.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (33, N'Урок в группе китайского языка для студентов', 2400, CAST(2000.00 AS Decimal(18, 2)), 20, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (34, N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', 1800, CAST(1330.00 AS Decimal(18, 2)), 20, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (35, N'Киноклуб китайского языка для детей', 6000, CAST(1120.00 AS Decimal(18, 2)), 10, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (36, N'Подготовка к экзамену TOEFL', 6000, CAST(1070.00 AS Decimal(18, 2)), 5, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (37, N'Урок в группе итальянского языка для взрослых', 2400, CAST(1290.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (38, N'Индивидуальный урок английского языка с преподавателем-носителем языка', 7200, CAST(1300.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (39, N'Миндальный пилинг', 2700, CAST(2430.00 AS Decimal(18, 2)), 15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (40, N'Занятие с репетитором-носителем французского языка', 3000, CAST(2040.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (41, N'Занятие с русскоязычным репетитором английского языка', 5400, CAST(1950.00 AS Decimal(18, 2)), 15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (42, N'Индивидуальный урок испанского языка с преподавателем-носителем языка', 5400, CAST(1200.00 AS Decimal(18, 2)), 10, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (43, N'Интенсивный онлайн-курс китайского языка для компаний по Skype', 7200, CAST(1760.00 AS Decimal(18, 2)), 15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (44, N'Занятие с репетитором-носителем немецкого языка', 7200, CAST(1120.00 AS Decimal(18, 2)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (45, N'Киноклуб португальского языка для детей', 5400, CAST(1710.00 AS Decimal(18, 2)), 15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (46, N'Киноклуб португальского языка для студентов', 1800, CAST(1170.00 AS Decimal(18, 2)), 15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (47, N'Киноклуб немецкого языка для взрослых', 6000, CAST(1560.00 AS Decimal(18, 2)), 10, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (48, N'Урок в группе немецкого языка для школьников', 1800, CAST(1570.00 AS Decimal(18, 2)), 15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (49, N'Урок в группе английского языка для взрослых', 3000, CAST(1010.00 AS Decimal(18, 2)), 25, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (50, N'Ремонт кронштейна глушителя', 34200, CAST(1410.00 AS Decimal(18, 2)), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [IskhakovLanguage] SET  READ_WRITE 
GO
