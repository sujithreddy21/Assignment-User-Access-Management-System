CREATE DATABASE useraccessdb;

use useraccessdb;

CREATE TABLE users (
id SERIAL PRIMARY KEY,
username VARCHAR(50) NOT NULL UNIQUE,
password VARCHAR(100) NOT NULL,
role VARCHAR(20) NOT NULL
);

CREATE TABLE software (
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
description TEXT NOT NULL,
access_levels VARCHAR(50)
);

CREATE TABLE requests (
id SERIAL PRIMARY KEY,
user_id INT REFERENCES users(id),
software_id INT REFERENCES software(id),
access_type VARCHAR(20) NOT NULL,
reason TEXT NOT NULL,
status VARCHAR(20) NOT NULL DEFAULT 'Pending'
);
