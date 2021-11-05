Create Database [Pruebas22_10]
Go
Use [Pruebas22_10]
Go
Create Table Bitacora(
	TipoOperacion varchar(20),
	Descripcion text,
	Fecha smalldatetime
);
Create Table Usuarios(
	Codigo Int Identity,
	Nombre varchar(50) Not Null,
	Apellidos varchar(50) Null,
	Correo varchar(255) Not Null Primary Key,
	Contraseña varchar(50) Not Null,
	TipoUsuario varchar(50) Not Null,
	EntFed varchar(50) Null,
	Genero varchar(20) Null,
	Domicilio text Null,
	Situacion varchar(50) Not Null,
	Pic text Null,
	FechaNac date Null
);

Create Procedure NewUser(
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

Create Procedure InsertBitacora(
	@TipoOperacion varchar(20),
	@Descripcion text
)
As
	Begin
		Begin Try
			Begin Transaction
			Insert Into Bitacora (TipoOperacion, Descripcion, Fecha) Values (@TipoOperacion, @Descripcion,  Cast(getdate() As smalldatetime))
			Commit Transaction
		End Try

		Begin Catch
			Rollback Transaction
		End Catch
	End


Create Trigger RegNewUser on Usuarios
For insert
as
	Begin

		Begin Try
			Begin Transaction
			Declare @tipoOperacion varchar(20) = 'Insert', @descripcion varchar(max);
			Begin
			Set @descripcion = Concat('Se agrero al usuario ', (Select Nombre from inserted))
			Exec InsertBitacora @tipoOperacion, @descripcion
			print('done')
			End
			Commit Transaction
		End Try

		Begin Catch
			Rollback Transaction
		End Catch
	End

Exec NewUser 'Prueba', 'correo@falso.com', '1234567890'

Select * From Usuarios
Select * From Bitacora