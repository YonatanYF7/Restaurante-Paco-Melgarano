create database restaurante;
use  restaurante;

create table persona(
idPersona int primary key,
nombre varchar(50),
apellido varchar(50),
sexo char(10),
telefono int,
idDireccion int,
foreign key (idDireccion) references direccion (idDireccion)
);

create table direccion(
idDireccion int primary key,
ciudad varchar(50),
zona varchar(50),
calle varchar(50),
nroCasa int
);

create table empleado(
idEmpleado int primary key,
cargo char(20),
idPersona int,
foreign key (idPersona) references persona (idPersona)
);

create table usuario(
idUsuario int primary key,
nombreUsuario varchar(50),
contraseña blob,
estadoUsuario char(10),
idEmpleado int,
foreign key (idEmpleado) references empleado (idEmpleado) 
);

create table proveedor(
idProveedor int primary key,
nombreProveedor varchar (50),
sitioWeb varchar (50),
idCategoriaInsumos int,
foreign key (idCategoriaInsumos) references categoriaInsumos (idCategoriaInsumos)
);

create table categoriaInsumos(
idCategoriaInsumos int primary key,
nombreCategoriaInsumos varchar (50)
);

create table producto(
idProducto int primary key,
nombreProducto varchar (50),
idCategoria int,
foreign key (idCategoria) references categoria(idCategoria)
);

create table categoria(
idCategoria int primary key,
nombreCategoria varchar (50)
);

create table cliente (
idCliente int primary key,
nit int,
estado char(10),
idPersona int,
foreign key (idPersona) references persona (idPersona)
);

create table menu(
idMenu int primary key,
nombrePlato varchar(50),
precioPlato float,
idProducto int,
foreign key (idProducto) references producto(idProducto)
);

create table orden(
idOrden int primary key,
cantidad int,
idCliente int,
idMenu int,
foreign key (idCliente) references cliente (idCliente),
foreign key (idMenu) references menu (idMenu)
);

create table produc_Menu(
idProduc_Menu int primary key,
cantidad int,
precioTotal float,
idProducto int,
idMenu int,
foreign key (idProducto) references producto (idProducto),
foreign key (idMenu) references menu(idMenu)
);

create table venta(
idVenta int primary key,
fecha date,
nombreProducto varchar(50),
precioProducto float,
idOrden int,
idEmpleado int,
foreign key (idOrden) references orden (idOrden),
foreign key (idEmpleado) references empleado(idEmpleado)
);

create table pago(
idPago int primary key,
montoCobrar float,
montoRecibido float,
cambio float,
idVenta int,
foreign key (idVenta) references venta (idVenta)
);