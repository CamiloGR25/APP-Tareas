CREATE DATABASE APP_Tareas; --Crear la BD

USE APP_Tareas; --Entrar a la BD
SHOW TABLES; --mostrar las tablas dentro de la BD

--Crear la tabla usuarios
CREATE TABLE usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100)NOT NULL
);

--Crear la tabla tareas
CREATE TABLE tareas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    completado BOOLEAN DEFAULT false,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE 
    --elimina todas las tareas del usuario eliminado con el ON DELETE CASCADE
);

--Crear la tabla tareas compartidas (la que va en relacion a muchos a muchos)
CREATE TABLE tareas_compartidas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tarea_id INT,
    usuario_id INT,
    FOREIGN KEY (tarea_id) REFERENCES tareas(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);