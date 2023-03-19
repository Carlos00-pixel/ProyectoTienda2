USE [master]
GO
/****** Object:  Database [PROYECTO_TIENDA]    Script Date: 19/03/2023 1:24:39 ******/
CREATE DATABASE [PROYECTO_TIENDA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROYECTO_TIENDA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PROYECTO_TIENDA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PROYECTO_TIENDA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PROYECTO_TIENDA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PROYECTO_TIENDA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROYECTO_TIENDA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROYECTO_TIENDA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET  MULTI_USER 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROYECTO_TIENDA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PROYECTO_TIENDA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PROYECTO_TIENDA] SET QUERY_STORE = OFF
GO
USE [PROYECTO_TIENDA]
GO
/****** Object:  Table [dbo].[Artista]    Script Date: 19/03/2023 1:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artista](
	[IdArtista] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Nick] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](700) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [varbinary](max) NULL,
	[Salt] [nvarchar](50) NULL,
	[Imagen] [nvarchar](400) NULL,
 CONSTRAINT [PK_Artista] PRIMARY KEY CLUSTERED 
(
	[IdArtista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Arte]    Script Date: 19/03/2023 1:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Arte](
	[IdInfoArte] [int] NOT NULL,
	[Titulo] [nvarchar](50) NULL,
	[Precio] [int] NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Imagen] [nvarchar](700) NULL,
	[IdArtista] [int] NULL,
 CONSTRAINT [PK_Info_Arte] PRIMARY KEY CLUSTERED 
(
	[IdInfoArte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[INFO_PRODUCTOS]    Script Date: 19/03/2023 1:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[INFO_PRODUCTOS]
AS
	SELECT ISNULL(IA.IdInfoArte, 0) AS IdInfoArte, IA.Titulo, IA.Precio, IA.Imagen, IA.Descripcion, A.IdArtista, A.Nick
	FROM Info_Arte IA
	INNER JOIN Artista A
	ON IA.IdArtista = A.IdArtista
GO
/****** Object:  Table [dbo].[Chat]    Script Date: 19/03/2023 1:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[IdChat] [int] NOT NULL,
	[Mensajes] [nvarchar](500) NULL,
	[IdReceptor] [int] NULL,
	[IdSubscriptor] [int] NULL,
	[Fecha_Hora] [date] NULL,
	[IdArtista] [int] NULL,
	[IdCliente] [int] NULL,
 CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED 
(
	[IdChat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 19/03/2023 1:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [varbinary](max) NULL,
	[Salt] [nvarchar](50) NULL,
	[Imagen] [nvarchar](400) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaccion]    Script Date: 19/03/2023 1:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaccion](
	[IdTransaccion] [int] NOT NULL,
	[Fecha_Transaccion] [date] NULL,
	[Precio_Compra] [int] NULL,
	[Precio_Venta] [int] NULL,
	[IdCliente] [int] NULL,
	[IdInfoArte] [int] NULL,
 CONSTRAINT [PK_Transaccion] PRIMARY KEY CLUSTERED 
(
	[IdTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Valoraciones]    Script Date: 19/03/2023 1:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valoraciones](
	[IdValoraciones] [int] NOT NULL,
	[Puntuacion] [int] NULL,
	[IdCliente] [int] NULL,
	[IdArtista] [int] NULL,
 CONSTRAINT [PK_Valoraciones] PRIMARY KEY CLUSTERED 
(
	[IdValoraciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Artista] ([IdArtista], [Nombre], [Apellidos], [Nick], [Descripcion], [Email], [Password], [Salt], [Imagen]) VALUES (1, N'Gabriel', N'Picolo', N'_picolo', N'Artista
• 🇧🇷 brazilian comic artist', N'gabrielpicolo@gmail.com', 0x31003200330034003500, NULL, NULL)
INSERT [dbo].[Artista] ([IdArtista], [Nombre], [Apellidos], [Nick], [Descripcion], [Email], [Password], [Salt], [Imagen]) VALUES (2, N'Laia', N'Lopez', N'itslopez', N'Artista
Barcelona, Spain
• illustration, ch.design
• inquiries: 📩 itslopezillustrations@gmail.com
• Rep’d by Britt Siess Creative Management', N'itslopezillustrations@gmail.com', 0x31003200330034003500, NULL, NULL)
INSERT [dbo].[Artista] ([IdArtista], [Nombre], [Apellidos], [Nick], [Descripcion], [Email], [Password], [Salt], [Imagen]) VALUES (3, N'Zune', NULL, N'creandoinfinito', N'Artista
¡Soy Zune! Hago ilustración. También me gusta el modelar con plastilina. Me gustan los retos, los colores locos y probar cosas nuevas.                                 ', N'creandoinfinito@gmail.com', 0x904D4C8B9E5ADD899A57D788A4FC33F2AB1EAECE3FD11673703B12E3DE897FE447F122DDC20E5E4D0C9DC43A003BD2FBFF1CCD069F2814C2D7DA1A10E4AC751F, N'Èì=týC
MxM[ðY Z?´¼«æ¸ÂZYåÀ+&½À1ü=', N'https://ksr-ugc.imgix.net/assets/039/254/628/b9c47e7474b8b810ea97ecd4d7bad9bc_original.png?ixlib=rb-4.0.2&w=80&h=80&fit=crop&v=1678360852&auto=format&frame=1&q=92&s=71d1c160c16638bd334366cd0c1efbe3')
GO
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Email], [Password], [Salt], [Imagen]) VALUES (1, NULL, NULL, NULL, 0xD04CFADAB37F5A5880927C1158D031CE7F62C1D8D261A9F2CFA42E875AFBEB520968EA02991658167A0670694E004AFE435A95464D0E5E1F62AE6416A907CD3F, N'^mØµ£5SHQ»Uñ,Uî
DZ£!y`ë³Æfúí_''ðz#4BµU¼', NULL)
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Email], [Password], [Salt], [Imagen]) VALUES (2, N'Ejemplo', N'Prueba Prueba', N'ejemploprueba@gmail.com', 0x391AAC97930CF1D81DA00F4F1F3FE08E80B23278990B9880F0507003021A6AF50A5B19D7B2AA3E9605DC70BF416061142DDCBE5E8ADE1EEBCE3F2207BDBFFA56, N'rJ*ÎFDøÎÔ}''ÔöWý®®ÐÌ½ZDyI>öAê¸2¿|{­é(w@', N'https://ceslava.s3-accelerate.amazonaws.com/2016/04/mistery-man-gravatar-wordpress-avatar-persona-misteriosa-510x510.png')
GO
INSERT [dbo].[Info_Arte] ([IdInfoArte], [Titulo], [Precio], [Descripcion], [Imagen], [IdArtista]) VALUES (1, N'Summer 1999', 35, N'Giclee print

16 x 15 inches

﻿Hand-numbered limited edition of 100

Ships in 2 - 3 weeks', N'https://cdn.shopify.com/s/files/1/0230/6428/1166/products/digi-2_540x.jpg?v=1564779773', 1)
INSERT [dbo].[Info_Arte] ([IdInfoArte], [Titulo], [Precio], [Descripcion], [Imagen], [IdArtista]) VALUES (2, N'Get Jinx', 6, N'Jinx de Arcane', N'https://i.pinimg.com/originals/e7/6f/94/e76f944701bc1026dfe0473e68e72a47.jpg', 2)
INSERT [dbo].[Info_Arte] ([IdInfoArte], [Titulo], [Precio], [Descripcion], [Imagen], [IdArtista]) VALUES (3, N'Jim Hawkins', 17, N'Jim Hawkins from Treasure Planet', N'https://pbs.twimg.com/media/Fi058moXEAMPnJJ?format=jpg&name=large', 1)
INSERT [dbo].[Info_Arte] ([IdInfoArte], [Titulo], [Precio], [Descripcion], [Imagen], [IdArtista]) VALUES (4, N'Beast Boy & Pets', 30, N'Giclee print

13 x 11 inches

Open edition', N'https://cdn.shopify.com/s/files/1/0230/6428/1166/products/beastboy-shadow_540x.jpg?v=1557848357', 1)
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Artista] FOREIGN KEY([IdArtista])
REFERENCES [dbo].[Artista] ([IdArtista])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_Artista]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_Cliente]
GO
ALTER TABLE [dbo].[Info_Arte]  WITH CHECK ADD  CONSTRAINT [FK_Info_Arte_Artista] FOREIGN KEY([IdArtista])
REFERENCES [dbo].[Artista] ([IdArtista])
GO
ALTER TABLE [dbo].[Info_Arte] CHECK CONSTRAINT [FK_Info_Arte_Artista]
GO
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_Transaccion_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_Transaccion_Cliente]
GO
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_Transaccion_Info_Arte] FOREIGN KEY([IdInfoArte])
REFERENCES [dbo].[Info_Arte] ([IdInfoArte])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_Transaccion_Info_Arte]
GO
ALTER TABLE [dbo].[Valoraciones]  WITH CHECK ADD  CONSTRAINT [FK_Valoraciones_Artista] FOREIGN KEY([IdArtista])
REFERENCES [dbo].[Artista] ([IdArtista])
GO
ALTER TABLE [dbo].[Valoraciones] CHECK CONSTRAINT [FK_Valoraciones_Artista]
GO
ALTER TABLE [dbo].[Valoraciones]  WITH CHECK ADD  CONSTRAINT [FK_Valoraciones_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Valoraciones] CHECK CONSTRAINT [FK_Valoraciones_Cliente]
GO
USE [master]
GO
ALTER DATABASE [PROYECTO_TIENDA] SET  READ_WRITE 
GO
