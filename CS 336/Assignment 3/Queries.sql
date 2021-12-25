USE ElectronicsDB;

-- Constraint 1
SELECT DISTINCT P1.maker FROM Electronics.Products P1, Electronics.Products P2
WHERE P1.maker = P2.maker AND P1.type = 'PC' AND P2.type = 'Laptop'

-- Constraint 2
SELECT DISTINCT P.maker FROM Electronics.PCs P, Electronics.Laptops L
WHERE P.maker = L.maker AND P.speed > ALL (SELECT S.speed FROM Electronics.Laptops S)

-- Constraint 3
SELECT L.model FROM Electronics.PCs P, Electronics.Laptops L
WHERE L.ram > P.ram AND L.price <= P.price

-- Constraint 4
SELECT P.model FROM Electronics.Products P WHERE P.model NOT IN
    (SELECT P1.model FROM Electronics.Products P1 WHERE P1.type = 'PC' AND P1.model IN (SELECT model FROM Electronics.PCs)
    UNION ALL
    SELECT P2.model FROM Electronics.Products P2 WHERE P2.type = 'Laptop' AND P2.model IN (SELECT model FROM Electronics.Laptops)
    UNION ALL
    SELECT P3.model FROM Electronics.Products P3 WHERE P3.type = 'Printer' AND P3.model IN (SELECT model FROM Electronics.Printers))