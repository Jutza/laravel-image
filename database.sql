CREATE DATABASE IF NOT EXISTS laravel_master;
USE laravel_master;

CREATE TABLE IF NOT EXISTS users(
    id              int(255) auto_increment not null,
    role            VARCHAR(20),
    name            VARCHAR(100),
    surname         VARCHAR(200),
    nick            VARCHAR(100),
    email           VARCHAR(255),
    password        VARCHAR(255),
    image           VARCHAR(255),
    created_at      DATETIME,
    updated_at      DATETIME,
    remember_token  VARCHAR(255),
    CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb;

INSERT INTO users VALUES(null, 'user', 'Ivan', 'Ruiz', 'Jutza', 'manuelivanruiz@gmail.com', 'pass', null, CURTIME(), CURTIME(), NULL );
INSERT INTO users VALUES(null, 'user', 'Jose', 'Francisco', 'Chico', 'jose@gmail.com', 'pass', null, CURTIME(), CURTIME(), NULL );
INSERT INTO users VALUES(null, 'user', 'Manuel', 'Jesus', 'Manchado', 'manueljesus@gmail.com', 'pass', null, CURTIME(), CURTIME(), NULL );

CREATE TABLE IF NOT EXISTS images(
    id              INT(255) auto_increment not null,
    user_id         INT(255),
    image_path      VARCHAR(255),
    DESCRIPTION     text,
    created_at      DATETIME,
    updated_at      DATETIME,
    CONSTRAINT pk_images PRIMARY KEY(id),
    CONSTRAINT fk_images_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDb;

INSERT INTO images VALUES(null, 1, 'ruiz.jpg', 'desc1', CURTIME(), CURTIME());
INSERT INTO images VALUES(null, 2, 'carmelo.jpg', 'desc2', CURTIME(), CURTIME());
INSERT INTO images VALUES(null, 3, 'castillo.jpg', 'desc3', CURTIME(), CURTIME());

CREATE TABLE IF NOT EXISTS comments(
    id              INT(255) auto_increment not null,
    user_id         INT(255),
    image_id        INT(255),
    content         text,
    created_at      DATETIME,
    updated_at      DATETIME,
    CONSTRAINT pk_comments PRIMARY KEY(id),
    CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id),
    CONSTRAINT fk_comments_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDb;

INSERT INTO comments VALUES(null, 1, 3,'nice-su', CURTIME(), CURTIME());
INSERT INTO comments VALUES(null, 1, 2,'OwO', CURTIME(), CURTIME());
INSERT INTO comments VALUES(null, 2, 1,'casita', CURTIME(), CURTIME());
INSERT INTO comments VALUES(null, 2, 3, 'playa', CURTIME(), CURTIME());
INSERT INTO comments VALUES(null, 3, 2,'carro', CURTIME(), CURTIME());
INSERT INTO comments VALUES(null, 3, 1,'UwU', CURTIME(), CURTIME());

CREATE TABLE IF NOT EXISTS likes(
    id              INT(255) auto_increment not null,
    user_id         INT(255),
    image_id        INT(255),
    created_at      DATETIME,
    updated_at      DATETIME,
    CONSTRAINT pk_likes PRIMARY KEY(id),
    CONSTRAINT fk_likes_users FOREIGN KEY(user_id) REFERENCES users(id),
    CONSTRAINT fk_likes_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDb;

INSERT INTO likes VALUES(null, 1, 2, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 1, 3, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 2, 1, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 2, 3, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 3, 1, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 3, 2, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 3, 3, CURTIME(), CURTIME());