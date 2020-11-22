CREATE DATABASE myjoinsdb;
DROP DATABASE MyJoinsDB;
USE myjoinsdb;

CREATE TABLE employee
(
    e_id   INT(2)       NOT NULL AUTO_INCREMENT,
    e_name VARCHAR(255) NOT NULL,
    e_tel  INT(10),
    PRIMARY KEY (e_id)
);

CREATE TABLE staff_list
(
    s_l_id INT(2)          NOT NULL AUTO_INCREMENT,
    f_e_id INT(2)          NOT NULL,
    title  VARCHAR(255)    NOT NULL,
    salary INT(6) UNSIGNED NOT NULL,
    PRIMARY KEY (s_l_id),
    KEY i_f_e_id (f_e_id),
    CONSTRAINT staff_list_ibfk_1 FOREIGN KEY (f_e_id) REFERENCES employee (e_id)
);

CREATE TABLE family_status
(
    f_s_id         INT(2)       NOT NULL AUTO_INCREMENT,
    f_e_id         INT(2)       NOT NULL,
    marital_status VARCHAR(255) NOT NULL,
    date_of_birth  DATE         NOT NULL,
    city           VARCHAR(255) NOT NULL,
    PRIMARY KEY (f_s_id),
    KEY i_f_e_id (f_e_id),
    CONSTRAINT family_status_ibfk_1 FOREIGN KEY (f_e_id) REFERENCES employee (e_id)
);

INSERT INTO employee
    (e_name, e_tel)
VALUES ('Артур Пирожков', 234568),
       ('Аркадий Паровозов', 223355),
       ('Гжегож Бжэштынтыкевич', 258236);

DROP TABLE employee;

INSERT INTO staff_list
    (f_e_id, title, salary)
VALUES (1, 'Рабочий', 30000),
       (2, 'Менеджер', 75000),
       (3, 'Директор', 99000);

INSERT INTO family_status
    (f_e_id, marital_status, date_of_birth, city)
VALUES (1, 'Женат', '1985-03-24', 'Москва'),
       (2, 'Женат', '2000-09-12', 'Екатеринбург'),
       (3, 'Холост', '1990-11-17', 'Омск');

SELECT employee.e_name, employee.e_tel, family_status.city
FROM employee
         INNER JOIN family_status
                    ON employee.e_id = family_status.f_e_id;

SELECT employee.e_name, family_status.date_of_birth, employee.e_tel
FROM employee
         INNER JOIN family_status
                    ON employee.e_id = family_status.f_e_id
WHERE marital_status = 'Холост';

SELECT employee.e_name, family_status.date_of_birth, employee.e_tel
FROM employee
         INNER JOIN family_status
                    ON employee.e_id = family_status.f_e_id
         INNER JOIN staff_list
                    On employee.e_id = staff_list.f_e_id
WHERE staff_list.title = 'Менеджер';


