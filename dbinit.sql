CREATE DATABASE `voyage_challenge`;

CREATE USER 'voyage_challenge'@'localhost' IDENTIFIED BY 'vagrant';

GRANT ALL PRIVILEGES ON `voyage_challenge`.* TO 'voyage_challenge'@'localhost';
