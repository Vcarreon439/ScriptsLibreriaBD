USE [Pruebas23_10]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 23/10/2021 04:02:00 p. m. ******/
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
/****** Object:  Table [dbo].[AutoresLibro]    Script Date: 23/10/2021 04:02:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoresLibro](
	[codLibro] [int] NOT NULL,
	[codAutor] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 23/10/2021 04:02:00 p. m. ******/
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
/****** Object:  Table [dbo].[Editorial]    Script Date: 23/10/2021 04:02:00 p. m. ******/
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
/****** Object:  Table [dbo].[Libro]    Script Date: 23/10/2021 04:02:00 p. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibrosPrestamos]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  Table [dbo].[Prestamos]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  Table [dbo].[Tema]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  Table [dbo].[TemaLibro]    Script Date: 23/10/2021 04:02:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemaLibro](
	[codLibro] [int] NULL,
	[codTema] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 23/10/2021 04:02:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NULL,
	[Correo] [varchar](255) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[TipoUsuario] [varchar](50) NOT NULL,
	[EntFed] [varchar](50) NULL,
	[Genero] [varchar](20) NULL,
	[Domicilio] [text] NULL,
	[Situacion] [varchar](50) NOT NULL,
	[Pic] [text] NULL,
	[FechaNac] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
ALTER TABLE [dbo].[Prestamos]  WITH CHECK ADD FOREIGN KEY([codigoUsuario])
REFERENCES [dbo].[Usuarios] ([Codigo])
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
/****** Object:  StoredProcedure [dbo].[AddEditorial]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[AddTema]    Script Date: 23/10/2021 04:02:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		Create Procedure [dbo].[AddTema](
			@Codigo varchar(5),
			@Descripcion varchar(50)
		)
		As 
			Begin
				Begin Try
					Begin Transaction
					Insert Into Tema (Codigo, Descripcion) Values (@Codigo, @Descripcion)
					print('El tema fue registrado correctamente')
					Commit Transaction
					Return 1
				End Try

				Begin Catch
					print('No se pudo registrar el tema')
					RollBack Transaction
					Return 0
				End Catch
			End
GO
/****** Object:  StoredProcedure [dbo].[ChangeLevel]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[InsertBitacora]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[NewUser]    Script Date: 23/10/2021 04:02:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[NewUser](
			@Nombre varchar(50),
			@Correo varchar(255),
			@Contraseña varchar(50)
		)
		As
			Begin
				Begin Try
					Begin Transaction
					Insert Into Usuarios (Nombre, Correo, Contraseña, Situacion, TipoUsuario) Values (@Nombre, @Correo, @Contraseña, 'En Orden', 'User')
					print('El usuario fue registrado exitosamente')
					Commit Transaction
					Return 1
				End Try

				Begin Catch
					print('No se pudo registrar al usuario')
					RollBack Transaction
					Return 0
				End Catch
			End
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  Trigger [dbo].[DelEditorial]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  Trigger [dbo].[RegNewEditorial]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  Trigger [dbo].[DelTema]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  Trigger [dbo].[RegNewTema]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  Trigger [dbo].[DelUser]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
/****** Object:  Trigger [dbo].[RegNewUser]    Script Date: 23/10/2021 04:02:01 p. m. ******/
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
