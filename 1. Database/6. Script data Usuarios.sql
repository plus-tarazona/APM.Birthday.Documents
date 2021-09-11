DECLARE @Fecha  DATETIME = GETDATE()
INSERT INTO Usuario
(Cuenta,Clave,Correo,IdTipoDocumento,NumeroDocumento,ApellidoPaterno,ApellidoMaterno, Nombres,Activo,UsuarioCrea,FechaCrea) VALUES
('manager','manager','manager',2,'99999999','manager','manager','manager',1,'MIGRACION',@Fecha)