-- Drop tables if they exist
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS vehicle;

-- Create user table
CREATE TABLE "user"
(
    id       BIGINT      NOT NULL,
    email    VARCHAR(60) NOT NULL,
    password VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE (email)
);

-- Create vehicle table
CREATE TABLE vehicle
(
    id              BIGINT NOT NULL,
    brand           VARCHAR(255) DEFAULT NULL,
    model           VARCHAR(255) DEFAULT NULL,
    number_of_seats INT          DEFAULT NULL,
    production_year INT          DEFAULT NULL,
    PRIMARY KEY (id)
);

-- Create reservation table
CREATE TABLE reservation
(
    id               BIGINT NOT NULL,
    creation_date    TIMESTAMP DEFAULT NULL,
    customer_name    VARCHAR(255) DEFAULT NULL,
    departure_date   TIMESTAMP DEFAULT NULL,
    destination      VARCHAR(255) DEFAULT NULL,
    last_update_date TIMESTAMP DEFAULT NULL,
    status           VARCHAR(255) DEFAULT NULL,
    type             VARCHAR(255) DEFAULT NULL,
    user_id          BIGINT       DEFAULT NULL,
    vehicle_id       BIGINT       DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user" (id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle (id)
);

-- Insert data into user table
INSERT INTO "user" (id, email, password)
VALUES (1, 'kowalski@kowalski.pl', '$2a$10$CwVExHkDBOkhomt05JBawu7bFTsVY1OIMn/bCe4ccjNx2SL85mw9S'),
       (2, 'nowak@nowak.pl', '$2a$10$ijTybM7zYc1krR.1MXJUU.QRKrv07XbN8WSlPSGj/6OaHWdIzIu3i');

-- Insert data into vehicle table
INSERT INTO vehicle (id, brand, model, production_year, number_of_seats)
VALUES (1, 'Mercedes', 'Sprinter', 2010, 19),
       (2, 'Neoplan', 'Euroliner', 2007, 51),
       (3, 'Volkswagen', 'LT', 2005, 19);

-- Insert data into reservation table
INSERT INTO reservation (id, user_id, customer_name, vehicle_id, type, departure_date, destination, status, creation_date, last_update_date)
VALUES (1, 1, 'FirmaPOL Sp. z o.o.', 2, 'TRIP', '2022-01-01 00:00:00', 'Lublin', 'CREATED', '2022-01-01 00:00:00', NULL),
       (2, 2, 'Zakon Sióstr Karmelitanek Bosych', 2, 'PILGRIMAGE', '2022-01-01 00:00:00', 'Częstochowa', 'EDITED', '2022-01-01 00:00:00', NULL);
