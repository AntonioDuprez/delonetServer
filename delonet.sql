/**************************************************************************/
/*Este script SQL crea la base de datos delonet y todas sus tablas*/
/*************************************************************************/

/*Borramos, si existe, una base de datos anterior */
DROP DATABASE IF EXISTS delonet;

/*Creamos la base de datos llamada delonet */
CREATE DATABASE delonet
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

use delonet;

/***********************/
/* TABLA: usuarios     */
/***********************/
CREATE TABLE delonet.usuarios (
 email VARCHAR(50) PRIMARY KEY,
 passwrd VARCHAR(30),
 is_admin TINYINT(1),
 profile_image VARCHAR(100)
) ENGINE=INNODB;


/***********************/
/* TABLA: clases       */
/***********************/
CREATE TABLE delonet.clases (
 id_clase INT(11) AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(40),
 num_plazas INT(2),
 edad_maxima INT(2),
 nivel VARCHAR(30),
 hora TIME,
 dias VARCHAR(40)
) ENGINE=INNODB;






/***********************/
/* TABLA: socios       */
/***********************/
CREATE TABLE delonet.socios (
 id_socio INT(11) AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(30),
 apellidos VARCHAR(30),
 direccion VARCHAR(50),
 fecha_alta DATE,
 fecha_baja DATE,
 telefono VARCHAR(15),
 id_clase INT(11),
 email VARCHAR(50),
 FOREIGN KEY (id_clase)
 REFERENCES clases(id_clase)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (email)
 REFERENCES usuarios(email)
 ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;


/***********************/
/* TABLA: monitores    */
/***********************/
CREATE TABLE delonet.monitores (
 id_monitor INT(11) AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(30),
 apellidos VARCHAR(30),
 direccion VARCHAR(50),
 telefono VARCHAR(15),
 email VARCHAR(50),
 FOREIGN KEY (email)
 REFERENCES usuarios(email)
 ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;


/***********************/
/* TABLA: calles       */
/***********************/
CREATE TABLE delonet.calles (
 id_calle INT(11) AUTO_INCREMENT PRIMARY KEY,
 velocidad VARCHAR(30),
 complementos TINYINT(1)
) ENGINE=INNODB;
/***********************/
/* TABLA: complementos */
/***********************/
CREATE TABLE delonet.complementos (
 id_complemento INT(11) AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(40),
 existencias INT(3)
) ENGINE=INNODB;


/***********************/
/* TABLA: reservas     */
/***********************/
CREATE TABLE delonet.reservas (
 id_reserva INT(11) AUTO_INCREMENT PRIMARY KEY,
 id_socio INT(11),
 id_calle INT(11),
 id_clase INT(11),
 fecha DATE,
 hora TIME,
 FOREIGN KEY (id_socio)
 REFERENCES socios(id_socio)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (id_calle)
 REFERENCES calles(id_calle)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (id_clase)
 REFERENCES clases(id_clase)
 ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;


/***********************/
/* TABLA: clasesMonitores */
/***********************/
CREATE TABLE delonet.clasesMonitores (
 id_monitor INT(11),
 id_clase INT(11),
 PRIMARY KEY (id_monitor, id_clase),
 FOREIGN KEY (id_monitor)
 REFERENCES monitores(id_monitor)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (id_clase)
 REFERENCES clases(id_clase)
 ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;
/***********************/
/* TABLA: callesClases */
/***********************/
CREATE TABLE delonet.callesClases (
 id_calle INT(11),
 id_clase INT(11),
 PRIMARY KEY (id_calle, id_clase),
 FOREIGN KEY (id_calle)
 REFERENCES calles(id_calle)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (id_clase)
 REFERENCES clases(id_clase)
 ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;


/***********************/
/* TABLA: complementosClases */
/***********************/
CREATE TABLE delonet.complementosClases (
 id_complemento INT(11),
 id_clase INT(11),
 cantidad INT(2),
 PRIMARY KEY (id_complemento, id_clase),
 FOREIGN KEY (id_complemento)
 REFERENCES complementos(id_complemento)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (id_clase)
 REFERENCES clases(id_clase)
 ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB;















/****************************************************************************************
Estas sentencias SQL insertan en las tablas de delonet un conjunto de datos de prueba
****************************************************************************************/
USE delonet;


/***********************/
/* TABLA: usuarios       */
/***********************/

INSERT INTO usuarios (email, passwrd, is_admin, profile_image)
VALUES ('adrian@delonet.com', '123456', 1, ''),
('laura@delonet.com', '123456', 1, ''),
('gabriel@delonet.com', '123456', 1, ''),
('juan@gmail.com', '123456', 0, ''),
('antonio@gmail.com', '123456', 0, ''),
('alicia@gmail.com', '123456', 0, ''),
('fran@gmail.com', '123456', 0, ''),
('estefania@gmail.com', '123456', 0, ''),
('jose@gmail.com', '123456', 0, '');


/***********************/
/* TABLA: clases       */
/***********************/

INSERT INTO clases (nombre, num_plazas, edad_maxima, nivel, hora, dias)
VALUES ('Aquagym', 10, null, 'Principiante', '20:30:00', 'Viernes'),
('Natación Infantil', 10, 10, 'Principiante', '16:30:00', 'Lunes, Miércoles'),
('Natación Infantil', 10, 10, 'Principiante', '17:30:00', 'Lunes, Miércoles'),
('Natación Iniciación', 10, null, 'Principiante', '18:30:00', 'Martes, Jueves'),
('Natación Iniciación', 10, null, 'Principiante', '19:30:00', 'Martes, Jueves'),
('Natación Iniciación', 10, null, 'Principiante', '20:30:00', 'Martes, Jueves'),
('Natación Avanzado', 10, null, 'Avanzado', '18:30:00', 'Lunes, Miércoles'),
('Natación Avanzado', 10, null, 'Avanzado', '19:30:00', 'Lunes, Miércoles');











/***********************/
/* TABLA: socios       */
/***********************/

INSERT INTO socios (nombre, apellidos, direccion, fecha_alta, fecha_baja, telefono, id_clase, email)
VALUES ('Juan', 'Martin', 'C/ Laujar de Andarax 37, Vicar', '2018/06/02', '2018/07/02', '666112233', 7, 'juan@gmail.com'),
('Antonio', 'Duprez', 'C/ Costa Blanca 11, Aguadulce', '2018/06/15', '2018/07/15', '666445566', 5, 'antonio@gmail.com'),
('Alicia', 'Rodriguez', 'C/ Blanca 6, Aguadulce', '2018/06/28', '2018/07/28', '612345678', 2, 'alicia@gmail.com'),
('Fran', 'Ruiz', 'C/ Verde 12, Almeria', '2018/06/25', '2018/07/25', '601234567', 7, 'fran@gmail.com'),
('Estefanía', 'Padilla', 'C/ Rojo 43, Vicar', '2018/06/11', '2018/07/11', '656789812', 5, 'estefania@gmail.com'),
('Jose', 'Díaz', 'C/ Amarilla 15, El Ejido', '2018/06/06', '2018/07/06', '654267111', 1, 'jose@gmail.com');


/***********************/
/* TABLA: monitores    */
/***********************/

INSERT INTO monitores (nombre, apellidos, direccion, telefono, email)
VALUES ('Adrián', 'Roda', 'C/ Ancha 12, Vícar', 612345122, 'adrian@delonet.com'),
('Laura', 'Alcántara', 'C/ Estrecha 27, Vícar', 678568765, 'laura@delonet.com'),
('Gabriel', 'Manzano', 'C/ Intermedia 7, Vícar', 609675493, 'gabriel@delonet.com');


/***********************/
/* TABLA: calles       */
/***********************/

INSERT INTO calles (velocidad, complementos)
VALUES ('Lenta', 1),
('Rápida', 1),
('Lenta', 0),
('Rápida', 0),
('Rápida', 1),
('Lenta', 0);





/***********************/
/* TABLA: complementos */
/***********************/

INSERT INTO complementos (nombre, existencias)
VALUES ('Pullboy', 10),
('Aletas pies', 6),
('Aletas manos', 6),
('Churro', 20),
('Pelota', 15),
('Tabla', 20),
('Anilla', 20);


/***********************/
/* TABLA: reservas     */
/***********************/

INSERT INTO reservas (id_socio, id_calle, id_clase, fecha, hora)
VALUES (1, 4, null, '2018/07/01', '17:30:00'),
(1, 4, null, '2018/07/02', '18:30:00'),
(null, 1, 7, '2018/07/03', '19:30:00'),
(null, 2, 7, '2018/07/03', '19:30:00');


/***********************/
/* TABLA: clasesMonitores */
/***********************/

INSERT INTO clasesMonitores (id_monitor, id_clase)
VALUES (1, 1),
(2, 2),
(3, 2),
(2, 5),
(3, 7);











/***********************/
/* TABLA: callesClases */
/***********************/

INSERT INTO callesClases (id_calle, id_clase)
VALUES (5, 1),
(6, 1),
(1, 2),
(2, 2),
(5, 5),
(6, 5),
(1, 7),
(2, 7);


/***********************/
/* TABLA: complementosClases */
/***********************/

INSERT INTO complementosClases (id_complemento, id_clase, cantidad)
VALUES (1, 7, 2),
(7, 2, 1),
(5, 2, 1),
(5, 1, 1),
(4, 1, 1);