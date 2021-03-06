USE [Pruebas24_10]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 24/10/2021 04:12:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [varchar](15) NULL,
	[Titulo] [varchar](50) NOT NULL,
	[codEditorial] [varchar](5) NULL,
	[añoEdicion] [varchar](4) NULL,
	[lugarEdicion] [varchar](50) NULL,
	[numeroEdicion] [smallint] NULL,
	[Copias] [int] NOT NULL,
	[Disponibilidad] [bit] NOT NULL,
	[ImagenLibro] [text] NULL,
	[SolicitudesRenta] [int] NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[LibrosPopulares_4]    Script Date: 24/10/2021 04:12:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[LibrosPopulares_4]
As
	SELECT TOP (4) Codigo, Titulo, Descripcion, ImagenLibro As Imagen From Libro Order By SolicitudesRenta Desc
GO
/****** Object:  Table [dbo].[Tema]    Script Date: 24/10/2021 04:12:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tema](
	[Codigo] [varchar](5) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ShowAllTopics]    Script Date: 24/10/2021 04:12:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[ShowAllTopics]
As	
	Select * From Tema
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 24/10/2021 04:12:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NULL,
	[paisNacimiento] [varchar](50) NULL,
	[ciudadNacimiento] [varchar](50) NULL,
	[comentarios] [text] NULL,
	[foto] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutoresLibro]    Script Date: 24/10/2021 04:12:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoresLibro](
	[codLibro] [int] NOT NULL,
	[codAutor] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 24/10/2021 04:12:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[TipoOperacion] [varchar](50) NULL,
	[Descripcion] [text] NULL,
	[Fecha] [smalldatetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 24/10/2021 04:12:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[Codigo] [varchar](5) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Telefono] [varchar](10) NULL,
	[Correo] [varchar](50) NULL,
	[Direccion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibrosPrestamos]    Script Date: 24/10/2021 04:12:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibrosPrestamos](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[codLibro] [int] NOT NULL,
	[codPrestamo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamos]    Script Date: 24/10/2021 04:12:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamos](
	[NumeroPedido] [int] IDENTITY(1,1) NOT NULL,
	[codigoUsuario] [int] NOT NULL,
	[FechaSalida] [smalldatetime] NOT NULL,
	[FechaMaxima] [smalldatetime] NOT NULL,
	[FechaDevolucion] [smalldatetime] NOT NULL,
	[estadoPrestamo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TemaLibro]    Script Date: 24/10/2021 04:12:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemaLibro](
	[codLibro] [int] NULL,
	[codTema] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 24/10/2021 04:12:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NULL,
	[Correo] [varchar](255) NOT NULL,
	[Contraseña] [varchar](max) NOT NULL,
	[TipoUsuario] [varchar](50) NOT NULL,
	[EntFed] [varchar](50) NULL,
	[Genero] [varchar](20) NULL,
	[Domicilio] [text] NULL,
	[Situacion] [varchar](50) NOT NULL,
	[Pic] [text] NULL,
	[FechaNac] [date] NULL,
 CONSTRAINT [PK__Usuarios__06370DAD3A478737] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Arquitectura de Computadoras con el codigo ARQPC', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Romance con el codigo ROM', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Matematicas con el codigo MAT', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Ciencia Fición con el codigo CIFI', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Historia con el codigo HIS', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Biologia con el codigo BIO', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Fisica con el codigo FIS', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Quimica con el codigo QUI', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Tecnologia con el codigo TECH', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Politica con el codigo POL', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Finanzas con el codigo FIN', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Psicologia con el codigo PSI', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Contabilidad con el codigo CONT', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero la editorial Jus con el codigo 97254', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero la editorial Grijalbo con el codigo 14374', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero la editorial Lumen con el codigo 98697', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero la editorial Salamandra con el codigo 76453', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero la editorial Planeta con el codigo 23564', CAST(N'2021-10-23T17:44:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario First Name con el codigo 1', CAST(N'2021-10-23T18:14:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario First Name con el codigo 2', CAST(N'2021-10-23T18:16:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario First Name con el codigo 3', CAST(N'2021-10-23T18:19:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario First Name con el codigo 6', CAST(N'2021-10-23T18:24:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario First Name con el codigo 7', CAST(N'2021-10-23T18:25:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario First Name con el codigo 8', CAST(N'2021-10-23T18:26:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario First Name con el codigo 9', CAST(N'2021-10-23T18:26:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario First Name con el codigo 10', CAST(N'2021-10-23T20:02:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario Victor con el codigo 11', CAST(N'2021-10-23T23:47:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario Victor Hugo con el codigo 12', CAST(N'2021-10-23T23:56:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario Victor Hugo con el codigo 13', CAST(N'2021-10-23T23:56:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario First Name con el codigo 4', CAST(N'2021-10-23T18:19:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario First Name con el codigo 5', CAST(N'2021-10-23T18:20:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario Victor Hugo con el codigo 14', CAST(N'2021-10-24T00:06:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario Victor Hugo con el codigo 15', CAST(N'2021-10-24T00:12:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario First Name con el codigo 1', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario Victor Hugo con el codigo 16', CAST(N'2021-10-24T01:19:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-24T10:45:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-24T10:46:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-24T10:47:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T10:48:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T10:49:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T10:55:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-24T10:55:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T10:57:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-24T10:57:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T10:58:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-24T10:58:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Pepito ha iniciado sesion', CAST(N'2021-10-24T11:00:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-24T11:01:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:01:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:36:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T12:00:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T12:19:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T12:22:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T12:30:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T12:57:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T13:49:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T13:51:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Calculo 1 con el codigo CAL1', CAST(N'2021-10-24T13:52:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T13:58:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Cálculo 3 con el codigo CAL3', CAST(N'2021-10-24T13:59:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T14:01:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T14:02:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T14:24:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T14:26:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T14:29:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos del tema Calculo 2=> Cálculo 2 con el codigo CAL2=> CAL2', CAST(N'2021-10-24T15:10:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario First Name con el codigo 2', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario First Name con el codigo 3', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario First Name con el codigo 4', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario First Name con el codigo 5', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario First Name con el codigo 6', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario First Name con el codigo 7', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario First Name con el codigo 8', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario First Name con el codigo 9', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario First Name con el codigo 10', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario Victor con el codigo 11', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario Victor Hugo con el codigo 12', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario Victor Hugo con el codigo 13', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario Victor Hugo con el codigo 14', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino al usuario Victor Hugo con el codigo 15', CAST(N'2021-10-24T01:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T02:01:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-24T02:01:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:09:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T12:24:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T12:25:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T14:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario Pepito con el codigo 18', CAST(N'2021-10-24T11:00:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T15:00:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T15:01:00' AS SmallDateTime))
GO
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T15:02:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:22:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:25:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:26:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:38:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:40:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:41:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:42:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:43:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T11:48:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T12:38:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-24T13:55:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T13:55:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Calculo 2 con el codigo CAL2', CAST(N'2021-10-24T13:56:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T14:48:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T14:52:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T14:57:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T15:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos del tema Cálculo 2=> Cálculo 2 con el codigo CAL2=> CAL2', CAST(N'2021-10-24T15:05:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T15:06:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos del tema Cálculo 2=> Cálculo 2 con el codigo CAL2=> CAL2', CAST(N'2021-10-24T15:06:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T15:08:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos del tema Cálculo 2=> Cálculo 2 con el codigo CAL2=> CAL2', CAST(N'2021-10-24T15:08:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos del tema cálculo 2=> cálculo 2 con el codigo CAL2=> CAL2', CAST(N'2021-10-24T15:11:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos del tema Cálculo 2=> Cálculo 2 con el codigo CAL2=> CAL2', CAST(N'2021-10-24T15:11:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T15:12:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-24T15:13:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T15:14:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T15:16:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T15:17:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-24T15:18:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos del tema Cálculo 1=> Cálculo 1 con el codigo CAL1=> CAL1', CAST(N'2021-10-24T15:18:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos del tema Cálculo 1=> Cálculo 1 con el codigo CAL1=> CAL1', CAST(N'2021-10-24T15:19:00' AS SmallDateTime))
GO
INSERT [dbo].[Editorial] ([Codigo], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (N'14374', N'Grijalbo', N'8725367496', N'GrijalboEdit@gmail.com', N'Renacimiento 180 Col. San Juan Tlihuaca')
INSERT [dbo].[Editorial] ([Codigo], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (N'23564', N'Planeta', N'8725630429', N'PlanetLib@Outlook.es', N'Av. Miguel Ángel de Quevedo 906,')
INSERT [dbo].[Editorial] ([Codigo], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (N'76453', N'Salamandra', N'8715264820', N'GrupoSalamandra@hotmail.com', N'Abasola 40 Col. Santa Úrsula Coapa')
INSERT [dbo].[Editorial] ([Codigo], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (N'97254', N'Jus', N'8712570394', N'JusEditorial@hotmail.com', N'Priv. de Ceylán 22 Col. Industrial Vallejo')
INSERT [dbo].[Editorial] ([Codigo], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (N'98697', N'Lumen', N'8700446582', N'Lumeen@gmail.com', N'Av. Juárez 20 Cuauhtémoc')
GO
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'ARQPC', N'Arquitectura de Computadoras')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'BIO', N'Biologia')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'CAL1', N'Calculo 1')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'CAL2', N'Cálculo 2')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'CAL3', N'Cálculo 3')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'CIFI', N'Ciencia Fición')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'CONT', N'Contabilidad')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'FIN', N'Finanzas')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'FIS', N'Fisica')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'HIS', N'Historia')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'MAT', N'Matematicas')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'POL', N'Politica')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'PSI', N'Psicologia')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'QUI', N'Quimica')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'ROM', N'Romance')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'TECH', N'Tecnologia')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Codigo], [Nombre], [Apellidos], [Correo], [Contraseña], [TipoUsuario], [EntFed], [Genero], [Domicilio], [Situacion], [Pic], [FechaNac]) VALUES (16, N'Victor Hugo', N'Carreon Pulido', N'hv_carreon@hotmail.com', N'6Afx/PgtEy+bsBjKZzihnw==', N'Master', NULL, NULL, NULL, N'En Orden', NULL, NULL)
INSERT [dbo].[Usuarios] ([Codigo], [Nombre], [Apellidos], [Correo], [Contraseña], [TipoUsuario], [EntFed], [Genero], [Domicilio], [Situacion], [Pic], [FechaNac]) VALUES (18, N'Pepito', N'Perez', N'pepito@gmail.com', N'JfnnlDI7RTiF9RgfG2JNCw==', N'User', NULL, NULL, NULL, N'En Orden', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[AutoresLibro]  WITH CHECK ADD FOREIGN KEY([codAutor])
REFERENCES [dbo].[Autor] ([Codigo])
GO
ALTER TABLE [dbo].[AutoresLibro]  WITH CHECK ADD FOREIGN KEY([codLibro])
REFERENCES [dbo].[Libro] ([Codigo])
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD FOREIGN KEY([codEditorial])
REFERENCES [dbo].[Editorial] ([Codigo])
GO
ALTER TABLE [dbo].[LibrosPrestamos]  WITH CHECK ADD FOREIGN KEY([codLibro])
REFERENCES [dbo].[Libro] ([Codigo])
GO
ALTER TABLE [dbo].[LibrosPrestamos]  WITH CHECK ADD FOREIGN KEY([codPrestamo])
REFERENCES [dbo].[Prestamos] ([NumeroPedido])
GO
ALTER TABLE [dbo].[Prestamos]  WITH CHECK ADD  CONSTRAINT [FK__Prestamos__codig__37A5467C] FOREIGN KEY([codigoUsuario])
REFERENCES [dbo].[Usuarios] ([Codigo])
GO
ALTER TABLE [dbo].[Prestamos] CHECK CONSTRAINT [FK__Prestamos__codig__37A5467C]
GO
ALTER TABLE [dbo].[TemaLibro]  WITH CHECK ADD  CONSTRAINT [FK__TemaLibro__codLi__34C8D9D1] FOREIGN KEY([codLibro])
REFERENCES [dbo].[Libro] ([Codigo])
GO
ALTER TABLE [dbo].[TemaLibro] CHECK CONSTRAINT [FK__TemaLibro__codLi__34C8D9D1]
GO
ALTER TABLE [dbo].[TemaLibro]  WITH CHECK ADD  CONSTRAINT [FK__TemaLibro__codTe__35BCFE0A] FOREIGN KEY([codTema])
REFERENCES [dbo].[Tema] ([Codigo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TemaLibro] CHECK CONSTRAINT [FK__TemaLibro__codTe__35BCFE0A]
GO
/****** Object:  StoredProcedure [dbo].[AddEditorial]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		Create Procedure [dbo].[AddEditorial](
			@Codigo varchar(5),
			@Nombre varchar(50),
			@Telefono varchar(10),
			@Correo varchar(50),
			@Direccion text
		)
		As 
			Begin
				Begin Try
					Begin Transaction
					Insert Into Editorial (Codigo, Nombre, Telefono, Correo, Direccion) Values (@Codigo, @Nombre, @Telefono, @Correo, @Direccion)
					print('La editorial fue registrada correctamente')
					Commit Transaction
					Return 1
				End Try

				Begin Catch
					print('No se pudo registrar ala editorial')
					RollBack Transaction
					Return 0
				End Catch
			End
GO
/****** Object:  StoredProcedure [dbo].[AddTema]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE Procedure [dbo].[AddTema](
			@Codigo varchar(5),
			@Descripcion varchar(50)
		)
		As 
			Begin
				Declare @ret bit;
				Begin Try
					Begin Transaction
					Insert Into Tema (Codigo, Descripcion) Values (@Codigo, @Descripcion)
					print('El tema fue registrado correctamente')
					Commit Transaction
					Set @ret = 1;
					Return @ret
				End Try

				Begin Catch
					print('No se pudo registrar el tema')
					RollBack Transaction
					Set @ret = 0;
					Return @ret
				End Catch
			End
GO
/****** Object:  StoredProcedure [dbo].[ChangeLevel]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ChangeLevel](
			@Codigo int,
			@Permiso varchar(50)
		)
		As
			Begin
				Begin Try
					Begin Transaction
					Update Usuarios Set TipoUsuario = @Permiso Where Codigo = @Codigo;
					Declare @desc varchar(max) = Concat('Se han modificado los permisos del usuario ', (Select Nombre From Usuarios Where Codigo = @Codigo), ' nuevo permiso => ', @Permiso);
					Exec InsertBitacora 'Update Authorization', @desc
					print('Los permisos del usuario han sido actualizados')
					Commit Transaction
					Return 1
				End Try

				Begin Catch
					print('No se pudieron actualizar los permisos del usuario')
					RollBack Transaction
					Return 0
				End Catch
			End
GO
/****** Object:  StoredProcedure [dbo].[InsertarTemaLibro]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[InsertarTemaLibro]
	@codLibro int,
	@codTema varchar(5)
AS
	Begin
		Begin Try
			Begin Transaction
			Insert Into TemaLibro (codLibro, codTema) Values (@codLibro, @codTema)
			print('Sucessfull Insertion')
			Commit Transaction
		End Try

		Begin Catch
			print('No se pudo registrar el libro')
			RollBack Transaction
		End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[InsertBitacora]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[InsertBitacora](
			@TipoOperacion varchar(20),
			@Descripcion text
		)
		As
			Begin
				Begin Try
					Begin Transaction
					Insert Into Bitacora (TipoOperacion, Descripcion, Fecha) Values (@TipoOperacion, @Descripcion,  getdate())
					Commit Transaction
				End Try

				Begin Catch
					Rollback Transaction
				End Catch
			End
GO
/****** Object:  StoredProcedure [dbo].[Loggeo]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Loggeo](
	@Correo varchar(255),
	@Contraseña varchar(50),
	@level varchar(Max) output
)
As 
	Begin
		Begin Try
			Begin Transaction
			Set @level = (Select TipoUsuario From Usuarios Where Correo = @Correo And Contraseña = @Contraseña);
			Declare @Desc varchar(max) = Concat('El usuario ', (Select Nombre from Usuarios Where Correo = @Correo and Contraseña = @Contraseña), ' ha iniciado sesion')
			Exec InsertBitacora 'Login', @Desc
			Commit Transaction
		End Try

		Begin Catch
			print('No se encontraron las credenciales en la base de datos')
			RollBack Transaction
		End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[NewUser]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[NewUser](
			@Nombre varchar(50),
			@Apellidos varchar(50),
			@Correo varchar(255),
			@Contraseña varchar(50)
		)
		As
			Begin
				Declare @ret bit;
				Begin Try
					Begin Transaction
					Insert Into Usuarios (Nombre, Apellidos, Correo, Contraseña, Situacion, TipoUsuario) Values (@Nombre, @Apellidos, @Correo, @Contraseña, 'En Orden', 'User')
					print('El usuario fue registrado exitosamente')
					Commit Transaction
					Set @ret = 1
					Return @ret
				End Try

				Begin Catch
					print('No se pudo registrar al usuario')
					RollBack Transaction
					Set @ret = 0
					Return @ret
				End Catch
			End
GO
/****** Object:  StoredProcedure [dbo].[UpdateTema]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UpdateTema](
		@oldCode varchar(5),
		@oldDesc varchar(50),
		@newCode varchar(5),
		@newDesc varchar(50)
)
As
	Begin
		Declare @ret bit;
		Begin Try
			Begin Transaction
			Update Tema Set Codigo = @newCode, Descripcion = @newDesc Where Codigo = @oldCode And Descripcion = @oldDesc
			Declare @desc varchar(max) = Concat('Se han cambiado los datos del tema ', @oldDesc, '=> ', @newDesc, ' con el codigo ', @oldCode, '=> ', @newCode);
			Exec InsertBitacora 'Update', @desc
			print('Los datos del tema se han actualizado correctamente')
			Commit Transaction
			Set @ret = 1
			Return @ret
		End Try

		Begin Catch
			print('No se pudieron actualizar los datos del tema')
			RollBack Transaction
			Set @ret = 0
			Return @ret
		End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UpdateUser](
			@Codigo int,
			@Nombre varchar(50),
			@Apellidos varchar(50),
			@Correo varchar(255),
			@Contraseña varchar(50),
			@Entfed varchar(50),
			@Genero varchar(20),
			@Domicilio varchar(max),
			@ImagenUsuario varchar(max)
		)
		As
			Begin
				Begin Try
					Begin Transaction
					Update Usuarios Set Nombre = @Nombre, Apellidos = @Apellidos, Correo = @Correo, Contraseña = @Contraseña, EntFed = @EntFed, Genero = @Genero, Domicilio = @Domicilio, Pic = @ImagenUsuario Where Codigo = @Codigo
					Declare @desc varchar(max) = Concat('Se han modificado los datos del usuario ', (Select Nombre From Usuarios Where Codigo = @Codigo));
					Exec InsertBitacora 'Update', @desc
					print('El usuario fue acutualizado exitosamente')
					Commit Transaction
					Return 1
				End Try

				Begin Catch
					print('No se pudo actualizar al usuario')
					RollBack Transaction
					Return 0
				End Catch
			End
GO
/****** Object:  Trigger [dbo].[DelEditorial]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Trigger [dbo].[DelEditorial] on [dbo].[Editorial]
		For Delete
		as
			Begin
				Begin Try
					Begin Transaction
					Declare @tipoOperacion varchar(20) = 'Delete', @descripcion varchar(max);
					Begin
					Set @descripcion = Concat('Se elimino la editorial ', (Select Nombre from deleted), ' con el codigo ', (Select Codigo from deleted))
					Exec InsertBitacora @tipoOperacion, @descripcion
					print('done')
					End
					Commit Transaction
				End Try

				Begin Catch
					Rollback Transaction
				End Catch
			End
GO
ALTER TABLE [dbo].[Editorial] ENABLE TRIGGER [DelEditorial]
GO
/****** Object:  Trigger [dbo].[RegNewEditorial]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		Create Trigger [dbo].[RegNewEditorial] on [dbo].[Editorial]
		For insert
		as
			Begin
				Begin Try
					Begin Transaction
					Declare @tipoOperacion varchar(20) = 'Insert', @descripcion varchar(max);
					Begin
					Set @descripcion = Concat('Se agrero la editorial ', (Select Nombre from inserted), ' con el codigo ', (Select Codigo from inserted))
					Exec InsertBitacora @tipoOperacion, @descripcion
					print('done')
					End
					Commit Transaction
				End Try

				Begin Catch
					Rollback Transaction
				End Catch
			End
GO
ALTER TABLE [dbo].[Editorial] ENABLE TRIGGER [RegNewEditorial]
GO
/****** Object:  Trigger [dbo].[DelTema]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Trigger [dbo].[DelTema] on [dbo].[Tema]
		Instead of Delete
		as
			Begin
				Begin Try
					Begin Transaction
					Update TemaLibro Set codTema = Null Where codTema = (Select Codigo from deleted)
					Declare @tipoOperacion varchar(20) = 'Delete', @descripcion varchar(max);
					Begin
						Set @descripcion = Concat('Se elimino el tema ', (Select Descripcion From deleted), ' con el codigo ', (Select Codigo from deleted))
						Exec InsertBitacora @tipoOperacion, @descripcion
						print('done')
					End
					Commit Transaction
				End Try

				Begin Catch
					Declare @error varchar(max) = (Select ERROR_MESSAGE())
					print (@error)
					Rollback Transaction
				End Catch
			End
GO
ALTER TABLE [dbo].[Tema] ENABLE TRIGGER [DelTema]
GO
/****** Object:  Trigger [dbo].[RegNewTema]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Trigger [dbo].[RegNewTema] on [dbo].[Tema]
		For insert
		as
			Begin
				Begin Try
					Begin Transaction
					Declare @tipoOperacion varchar(20) = 'Insert', @descripcion varchar(max);
					Begin
					Set @descripcion = Concat('Se agrero el tema ', (Select Descripcion from inserted), ' con el codigo ', (Select Codigo from inserted))
					Exec InsertBitacora @tipoOperacion, @descripcion
					print('done')
					End
					Commit Transaction
				End Try

				Begin Catch
					Rollback Transaction
				End Catch
			End
GO
ALTER TABLE [dbo].[Tema] ENABLE TRIGGER [RegNewTema]
GO
/****** Object:  Trigger [dbo].[DelUser]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Trigger [dbo].[DelUser] on [dbo].[Usuarios]
		For Delete
		as
			Begin

				Begin Try
					Begin Transaction
					Declare @tipoOperacion varchar(20) = 'Delete', @descripcion varchar(max);
					Begin
					Set @descripcion = Concat('Se elimino al usuario ', (Select Nombre from deleted), ' con el codigo ', (Select Codigo from deleted))
					Exec InsertBitacora @tipoOperacion, @descripcion
					print('done')
					End
					Commit Transaction
				End Try

				Begin Catch
					Rollback Transaction
				End Catch
			End
GO
ALTER TABLE [dbo].[Usuarios] ENABLE TRIGGER [DelUser]
GO
/****** Object:  Trigger [dbo].[RegNewUser]    Script Date: 24/10/2021 04:12:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Trigger [dbo].[RegNewUser] on [dbo].[Usuarios]
		For insert
		as
			Begin
				Begin Try
					Begin Transaction
					Declare @tipoOperacion varchar(20) = 'Insert', @descripcion varchar(max);
					Begin
					Set @descripcion = Concat('Se agrero al usuario ', (Select Nombre from inserted), ' con el codigo ', (Select Codigo from inserted))
					Exec InsertBitacora @tipoOperacion, @descripcion
					print('done')
					End
					Commit Transaction
				End Try

				Begin Catch
					Rollback Transaction
				End Catch
			End
GO
ALTER TABLE [dbo].[Usuarios] ENABLE TRIGGER [RegNewUser]
GO
