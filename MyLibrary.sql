/********************************************************
* This script creates the database named MyLibrary
*********************************************************/

USE master;
GO

IF  DB_ID('MyLibrary') IS NOT NULL
    DROP DATABASE MyLibrary;
GO

CREATE DATABASE MyLibrary;
GO

-- --------------------------------------------------------

USE MyLibrary;

-- create the tables for the database MyLibrary

CREATE TABLE BookGenres (
  GenreID        INT            PRIMARY KEY   IDENTITY,
  GenreName      VARCHAR(50)    NOT NULL      UNIQUE
);

CREATE TABLE BookAuthors (
  AuthorID        INT            PRIMARY KEY   IDENTITY,
  AuthorName      VARCHAR(100)   NOT NULL      UNIQUE
);

CREATE TABLE BookLocations (
  LocationID        INT            PRIMARY KEY   IDENTITY,
  LocationArea      VARCHAR(50)    NOT NULL      UNIQUE,
  LocationShelve    VARCHAR(50)    NOT NULL      UNIQUE
);

CREATE TABLE Books (
  ISBN              INT            PRIMARY KEY   IDENTITY,
  GenreID           INT            REFERENCES    BookGenres (GenreID), 
  AuthorID          INT            REFERENCES    BookAuthors (AuthorID), 
  kLocationID       INT            REFERENCES    BookLocations (LocationID), 
  BookName          VARCHAR(255)   NOT NULL,
  BookDescription   TEXT           NOT NULL,
  BookPrice         MONEY          NOT NULL,
  BookStatus        VARCHAR(50)    NOT NULL,
);

CREATE TABLE Customers (
  CustomerID           INT            PRIMARY KEY   IDENTITY,
  CustomerFirstName    VARCHAR(100)   NOT NULL,
  CustomerLastName     VARCHAR(100)   NOT NULL,
  CustomerEmail        VARCHAR(255)   NOT NULL      UNIQUE,
  RegisterDate         DATETIME       NOT NULL,
);




CREATE TABLE Employees (
  EmployeeID           INT            PRIMARY KEY   IDENTITY,
  EmployeeFirstName    VARCHAR(60)    NOT NULL,
  EmployeeLastName     VARCHAR(60)    NOT NULL,
  EmployeePosition     VARCHAR(255)   NOT NULL,
  EmployeeSchedule     VARCHAR(255)   NOT NULL,  
);

CREATE TABLE BookBorrowed (
  BorrowID          INT            PRIMARY KEY  IDENTITY,
  ISBN              INT            REFERENCES Books (ISBN),
  CustomerID        INT            REFERENCES Customers (CustomerID),
  EmployeeID        INT            REFERENCES Employees (EmployeeID),
  BorrowedDate      DATETIME       NOT NULL,
  DueDate           DATETIME       NOT NULL,
);

