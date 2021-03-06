USE [Pruebas05_11]
GO
/****** Object:  StoredProcedure [dbo].[AddBook]    Script Date: 08/11/2021 05:28:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[AddBook](
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

Exec AddBook 'Ejemplo 1', 'PEA', Null, Null, 1, Null,Null,Null

Declare @rValue int;
Exec AddBook 'Ejemplo 1', 'PEA', Null, Null, 1, Null,Null,Null, @codLibro = @rValue OUTPUT;
Print(@rValue)

Select * from Usuarios

Exec ChangeLevel '2', 'Master'

Delete Libro

DBCC CHECKIDENT (Libro, RESEED, 0);