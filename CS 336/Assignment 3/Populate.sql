USE ElectronicsDB;

-- Clear All Tables
DROP TABLE IF EXISTS Electronics.PCs;
GO
DROP TABLE IF EXISTS Electronics.Laptops;
GO
DROP TABLE IF EXISTS Electronics.Printers;
GO
DROP TABLE IF EXISTS Electronics.Products;
GO

-- PCs Table
CREATE TABLE Electronics.PCs(maker VARCHAR(64), model INT PRIMARY KEY, speed FLOAT, ram INT, hd INT, price FLOAT);
INSERT INTO Electronics.PCs VALUES ('A', 1001, '2.66', 1024, 250, 2114);
INSERT INTO Electronics.PCs VALUES ('A', 1002, '2.10', 512, 250, 995);
INSERT INTO Electronics.PCs VALUES ('A', 1003, '1.42', 512, 80, 478);
INSERT INTO Electronics.PCS VALUES ('B', 1004, '2.80', 1024, 250, 649);
INSERT INTO Electronics.PCs VALUES ('B', 1005, '3.20', 512, 250, 630);
INSERT INTO Electronics.PCs VALUES ('B', 1006, '3.20', 1024, 320, 1049);
INSERT INTO Electronics.PCs VALUES ('C', 1007, '2.20', 1024, 200, 510);
INSERT INTO Electronics.PCs VALUES ('D', 1008, '2.20', 2048, 250, 770);
INSERT INTO Electronics.PCs VALUES ('D', 1009, '2.00', 1024, 250, 650);
INSERT INTO Electronics.PCs VALUES ('D', 1010, '2.80', 2048, 300, 770);
INSERT INTO Electronics.PCs VALUES ('E', 1011, '1.86', 2048, 160, 959);
INSERT INTO Electronics.PCs VALUES ('E', 1012, '2.80', 1024, 160, 649);
INSERT INTO Electronics.PCs VALUES ('E', 1013, '3.06', 512, 80, 529);
SELECT * FROM Electronics.PCs;

-- Laptops Table
CREATE TABLE Electronics.Laptops(maker VARCHAR(64), model INT PRIMARY KEY, speed FLOAT, ram INT, hd INT, screen FLOAT, price FLOAT);
INSERT INTO Electronics.Laptops VALUES ('E', 2001, '2.00', 2048, 240, '20.1', 3673);
INSERT INTO Electronics.Laptops VALUES ('E', 2002, '1.73', 1024, 80, '17.0', 949);
INSERT INTO Electronics.Laptops VALUES ('E', 2003, '1.80', 512, 60, '15.4', 549);
INSERT INTO Electronics.Laptops VALUES ('A', 2004, '2.00', 512, 60, '13.3', 1150);
INSERT INTO Electronics.Laptops VALUES ('A', 2005, '2.16', 1024, 120, '17.0', 2500);
INSERT INTO Electronics.Laptops VALUES ('A', 2006, '2.00', 2048, 80, '15.4', 1700);
INSERT INTO Electronics.Laptops VALUES ('B', 2007, '1.83', 1024, 120, '13.3', 1429);
INSERT INTO Electronics.Laptops VALUES ('F', 2008, '1.60', 1024, 100, '15.4', 900);
INSERT INTO Electronics.Laptops VALUES ('F', 2009, '1.60', 512, 80, '14.1', 680);
INSERT INTO Electronics.Laptops VALUES ('G', 2010, '2.00', 2048, 160, '15.4', 2300);
SELECT * FROM Electronics.Laptops;

-- Printers Table
CREATE TABLE Electronics.Printers(maker VARCHAR(64), model INT PRIMARY KEY, color BIT, type VARCHAR(64), price FLOAT);
INSERT INTO Electronics.Printers VALUES ('E', 3001, 1, 'ink-jet', 99);
INSERT INTO Electronics.Printers VALUES ('E', 3002, 0, 'laser', 239);
INSERT INTO Electronics.Printers VALUES ('E', 3003, 1, 'laser', 899);
INSERT INTO Electronics.Printers VALUES ('D', 3004, 1, 'ink-jet', 120);
INSERT INTO Electronics.Printers VALUES ('D', 3005, 0, 'laser', 120);
INSERT INTO Electronics.Printers VALUES ('H', 3006, 1, 'ink-jet', 100);
INSERT INTO Electronics.Printers VALUES ('H', 3007, 1, 'laser', 200);
SELECT * FROM Electronics.Printers;

-- Products Table
CREATE TABLE Electronics.Products(maker VARCHAR(64), model INT PRIMARY KEY, type VARCHAR(64));
INSERT INTO Electronics.Products
SELECT maker, model, 'PC' AS type FROM Electronics.PCs UNION
SELECT maker, model, 'Laptop' AS type FROM Electronics.Laptops UNION
SELECT maker, model, 'Printer' AS type FROM Electronics.Printers;
SELECT * FROM Electronics.Products ORDER BY maker, model;