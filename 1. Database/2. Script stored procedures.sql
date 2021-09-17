USE [DBNAME]
GO

create PROC [dbo].[USP_PLUS_Area_GetAll]
AS
BEGIN
	SELECT IdArea, Nombre, Activo FROM Area where Activo = 1
END
GO

create PROC [dbo].[USP_PLUS_CambioClave_Insert]
@Token		VARCHAR(4000),
@IdUsuario	INT 
AS
BEGIN
	INSERT INTO CambioClave(Token, FechaGeneracion, FechaExpiracion, IdUsuario,Activo) 
	VALUES(@Token, GETDATE(), DATEADD(DAY, 2, GETDATE()), @IdUsuario,1)
END
GO

CREATE PROCEDURE [dbo].[USP_PLUS_Empleado_Get]
	@IdEmpleado INT
AS
BEGIN
	SELECT
		E.IdEmpleado,
		E.IdTipoDocumento,
		P.Nombre TipoDocumento,
		E.NumeroDocumento,
		E.UiSap,
		A.IdArea,
		A.Nombre Area,
		E.Nombres,
		E.Apellidos,
		E.FechaNacimiento,
		E.CorreoCorporativo,
		E.CorreoPersonal,
		E.Celular,
		E.Activo
	FROM Empleado E
	LEFT JOIN Area A ON E.IdArea = A.IdArea      
	LEFT JOIN Parametro P ON E.IdTipoDocumento = P.IdParametro     
	WHERE IdEmpleado = @IdEmpleado
END
GO

CREATE procedure [dbo].[USP_PLUS_Empleado_GetBirthdayToday]
AS
BEGIN
	DECLARE @fechaActual DATE = GETDATE()
	SELECT [IdEmpleado]
		,[IdArea]
		,[Nombres]
		,[Apellidos]
		,[FechaNacimiento]
		,[CorreoCorporativo]
		,[CorreoPersonal]
		,[Celular]
		,[Activo]
		,[UsuarioCrea]
		,[FechaCrea]
		,[UsuarioEdita]
		,[FechaEdita]
	FROM [dbo].[Empleado]
	WHERE MONTH(FechaNacimiento) = MONTH(@fechaActual) AND DAY(FechaNacimiento) = DAY(@fechaActual)
		AND Activo = 1
	UNION
	SELECT [IdEmpleado]
		,[IdArea]
		,[Nombres]
		,[Apellidos]
		,[FechaNacimiento]
		,[CorreoCorporativo]
		,[CorreoPersonal]
		,[Celular]
		,[Activo]
		,[UsuarioCrea]
		,[FechaCrea]
		,[UsuarioEdita]
		,[FechaEdita]
	FROM [dbo].[Empleado]
	WHERE YEAR(@fechaActual) % 4 = 0
		AND MONTH(@fechaActual) = 3 AND DAY(@fechaActual) = 1
		AND MONTH(FechaNacimiento) = 2 AND DAY(FechaNacimiento) = 29
		AND Activo = 1
END
GO

CREATE procedure [dbo].[USP_PLUS_Empleado_Insert](  
	@IdTipoDocumento INT,
	@NumeroDocumento VARCHAR(20),
	@UiSap VARCHAR(20) = NULL,
	@IdArea INT,
	@Nombres VARCHAR(100),    
	@Apellidos VARCHAR(100),    
	@FechaNacimiento DATE,
	@CorreoCorporativo VARCHAR(250) = NULL,
	@CorreoPersonal VARCHAR(250) = NULL,
	@Celular VARCHAR(15) = NULL,
	@UsuarioRegistra VARCHAR(150),
	@FechaRegistra DATETIME
 )   
AS
BEGIN
	DECLARE @IdEmpleado INT

	INSERT INTO Empleado(
		IdTipoDocumento,
		NumeroDocumento,
		UiSap,
		IdArea,
		Nombres,
		Apellidos,
		FechaNacimiento,
		CorreoCorporativo,
		CorreoPersonal,
		Celular,
		Activo,
		UsuarioCrea,
		FechaCrea
	)
	VALUES(
		@IdTipoDocumento,
		@NumeroDocumento,
		@UiSap,
		@IdArea,
		@Nombres,
		@Apellidos,
		@FechaNacimiento,
		@CorreoCorporativo,
		@CorreoPersonal,
		@Celular,
		1,
		@UsuarioRegistra,
		@FechaRegistra
	)
	SET @IdEmpleado = SCOPE_IDENTITY()
END
GO

CREATE procedure [dbo].[USP_PLUS_Empleado_SearchPaginated](
	@offsetNumber INT,
	@pageSize  INT,
	@apellidos  VARCHAR(150) = NULL,
	@nombres  VARCHAR(100) = NULL,
	@activo   BIT = NULL,
	@totalRecords INT OUT
)
AS
BEGIN
	DECLARE	@apellidosText VARCHAR(150) = ISNULL(@apellidos, ''),
			@nombresText VARCHAR(100) = ISNULL(@nombres, '');
	SELECT
		E.IdEmpleado,
		E.IdTipoDocumento,
		P.Nombre TipoDocumento,
		E.NumeroDocumento,
		E.UiSap,
		A.IdArea,
		A.Nombre Area,
		E.Nombres,
		E.Apellidos,
		E.FechaNacimiento,
		E.CorreoCorporativo,
		E.CorreoPersonal,
		E.Celular,
		E.Activo
	FROM Empleado E
	LEFT JOIN Area A ON E.IdArea = A.IdArea      
	LEFT JOIN Parametro P ON E.IdTipoDocumento = P.IdParametro

	WHERE E.Activo = IIF(@activo IS NOT NULL, @activo, E.Activo) 
			AND ISNULL(E.Apellidos, '') LIKE '%' + @apellidosText + '%'
			AND E.Nombres LIKE '%' + @nombresText + '%' 
	ORDER BY IdEmpleado 
	OFFSET @OffsetNumber ROWS FETCH NEXT @pageSize ROWS ONLY;

	SET @totalRecords = (    
		SELECT COUNT(1) FROM Empleado
		WHERE  Activo = IIF(@activo IS NOT NULL, @activo, Activo) 
			AND ISNULL(Apellidos, '') LIKE '%' + @apellidosText + '%'
			AND Nombres LIKE '%' + @nombresText + '%' 
			);
END
GO

CREATE procedure [dbo].[USP_PLUS_Empleado_Update](  
	@IdEmpleado INT,
	@IdTipoDocumento INT,
	@NumeroDocumento VARCHAR(20),
	@UiSap VARCHAR(20) = NULL,
	@IdArea INT,
	@Nombres VARCHAR(100),    
	@Apellidos VARCHAR(100),   
	@FechaNacimiento DATE,
	@CorreoCorporativo VARCHAR(250) = NULL,
	@CorreoPersonal VARCHAR(250) = NULL,
	@Celular VARCHAR(15) = NULL,
	@Activo BIT,
	@UsuarioEdita VARCHAR(150),
	@FechaEdita DATETIME
 )   
AS
BEGIN
	UPDATE Empleado SET
		IdTipoDocumento = @IdTipoDocumento,
		NumeroDocumento = @NumeroDocumento,
		UiSap = @UiSap,
		Nombres = @Nombres,
		Apellidos = @Apellidos,
		IdArea = @IdArea,
		FechaNacimiento = @FechaNacimiento,
		CorreoCorporativo = @CorreoCorporativo,
		CorreoPersonal = @CorreoPersonal,
		Celular = @Celular,
		Activo = @Activo,
		UsuarioEdita = @UsuarioEdita,
		FechaEdita = @FechaEdita
	WHERE IdEmpleado = @IdEmpleado
END
GO

CREATE PROCEDURE [dbo].[USP_PLUS_Parametro_Get]
	@IdSecuencialPadre	INT 
AS
BEGIN
	SELECT	P.IdParametro,
			P.Nombre,
			P.IdSecuencial,
			P.Descripcion,
			P.Orden
	FROM Parametro AS P
	INNER JOIN Parametro AS PP ON PP.IdParametro = P.IdParametroPadre
	WHERE P.Activo = 1 AND PP.IdSecuencial = @IdSecuencialPadre
	ORDER BY P.Orden
END
GO

CREATE PROCEDURE [dbo].[USP_PLUS_Parametro_GetOne](
	@IdSecuencialPadre	INT,
	@IdSecuencial INT
)
AS
BEGIN
	SELECT	P.IdParametro,
			P.Nombre,
			P.IdSecuencial,
			P.Descripcion,
			P.Orden
	FROM Parametro AS P
	INNER JOIN Parametro AS PP ON PP.IdParametro = P.IdParametroPadre
	WHERE P.Activo = 1 AND PP.IdSecuencial = @IdSecuencialPadre AND P.IdSecuencial = @IdSecuencial
	ORDER BY P.Orden
END
GO

CREATE PROCEDURE [dbo].[USP_PLUS_Usuario_Get]
	@IdUsuario INT
AS
BEGIN
	SELECT
		U.IdUsuario,
		U.Cuenta,
		U.Correo,
		U.IdTipoDocumento,
		P1.Nombre TipoDocumento,
		U.NumeroDocumento,
		U.ApellidoPaterno,
		U.ApellidoMaterno,
		U.Nombres,
		U.Celular,
		U.Telefono,
		U.Activo
	FROM Usuario U
	INNER JOIN Parametro P1 ON U.IdTipoDocumento = P1.IdParametro    
	WHERE IdUsuario = @IdUsuario
END
GO

CREATE procedure [dbo].[USP_PLUS_Usuario_Insert](  
	@Cuenta VARCHAR(150),    
	@Clave VARCHAR(15),
	@Correo VARCHAR(100),    
	@IdTipoDocumento INT,    
	@NumeroDocumento VARCHAR(20),    
	@ApellidoPaterno VARCHAR(100),    
	@ApellidoMaterno VARCHAR(100),    
	@Nombres VARCHAR(100),    
	@Celular VARCHAR(15) = NULL,    
	@Telefono VARCHAR(15) = NULL,    
	@UsuarioRegistra VARCHAR(150),
	@FechaRegistra DATETIME
 )
AS
BEGIN
	DECLARE @IdUsuario INT

	INSERT INTO Usuario(
		Cuenta,
		Clave,
		Correo,
		IdTipoDocumento,
		NumeroDocumento,
		ApellidoPaterno,
		ApellidoMaterno,
		Nombres,
		Celular,
		Telefono,
		Activo,
		UsuarioCrea,
		FechaCrea
	)
	VALUES(
		@Cuenta,
		@Clave,
		@Correo,
		@IdTipoDocumento,
		@NumeroDocumento,
		@ApellidoPaterno,
		@ApellidoMaterno,
		@Nombres,
		@Celular,
		@Telefono,
		1,
		@UsuarioRegistra,
		@FechaRegistra
	)
	SET @IdUsuario = SCOPE_IDENTITY()
END
GO

CREATE PROCEDURE [dbo].[USP_PLUS_Usuario_Login] 
 @Bill    VARCHAR(80),  
 @Password   VARCHAR(50)  
AS  
	SELECT	U.IdUsuario,
			U.Cuenta,
			U.Correo,
			U.IdTipoDocumento,
			P1.Nombre TipoDocumento,
			U.NumeroDocumento,
			U.ApellidoPaterno,
			U.ApellidoMaterno,
			U.Nombres,
			U.Celular,
			U.Telefono,
			U.Activo
	FROM Usuario AS U 
	INNER JOIN Parametro P1 ON U.IdTipoDocumento = P1.IdParametro    
	WHERE U.Correo = @Bill AND U.Clave = @Password AND U.Activo = 1
GO

CREATE procedure [dbo].[USP_PLUS_Usuario_SearchPaginated](
	@offsetNumber INT,
	@pageSize  INT,
	@apellidos  VARCHAR(150) = NULL,
	@nombres  VARCHAR(100) = NULL,
	@activo   BIT = NULL,
	@totalRecords INT OUT
)
AS
BEGIN
	DECLARE	@apellidosText VARCHAR(150) = ISNULL(@apellidos, ''),
			@nombresText VARCHAR(100) = ISNULL(@nombres, '');
	SELECT 
		U.IdUsuario,
		U.Cuenta,
		U.Clave,
		U.Correo,
		U.IdTipoDocumento,
		P1.Nombre TipoDocumento,
		U.NumeroDocumento,
		U.ApellidoPaterno,
		U.ApellidoMaterno,
		U.Nombres,
		U.Celular,
		U.Telefono,
		U.Activo
	FROM Usuario U
	INNER JOIN Parametro P1 ON U.IdTipoDocumento = P1.IdParametro    

	WHERE U.Activo = IIF(@activo IS NOT NULL, @activo, U.Activo) 
			AND (
					ISNULL(ApellidoPaterno, '') LIKE '%' + @apellidosText + '%'
					OR ISNULL(ApellidoMaterno, '') LIKE '%' + @apellidosText + '%'
				)
			AND Nombres LIKE '%' + @nombresText + '%'
	ORDER BY IdUsuario 
	OFFSET @OffsetNumber ROWS FETCH NEXT @pageSize ROWS ONLY;

	SET @totalRecords = (    
		SELECT COUNT(1) FROM Usuario
		WHERE	Activo = IIF(@activo IS NOT NULL, @activo, Activo)   
				AND (
					ISNULL(ApellidoPaterno, '') LIKE '%' + @apellidosText + '%'
					OR ISNULL(ApellidoMaterno, '') LIKE '%' + @apellidosText + '%'
					)
				AND Nombres LIKE '%' + @nombresText + '%'  
		);
END
GO

CREATE procedure [dbo].[USP_PLUS_Usuario_Update](  
	@IdUsuario INT,
	@Cuenta VARCHAR(150),    
	@Clave VARCHAR(15),
	@Correo VARCHAR(100),    
	@IdTipoDocumento INT,    
	@NumeroDocumento VARCHAR(20),    
	@ApellidoPaterno VARCHAR(100),    
	@ApellidoMaterno VARCHAR(100),    
	@Nombres VARCHAR(100),    
	@Celular VARCHAR(15),    
	@Telefono VARCHAR(15),
	@Activo BIT,
	@UsuarioEdita VARCHAR(150),
	@FechaEdita DATETIME
 )   
AS
BEGIN
	UPDATE Usuario SET
		Cuenta = @Cuenta,
		Clave = @Clave,
		Correo = @Correo,
		IdTipoDocumento = @IdTipoDocumento,
		NumeroDocumento = @NumeroDocumento,
		ApellidoPaterno = @ApellidoPaterno,
		ApellidoMaterno = @ApellidoMaterno,
		Nombres = @Nombres,
		Celular = @Celular,
		Telefono = @Telefono,
		Activo = @Activo,
		UsuarioEdita = @UsuarioEdita,
		FechaEdita = @FechaEdita
	WHERE IdUsuario = @IdUsuario
END
GO

CREATE PROCEDURE [dbo].[USP_PLUS_Usuario_UpdatePassword]    
@IdUsuario  INT,    
@Clave VARCHAR(50)     
AS    
BEGIN    
 UPDATE Usuario     
 SET Clave = @Clave
 WHERE IdUsuario = @IdUsuario
END
GO

CREATE  PROCEDURE [dbo].[USP_PLUS_Usuario_ValidarNumeroDocumento]
@NumeroDocumento VARCHAR(20) AS
BEGIN
	SELECT COUNT(NumeroDocumento) as [Count] FROM Usuario WHERE NumeroDocumento = @NumeroDocumento
END
GO

CREATE PROCEDURE [dbo].[USP_PLUS_Usuario_ValidarToken]    
	@token VARCHAR(4000) AS
BEGIN      
	SELECT
		U.IdUsuario,
		U.Correo as Email,  
		U.Nombres as Usuario  
	FROM     
		CambioClave C INNER JOIN Usuario U ON C.IdUsuario = U.IdUsuario     
	WHERE 
		Token = ltrim(rtrim(@token))  AND C.Activo = 1
END 
GO

CREATE PROCEDURE [dbo].[USP_PLUS_Usuario_Validate]  
 @Bill    VARCHAR(80),  
 @Password   VARCHAR(50)  
AS  
	SELECT 1
	FROM Usuario
	WHERE Correo = @Bill AND Clave = @Password AND Activo = 1
GO

CREATE PROCEDURE [dbo].[USP_PLUS_Usuario_ValidEmail]
@Email VARCHAR(100) AS    
BEGIN    
 SELECT IdUsuario FROM Usuario WHERE Correo = @Email  AND Activo = 1  
END 
GO

CREATE procedure [dbo].[USP_PLUS_UsuarioPerfil_Get]
	@IdUsuario INT
AS
BEGIN
	SELECT   
		P.Nombres, 
		P.ApellidoPaterno,
		P.ApellidoMaterno,
		P.Celular,
		TD.nombre as 'TipoDocumento',         
		P.NumeroDocumento, 
		P.Correo,
		P.Cuenta
	FROM Usuario P         
		INNER JOIN Parametro TD ON P.IdTipoDocumento = TD.IdParametro
	WHERE IdUsuario = @IdUsuario
END
GO
