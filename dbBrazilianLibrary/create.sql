-- CREATE DATABASE dbLivrariaBrasileira

USE dbBrazilianLibrary

CREATE TABLE Editor (
	ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	name VARCHAR(255) NOT NULL
)

CREATE TABLE Gender (
	ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	name VARCHAR(255) NOT NULL
)

CREATE TABLE Author (
	ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	name VARCHAR(255) NOT NULL
)

CREATE TABLE Book (
	ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	name VARCHAR(255) NOT NULL,
	pages INT NOT NULL,
	genderID INT FOREIGN KEY REFERENCES Gender(ID),
	authorID INT FOREIGN KEY REFERENCES Author(ID),
	editorID INT FOREIGN KEY REFERENCES Editor(ID)
)
