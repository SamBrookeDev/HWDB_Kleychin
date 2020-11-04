CREATE DATABASE MyDB;
USE myDB;

CREATE TABLE emploees
(
    id        INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    full_name VARCHAR(50),
    tel       BIGINT

);

CREATE TABLE salary_and_position
(
    id       INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    salary   INT,
    position VARCHAR(50)
);

CREATE TABLE private_information
(
    id             INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    marital_status VARCHAR(7),
    DoB            DATE,
    city           VARCHAR(50)
);

INSERT INTO emploees
    (full_name, tel)
VALUES ('Sam Brooke', 89181122333),
       ('Helen Austrian', 890011223344),
       ('Evgeny Petrov', 89094411258),
       ('Max Pain', 89991221358),
       ('Justin Maximus', 87771122654);

INSERT INTO salary_and_position
    (salary, position)
VALUES (40000, 'Engeneer'),
       (25000, 'Teacher'),
       (32000, 'Mill'),
       (100000, 'Killer'),
       (5000, 'Transporter');

INSERT INTO private_information
    (marital_status, DoB, city)
VALUES ('single', '2000-12-17', 'Tambov'),
       ('single', '2001-07-21', 'Pskov'),
       ('married', '1985-06-11', 'Ryazan'),
       ('married', '1986-03-03', 'Sochi'),
       ('single', '1972-01-29', 'Volgograd');

SELECT salary FROM salary_and_position WHERE salary>10000;

UPDATE private_information
SET marital_status = 'married'
WHERE id = 1;

SELECT marital_status FROM private_information WHERE id = 1;