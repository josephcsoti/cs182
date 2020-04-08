-- CS 182
-- Lab 2
-- Joseph Csoti // jcsoti@ucsc.edu

-- Drop and clear
DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2;

-- Create Tables

-- Products
CREATE TABLE Products(
  productID    INT,
  productName  VARCHAR(40),
  manuf        VARCHAR(40),
  normalPrice  NUMERIC(5, 2) NOT NULL,
  discount     INT,
  PRIMARY KEY (productID),
  CONSTRAINT unq_product UNIQUE (productName, manuf) 
);

-- Customers
CREATE TABLE Customers(
  customerID    INT,
  custName      VARCHAR(40) NOT NULL,
  address       VARCHAR(40),
  joinDate      DATE,
  amountOwed    NUMERIC(6, 2),
  lastPaidDate  DATE,
  status        CHAR(1),
  PRIMARY KEY (customerID),
  CONSTRAINT unq_customer UNIQUE (custName, address)
);

-- Stores
CREATE TABLE Stores(
  storeID     INT,
  storeName   VARCHAR(40) NOT NULL,
  region      CHAR(5),
  address     VARCHAR(40),
  manager     VARCHAR(40),
  PRIMARY KEY (storeID),
  CONSTRAINT unq_store UNIQUE (storeName)
);

-- Day
CREATE TABLE Days(
  dayDate   DATE,
  category  CHAR(1),
  PRIMARY KEY (DATE)
);

-- Sales
CREATE TABLE Sales(
  productID     INT,
  customerID    INT,
  storeID       INT,
  dayDate       DATE,
  paidPrice     NUMERIC(5, 2),
  quantity      INT,
  PRIMARY KEY (productID, customerID, storeID, dayDate)
);

-- Payments
CREATE TABLE Payments(
  customerID   INT,
  custName     VARCHAR(40),
  paidDate     DATE,
  amountPaid   NUMERIC(6, 2),
  cleared      BOOLEAN,
  PRIMARY KEY (customerID, paidDate)
);