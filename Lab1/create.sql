-- CS 182
-- Lab 1
-- Joseph Csoti // jcsoti@ucsc.edu

-- Drop and clear
DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

-- Create Tables

-- Products
CREATE TABLE Products(
  productID    INT,
  productName  VARCHAR(40),
  manuf        VARCHAR(40),
  normalPrice  NUMERIC(5, 2),
  discount     INT,
  PRIMARY KEY (productID)
);

-- Customers
CREATE TABLE Customers(
  customerID    INT,
  custName      VARCHAR(40),
  address       VARCHAR(40),
  joinDate      DATE,
  amountOwed    NUMERIC(6, 2),
  lastPaidDate  DATE,
  status        CHAR(1),
  PRIMARY KEY (customerID)
);

-- Stores
CREATE TABLE Stores(
  storeID     INT,
  storeName   VARCHAR(40),
  region      CHAR(5),
  address     VARCHAR(40),
  manager     VARCHAR(40),
  PRIMARY KEY (storeID)
);

-- Day
CREATE TABLE Day(
  dayDate   DATE,
  category  CHAR(1)
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
  custName     CHAR(40),
  paidDate     DATE,
  amountPaid   NUMERIC(6, 2),
  cleared      BOOLEAN,
  PRIMARY KEY (customerID, paidDate)
);