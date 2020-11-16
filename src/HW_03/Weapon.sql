CREATE DATABASE weapon;
USE weapon;

CREATE TABLE employee
(
    e_id       INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
    e_name     VARCHAR(255)    NOT NULL,
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at  TIMESTAMP       NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (e_id)
);

CREATE TABLE squads
(
    s_id       INT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
    squad      INT(3)          NOT NULL UNIQUE,
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at  TIMESTAMP       NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (s_id)
);

CREATE TABLE offices
(
    of_id INT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
    office INT(3) NOT NULL,
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at  TIMESTAMP       NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (of_id)
);

CREATE TABLE weapons
(
    w_id       INT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
    w_type     VARCHAR(255)    NOT NULL UNIQUE,
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at  TIMESTAMP       NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (w_id)
);

CREATE TABLE officers
(
    o_id       INT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
    o_name     VARCHAR(255)    NOT NULL,
    o_title    VARCHAR(255)    NOT NULL,
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at  TIMESTAMP       NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (o_id)
);

CREATE TABLE employee_has_squad
(
    ehs_id     int(1)          NOT NULL AUTO_INCREMENT,
    f_e_id     INT(1) UNSIGNED NOT NULL,
    f_s_id     INT(1) UNSIGNED NOT NULL,
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at  TIMESTAMP       NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (ehs_id),
    KEY i_f_e_id (f_e_id),
    KEY i_f_s_id (f_s_id),
    CONSTRAINT employee_has_squad_ibfk_1 FOREIGN KEY (f_e_id) REFERENCES employee (e_id)
        ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT employee_has_squad_ibfk_2 FOREIGN KEY (f_s_id) REFERENCES squads (s_id)
        ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE employee_has_weapon
(
    ehw_id     int(1)          NOT NULL AUTO_INCREMENT,
    f_e_id     INT(1) UNSIGNED NOT NULL,
    f_w_id     INT(1) UNSIGNED NOT NULL,
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at  TIMESTAMP       NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (ehw_id),
    KEY i_f_e_id (f_e_id),
    KEY i_f_w_id (f_w_id),
    CONSTRAINT employee_has_weapon_ibfk_1 FOREIGN KEY (f_e_id) REFERENCES employee (e_id)
        ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT employee_has_weapon_ibfk_2 FOREIGN KEY (f_w_id) REFERENCES weapons (w_id)
        ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE weapon_has_officer
(
    who_id     int(1)          NOT NULL AUTO_INCREMENT,
    f_w_id     INT(1) UNSIGNED NOT NULL,
    f_o_id     INT(1) UNSIGNED NOT NULL,
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at  TIMESTAMP       NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (who_id),
    KEY i_f_w_id (f_w_id),
    KEY i_f_o_id (f_o_id),
    CONSTRAINT weapon_has_officer_ibfk_1 FOREIGN KEY (f_w_id) REFERENCES weapons (w_id)
        ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT weapon_has_officer_ibfk_2 FOREIGN KEY (f_o_id) REFERENCES officers (o_id)
        ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE squad_has_office
(
    sho_id     int(1)          NOT NULL AUTO_INCREMENT,
    f_s_id     INT(1) UNSIGNED NOT NULL,
    f_of_id     INT(1) UNSIGNED NOT NULL,
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at  TIMESTAMP       NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (sho_id),
    KEY i_f_s_id (f_s_id),
    KEY i_f_of_id (f_of_id),
    CONSTRAINT squad_has_office_ibfk_1 FOREIGN KEY (f_s_id) REFERENCES squads (s_id)
        ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT squad_has_office_ibfk_2 FOREIGN KEY (f_of_id) REFERENCES offices (of_id)
        ON DELETE CASCADE ON UPDATE NO ACTION
);




