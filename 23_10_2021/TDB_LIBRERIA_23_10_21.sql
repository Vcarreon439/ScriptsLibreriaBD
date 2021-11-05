Create Database [Pruebas23_10]
Go
Use [Pruebas23_10]
Go
Begin /*Table Squema*/

	Begin /*Tablas Raiz*/

		Create Table Usuarios(
			Codigo Int Identity(1,1) Not Null,
			Nombre varchar(50) Not Null,
			Apellidos varchar(50) Null,
			Correo varchar(255) Not Null,
			Contraseña varchar(50) Not Null,
			TipoUsuario varchar(50) Not Null,
			EntFed varchar(50) Null,
			Genero varchar(20) Null,
			Domicilio text Null,
			Situacion varchar(50) Not Null,
			Pic text Null,
			FechaNac date Null,
			Primary Key (Codigo)
		);

		Create Table Bitacora(
			TipoOperacion varchar(50) Null,
			Descripcion text Null,
			Fecha smalldatetime Null
		);

		Create Table Editorial(
			Codigo varchar(5) Primary Key Not Null,
			Nombre varchar(50) Not Null,
			Telefono varchar(10) Null,
			Correo varchar(50) Null,
			Direccion text Null
		);

		Create Table Tema(
			Codigo varchar(5) Primary Key Not Null,
			Descripcion varchar(50) Not Null
		);

		Create Table Autor(
			Codigo Int Identity Primary Key Not Null,
			Nombre varchar(50) Not Null,
			Apellido varchar(50) Null,
			paisNacimiento varchar(50) Null,
			ciudadNacimiento varchar(50) Null,
			comentarios text Null,
			foto text Null
		);

		
	End

	Begin /*Tablas Dependientes*/

		Create Table Libro(
			Codigo Int Identity Primary Key Not Null,
			ISBN varchar(15) Null,
			Titulo varchar(50) Not Null,
			codEditorial varchar(5) Null,
			añoEdicion varchar(4) Null,
			lugarEdicion varchar(50) Null,
			numeroEdicion smallint Null,
			Copias int Not Null,
			Disponibilidad bit Not Null,
			ImagenLibro text Null,
			SolicitudesRenta int Null,
			Foreign Key (codEditorial) References Editorial(Codigo)
		);

		Create Table Prestamos(
			NumeroPedido Int Identity Primary Key Not Null,
			codigoUsuario Int Not Null,
			FechaSalida smalldatetime Not Null,
			FechaMaxima smalldatetime Not Null,
			FechaDevolucion smalldatetime Not Null,
			estadoPrestamo varchar(50) Not Null,
			Foreign Key (codigoUsuario) References Usuarios(Codigo)
		);

	End

	Begin /*Tablas Muy Dependientes*/

		Create Table AutoresLibro(
			codLibro int Not Null,
			codAutor int Not Null,
			Foreign Key (codLibro) References Libro(Codigo),
			Foreign Key (codAutor) References Autor(Codigo)
		);

		Create Table TemaLibro(
			codLibro int Not Null,
			codTema varchar(5) Not Null,
			Foreign Key (codLibro) References Libro(Codigo),
			Foreign Key (codTema) References Tema(Codigo)
		);

		Create Table LibrosPrestamos(
			Codigo Int Identity Primary Key Not Null,
			codLibro int Not Null,
			codPrestamo int Not Null,
			Foreign Key (codPrestamo) References Prestamos(NumeroPedido),
			Foreign Key (codLibro) References Libro(Codigo)
		);

	End

End

Begin /*Procedures*/

	Begin /*Tabla Usuarios*/
	
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

		Create Procedure UpdateUser(
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

		Create Procedure ChangeLevel(
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

	End

	Begin /*Tabla Bitacora*/

		Create Procedure InsertBitacora(
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

	End

	Begin /*Tabla Editorial*/
		
		Create Procedure AddEditorial(
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

	End

	Begin /*Tabla Tema*/
		
		Create Procedure AddTema(
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

	End

		
End

Begin /*Triggers*/

	Begin /*Tabla Usuarios*/

		Create Trigger RegNewUser on Usuarios
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

		Create Trigger DelUser on Usuarios
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

	End

	Begin /*Tabla Editorial*/

		Create Trigger RegNewEditorial on Editorial
		For insert
		as
			Begin
				Begin Try
					Begin Transaction
					Declare @tipoOperacion varchar(20) = 'Insert', @descripcion varchar(max);
					Begin
					Set @descripcion = Concat('Se agrego la editorial ', (Select Nombre from inserted), ' con el codigo ', (Select Codigo from inserted))
					Exec InsertBitacora @tipoOperacion, @descripcion
					print('done')
					End
					Commit Transaction
				End Try

				Begin Catch
					Rollback Transaction
				End Catch
			End

		Create Trigger DelEditorial on Editorial
		For Delete
		as
			Begin
				Begin Try
					Begin Transaction
					Declare @tipoOperacion varchar(20) = 'Delete', @descripcion varchar(max);
					Begin
					Set @descripcion = Concat('Se elimino la editorial ', (Select Nombre From deleted), ' con el codigo ', (Select Codigo from deleted))
					Exec InsertBitacora @tipoOperacion, @descripcion
					print('done')
					End
					Commit Transaction
				End Try

				Begin Catch
					Rollback Transaction
				End Catch
			End

	End

	Begin /*Table Tema*/
		
		Create Trigger RegNewTema on Tema
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

		Create Trigger DelTema on Tema
		For Delete
		as
			Begin
				Begin Try
					Begin Transaction
					Declare @tipoOperacion varchar(20) = 'Delete', @descripcion varchar(max);
					Begin
					Set @descripcion = Concat('Se elimino el tema ', (Select Descripcion From deleted), ' con el codigo ', (Select Codigo from deleted))
					Exec InsertBitacora @tipoOperacion, @descripcion
					print('done')
					End
					Commit Transaction
				End Try

				Begin Catch
					Declare @error varchar(max)
					Select @error = ERROR_MESSAGE()
					print (@error)
					Rollback Transaction
				End Catch
			End

	End

End

Begin /*Region de pruebas*/

	Begin /*Editorial*/

		Exec AddEditorial '97254', 'Jus', '8712570394', 'JusEditorial@hotmail.com', 'Priv. de Ceylán 22 Col. Industrial Vallejo' 
		Exec AddEditorial '14374', 'Grijalbo', '8725367496', 'GrijalboEdit@gmail.com', 'Renacimiento 180 Col. San Juan Tlihuaca' 
		Exec AddEditorial '98697', 'Lumen', '8700446582', 'Lumeen@gmail.com', 'Av. Juárez 20 Cuauhtémoc' 
		Exec AddEditorial '76453', 'Salamandra', '8715264820', 'GrupoSalamandra@hotmail.com', 'Abasola 40 Col. Santa Úrsula Coapa' 
		Exec AddEditorial '23564', 'Planeta', '8725630429', 'PlanetLib@Outlook.es', 'Av. Miguel Ángel de Quevedo 906,' 
	
	End

	Begin /*User*/

		Exec NewUser 'Prueba', 'correo@falso.com', '1234567890'
		Exec UpdateUser 1, 'Prueba 2', 'Ejemplo de Apellido', 'correo2@falso.com', '1234567890', Null, Null, Null, Null
		Exec ChangeLevel 1, 'Master'

	End

	Begin /*Tema*/

		Exec AddTema 'ARQ_PC', 'Arquitectura de Computadoras'
		Exec AddTema 'EAMAR', 'El arte de amar'

		Insert into Tema (codigo, Nombre) values ('MATEB', 'Matematicas basicas');
		Insert into Tema (codigo, Nombre) values ('ESDLA', 'El Señor de los Anillos');
		Insert into Tema (codigo, Nombre) values ('ECDVI', 'El Código da Vinci ');
		Insert into Tema (codigo, Nombre) values ('EDDAF', 'El diario de Ana Frank ');
		Insert into Tema (codigo, Nombre) values ('EEDFR', 'El enigma de Fermat');
		Insert into Tema (codigo, Nombre) values ('FDCPI', 'Fundamentos De Computación Para Ingenieros');
		Insert into Tema (codigo, Nombre) values ('LMISC', 'Lógica Matemática Para Ingeniería De Sistemas Y Computación');
		Insert into Tema (codigo, Nombre) values ('IALAS', 'Introducción a los Algoritmos');
		Insert into Tema (codigo, Nombre) values ('EPRIT', 'El Principito');
		Insert into Tema (codigo, Nombre) values ('LSDEV', 'La Sombra del Viento');
		Insert into Tema (codigo, Nombre) values ('HAPOT', 'Harry Potter');
		Insert into Tema (codigo, Nombre) values ('EBTPD', 'En busca del tiempo perdido');
		Insert into Tema (codigo, Nombre) values ('UMFEL', 'Un mundo feliz');
		Insert into Tema (codigo, Nombre) values ('CADSO', 'Cien años de soledad');
		Insert into Tema (codigo, Nombre) values ('ESDLM', 'El señor de las moscas');
		Insert into Tema (codigo, Nombre) values ('DQDLM', 'Don Quijote de la Mancha');
		Insert into Tema (codigo, Nombre) values ('EALQA', 'El Alquimista');
		Insert into Tema (codigo, Nombre) values ('DSICU', 'Diseño de sistemas interactivos centrados en el usuario');

	End

	Delete Bitacora
	Delete Editorial
	Delete Usuarios
	Delete Tema Where Codigo = 'EAMAR'

	Select * From Usuarios
	Select * From Editorial
	Select * From Bitacora
	Select * From Tema

End