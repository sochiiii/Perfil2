DROP DATABASE IF EXISTS libro_Express;

CREATE DATABASE libro_express;
USE libro_express;

CREATE TABLE tb_clientes(
	id_cliente VARCHAR(36) PRIMARY KEY DEFAULT (UUID()) ,
    nombre_cliente VARCHAR(50) NOT NULL,
    email_cliente VARCHAR(100) NOT NULL,
    CONSTRAINT unique_email_cliente UNIQUE(email_cliente),
    telefono VARCHAR(10) NOT NULL,
    CONSTRAINT unique_telefono UNIQUE(telefono)
);

CREATE TABLE tb_genero_libros(
	id_genero_libro VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    nombre_genero_libro VARCHAR(50) NOT NULL
);

CREATE TABLE tb_prestamos(
	id_prestamo VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    id_cliente VARCHAR(36) NOT NULL,
    CONSTRAINT id_cliente_prestamo FOREIGN KEY(id_cliente) REFERENCES tb_clientes(id_cliente),
    fecha_inicio DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    CONSTRAINT check_fecha CHECK (fecha_inicio < fecha_devolucion),
    estado ENUM('activo', 'inactivo')
);

CREATE TABLE tb_libros(
	id_libro VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    titulo_libro VARCHAR(50) NOT NULL,
    anio_publicacion INT NOT NULL,
    CONSTRAINT check_anio_publicacion CHECK(anio_publicacion > 0 AND anio_publicacion < 2025),
    id_genero_libro VARCHAR(36) NOT NULL,
    CONSTRAINT id_genero_tblibro FOREIGN KEY (id_genero_libro) REFERENCES tb_genero_libros(id_genero_libro),
    estado ENUM('disponible', 'prestado')
);

CREATE TABLE tb_detalles_prestamos(
	id_detalle_prestamo VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
    id_prestamo VARCHAR(36) NOT NULL,
	CONSTRAINT id_prestamo_detalle FOREIGN KEY (id_prestamo) REFERENCES tb_prestamos(id_prestamo),
    id_libro VARCHAR(36) NOT NULL,
    CONSTRAINT id_libro_detalle FOREIGN KEY (id_libro) REFERENCES tb_libros(id_libro)
);
