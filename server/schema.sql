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
    compartir_id INT,
    FOREIGN KEY (tarea_id) REFERENCES tareas(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (compartir_id) REFERENCES usuarios(id)
);

--Insertar dos usuarios:
INSERT INTO usuarios (nombre, email, password) VALUES ("Camilo", "camilo@gmail.com", "123");
INSERT INTO usuarios (nombre, email, password) VALUES ("David", "david@gmail.com", "123");

--Insertar tareas:
INSERT INTO tareas (titulo, usuario_id) 
VALUES("Hacer lagartijas 💪🏻",1), ("Preparar desayuno ☕",1), ("Leer mi libro📚",1), ("Bañarme 🛁🚿",1), ("Ir al gym 🏋",1);

-- Compartir tarea:
INSERT INTO tareas_compartidas (tarea_id, usuario_id, compartir_id) VALUES (1,1,2);

--verificar su insersion
select tareas.*, tareas_compartidas.compartir_id
from tareas
left join tareas_compartidas on tareas.id=tareas_compartidas.tarea_id
where tareas.usuario_id=2 or tareas_compartidas.compartir_id=2;