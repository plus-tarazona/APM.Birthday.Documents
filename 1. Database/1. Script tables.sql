USE [DBNAME]
CREATE TABLE [dbo].[Area](
	[IdArea] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Activo] [bit] NULL,
	[UsuarioCrea] [varchar](20) NOT NULL,
	[FechaCrea] [datetime] NOT NULL,
	[UsuarioEdita] [varchar](20) NULL,
	[FechaEdita] [datetime] NULL,
	PRIMARY KEY ([IdArea])
) 
GO
CREATE TABLE [dbo].[CambioClave](
	[IdCambioClave] [int] IDENTITY(1,1) NOT NULL,
	[Token] [varchar](4000) NOT NULL,
	[FechaGeneracion] [datetime] NOT NULL,
	[FechaExpiracion] [datetime] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
    PRIMARY KEY([IdCambioClave])
) 
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[NumeroDocumento] [varchar](20) NOT NULL,
	[UiSap] [varchar](20) NULL,
	[IdArea] [int] NOT NULL,
	[Nombres] [varchar](100) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[CorreoCorporativo] [varchar](250) NULL,
	[CorreoPersonal] [varchar](250) NULL,
	[Celular] [varchar](15) NULL,
	[Activo] [bit] NOT NULL,
	[UsuarioCrea] [varchar](150) NOT NULL,
	[FechaCrea] [datetime] NOT NULL,
	[UsuarioEdita] [varchar](150) NULL,
	[FechaEdita] [datetime] NULL,
	PRIMARY KEY ([IdEmpleado])
) 
GO
CREATE TABLE [dbo].[Parametro](
	[IdParametro] [int] NOT NULL,
	[IdParametroPadre] [int] NULL,
	[IdSecuencial] [int] NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Descripcion] [varchar](250) NULL,
	[Orden] [int] NOT NULL,
	[Activo] [bit] NULL,
	[FechaCrea] [datetime] NOT NULL,
	[UsuarioCrea] [varchar](20) NOT NULL,
	[FechaEdita] [datetime] NULL,
	[UsuarioEdita] [varchar](20) NULL,
	PRIMARY KEY ([IdParametro])
)
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Cuenta] [varchar](150) NOT NULL,
	[Clave] [varchar](15) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[NumeroDocumento] [varchar](20) NOT NULL,
	[ApellidoPaterno] [varchar](100) NOT NULL,
	[ApellidoMaterno] [varchar](100) NOT NULL,
	[Nombres] [varchar](100) NOT NULL,
	[Celular] [varchar](15) NULL,
	[Telefono] [varchar](15) NULL,
	[Activo] [bit] NOT NULL,
	[UsuarioCrea] [varchar](150) NOT NULL,
	[FechaCrea] [datetime] NOT NULL,
	[UsuarioEdita] [varchar](150) NULL,
	[FechaEdita] [datetime] NULL,
    PRIMARY KEY ([IdUsuario])
) 
GO
ALTER TABLE [dbo].[CambioClave]  WITH CHECK ADD  CONSTRAINT [FK_CambioClave_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[CambioClave] CHECK CONSTRAINT [FK_CambioClave_Usuario]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Area] FOREIGN KEY([IdArea])
REFERENCES [dbo].[Area] ([IdArea])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Area]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Parametro] FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[Parametro] ([IdParametro])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Parametro]
GO