CREATE DATABASE [Pruebas08_11]
GO
USE [Pruebas08_11]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 08/11/2021 10:49:52 p. m. ******/
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
/****** Object:  View [dbo].[MostrarEditoriales]    Script Date: 08/11/2021 10:49:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[MostrarEditoriales]
As
	Select * From Editorial
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 08/11/2021 10:49:52 p. m. ******/
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
/****** Object:  View [dbo].[LibrosPopulares_4]    Script Date: 08/11/2021 10:49:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[LibrosPopulares_4]
As
	SELECT TOP (4) Codigo, Titulo, Descripcion, ImagenLibro As Imagen From Libro Order By SolicitudesRenta Desc
GO
/****** Object:  Table [dbo].[Tema]    Script Date: 08/11/2021 10:49:52 p. m. ******/
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
/****** Object:  View [dbo].[ShowAllTopics]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[ShowAllTopics]
As	
	Select * From Tema
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  View [dbo].[AutoresTabla]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[AutoresTabla]
As
	Select Codigo, Nombre, Apellido, paisNacimiento as [Pais], ciudadNacimiento as [Ciudad] From Autor
GO
/****** Object:  Table [dbo].[AutoresLibro]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoresLibro](
	[codLibro] [int] NOT NULL,
	[codAutor] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  Table [dbo].[LibrosPrestamos]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  Table [dbo].[Prestamos]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  Table [dbo].[TemaLibro]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemaLibro](
	[codLibro] [int] NULL,
	[codTema] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([Codigo], [Nombre], [Apellido], [paisNacimiento], [ciudadNacimiento], [comentarios], [foto]) VALUES (1, N'dhdhdgd', N'efassd', N'AO', N'sdfdfgfsg', N' dgdsfgsd gsdfg sdfgdsf gsdfg ', NULL)
SET IDENTITY_INSERT [dbo].[Autor] OFF
GO
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-26T13:56:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario Victor Hugo con el codigo 1', CAST(N'2021-10-26T13:59:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-26T14:00:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-26T14:01:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-26T14:02:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Quimica con el codigo QUI', CAST(N'2021-10-26T14:02:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Fisica con el codigo FIS', CAST(N'2021-10-26T14:02:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Terror con el codigo TER', CAST(N'2021-10-26T14:02:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Romance con el codigo ROM', CAST(N'2021-10-26T14:02:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino el tema Romance con el codigo ROM', CAST(N'2021-10-26T14:02:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-26T14:04:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino el tema Terror con el codigo TER', CAST(N'2021-10-26T14:05:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino el tema Terror con el codigo TER', CAST(N'2021-10-26T14:07:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-26T14:09:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino el tema Terror con el codigo TER', CAST(N'2021-10-26T14:09:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino el tema Terror con el codigo TER', CAST(N'2021-10-26T14:10:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino el tema Terror con el codigo TER', CAST(N'2021-10-26T14:16:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-26T20:08:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-26T20:09:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-26T22:07:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-26T22:08:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-10-26T22:09:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-26T22:09:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero la editorial Person con el codigo PEA', CAST(N'2021-10-26T22:10:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-26T22:12:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero la editorial DFGDFGDFGD con el codigo WWW', CAST(N'2021-10-26T22:12:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino el tema Terror con el codigo TER', CAST(N'2021-10-26T14:11:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino el tema Terror con el codigo TER', CAST(N'2021-10-26T14:13:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino el tema Terror con el codigo TER', CAST(N'2021-10-26T14:14:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Victor Hugo ha iniciado sesion', CAST(N'2021-10-26T22:16:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero la editorial fdrhyfh con el codigo QQQ', CAST(N'2021-10-26T22:17:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos de la editorial Person con el codigo PEA', CAST(N'2021-10-28T00:14:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos de la editorial Person con el codigo PED', CAST(N'2021-10-28T00:14:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos de la editorial Person con el codigo PEA', CAST(N'2021-10-28T00:15:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos de la editorial Person con el codigo PEA', CAST(N'2021-10-28T00:16:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos de la editorial Personss con el codigo PEA', CAST(N'2021-10-28T00:16:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos de la editorial Personss con el codigo PEA', CAST(N'2021-10-28T00:17:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos de la editorial Personss con el codigo PEA', CAST(N'2021-10-28T00:18:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos de la editorial Personss con el codigo PEA', CAST(N'2021-10-28T00:19:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino la editorial Personss con el codigo PEA', CAST(N'2021-10-28T00:46:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se ha eliminado la editorial  con el codigo PEA', CAST(N'2021-10-28T00:46:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos del autor edfg con el codigo 12', CAST(N'2021-11-04T20:38:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update', N'Se han cambiado los datos del autor edfg con el codigo 12', CAST(N'2021-11-04T20:39:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Piscologia con el codigo PSI', CAST(N'2021-11-05T19:43:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Terror con el codigo TER', CAST(N'2021-11-05T19:46:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Ciencia con el codigo SCI', CAST(N'2021-11-05T19:46:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero el tema Ciencia y Ficción con el codigo SciFi', CAST(N'2021-11-05T19:46:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino la editorial fdrhyfh con el codigo QQQ', CAST(N'2021-11-08T10:56:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se ha eliminado la editorial  con el codigo QQQ', CAST(N'2021-11-08T10:56:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se elimino la editorial DFGDFGDFGD con el codigo WWW', CAST(N'2021-11-08T10:56:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Delete', N'Se ha eliminado la editorial  con el codigo WWW', CAST(N'2021-11-08T10:56:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero la editorial Pearson Education con el codigo PEA', CAST(N'2021-11-08T11:29:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero la editorial Tomato Publishers con el codigo TO', CAST(N'2021-11-08T11:36:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-11-08T22:42:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario  ha iniciado sesion', CAST(N'2021-11-08T22:43:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Insert', N'Se agrero al usuario Andrea Evelyn con el codigo 2', CAST(N'2021-11-08T22:45:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Update Authorization', N'Se han modificado los permisos del usuario Andrea Evelyn nuevo permiso => Master', CAST(N'2021-11-08T22:46:00' AS SmallDateTime))
INSERT [dbo].[Bitacora] ([TipoOperacion], [Descripcion], [Fecha]) VALUES (N'Login', N'El usuario Andrea Evelyn ha iniciado sesion', CAST(N'2021-11-08T22:46:00' AS SmallDateTime))
GO
INSERT [dbo].[Editorial] ([Codigo], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (N'PEA', N'Pearson Education', N'2234345', N'pearson@education.com', N's g zvxdfvxbxd vdvd fv')
INSERT [dbo].[Editorial] ([Codigo], [Nombre], [Telefono], [Correo], [Direccion]) VALUES (N'TO', N'Tomato Publishers', N'4455', N'fdfdf@gmail.com', N'gdfgdfg')
GO
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'FIS', N'Fisica')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'PSI', N'Piscologia')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'QUI', N'Quimica')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'ROM', N'Romance')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'SCI', N'Ciencia')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'SciFi', N'Ciencia y Ficción')
INSERT [dbo].[Tema] ([Codigo], [Descripcion]) VALUES (N'TER', N'Terror')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Codigo], [Nombre], [Apellidos], [Correo], [Contraseña], [TipoUsuario], [EntFed], [Genero], [Domicilio], [Situacion], [Pic], [FechaNac]) VALUES (1, N'Victor Hugo', N'Carreon Pulido', N'hv_carreon@hotmail.com', N'6Afx/PgtEy+bsBjKZzihnw==', N'Master', NULL, NULL, NULL, N'En Orden', NULL, NULL)
INSERT [dbo].[Usuarios] ([Codigo], [Nombre], [Apellidos], [Correo], [Contraseña], [TipoUsuario], [EntFed], [Genero], [Domicilio], [Situacion], [Pic], [FechaNac]) VALUES (2, N'Andrea Evelyn', N'Mejia Rubio', N'andiemartin33@gmail.com', N'JfnnlDI7RTiF9RgfG2JNCw==', N'Master', NULL, NULL, NULL, N'En Orden', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[AutoresLibro]  WITH CHECK ADD FOREIGN KEY([codAutor])
REFERENCES [dbo].[Autor] ([Codigo])
GO
ALTER TABLE [dbo].[AutoresLibro]  WITH CHECK ADD FOREIGN KEY([codLibro])
REFERENCES [dbo].[Libro] ([Codigo])
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK__Libro__codEditor__37A5467C] FOREIGN KEY([codEditorial])
REFERENCES [dbo].[Editorial] ([Codigo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK__Libro__codEditor__37A5467C]
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
/****** Object:  StoredProcedure [dbo].[AddAuthor]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddAuthor](
	@Nombre varchar(50),
	@Apellidos varchar(50),
	@pais varchar(50),
	@ciudad varchar(50),
	@coment text,
	@foto varchar(max)
)
As 
	Begin
		Declare @ret bit;
		Begin Try
			Begin Transaction
			Insert Into Autor (Nombre, Apellido, paisNacimiento, ciudadNacimiento, comentarios, foto) Values (@Nombre,@Apellidos,@Pais,@Ciudad,@coment,@foto)
			print('El autor fue insertado correctamente')
			Commit Transaction
			Set @ret = 1;
			Return @ret
		End Try

		Begin Catch
			print('No se pudo registrar a la editorial')
			RollBack Transaction
			Set @ret = 0;
			Return @ret
		End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[AddBook]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddBook](
	@Titulo varchar(50),
	@codEditorial varchar(5),
	@ISBN varchar(15),
	@numEdicion smallint,
	@copias int,
	@añoEdicion varchar(4),
	@descripcion text,
	@foto varchar(max),
	@codLibro int OUTPUT
)
As 
	Begin
		Declare @ret bit
		Begin Try
			Begin Transaction
				Insert Into Libro (Titulo, codEditorial, ISBN, numeroEdicion, Copias, añoEdicion, Descripcion, ImagenLibro, Disponibilidad) Values (@Titulo, @codEditorial, @ISBN, @numEdicion, @copias, @añoEdicion, @descripcion, @foto, 1)
				Set @codLibro = Scope_Identity()
			Commit Transaction
			Set @ret = 1;
			Return @ret
		End Try

		Begin Catch
			print(ERROR_MESSAGE())
			RollBack Transaction
			Set @ret = 0;
			Return @ret
		End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[AddEditorial]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE Procedure [dbo].[AddEditorial](
			@Codigo varchar(5),
			@Nombre varchar(50),
			@Telefono varchar(10),
			@Correo varchar(50),
			@Direccion text
		)
		As 
			Begin
				Declare @ret bit;
				Begin Try
					Begin Transaction
					Insert Into Editorial (Codigo, Nombre, Telefono, Correo, Direccion) Values (@Codigo, @Nombre, @Telefono, @Correo, @Direccion)
					print('La editorial fue registrada correctamente')
					Commit Transaction
					Set @ret = 1;
					Return @ret
				End Try

				Begin Catch
					print('No se pudo registrar a la editorial')
					RollBack Transaction
					Set @ret = 0;
					Return @ret
				End Catch
			End
GO
/****** Object:  StoredProcedure [dbo].[AddTema]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ChangeLevel]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteAutor]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteAutor](
	@Codigo int
)
As 
	Begin
		Declare @ret bit;
		Begin Try
			Begin Transaction
			Delete Autor Where Codigo = @Codigo 
			print('El autor fue eliminado correctamente')
			Commit Transaction
			Set @ret = 1;
			Return @ret
		End Try

		Begin Catch
			print('No se pudo eliminar al autor')
			RollBack Transaction
			Set @ret = 0;
			Return @ret
		End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[DeletePublisher]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeletePublisher](
		@Code varchar(5)
)
As
	Begin
		Declare @ret bit;
		Begin Try
			Begin Transaction
			Update Libro Set codEditorial = Null Where codEditorial = @Code
			Delete Editorial Where Codigo = @Code
			Declare @desc varchar(max) = Concat('Se ha eliminado la editorial ', (Select Nombre from Editorial Where Codigo = @Code), ' con el codigo ', @Code);
			Exec InsertBitacora 'Delete', @desc
			print('La editorial se ha eliminado exitosamente')
			Commit Transaction
			Set @ret = 1
			Return @ret
		End Try

		Begin Catch
			print('No se pudo eliminar la editorial')
			RollBack Transaction
			Set @ret = 0
			Return @ret
		End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[DeleteTema]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteTema](
	@Codigo varchar(5),
	@Descripcion varchar(50)
)
As 
	Begin
		Declare @ret bit;
		Begin Try
			Begin Transaction
			Delete Tema Where Codigo = @Codigo And Descripcion = @Descripcion
			print('El tema fue eliminado correctamente')
			Commit Transaction
			Set @ret = 1;
			Return @ret
		End Try

		Begin Catch
			print('No se pudo eliminar el tema')
			RollBack Transaction
			Set @ret = 0;
			Return @ret
		End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[InsertarTemaLibro]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[InsertBitacora]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ListarTemas]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ListarTemas](
	@inicio int,
	@final int
)
As 
	Declare @ListarTemas Table
	(
		Numero int,
		Codigo varchar(5),
		Descripcion varchar(50)
	)
		Begin
			Begin Try
				Begin Transaction
				Insert Into @ListarTemas (Numero, Codigo, Descripcion) Select ROW_NUMBER() over (order by Descripcion asc) Numero, Codigo, Descripcion from Tema
				Select * from @ListarTemas Where Numero between @inicio and @final
				Commit Transaction
			End Try

			Begin Catch
				RollBack Transaction
			End Catch
		End
GO
/****** Object:  StoredProcedure [dbo].[Loggeo]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[NewUser]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[TakeExtraDataAutor]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[TakeExtraDataAutor](
		@code int
)
As
	Begin
		Declare @ret bit;
		Begin Try
			Begin Transaction
			Select comentarios, foto From Autor Where Codigo = @code
			Commit Transaction
		End Try

		Begin Catch
			RollBack Transaction
		End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[UpdateAutor]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UpdateAutor](
		@code int,
		@newName varchar(5),
		@newSecond varchar(50),
		@newCountry varchar(10),
		@newCity varchar(50),
		@newComments text,
		@newFoto varchar(max)
)
As
	Begin
		Declare @ret bit;
		Begin Try
			Begin Transaction
			Update Autor Set Nombre = @newName, Apellido = @newSecond, paisNacimiento = @newCountry, ciudadNacimiento = @newCity, comentarios = @newComments, foto = @newFoto Where Codigo = @code
			Declare @desc varchar(max) = Concat('Se han cambiado los datos del autor ', @newName, ' con el codigo ', @code);
			Exec InsertBitacora 'Update', @desc
			print('Los datos del autor se han actualizado correctamente')
			Commit Transaction
			Set @ret = 1
			Return @ret
		End Try

		Begin Catch
			print('No se pudieron actualizar los datos del autor')
			RollBack Transaction
			Set @ret = 0
			Return @ret
		End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[UpdatePublishers]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdatePublishers](
		@oldCode varchar(5),
		@newCode varchar(5),
		@newName varchar(50),
		@newPhone varchar(10),
		@newMail varchar(50),
		@newAddress text
)
As
	Begin
		Declare @ret bit;
		Begin Try
			Begin Transaction
			Update Editorial Set Codigo = @newCode, Nombre = @newName, Telefono = @newPhone, Correo = @newMail, Direccion = @newAddress Where Codigo = @oldCode 
			Declare @desc varchar(max) = Concat('Se han cambiado los datos de la editorial ', @newName, ' con el codigo ', @oldCode);
			Exec InsertBitacora 'Update', @desc
			print('Los datos de la editorial se han actualizado correctamente')
			Commit Transaction
			Set @ret = 1
			Return @ret
		End Try

		Begin Catch
			print('No se pudieron actualizar los datos de la editorial')
			RollBack Transaction
			Set @ret = 0
			Return @ret
		End Catch
	End
GO
/****** Object:  StoredProcedure [dbo].[UpdateTema]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  Trigger [dbo].[DelEditorial]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  Trigger [dbo].[RegNewEditorial]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  Trigger [dbo].[DelTema]    Script Date: 08/11/2021 10:49:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Trigger [dbo].[DelTema] on [dbo].[Tema]
		For Delete
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
/****** Object:  Trigger [dbo].[RegNewTema]    Script Date: 08/11/2021 10:49:53 p. m. ******/
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
/****** Object:  Trigger [dbo].[DelUser]    Script Date: 08/11/2021 10:49:54 p. m. ******/
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
/****** Object:  Trigger [dbo].[RegNewUser]    Script Date: 08/11/2021 10:49:54 p. m. ******/
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
