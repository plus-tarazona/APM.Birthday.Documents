USE [DBNAME]
GO
INSERT [dbo].[Parametro] ([IdParametro], [IdParametroPadre], [IdSecuencial], [Nombre], [Descripcion], [Orden], [Activo], [FechaCrea], [UsuarioCrea], [FechaEdita], [UsuarioEdita]) VALUES (1, NULL, 1, N'Tipo Documento Identidad', NULL, 1, 1, CAST(N'2021-09-09T19:13:26.123' AS DateTime), N'MIGRACION', NULL, NULL)
GO
INSERT [dbo].[Parametro] ([IdParametro], [IdParametroPadre], [IdSecuencial], [Nombre], [Descripcion], [Orden], [Activo], [FechaCrea], [UsuarioCrea], [FechaEdita], [UsuarioEdita]) VALUES (2, 1, 1, N'Dni', NULL, 1, 1, CAST(N'2021-09-09T19:13:26.123' AS DateTime), N'MIGRACION', NULL, NULL)
GO
INSERT [dbo].[Parametro] ([IdParametro], [IdParametroPadre], [IdSecuencial], [Nombre], [Descripcion], [Orden], [Activo], [FechaCrea], [UsuarioCrea], [FechaEdita], [UsuarioEdita]) VALUES (3, 1, 2, N'Carnet extranjeria', NULL, 2, 1, CAST(N'2021-09-09T19:13:26.123' AS DateTime), N'MIGRACION', NULL, NULL)
GO
INSERT [dbo].[Parametro] ([IdParametro], [IdParametroPadre], [IdSecuencial], [Nombre], [Descripcion], [Orden], [Activo], [FechaCrea], [UsuarioCrea], [FechaEdita], [UsuarioEdita]) VALUES (4, 1, 3, N'Pasaporte', NULL, 3, 1, CAST(N'2021-09-09T19:13:26.123' AS DateTime), N'MIGRACION', NULL, NULL)
GO
INSERT [dbo].[Parametro] ([IdParametro], [IdParametroPadre], [IdSecuencial], [Nombre], [Descripcion], [Orden], [Activo], [FechaCrea], [UsuarioCrea], [FechaEdita], [UsuarioEdita]) VALUES (5, NULL, 2, N'Plantillas Correo', NULL, 1, 1, CAST(N'2021-09-09T19:13:26.123' AS DateTime), N'MIGRACION', NULL, NULL)
GO
INSERT [dbo].[Parametro] ([IdParametro], [IdParametroPadre], [IdSecuencial], [Nombre], [Descripcion], [Orden], [Activo], [FechaCrea], [UsuarioCrea], [FechaEdita], [UsuarioEdita]) VALUES (6, 5, 1, N'EmpleadoBirthdayToday', N'C:\APM-2680218\PLANTILLAS\EmpleadoBirthdayToday.html', 1, 1, CAST(N'2021-09-09T19:13:26.123' AS DateTime), N'MIGRACION', NULL, NULL)
GO
INSERT [dbo].[Parametro] ([IdParametro], [IdParametroPadre], [IdSecuencial], [Nombre], [Descripcion], [Orden], [Activo], [FechaCrea], [UsuarioCrea], [FechaEdita], [UsuarioEdita]) VALUES (7, 5, 2, N'Olvidaste Contraseña', N'Content\Templates\OlvidasteContrasenia.html', 2, 1, CAST(N'2021-09-09T19:13:26.123' AS DateTime), N'MIGRACION', NULL, NULL)
GO
INSERT [dbo].[Parametro] ([IdParametro], [IdParametroPadre], [IdSecuencial], [Nombre], [Descripcion], [Orden], [Activo], [FechaCrea], [UsuarioCrea], [FechaEdita], [UsuarioEdita]) VALUES (8, 5, 3, N'Restauracion Correo', N'Content\Templates\RestauracionCorreo.html', 3, 1, CAST(N'2021-09-09T19:13:26.123' AS DateTime), N'MIGRACION', NULL, NULL)
GO
INSERT [dbo].[Parametro] ([IdParametro], [IdParametroPadre], [IdSecuencial], [Nombre], [Descripcion], [Orden], [Activo], [FechaCrea], [UsuarioCrea], [FechaEdita], [UsuarioEdita]) VALUES (9, NULL, 3, N'Sistema', NULL, 1, 1, CAST(N'2021-09-09T19:13:26.123' AS DateTime), N'MIGRACION', NULL, NULL)
GO
INSERT [dbo].[Parametro] ([IdParametro], [IdParametroPadre], [IdSecuencial], [Nombre], [Descripcion], [Orden], [Activo], [FechaCrea], [UsuarioCrea], [FechaEdita], [UsuarioEdita]) VALUES (10, 9, 1, N'Url Cambio Clave', N'http://177.85.33.53:29476/portal/change-pwd/', 1, 1, CAST(N'2021-09-09T19:13:26.123' AS DateTime), N'MIGRACION', NULL, NULL)
GO
SELECT * FROM Parametro
GO