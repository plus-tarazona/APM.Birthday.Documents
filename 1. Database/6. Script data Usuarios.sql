USE [DBNAME]
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Cuenta], [Clave], [Correo], [IdTipoDocumento], [NumeroDocumento], [ApellidoPaterno], [ApellidoMaterno], [Nombres], [Celular], [Telefono], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (2, N'manager', N'manager', N'manager', 2, N'99999999', N'manager', N'manager', N'manager', NULL, NULL, 1, N'MIGRACION', CAST(N'2021-09-09T19:14:55.410' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
