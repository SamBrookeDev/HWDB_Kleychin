CREATE DATABASE warehouse;
USE warehouse;
SHOW TABLE STATUS WHERE Name = 'goods';

DROP TABLE storekeeper;

CREATE TABLE storekeeper
(
    sk_id      int auto_increment,
    last_name  varchar(20) NOT NULL,
    first_name varchar(20) NOT NULL,
    PRIMARY KEY (sk_id)
);
DROP TABLE contractors;
CREATE TABLE contractors
(
    c_id               int auto_increment,
    bank_id            INT                    NOT NULL,
    company_name       VARCHAR(20)            NOT NULL,
    IndividualNumberTP bigint unsigned UNIQUE NOT NULL,
    type_of_goods      varchar(50),
    FOREIGN KEY (bank_id) references bank (b_id),
    PRIMARY KEY (c_id)
);
DROP TABLE contractors;
SELECT *
FROM contractors;
INSERT INTO contractors
    (bank_id, company_name, IndividualNumberTP, type_of_goods)
VALUES (1, "ООО АГРОТОРГ", 7825706086, "Товары общего потребления"),
       (1, "ООО ЮМК", 1122334567, "Крепеж"),
       (2, "ООО ТехноНиколь", 2256789321, "Теплоизоляционные материалы"),
       (3, "ООО Арматура", 4567892587, "Прокатный металл"),
       (2, "ООО Комус", 4567897412, "Канцелярские товары");
SELECT *
FROM contractors;
DROP TABLE bank;
SELECT *
FROM bank;
CREATE TABLE bank
(
    b_id      int auto_increment,
    bank_name varchar(20) UNIQUE NOT NULL,
    PRIMARY KEY (b_id)
);

INSERT INTO bank
    (bank_name)
VALUES ("Сбербанк"),
       ("ВТБ24"),
       ("АльфаБанк");
SELECT *
FROM bank;
DROP TABLE goods;
CREATE TABLE goods
(
    goods_id      int AUTO_INCREMENT,
    contractor_id INT,
    name_of_goods VARCHAR(50) NOT NULL,
    note          VARCHAR(50),
    PRIMARY KEY (goods_id)

);

ALTER TABLE goods
    ADD CONSTRAINT fk_noc
        FOREIGN KEY (contractor_id) references contractors (c_id);

SELECT *
FROM goods;

INSERT INTO goods
VALUES (1, 1, "Тушеная говядина", "Высший сорт"),
       (2, 1, "Гречневая каша", "Первый сорт"),
       (3, 2, "Гвозди 100", "Сталь МГ"),
       (4, 3, "Роклайт", "Плотность 35"),
       (5, 3, "Техноэласт", "низ"),
       (6, 5, "Карандаш", "НВ");