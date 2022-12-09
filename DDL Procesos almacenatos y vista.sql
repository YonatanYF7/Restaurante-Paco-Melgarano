use restaurante;
-- PROCEDIMIENTOS ALMACENADOS
-- #1 Insertar Productos
delimiter $$
CREATE PROCEDURE  insertarProductos(
in varId int,
in varNombreProducto varchar(50),
in varidCategoria int
)
BEGIN
insert into producto values (varId,varNombreProducto,varidCategoria); 
END $$

call insertarProductos (1,'Hamburguesa',1);

-- #2 Insertar Categoria
delimiter $$
CREATE PROCEDURE  insertarCategoria(
in varId int,
in varNombreCategoria varchar(50)
)
BEGIN
insert into categoria values (varId,varNombreCategoria); 
END $$

call insertarCategoria (1,'alimentos');

-- #3 Insertar Personas
delimiter $$
CREATE PROCEDURE  insertarPersonas(
in varId int,
in varNombre varchar(50),
in varApellido varchar(50),
in varSexo char(10),
in varTelefono int,
in varIdDireccion int
)
BEGIN
insert into persona values (varId,varNombre,varApellido,varSexo,varTelefono,varIdDireccion); 
END $$

call insertarPersonas (1,'Yonatan','Flores', 'Masculino', 75557296,1);

-- #4 Insertar Direcciones
delimiter $$
CREATE PROCEDURE  insertarDireccion(
in varId int,
in varCiudad varchar(50),
in varZona varchar(50),
in varCalle varchar(50),
in varNroCasa int
)
BEGIN
insert into direccion values (varId,varCiudad,varZona,varCalle,varNroCasa); 
END $$

CALL insertarDireccion();

-- #5 Insertar Empleados
delimiter $$
CREATE PROCEDURE  insertarEmpleados(
in varId int,
in varCargo char(20),
in varIdPersona int
)
BEGIN
insert into empleado values (varId,varCargo,varIdPersona); 
END $$

call insertarEmpleados (1,'cocinero',1);

-- #6 Insertar Usuarios
delimiter $$
CREATE PROCEDURE  insertarUsuarios(
in varId int,
in varNombreUsuario varchar(50),
in varContraseña blob,
in varEstadoUsuario char(10),
in varIdEmpleados int
)
BEGIN
insert into usuario values (varId,varNombreUsuario, varContraseña, varEstadoUsuario,varIdEmpleados);
END $$

call insertarUsuarios (1,'Yonatan', aes_encrypt('yonatan777','xyz321'), 'activo',1);
select cast(aes_decrypt(contraseña,'xyz321') as char)as Contraseña from usuario;

-- #7 Cambiar Contraseña
delimiter $$
CREATE PROCEDURE  cambiarContraseñaUsuario(
in varId int,
in varContraseña blob
)
BEGIN
update usuario set contraseña=varContraseña Where idUsuario = varId;
END $$

call cambiarContraseñaUsuario(1, aes_encrypt('yonatan123','xyz7'));
select cast(aes_decrypt(contraseña,'xyz7') as char)as Contraseña from usuario;

--  VISTA
# 1 Listar Menu
CREATE VIEW listarMenu AS 
select m.nombrePlato,m.precioPlato,p.nombreProducto
from menu m,producto p
where m.idProducto=p.idProducto;

select * from listarMenu

-- #2 Listar Empleados
create view listarEmpleados as
select p.Nombre,p.apellido,p.sexo,e.cargo
from persona p,empleado e
where p.idPersona=e.idPersona;

select * from listarEmpleados;

-- #3 Listar Clientes
create view listarClientes as
select p.Nombre,p.apellido,p.sexo,c.nit,c.estado
from persona p,cliente c
where p.idPersona=c.idPersona;


select * from listarClientes;