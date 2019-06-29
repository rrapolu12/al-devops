DROP DATABASE IF EXISTS autologic;
CREATE DATABASE IF NOT EXISTS autologic;
USE autologic;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS users;

/*!50503 set default_storage_engine = InnoDB */;
/*!50503 select CONCAT('storage engine: ', @@default_storage_engine) as INFO */;

CREATE TABLE users (
    id      INT             NOT NULL,
    name    VARCHAR(50)     NOT NULL,
    email   VARCHAR(255)     NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO users VALUES (1,'Mark Twain','mtwain@example.com');
INSERT INTO users VALUES (2,'Charles Darwin','cdarwain@example.com');
INSERT INTO users VALUES (3,'Automation Logic','alogic@example.com');

SELECT * FROM users;
