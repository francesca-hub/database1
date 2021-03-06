USE [master]
GO
/****** Object:  Database [Scuola]    Script Date: 13/05/2021 15:54:47 ******/
CREATE DATABASE [Scuola]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Scuola', FILENAME = N'C:\Users\fradi\Scuola.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Scuola_log', FILENAME = N'C:\Users\fradi\Scuola_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Scuola] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Scuola].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Scuola] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Scuola] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Scuola] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Scuola] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Scuola] SET ARITHABORT OFF 
GO
ALTER DATABASE [Scuola] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Scuola] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Scuola] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Scuola] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Scuola] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Scuola] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Scuola] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Scuola] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Scuola] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Scuola] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Scuola] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Scuola] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Scuola] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Scuola] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Scuola] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Scuola] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Scuola] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Scuola] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Scuola] SET  MULTI_USER 
GO
ALTER DATABASE [Scuola] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Scuola] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Scuola] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Scuola] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Scuola] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Scuola] SET QUERY_STORE = OFF
GO
USE [Scuola]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Scuola]
GO
/****** Object:  Table [dbo].[cattedre]    Script Date: 13/05/2021 15:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cattedre](
	[IdCattedra] [int] IDENTITY(1,1) NOT NULL,
	[IdDocente] [int] NOT NULL,
	[IdClasse] [int] NOT NULL,
 CONSTRAINT [PK_cattedre] PRIMARY KEY CLUSTERED 
(
	[IdCattedra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classi]    Script Date: 13/05/2021 15:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classi](
	[IdClasse] [int] IDENTITY(1,1) NOT NULL,
	[sezione] [nchar](1) NOT NULL,
	[classe] [int] NOT NULL,
 CONSTRAINT [PK_classi] PRIMARY KEY CLUSTERED 
(
	[IdClasse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[docenti]    Script Date: 13/05/2021 15:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docenti](
	[IdDocente] [int] NOT NULL,
	[Titolostudio] [nvarchar](30) NULL,
 CONSTRAINT [PK_docenti] PRIMARY KEY CLUSTERED 
(
	[IdDocente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persone]    Script Date: 13/05/2021 15:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persone](
	[IdPersona] [int] NOT NULL,
	[nome] [nchar](30) NOT NULL,
	[cognome] [nchar](30) NOT NULL,
	[datanascita] [date] NOT NULL,
 CONSTRAINT [PK_persone] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studenti]    Script Date: 13/05/2021 15:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studenti](
	[IdStudenti] [int] NOT NULL,
	[IdClasse] [int] NOT NULL,
 CONSTRAINT [PK_studenti] PRIMARY KEY CLUSTERED 
(
	[IdStudenti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cattedre]  WITH CHECK ADD  CONSTRAINT [FK_cattedre_classi] FOREIGN KEY([IdClasse])
REFERENCES [dbo].[classi] ([IdClasse])
GO
ALTER TABLE [dbo].[cattedre] CHECK CONSTRAINT [FK_cattedre_classi]
GO
ALTER TABLE [dbo].[cattedre]  WITH CHECK ADD  CONSTRAINT [FK_cattedre_docenti] FOREIGN KEY([IdDocente])
REFERENCES [dbo].[docenti] ([IdDocente])
GO
ALTER TABLE [dbo].[cattedre] CHECK CONSTRAINT [FK_cattedre_docenti]
GO
ALTER TABLE [dbo].[docenti]  WITH CHECK ADD  CONSTRAINT [FK_docenti_persone] FOREIGN KEY([IdDocente])
REFERENCES [dbo].[persone] ([IdPersona])
GO
ALTER TABLE [dbo].[docenti] CHECK CONSTRAINT [FK_docenti_persone]
GO
ALTER TABLE [dbo].[persone]  WITH CHECK ADD  CONSTRAINT [FK_persone_studenti] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[studenti] ([IdStudenti])
GO
ALTER TABLE [dbo].[persone] CHECK CONSTRAINT [FK_persone_studenti]
GO
ALTER TABLE [dbo].[studenti]  WITH CHECK ADD  CONSTRAINT [FK_studenti_classi] FOREIGN KEY([IdClasse])
REFERENCES [dbo].[classi] ([IdClasse])
GO
ALTER TABLE [dbo].[studenti] CHECK CONSTRAINT [FK_studenti_classi]
GO
/****** Object:  StoredProcedure [dbo].[InserimentoDocente]    Script Date: 13/05/2021 15:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InserimentoDocente]
	-- Add the parameters for the stored procedure here
	@nome nchar(30),
	@cognome nchar(30),
	@dataNascita date,
	@titolostudio nvarchar (30)=null 
AS
BEGIN
	insert into persone (nome, cognome, datanascita) values (@nome, @cognome, @dataNascita)
	insert into docenti (idDocente, titolostudio) values (@@IDENTITY, @titolostudio)

END
GO
USE [master]
GO
ALTER DATABASE [Scuola] SET  READ_WRITE 
GO
