
-- trigger
DELIMITER $$
 
CREATE TRIGGER actualizar_estado_libro

AFTER INSERT ON tb_detalles_prestamos

FOR EACH ROW

BEGIN

    UPDATE tb_libros

    SET estado = 'Prestado'

    WHERE id_libro = NEW.id_libro;
 
END;

$$

-- Procedimiento almacenado tabla clientes
DELIMITER $$
CREATE PROCEDURE insercion_clientes(IN nombre VARCHAR(50), IN email VARCHAR(100), IN telefono VARCHAR(10))
BEGIN
INSERT INTO tb_clientes(nombre_cliente, email_cliente, telefono) VALUES (nombre, email, telefono);
END
$$


-- procedimiento almacenado tabla genero libros
DELIMITER $$
CREATE PROCEDURE insercion_genero_libros(nombre_genero VARCHAR(50))
BEGIN 
INSERT INTO tb_genero_libros(nombre_genero_libro) VALUES (nombre_genero);
END
$$

-- procedimiento almacenado tabla prestamos
DELIMITER $$
CREATE PROCEDURE insercion_prestamos(IN cliente VARCHAR(50),IN fch_inicio DATE, IN fch_devolucion DATE, IN estado ENUM('activo', 'inactivo'))
BEGIN
	DECLARE P_id_nombre VARCHAR(36);
    
    SELECT id_cliente INTO P_id_nombre FROM tb_clientes WHERE nombre_cliente = cliente;
    INSERT INTO tb_prestamos(id_cliente, fecha_inicio, fecha_devolucion, estado) VALUES (P_id_nombre, fch_inicio, fch_devolucion, estado);
END
$$



-- procedimiento almacenado tabla libros
DELIMITER $$
CREATE PROCEDURE insercion_libros(IN titulo VARCHAR(50), IN anio INT, IN nombre_genero VARCHAR(50), IN estado ENUM('disponible', 'prestado'))
BEGIN
	DECLARE p_id_genero VARCHAR(36);
    
    SELECT id_genero_libro INTO p_id_genero FROM tb_genero_libros WHERE nombre_genero_libro = nombre_genero;
    INSERT INTO tb_libros(titulo_libro, anio_publicacion, id_genero_libro, estado) VALUES (titulo, anio, p_id_genero, estado);
END
$$




-- procedimiento almacenado tabla detalles prestamos
DELIMITER $$
CREATE PROCEDURE insertar_detalle_prestamo(
    IN p_titulo_libro VARCHAR(50),
    IN p_fecha_inicio DATE,
    IN p_fecha_devolucion DATE
)
BEGIN
DECLARE p_id_libro VARCHAR(36);
DECLARE p_id_prestamo VARCHAR(36);
    SELECT id_prestamo INTO p_id_prestamo FROM tb_prestamos WHERE fecha_inicio = p_fecha_inicio AND fecha_devolucion = p_fecha_devolucion LIMIT 1;
    SELECT id_libro INTO p_id_libro FROM tb_libros WHERE titulo_libro = p_titulo_libro;
    INSERT INTO tb_detalles_prestamos (id_prestamo, id_libro) VALUES (p_id_prestamo, p_id_libro);
END
$$

-- insercion de datos del procedimiento insercion_clientes
CALL insercion_clientes ('Ana Pérez', 'ana.perez@gmail.com', '1234-5678');
CALL insercion_clientes ('Carlos García', 'carlos.garcia@hotmail.com', '0987-6543');
CALL insercion_clientes ('Luisa Rodríguez', 'luisa.rodriguez@yahoo.com', '2345-6789');
CALL insercion_clientes ('Pedro Sánchez', 'pedro.sanchez@outlook.com', '3456-7890');
CALL insercion_clientes ('María López', 'maria.lopez@libroexpress.com', '4567-8901');
CALL insercion_clientes ('Jorge Martínez', 'jorge.martinez@libroexpress.com', '5678-9012');
CALL insercion_clientes ('Sofía González', 'sofia.gonzalez@libroexpress.com', '6789-0123');
CALL insercion_clientes ('Juan Hernández', 'juan.hernandez@libroexpress.com', '7890-1234');
CALL insercion_clientes ('Laura Torres', 'laura.torres@libroexpress.com', '8901-2345');
CALL insercion_clientes ('Miguel Álvarez', 'miguel.alvarez@libroexpress.com', '9012-3456');
CALL insercion_clientes ('Elena Jiménez', 'elena.jimenez@libroexpress.com', '0123-4567');
CALL insercion_clientes ('Daniel Ruiz', 'daniel.ruiz@libroexpress.com', '1234-5098');
CALL insercion_clientes ('Sara Morales', 'sara.morales@libroexpress.com', '2345-6109');
CALL insercion_clientes ('José Ramírez', 'jose.ramirez@libroexpress.com', '3456-7210');
CALL insercion_clientes ('Carmen Díaz', 'carmen.diaz@libroexpress.com', '4567-8321');

-- insercion de datos del procedimiento insercion_genero_libros
CALL insercion_genero_libros ('Novela');
CALL insercion_genero_libros ('Poesía');
CALL insercion_genero_libros ('Ensayo');
CALL insercion_genero_libros ('Biografía');
CALL insercion_genero_libros ('Ciencia ficción');
CALL insercion_genero_libros ('Fantasía');
CALL insercion_genero_libros ('Terror');
CALL insercion_genero_libros ('Romance');
CALL insercion_genero_libros ('Histórica');
CALL insercion_genero_libros ('Policial');
CALL insercion_genero_libros ('Humor');
CALL insercion_genero_libros ('Autoayuda');
CALL insercion_genero_libros ('Infantil');
CALL insercion_genero_libros ('Juvenil');
CALL insercion_genero_libros ('Cómic');

-- insercion de datos del procedimiento insercion_prestamos
CALL insercion_prestamos ('Ana Pérez', '2024-01-01', '2024-01-15', 'activo');
CALL insercion_prestamos ('Carlos García', '2024-01-02', '2024-01-16', 'activo');
CALL insercion_prestamos ('Luisa Rodríguez', '2024-01-03', '2024-01-17', 'activo');
CALL insercion_prestamos ('Pedro Sánchez', '2024-01-04', '2024-01-18', 'activo');
CALL insercion_prestamos ('María López', '2024-01-05', '2024-01-19', 'activo');
CALL insercion_prestamos ('Jorge Martínez', '2024-01-06', '2024-01-20', 'activo');
CALL insercion_prestamos ('Sofía González', '2024-01-07', '2024-01-21', 'activo');
CALL insercion_prestamos ('Juan Hernández', '2024-01-08', '2024-01-22', 'activo');
CALL insercion_prestamos ('Laura Torres', '2024-01-09', '2024-01-23', 'activo');
CALL insercion_prestamos ('Miguel Álvarez', '2024-01-10', '2024-01-24', 'activo');
CALL insercion_prestamos ('Elena Jiménez', '2024-01-11', '2024-01-25', 'activo');
CALL insercion_prestamos ('Daniel Ruiz', '2024-01-12', '2024-01-26', 'activo');
CALL insercion_prestamos ('Sara Morales', '2024-01-13', '2024-01-27', 'activo');
CALL insercion_prestamos ('José Ramírez', '2024-01-14', '2024-01-28', 'activo');
CALL insercion_prestamos ('Carmen Díaz', '2024-01-15', '2024-01-29', 'activo');

-- insercion de datos del procedimiento insercion_libros
CALL insercion_libros ('Cien años de soledad', 1967, 'Novela', 'disponible');
CALL insercion_libros ('Veinte poemas de amor y una canción desesperada', 1924, 'Poesía', 'disponible');
CALL insercion_libros ('El origen de las especies', 1859, 'Ensayo', 'disponible');
CALL insercion_libros ('El diario de Ana Frank', 1947, 'Biografía', 'disponible');
CALL insercion_libros ('El juego de Ender', 1985, 'Ciencia ficción', 'disponible');
CALL insercion_libros ('El señor de los anillos', 1954, 'Fantasía', 'disponible');
CALL insercion_libros ('El resplandor', 1977, 'Terror', 'disponible');
CALL insercion_libros ('Orgullo y prejuicio', 1813, 'Romance', 'disponible');
CALL insercion_libros ('El nombre de la rosa', 1980, 'Histórica', 'disponible');
CALL insercion_libros ('El código Da Vinci', 2003, 'Policial', 'disponible');
CALL insercion_libros ('El principito', 1943, 'Humor', 'disponible');
CALL insercion_libros ('Los cuatro acuerdos', 1997, 'Autoayuda', 'disponible');
CALL insercion_libros ('Harry Potter y la piedra filosofal', 1997, 'Infantil', 'disponible');
CALL insercion_libros ('Los juegos del hambre', 2008, 'Juvenil', 'disponible');
CALL insercion_libros ('Maus', 1986, 'Cómic', 'disponible');

-- insercion de datos del procedimiento insertar_detalle_prestamo
CALL insertar_detalle_prestamo ('Cien años de soledad', '2024-01-01', '2024-01-15');
CALL insertar_detalle_prestamo ('Veinte poemas de amor y una canción desesperada', '2024-01-02', '2024-01-16');
CALL insertar_detalle_prestamo ('El origen de las especies', '2024-01-03', '2024-01-17');
CALL insertar_detalle_prestamo ('El diario de Ana Frank', '2024-01-04', '2024-01-18');
CALL insertar_detalle_prestamo ('El juego de Ender', '2024-01-05', '2024-01-19');
CALL insertar_detalle_prestamo ('El señor de los anillos', '2024-01-06', '2024-01-20');
CALL insertar_detalle_prestamo ('El resplandor', '2024-01-07', '2024-01-21');
CALL insertar_detalle_prestamo ('Orgullo y prejuicio', '2024-01-08', '2024-01-22');
CALL insertar_detalle_prestamo ('El nombre de la rosa', '2024-01-09', '2024-01-23');
CALL insertar_detalle_prestamo ('El código Da Vinci', '2024-01-10', '2024-01-24');
CALL insertar_detalle_prestamo ('El principito', '2024-01-11', '2024-01-25');
CALL insertar_detalle_prestamo ('Los cuatro acuerdos', '2024-01-12', '2024-01-26');
CALL insertar_detalle_prestamo ('Harry Potter y la piedra filosofal', '2024-01-13', '2024-01-27');
CALL insertar_detalle_prestamo ('Los juegos del hambre', '2024-01-14', '2024-01-28');
CALL insertar_detalle_prestamo ('Maus', '2024-01-15', '2024-01-29');



    





