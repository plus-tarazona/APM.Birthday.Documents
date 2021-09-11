DECLARE @Fecha  DATETIME = GETDATE()
INSERT Parametro (IdParametro,IdParametroPadre,IdSecuencial,Nombre,Descripcion,Orden,Activo,FechaCrea,UsuarioCrea) VALUES
(1,NULL,1,'Tipo Documento Identidad',NULL,1,1,@Fecha,'MIGRACION'),
(2,1,1,'Dni',NULL,1,1,@Fecha,'MIGRACION'),
(3,1,2,'Carnet extranjeria',NULL,2,1,@Fecha,'MIGRACION'),
(4,1,3,'Pasaporte',NULL,3,1,@Fecha,'MIGRACION'),

(5,NULL,2,'Plantillas Correo',NULL,1,1,@Fecha,'MIGRACION'),
(6,5,1,'EmpleadoBirthdayToday','C:\APM-2680218\PLANTILLAS\EmpleadoBirthdayToday.html',1,1,@Fecha,'MIGRACION'),
(7,5,2,'Olvidaste Contraseña','Content\Templates\OlvidasteContrasenia.html',2,1,@Fecha,'MIGRACION'),
(8,5,3,'Restauracion Correo','Content\Templates\RestauracionCorreo.html',3,1,@Fecha,'MIGRACION'),

(9,NULL,1,'Sistema',NULL,1,1,@Fecha,'MIGRACION'),
(10,9,1,'Url Cambio Clave','http://177.85.33.53:29476/portal/change-pwd/',1,1,@Fecha,'MIGRACION')