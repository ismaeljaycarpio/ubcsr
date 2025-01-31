USE [master]
GO
/****** Object:  Database [aspnet-UBCSR-20160203174442]    Script Date: 7/31/2016 10:53:16 PM ******/
CREATE DATABASE [aspnet-UBCSR-20160203174442] ON  PRIMARY 
( NAME = N'aspnet-UBCSR-20160203174442.mdf', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\aspnet-UBCSR-20160203174442.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'aspnet-UBCSR-20160203174442_log.ldf', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\aspnet-UBCSR-20160203174442_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [aspnet-UBCSR-20160203174442].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET ARITHABORT OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET  DISABLE_BROKER 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET  MULTI_USER 
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET DB_CHAINING OFF 
GO
USE [aspnet-UBCSR-20160203174442]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/31/2016 10:53:16 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[LastName] [varchar](max) NULL,
	[MiddleName] [varchar](max) NULL,
	[FirstName] [varchar](max) NULL,
	[StudentId] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Applications]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[ApplicationName] [nvarchar](235) NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK_dbo.Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[SubjectId] [int] NULL,
	[ReservationId] [int] NULL,
	[Status] [varchar](50) NULL,
	[Remarks] [varchar](max) NULL,
	[JoinedDate] [datetime] NULL,
	[HasBreakage] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[IsReturned] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupItem]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NULL,
	[InventoryId] [int] NULL,
	[BorrowedQuantity] [int] NULL,
	[Breakage] [int] NULL,
	[Remarks] [varchar](max) NULL,
	[HasBreakage] [bit] NULL,
	[ReturnedQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupMember]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMember](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NULL,
	[UserId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[Stocks] [int] NULL,
	[Expiration] [datetime] NULL,
	[Serial] [varchar](50) NULL,
	[DateAdded] [datetime] NULL,
	[Remarks] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemCategoryId] [int] NULL,
	[ItemBrandId] [int] NULL,
	[ItemName] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemBrand]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemBrand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemCategory]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
 CONSTRAINT [PK_dbo.Memberships] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](max) NOT NULL,
	[PropertyValueStrings] [nvarchar](max) NOT NULL,
	[PropertyValueBinary] [varbinary](max) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Profiles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[SubjectId] [int] NULL,
	[ExperimentNo] [varchar](50) NULL,
	[DateRequested] [datetime] NULL,
	[DateFrom] [datetime] NULL,
	[LabRoom] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[ApprovalStatus] [varchar](50) NULL,
	[DateTo] [datetime] NULL,
	[IsReleased] [bit] NULL,
	[IsReturned] [bit] NULL,
	[ReleasedDate] [datetime] NULL,
	[ReturnedDate] [datetime] NULL,
	[DisapproveRemarks] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReservationItem]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InventoryId] [int] NULL,
	[Quantity] [int] NULL,
	[Status] [varchar](50) NULL,
	[ReservationId] [int] NULL,
	[QuantityByGroup] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Section] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [varchar](max) NULL,
	[YearFrom] [int] NULL,
	[YearTo] [int] NULL,
	[Sem] [varchar](50) NULL,
	[SectionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 7/31/2016 10:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.UsersInRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201602031012339_InitialCreate', N'System.Web.Providers.Entities.MembershipContext', 0x1F8B0800000000000400ED5D5B6FDCB8157E2FD0FF20E8A92DBC33BE34416ACCECC299C40BA376EC6692DDBE05B4C4190BD16556A21C1B457F591FFA93FA174ADDC5AB488A7371B058ECC223921F0F0F0F0FCF2179CEFEEF3FFF9DFDF41485CE234CB32089E7EEC9E4D87560EC257E10AFE76E8E563FBC717FFAF18F7F98BDF7A327E797A6DE59510FB78CB3B9FB80D0E67C3ACDBC0718816C12055E9A64C90A4DBC249A023F999E1E1FFF6D7A72328518C2C5588E33FB98C7288860F903FF5C24B107372807E14DE2C330ABBFE3926589EA7C0011CC36C0837377F99C21184D7E85F793BB34790C7C4CD3E43D864301CC5CE7220C00266A09C395EB80384E104098E4F3CF195CA23489D7CB0DFE00C24FCF1B88EBAD4098C17A28E75D75D5511D9F16A39A760D1B282FCF501269029E9CD56C9AD2CD8D98EDB66CC48C2C39F45C8CBA64E6DCBDD86CC2C0ABD1E9FECE17615AD41D60F7A40772E4F0AA1EB532733A392EFE3972167988F214CE6398A3148447CE5D7E8F41FE0E9F3F255F613C3F3BB95F9DBD79F51AF867AFFF0ACF5EF587810782EB111FF027DCDB06A6E8F9235CB183BBF25D674A424C698C1681DFBCE2C4CF7980FFFE908721B80F612B3A5355A4E243838545112F30D7B9014FD7305EA387B97B8A47EA5C064FD06FBED41D7C8E03BC1E712394E6509B807730F3D260534DB3B8F357AF953AA7FAFA001E83753938AAD71B18DDE3797F083678497E846159A7F859ADCC49575EC9E517421A2FD324FA9884040E5BEFCB2790AE21C2A34A142A2F933CF534465040F2692F4AE454F36B30F40AAAE9528A355BCAA7B42811D1489731D431157874CDA69D5E916A1B7A6ECC550E8D74507AA7609A89C269DAD9D1342391EE40967D4B525FA22F4E4EDF6C4359353D5F26690450D3FF558CCE4E8DB1962044BB1FC9FB0804A17D852B18E33F72986D47C30B3ABC88B36F30B5C05679775719966ABCA4612B8B6F13AC9C40AC3D1F57D975E27D85FE6D8EC6422D5208107C87FF6D908ABF3F0591BE945C830C5D27EB20B686D64CD0E201C46BE85BA4D2FB9AE4C80ADE255E1AD06F450961E5BD418B04BB04E3563C17F7D720F6936F4B0452649BF0720D6C8DFC3E7A3588CCCE28164914C158A6136D5B838409B22D6BB0314F94ACC1C6D8D1B1B1D448AF6A4A682EEDAA4162CB5A3C2A952DAE8A10532BAB68FDBB6565DBB22A881970035F1D6FC31CC11B699CC4CF51926763B7BF6237B8F050F088C5CD6C3B30D6135AFE0CBDC4840E8FBE4F6B53130C3AB184BE50A515FF5CE1DD844B685D26A0922D6548E45431F259AF62B193DDABC0904897715D57A2C228D79518AEB94625607E57AD2D6FCB9FE5F9AE442BE23FB7E26FD63F7F01610EAB6EF74DC5DB2006E973ABA4EB5F2A4418E8F1CF1B1F6B6D432F41DF58D2D63CB40E972827631BA95614E34CA51AE4052C6B6ED582F63D6980A66B1D08E9A1EDE0765255E26F27E57F78960351C19AF7A0B5CBC9C81ABF14BAC368F395D0611CD44230956E13D1DC9AEB5010337483A4E8B6BF881BA4215FC0F816865E460397355BB168075590CCA2257494CA5ABFC8B2C40B4A7A04B731040BC901BF8F7D47E7F4A5920F9E4384C5052FF6A068837FCDDDBF30CC55ECAB654ED71721026437274C375833C014C6C52B80059E22AC778218B16A2488BD6003420D8A280CFD9BE9620EDB8EE992777003631FD3AD311F56286A3BA6F4E7101F67D39EE4C90592F1EC45822176F33B61A876527561135F85EE52C04454EC56A844FC7D2982C4713144D32EF337BA89A7BC7F72EA8F271376F6A53D70448B27AE96644A4C80CA7C0A1D08757112F3781C013B90248181219AEB216BA39BEFBEA5ADAEA486DE94EC5255C969D9ADC292F3FDA5A82DC63894ED557C67955428EDA986DE36C837425564D7E22EC823426522F97E9EF6F6C763EFB8EE772C40D25D4F7CAC605580F6B0D989BADFD1562762ECC16F74FC8B2B65CF4C244443EEDF80ED34705BB6138992D2B023B192F2FBC064ABA210B741B8054C19F92A4AE013E21C306222EB33C6AC3E28A2E5A2405E42C4EED999EB74C71E3C13881131128A78AACC20B1523C0057BFC665802A311D685C9BCBBCF6941FA242457B1AC525A655F00350228CBE294041F4C483C767DEB15DAF89CAA3205A96354FA9DA3152D3CFAC11CD13A91E2E29A1F4D133C92105EEB14F1F588EC90F51D48E517A23A82559C213E1C1C9F6F8C0BB42643931740AA07A0ED01B47B734250C9138FC438C35E085E8089CE5878A2FABE3CDF60653AB070953063CD7EDAE19F2C49DBF66C48E979AEB454F6DAB7707960ED7D91A62ED483E88568CDC7F50F320C6F261DBEB45F0424B61EB19E088DC26B6B1D9D8624D7345D4DA686DD96C5A855AD61F6653414CE6EC066C36C53B99AE65FDC55956019A8B1F96FAE18A518531F5324ED4624B6DDB134A52B0865469F1B4D98797419A15EFD4C13D28AE1F177EC454632D528109D4F4C7313AD9C96BECA3A651F177D55039869263D0D7689778BCC5ABED72E890AF33D9D64E11400B4290CAAFA517499847B1D269981266754F2D40AD0AD57189EBE73E2651C0E2CDA614EB18FF8799326A15D162A02424FD256E4F461837445F5086214433D078907DE68BBCCADDCA5C17A9D687EBBEEA233591673CBCA64C1FB58A41E3615625EA88755C591FAAFEA44F551735C6A3AC2BD5476EC2C378B84D993A6A3F0AAC8FD8FFAE83D68B0423E17A05EA78FD70B03E5CFFBB3A1A1511D607A48AF430B97161343AB7922EEDBD383196FA5EA13AAE2C5EACDF85ACDEC8DE8828B2C13E89DAC63D73C2CB243D736A5BE9990C3D5324806CA4B1969AD0346221351F0F668FAFAC6E7BBB3BCFBD50D8D1F9CD5EDE2EDE4545D1B4E9DA8A449813B55574057A1A8D8C75A2551A597A3012DA9E56D91352F2005A5F5A07DA6F576CA93813C22E218BF431C9E0111E3459C3B087261444D84153414FBC8910105ABA89C283116EE270C9AE166E2E45CC94B1B0F57685BB7978D047113D46D8DBA4D99EADDEF593FE64C91ADBE1F22EF7CF2E3480A6EDBB386B61CE2CE92A6DEFEDD925754639ABCF0B8793CB3107885515D76924B015CBA2C264F95BB80883D2386D2ADC80385861CFB90A5F714F8F4F4EA9A4748793206E9A657EA89E258E9CB2BDE561CBE3E0B71C06C5C38560151447097672B2C58F20F51E40CA66651B1F30C3C72E42663A6C363EC63CBB96C154D9890266278779EB7115FBF069EEFEAB6C7FEE5CFDF34B0571E4DCA678019D3BC7CEBFED045A191143208DA289CEA3C5158232519295345941A1862C24C9B246269103CB6C058829A6535ED9C627335CA9F0C42CA1D57DA03F6B9C645626306C22ABC2DA47D612598D429324B21A492593C8CA186F389195C99A544D63658B6C611A2B0BC40F25B1321E0395C46ACBFB2BE745EC5EF7D4EF6073EC8EF724335824431A9FE9C844378AB21C290AAC6172990312B1DD986DD4E11B290A7F8AC0D39FADE674B1884CE669C1B8F7E5073364412E16DBC2263CA33AD08422FB924A32F18311151584061526893A0CE6D04E2E8CEF7247A2336CA8D81487711E6029C103F188D834A054FC8871647208A3081EF9DBBA6DC6A52ABCD83ADC50D47D884BF518573B8DC30B130BC155FF618AC2501885EEEC29E74A189981C1387C742F69110E2D8A6F742A04CB8AA11F68669846E1852909E9DDE661AA0AE50406DAB339B467B4718CA601EC235360EC2135C177968E60D4BEB13F11D8E586A13BF92F28A1C0680918E567BC4CFBC1C8B9D87B2200363A8B9E526190FF508C7FF54C63EEFAF7099EFECA7F964693D27DB172C274C856E1F52A09F1E346E90B5305F0C0F9E17E342C653033F85439AFA33B41B4B32CD1C0509E01E1800471A2DC4C04C241F50B793DF1BBD867A6028E7833117D3A41A28248D3A6D04A18B1C514046387DF5F3CDD73F8F1C3E438BD63330C28912AF3867B4DEFA479400E2A89C0D81966D73BFD78D38E505BCC11A04DB2D896A5C44594AEE520D201E809F76E86B9B5687FFD016F4B536B44F3B32F60B179D7FB9F306313330BD61D44F1BF648EA14718766D9DAB789534F62545515385BA02B98108F8D8EABB4851B0021EC2C51ECCB2328978799D5ABC16BB87FE557C9BA34D8EF090315B428219859D2AEBBF4C5940D23CBB2D6F5D321B43C06406C585EC6DFC360F42BFA5FB9273972780280CE09F21FE5ECD25B6A7115C3FB7481F925811A8665F6BB77F82D126C460D96DBC048FD084362CC4D7700DBCE7E621B31864782248B6CFDE05609D8228AB31BAF6F82796613F7AFAF1FF499127078B7C0000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (1, N'8da709af-6186-41e0-b24d-93987d717dd6', N'testfname', N'testmname', N'testname', N'test1')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (2, N'df58da55-3e74-4819-bb77-2755c5164e59', N'Sample', N'Sample', N'Sample', N'test-student')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (3, N'052541ed-d7a9-4bba-9abb-ad777db5512e', N'ins', N'ins', N'ins', N'test-instructor')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (4, N'26fa01c2-7eb9-465d-ae89-3638479b60fe', N'csr', N'csr', N'csr', N'test-csr')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (5, N'54f45fe1-2bfc-46e5-a896-341eff5dbd76', N'admin', N'admins', N'admin', N'test-admin')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (6, N'b77099c3-8113-4ee5-990f-44c63ba743db', N'test-student1', N'test-student1', N'test-student1', N'test-student1')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (7, N'8ea224af-aa92-4fc0-af2b-9010dee3bf41', N'test-student2', N'test-student2', N'test-student2', N'test-student2')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (8, N'7a27c0b3-43d4-4d80-8e2d-86cfe798d08a', N'test-student3', N'test-student3', N'test-student3', N'test-student3')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (9, N'98df1966-196d-4fc4-9414-d2efbc4b9679', N'test-student4', N'test-student4', N'test-student4', N'test-student4')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (10, N'22a0f4f8-07e7-488a-9f8a-7b6e4576cd96', N'test-student5', N'test-student5', N'test-student5', N'test-student5')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (11, N'68d5d06d-e113-4f7c-819d-dcfd429887aa', N'test-student6', N'test-student6', N'test-student6', N'test-student6')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (12, N'3deecc83-a4f6-4509-8303-983b5e67749c', N'test-student7', N'test-student7', N'test-student7', N'test-student7')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (13, N'dd84d6d4-ccc4-4007-9034-cfdcff98ca07', N'test-student8-lname', N'test-student8-mname', N'test-student8-lname', N'test-student8')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (14, N'f6233d9d-5831-4d74-b3f8-8dddea972eca', N'John', N'Ray', N'Balcita', N'test-instructor1')
INSERT [dbo].[Account] ([Id], [UserId], [LastName], [MiddleName], [FirstName], [StudentId]) VALUES (15, N'1de53dd0-e335-46d3-8b32-04bb9d55c0c3', N'Boaging', N'Joseph', N'Mark', N'test-instructor2')
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Applications] ([ApplicationId], [ApplicationName], [Description]) VALUES (N'a33be911-3945-435c-b189-1affb0a669f0', N'/', NULL)
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Id], [Name], [SubjectId], [ReservationId], [Status], [Remarks], [JoinedDate], [HasBreakage], [CreatedBy], [IsReturned]) VALUES (32, N'1', NULL, 15, N'Joined', NULL, CAST(N'2016-05-07T20:18:49.227' AS DateTime), 0, N'052541ed-d7a9-4bba-9abb-ad777db5512e', 0)
INSERT [dbo].[Group] ([Id], [Name], [SubjectId], [ReservationId], [Status], [Remarks], [JoinedDate], [HasBreakage], [CreatedBy], [IsReturned]) VALUES (34, N'2', NULL, 15, N'Joined', NULL, CAST(N'2016-05-07T20:23:20.290' AS DateTime), 0, N'052541ed-d7a9-4bba-9abb-ad777db5512e', 0)
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[GroupItem] ON 

INSERT [dbo].[GroupItem] ([Id], [GroupId], [InventoryId], [BorrowedQuantity], [Breakage], [Remarks], [HasBreakage], [ReturnedQuantity]) VALUES (7, 32, 16, 5, 0, NULL, 0, 0)
INSERT [dbo].[GroupItem] ([Id], [GroupId], [InventoryId], [BorrowedQuantity], [Breakage], [Remarks], [HasBreakage], [ReturnedQuantity]) VALUES (8, 32, 17, 10, 0, NULL, 0, 0)
INSERT [dbo].[GroupItem] ([Id], [GroupId], [InventoryId], [BorrowedQuantity], [Breakage], [Remarks], [HasBreakage], [ReturnedQuantity]) VALUES (9, 32, 18, 30, 0, NULL, 0, 0)
INSERT [dbo].[GroupItem] ([Id], [GroupId], [InventoryId], [BorrowedQuantity], [Breakage], [Remarks], [HasBreakage], [ReturnedQuantity]) VALUES (13, 34, 16, 5, 0, NULL, 0, 0)
INSERT [dbo].[GroupItem] ([Id], [GroupId], [InventoryId], [BorrowedQuantity], [Breakage], [Remarks], [HasBreakage], [ReturnedQuantity]) VALUES (14, 34, 17, 10, 0, NULL, 0, 0)
INSERT [dbo].[GroupItem] ([Id], [GroupId], [InventoryId], [BorrowedQuantity], [Breakage], [Remarks], [HasBreakage], [ReturnedQuantity]) VALUES (15, 34, 18, 30, 0, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[GroupItem] OFF
SET IDENTITY_INSERT [dbo].[GroupMember] ON 

INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId]) VALUES (59, 34, N'68d5d06d-e113-4f7c-819d-dcfd429887aa')
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId]) VALUES (60, 34, N'3deecc83-a4f6-4509-8303-983b5e67749c')
INSERT [dbo].[GroupMember] ([Id], [GroupId], [UserId]) VALUES (61, 34, N'dd84d6d4-ccc4-4007-9034-cfdcff98ca07')
SET IDENTITY_INSERT [dbo].[GroupMember] OFF
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([Id], [ItemId], [Stocks], [Expiration], [Serial], [DateAdded], [Remarks]) VALUES (16, 8, 85, CAST(N'2016-04-27T00:00:00.000' AS DateTime), N'', CAST(N'2016-04-18T14:20:39.213' AS DateTime), N'')
INSERT [dbo].[Inventory] ([Id], [ItemId], [Stocks], [Expiration], [Serial], [DateAdded], [Remarks]) VALUES (17, 9, 70, NULL, N'', CAST(N'2016-04-18T14:20:45.513' AS DateTime), N'')
INSERT [dbo].[Inventory] ([Id], [ItemId], [Stocks], [Expiration], [Serial], [DateAdded], [Remarks]) VALUES (18, 10, 10, NULL, N'', CAST(N'2016-04-18T14:20:53.930' AS DateTime), N'')
INSERT [dbo].[Inventory] ([Id], [ItemId], [Stocks], [Expiration], [Serial], [DateAdded], [Remarks]) VALUES (19, 9, 100, CAST(N'2016-05-31T00:00:00.000' AS DateTime), N'44-55', CAST(N'2016-05-07T21:41:29.447' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Inventory] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (8, 8, 2, N'item 1')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (9, 5, 2, N'item 2')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (10, 5, 2, N'item 3')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (11, 5, 2, N'item 4')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (12, 5, 2, N'item 5')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (13, 5, 2, N'item 6')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (14, 5, 2, N'item 7')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (15, 5, 2, N'item 8')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (16, 5, 2, N'item 9')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (17, 5, 2, N'item 10')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (18, 5, 2, N'item 11')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (19, 8, 3, N'item1')
INSERT [dbo].[Item] ([Id], [ItemCategoryId], [ItemBrandId], [ItemName]) VALUES (20, 5, 2, N'item 12')
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[ItemBrand] ON 

INSERT [dbo].[ItemBrand] ([Id], [BrandName]) VALUES (2, N'brand2')
INSERT [dbo].[ItemBrand] ([Id], [BrandName]) VALUES (3, N'brand3')
INSERT [dbo].[ItemBrand] ([Id], [BrandName]) VALUES (4, N'brand123')
INSERT [dbo].[ItemBrand] ([Id], [BrandName]) VALUES (5, N'brand23')
SET IDENTITY_INSERT [dbo].[ItemBrand] OFF
SET IDENTITY_INSERT [dbo].[ItemCategory] ON 

INSERT [dbo].[ItemCategory] ([Id], [CategoryName]) VALUES (5, N'cat2')
INSERT [dbo].[ItemCategory] ([Id], [CategoryName]) VALUES (8, N'Category 1')
INSERT [dbo].[ItemCategory] ([Id], [CategoryName]) VALUES (9, N'Category 3')
INSERT [dbo].[ItemCategory] ([Id], [CategoryName]) VALUES (10, N'Category 4')
INSERT [dbo].[ItemCategory] ([Id], [CategoryName]) VALUES (12, N'cat23')
SET IDENTITY_INSERT [dbo].[ItemCategory] OFF
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'1de53dd0-e335-46d3-8b32-04bb9d55c0c3', N'a33be911-3945-435c-b189-1affb0a669f0', N'2J3q/4bqVrbFrPnCE43q8DYrCzCur2t0ZCNP3IHpt84=', 1, N'iK6FjJb4WRqWI8tBnF/aNA==', NULL, NULL, NULL, 1, 0, CAST(N'2016-04-06T12:08:55.787' AS DateTime), CAST(N'2016-04-06T12:08:55.787' AS DateTime), CAST(N'2016-07-31T14:22:03.727' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'df58da55-3e74-4819-bb77-2755c5164e59', N'a33be911-3945-435c-b189-1affb0a669f0', N'switHk5+w9KY6fGb95CvTfFgtQ6oSsXamVkToAchypg=', 1, N'gIAVlpPXQzyTEfAfXDoy3g==', NULL, NULL, NULL, 1, 0, CAST(N'2016-02-25T23:54:34.397' AS DateTime), CAST(N'2016-02-25T23:54:34.397' AS DateTime), CAST(N'2016-07-31T14:21:43.130' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'54f45fe1-2bfc-46e5-a896-341eff5dbd76', N'a33be911-3945-435c-b189-1affb0a669f0', N'qtwGMa/RGvDn8d679PPxKuEpvgPy2174FssyWWkECkE=', 1, N'xUNiok74tzgpUYttP47dvg==', NULL, NULL, NULL, 1, 0, CAST(N'2016-02-26T00:06:06.760' AS DateTime), CAST(N'2016-07-31T14:21:18.990' AS DateTime), CAST(N'2016-07-31T13:56:18.273' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'26fa01c2-7eb9-465d-ae89-3638479b60fe', N'a33be911-3945-435c-b189-1affb0a669f0', N'QeBhQNCHgLF9AO/vGVSSNf6Z8z7ANJ4NT8dOQ8+0RCQ=', 1, N'wIBiCv/L001T3ThNRWvmnA==', NULL, NULL, NULL, 1, 0, CAST(N'2016-02-25T23:55:05.500' AS DateTime), CAST(N'2016-05-07T12:18:16.407' AS DateTime), CAST(N'2016-02-25T23:55:05.500' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'b77099c3-8113-4ee5-990f-44c63ba743db', N'a33be911-3945-435c-b189-1affb0a669f0', N'dIpqqDafdcqB1VK+L3bP6xpuGZSPdC6S/qxMAb5XgL8=', 1, N'v34YVQ20pYpSgnO/iLX4/g==', NULL, NULL, NULL, 1, 0, CAST(N'2016-03-30T12:26:40.867' AS DateTime), CAST(N'2016-05-05T13:49:43.540' AS DateTime), CAST(N'2016-07-31T14:21:53.767' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'22a0f4f8-07e7-488a-9f8a-7b6e4576cd96', N'a33be911-3945-435c-b189-1affb0a669f0', N'FDbRaXP4jt9qrVrBYRdAFHDqOq+rmtYdw0n7IqFihw0=', 1, N'ZTLh7fyP62HZkT4Qg1TvwA==', NULL, NULL, NULL, 1, 0, CAST(N'2016-03-30T12:28:07.473' AS DateTime), CAST(N'2016-03-30T12:28:07.473' AS DateTime), CAST(N'2016-03-30T12:28:07.473' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'7a27c0b3-43d4-4d80-8e2d-86cfe798d08a', N'a33be911-3945-435c-b189-1affb0a669f0', N'kzYDhsiNrr81wqyz9K/yAaWaOhJLiMRib5sA6LkcR10=', 1, N'GmdVzL7ZYAqG3U6of2iQRQ==', NULL, NULL, NULL, 1, 0, CAST(N'2016-03-30T12:27:08.993' AS DateTime), CAST(N'2016-04-05T05:51:16.470' AS DateTime), CAST(N'2016-03-30T12:27:08.993' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'f6233d9d-5831-4d74-b3f8-8dddea972eca', N'a33be911-3945-435c-b189-1affb0a669f0', N'gF2Mh7u14brL+3J6pB40fDop6FbPtdgW+cJidZMhKHc=', 1, N'10dEZ1b84xV3XQ66yAJsDA==', NULL, NULL, NULL, 1, 0, CAST(N'2016-04-06T12:02:47.380' AS DateTime), CAST(N'2016-04-06T12:45:36.380' AS DateTime), CAST(N'2016-04-06T12:02:47.380' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'8ea224af-aa92-4fc0-af2b-9010dee3bf41', N'a33be911-3945-435c-b189-1affb0a669f0', N'QvRNx1Iq0jR2X29mZk+brwCo1MmP1eJTfq1KbDTcZa0=', 1, N'W8RK8uWYFzO0VToxP7O+1g==', NULL, NULL, NULL, 1, 0, CAST(N'2016-03-30T12:27:00.083' AS DateTime), CAST(N'2016-04-18T06:33:38.873' AS DateTime), CAST(N'2016-07-31T14:21:57.433' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'8da709af-6186-41e0-b24d-93987d717dd6', N'a33be911-3945-435c-b189-1affb0a669f0', N'km/TLLKxbNgKurMqGLhW23LpXwptQbgAXqTm8uc6NQs=', 1, N'p2Pg9vZZON8Ul2wL3x6uqg==', NULL, NULL, NULL, 1, 0, CAST(N'2016-02-23T05:59:29.577' AS DateTime), CAST(N'2016-05-05T16:36:31.383' AS DateTime), CAST(N'2016-07-31T14:21:41.187' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'3deecc83-a4f6-4509-8303-983b5e67749c', N'a33be911-3945-435c-b189-1affb0a669f0', N'4Q+VZFADeKEqvky8pEUScTustYnAjYgG3c0q78xhJrM=', 1, N'qYeUOByc/gueFAkKIyOPHw==', NULL, NULL, NULL, 1, 0, CAST(N'2016-04-04T09:20:40.307' AS DateTime), CAST(N'2016-04-04T09:20:40.307' AS DateTime), CAST(N'2016-04-04T09:20:40.307' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'052541ed-d7a9-4bba-9abb-ad777db5512e', N'a33be911-3945-435c-b189-1affb0a669f0', N'8RQpVpk8DUqFVNBy08aLD+Dho/s5BSxB4r5Eu4UWU8I=', 1, N'kjr8wqGgxiDTCm3LJuqLWg==', NULL, NULL, NULL, 1, 0, CAST(N'2016-02-25T23:54:51.800' AS DateTime), CAST(N'2016-05-07T12:18:38.120' AS DateTime), CAST(N'2016-07-31T14:21:49.620' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'dd84d6d4-ccc4-4007-9034-cfdcff98ca07', N'a33be911-3945-435c-b189-1affb0a669f0', N'0exEfZof55ewMUA0CdSsH2vaVWP0THcALPAGU+QE89I=', 1, N'Sx2C0VE7twtvhonm8rwLuA==', NULL, NULL, NULL, 1, 0, CAST(N'2016-04-06T06:55:43.183' AS DateTime), CAST(N'2016-04-06T06:55:43.183' AS DateTime), CAST(N'2016-04-06T06:55:43.183' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'98df1966-196d-4fc4-9414-d2efbc4b9679', N'a33be911-3945-435c-b189-1affb0a669f0', N'K1aPyYY1XJKFMORyqFN1//Vas7dmVdCuVM5VdCmbklA=', 1, N'psMxzE60v4tJyTtdKNPvVw==', NULL, NULL, NULL, 1, 0, CAST(N'2016-03-30T12:27:16.297' AS DateTime), CAST(N'2016-03-30T12:27:16.297' AS DateTime), CAST(N'2016-03-30T12:27:16.297' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Memberships] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'68d5d06d-e113-4f7c-819d-dcfd429887aa', N'a33be911-3945-435c-b189-1affb0a669f0', N'KlCTnP7lXYKJC3V9Yq1KWmIfIhxJkpBwn9UTxCVTDu4=', 1, N'T6OxRvaBfxvT5zoJh2NGxw==', NULL, NULL, NULL, 1, 0, CAST(N'2016-03-30T12:28:21.807' AS DateTime), CAST(N'2016-05-05T13:49:59.320' AS DateTime), CAST(N'2016-03-30T12:28:21.807' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([Id], [UserId], [SubjectId], [ExperimentNo], [DateRequested], [DateFrom], [LabRoom], [Status], [ApprovalStatus], [DateTo], [IsReleased], [IsReturned], [ReleasedDate], [ReturnedDate], [DisapproveRemarks]) VALUES (15, N'052541ed-d7a9-4bba-9abb-ad777db5512e', 5, N'101', CAST(N'2016-05-07T20:18:01.767' AS DateTime), CAST(N'2016-05-07T20:17:00.000' AS DateTime), N'2F XLAB 1FDG', NULL, N'Approved', CAST(N'2016-05-07T21:17:00.000' AS DateTime), 0, 0, NULL, NULL, N'')
SET IDENTITY_INSERT [dbo].[Reservation] OFF
SET IDENTITY_INSERT [dbo].[ReservationItem] ON 

INSERT [dbo].[ReservationItem] ([Id], [InventoryId], [Quantity], [Status], [ReservationId], [QuantityByGroup]) VALUES (38, 16, 15, NULL, 15, 5)
INSERT [dbo].[ReservationItem] ([Id], [InventoryId], [Quantity], [Status], [ReservationId], [QuantityByGroup]) VALUES (39, 17, 30, NULL, 15, 10)
INSERT [dbo].[ReservationItem] ([Id], [InventoryId], [Quantity], [Status], [ReservationId], [QuantityByGroup]) VALUES (40, 18, 90, NULL, 15, 30)
SET IDENTITY_INSERT [dbo].[ReservationItem] OFF
INSERT [dbo].[Roles] ([RoleId], [ApplicationId], [RoleName], [Description]) VALUES (N'f5fb215f-0820-4398-9412-24c492148a71', N'a33be911-3945-435c-b189-1affb0a669f0', N'Student', NULL)
INSERT [dbo].[Roles] ([RoleId], [ApplicationId], [RoleName], [Description]) VALUES (N'17db14a8-cb3c-45e5-9cd1-24dc4e7f12d7', N'a33be911-3945-435c-b189-1affb0a669f0', N'Instructor', NULL)
INSERT [dbo].[Roles] ([RoleId], [ApplicationId], [RoleName], [Description]) VALUES (N'10098dbe-b880-4f8d-be36-805c15dc5e6d', N'a33be911-3945-435c-b189-1affb0a669f0', N'Admin', NULL)
INSERT [dbo].[Roles] ([RoleId], [ApplicationId], [RoleName], [Description]) VALUES (N'eaa18504-9018-4b4e-913a-8cf8a84cc7e5', N'a33be911-3945-435c-b189-1affb0a669f0', N'CSR Head', NULL)
INSERT [dbo].[Roles] ([RoleId], [ApplicationId], [RoleName], [Description]) VALUES (N'50b9b51e-4009-4b95-b27c-9fd20e5c1a43', N'a33be911-3945-435c-b189-1affb0a669f0', N'Student Assistant', NULL)
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([Id], [Section]) VALUES (1, N'IDF - modified')
INSERT [dbo].[Section] ([Id], [Section]) VALUES (2, N'IAA')
INSERT [dbo].[Section] ([Id], [Section]) VALUES (3, N'IRCC')
INSERT [dbo].[Section] ([Id], [Section]) VALUES (4, N'IRCC - mods')
SET IDENTITY_INSERT [dbo].[Section] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([Id], [Code], [Name], [YearFrom], [YearTo], [Sem], [SectionId]) VALUES (5, N'Matlab', N'Mathematics Laboratory', 2015, 2016, N'First Sem', 1)
INSERT [dbo].[Subject] ([Id], [Code], [Name], [YearFrom], [YearTo], [Sem], [SectionId]) VALUES (6, N'PHY1', N'Physics 1 - Lecture', 2015, 2016, N'First Sem', 2)
INSERT [dbo].[Subject] ([Id], [Code], [Name], [YearFrom], [YearTo], [Sem], [SectionId]) VALUES (7, N'BLD1', N'Blood', 2015, 2016, N'First Sem', 3)
INSERT [dbo].[Subject] ([Id], [Code], [Name], [YearFrom], [YearTo], [Sem], [SectionId]) VALUES (8, N'SpaceX', N'Google SpaceX Inc.', 2015, 2016, N'First Sem', 3)
INSERT [dbo].[Subject] ([Id], [Code], [Name], [YearFrom], [YearTo], [Sem], [SectionId]) VALUES (9, N'MSFT', N'Microsoft Quantum X', 2015, 2016, N'First Sem', 2)
INSERT [dbo].[Subject] ([Id], [Code], [Name], [YearFrom], [YearTo], [Sem], [SectionId]) VALUES (10, N'MSFT', N'dasdas', 2015, 2016, N'First Sem', 1)
SET IDENTITY_INSERT [dbo].[Subject] OFF
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'1de53dd0-e335-46d3-8b32-04bb9d55c0c3', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-instructor2', 0, CAST(N'2016-04-06T12:08:55.937' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'df58da55-3e74-4819-bb77-2755c5164e59', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-student', 0, CAST(N'2016-02-25T23:54:34.420' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'54f45fe1-2bfc-46e5-a896-341eff5dbd76', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-admin', 0, CAST(N'2016-07-31T14:21:37.000' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'26fa01c2-7eb9-465d-ae89-3638479b60fe', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-csr', 0, CAST(N'2016-05-07T12:18:16.407' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'b77099c3-8113-4ee5-990f-44c63ba743db', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-student1', 0, CAST(N'2016-05-05T13:49:50.570' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'22a0f4f8-07e7-488a-9f8a-7b6e4576cd96', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-student5', 0, CAST(N'2016-03-30T12:28:07.477' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'7a27c0b3-43d4-4d80-8e2d-86cfe798d08a', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-student3', 0, CAST(N'2016-04-05T05:51:25.683' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'f6233d9d-5831-4d74-b3f8-8dddea972eca', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-instructor1', 0, CAST(N'2016-04-06T12:47:12.960' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'8ea224af-aa92-4fc0-af2b-9010dee3bf41', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-student2', 0, CAST(N'2016-04-18T06:34:11.107' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'8da709af-6186-41e0-b24d-93987d717dd6', N'a33be911-3945-435c-b189-1affb0a669f0', N'test1', 0, CAST(N'2016-05-05T16:36:31.383' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'3deecc83-a4f6-4509-8303-983b5e67749c', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-student7', 0, CAST(N'2016-04-04T09:20:40.347' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'052541ed-d7a9-4bba-9abb-ad777db5512e', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-instructor', 0, CAST(N'2016-05-07T13:17:10.997' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'dd84d6d4-ccc4-4007-9034-cfdcff98ca07', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-student8', 0, CAST(N'2016-04-06T06:55:43.257' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'98df1966-196d-4fc4-9414-d2efbc4b9679', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-student4', 0, CAST(N'2016-03-30T12:27:16.303' AS DateTime))
INSERT [dbo].[Users] ([UserId], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'68d5d06d-e113-4f7c-819d-dcfd429887aa', N'a33be911-3945-435c-b189-1affb0a669f0', N'test-student6', 0, CAST(N'2016-05-05T13:50:00.487' AS DateTime))
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'df58da55-3e74-4819-bb77-2755c5164e59', N'f5fb215f-0820-4398-9412-24c492148a71')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'b77099c3-8113-4ee5-990f-44c63ba743db', N'f5fb215f-0820-4398-9412-24c492148a71')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'22a0f4f8-07e7-488a-9f8a-7b6e4576cd96', N'f5fb215f-0820-4398-9412-24c492148a71')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'7a27c0b3-43d4-4d80-8e2d-86cfe798d08a', N'f5fb215f-0820-4398-9412-24c492148a71')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'8ea224af-aa92-4fc0-af2b-9010dee3bf41', N'f5fb215f-0820-4398-9412-24c492148a71')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'3deecc83-a4f6-4509-8303-983b5e67749c', N'f5fb215f-0820-4398-9412-24c492148a71')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'dd84d6d4-ccc4-4007-9034-cfdcff98ca07', N'f5fb215f-0820-4398-9412-24c492148a71')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'98df1966-196d-4fc4-9414-d2efbc4b9679', N'f5fb215f-0820-4398-9412-24c492148a71')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'68d5d06d-e113-4f7c-819d-dcfd429887aa', N'f5fb215f-0820-4398-9412-24c492148a71')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'1de53dd0-e335-46d3-8b32-04bb9d55c0c3', N'17db14a8-cb3c-45e5-9cd1-24dc4e7f12d7')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'f6233d9d-5831-4d74-b3f8-8dddea972eca', N'17db14a8-cb3c-45e5-9cd1-24dc4e7f12d7')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'052541ed-d7a9-4bba-9abb-ad777db5512e', N'17db14a8-cb3c-45e5-9cd1-24dc4e7f12d7')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'54f45fe1-2bfc-46e5-a896-341eff5dbd76', N'10098dbe-b880-4f8d-be36-805c15dc5e6d')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'26fa01c2-7eb9-465d-ae89-3638479b60fe', N'eaa18504-9018-4b4e-913a-8cf8a84cc7e5')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'8da709af-6186-41e0-b24d-93987d717dd6', N'50b9b51e-4009-4b95-b27c-9fd20e5c1a43')
/****** Object:  Index [IX_ApplicationId]    Script Date: 7/31/2016 10:53:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationId] ON [dbo].[Memberships]
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/31/2016 10:53:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Memberships]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/31/2016 10:53:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Profiles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApplicationId]    Script Date: 7/31/2016 10:53:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationId] ON [dbo].[Roles]
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_UserName]    Script Date: 7/31/2016 10:53:16 PM ******/
CREATE NONCLUSTERED INDEX [IDX_UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApplicationId]    Script Date: 7/31/2016 10:53:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationId] ON [dbo].[Users]
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 7/31/2016 10:53:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[UsersInRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 7/31/2016 10:53:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[UsersInRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reservation] ADD  DEFAULT (getdate()) FOR [DateRequested]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Reservation]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[GroupItem]  WITH CHECK ADD  CONSTRAINT [FK_GroupItem_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupItem] CHECK CONSTRAINT [FK_GroupItem_Group]
GO
ALTER TABLE [dbo].[GroupItem]  WITH CHECK ADD  CONSTRAINT [FK_GroupItem_Inventory] FOREIGN KEY([InventoryId])
REFERENCES [dbo].[Inventory] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupItem] CHECK CONSTRAINT [FK_GroupItem_Inventory]
GO
ALTER TABLE [dbo].[GroupMember]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupMember_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_Group]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Item]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemBrand] FOREIGN KEY([ItemBrandId])
REFERENCES [dbo].[ItemBrand] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemBrand]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemCategory] FOREIGN KEY([ItemCategoryId])
REFERENCES [dbo].[ItemCategory] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemCategory]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Memberships_dbo.Applications_ApplicationId] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [FK_dbo.Memberships_dbo.Applications_ApplicationId]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Memberships_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [FK_dbo.Memberships_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Profiles_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [FK_dbo.Profiles_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Reservation]  WITH NOCHECK ADD  CONSTRAINT [FK_Reservation_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Subject]
GO
ALTER TABLE [dbo].[ReservationItem]  WITH CHECK ADD  CONSTRAINT [FK_ReservationItem_Inventory] FOREIGN KEY([InventoryId])
REFERENCES [dbo].[Inventory] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservationItem] CHECK CONSTRAINT [FK_ReservationItem_Inventory]
GO
ALTER TABLE [dbo].[ReservationItem]  WITH CHECK ADD  CONSTRAINT [FK_ReservationItem_Reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReservationItem] CHECK CONSTRAINT [FK_ReservationItem_Reservation]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Roles_dbo.Applications_ApplicationId] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_dbo.Roles_dbo.Applications_ApplicationId]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([Id])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Section]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Applications_ApplicationId] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Applications_ApplicationId]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UsersInRoles_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [FK_dbo.UsersInRoles_dbo.Roles_RoleId]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UsersInRoles_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [FK_dbo.UsersInRoles_dbo.Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [aspnet-UBCSR-20160203174442] SET  READ_WRITE 
GO
