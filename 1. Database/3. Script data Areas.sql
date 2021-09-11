USE [DBNAME]
GO
SET IDENTITY_INSERT [dbo].[Area] ON 
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (1, N'MANTENIMIENTO', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (2, N'OPERACIONES', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (3, N'RECURSOS HUMANOS', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (4, N'LEGAL', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (5, N'FINANZAS', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (6, N'TRANSFORMACIÓN', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (7, N'HSSE', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (8, N'IMPLEMENTACIÓN Y PROYECTO', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (9, N'SISTEMAS', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (10, N'COMERCIAL', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (11, N'GERENCIA', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (12, N'LEGAL Y RELACIONES LABORALES', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (13, N'IMPLEMENTACIÓN_Y_PROYECTO', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Area] ([IdArea], [Nombre], [Activo], [UsuarioCrea], [FechaCrea], [UsuarioEdita], [FechaEdita]) VALUES (14, N'TRANSFORMACION', 1, N'MIGRACION', CAST(N'2021-09-09T03:46:54.783' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SELECT * FROM Area
GO
