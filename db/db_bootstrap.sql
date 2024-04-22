-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
create database MovieSpot;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
grant all privileges on MovieSpot.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
use MovieSpot;

-- Put your DDL 
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    pass VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    preferences TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    length INT NOT NULL,
    director VARCHAR(50) NOT NULL,
    plot VARCHAR(255) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    actors TEXT NOT NULL
);

CREATE TABLE Theaters (
    theater_id INT AUTO_INCREMENT PRIMARY KEY,
    num_halls INT NOT NULL,
    city VARCHAR(100) NOT NULL,
    sells_foods BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Foods (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    price INT NOT NULL,
    name VARCHAR(50) NOT NULL
);

-- Add sample data. 
