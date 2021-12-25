-- Function 1 = Alter Table
DROP FUNCTION IF EXISTS Electronics.Constraint1;
GO
CREATE FUNCTION Electronics.Constraint1(@maker AS CHAR)
    RETURNS BIT
AS
BEGIN
    DECLARE @FLAG BIT = 1
    IF (@maker IN (SELECT P1.maker FROM Electronics.Products P1, Electronics.Products P2
                   WHERE P1.maker = P2.maker AND P1.type = 'PC' AND P2.type = 'Laptop'))
    SET @FLAG = 0;
RETURN @FLAG
END;
GO
ALTER TABLE Electronics.Products
    ADD violations1 BIT
        DEFAULT 1;
GO
UPDATE Electronics.Products
SET violations1 = Electronics.Constraint1(maker);
SELECT DISTINCT maker, model, type FROM Electronics.Products
Where violations1 = 1;

-- Function 2 = Alter Table
DROP FUNCTION IF EXISTS Electronics.Constraint2;
GO
CREATE FUNCTION Electronics.Constraint2(@maker AS CHAR)
    RETURNS BIT
AS
BEGIN
    DECLARE @FLAG BIT = 1
    IF (@maker IN (SELECT DISTINCT P.maker FROM Electronics.PCs P, Electronics.Laptops L
                   WHERE P.maker = L.maker AND P.speed > ALL (SELECT speed FROM Electronics.Laptops)))
        SET @FLAG = 0;
    RETURN @FLAG
END;
GO
ALTER TABLE Electronics.Products
    ADD violations2 BIT
        DEFAULT 1;
GO
UPDATE Electronics.Products
SET violations2 = Electronics.Constraint2(maker);
SELECT maker, model, type FROM Electronics.Products
Where violations2 = 1;

-- Function 3 = Alter Table
DROP FUNCTION IF EXISTS Electronics.Constraint3;
GO
CREATE FUNCTION Electronics.Constraint3(@model AS INT)
    RETURNS BIT
AS
BEGIN
    DECLARE @FLAG BIT = 1
    IF (@model IN (SELECT L.model FROM Electronics.PCs P, Electronics.Laptops L
                   WHERE L.ram > P.ram AND L.price <= P.price))
        SET @FLAG = 0;
    RETURN @FLAG
END;
GO
ALTER TABLE Electronics.Products
    ADD violations3 BIT
        DEFAULT 1;
GO
UPDATE Electronics.Products
SET violations3 = Electronics.Constraint3(model);
SELECT maker, model, type FROM Electronics.Products
Where violations3 = 1;

-- Function 4 = Alter Table
DROP FUNCTION IF EXISTS Electronics.Constraint4;
GO
CREATE FUNCTION Electronics.Constraint4(@model AS INT)
    RETURNS BIT
AS
BEGIN
    DECLARE @FLAG BIT = 1
    IF (@model IN (SELECT P.model FROM Products P WHERE P.model NOT IN
                                                        (SELECT P1.model FROM Products P1 WHERE P1.type = 'PC' AND P1.model IN (SELECT model FROM PCs)
                                                         UNION ALL
                                                         SELECT P1.model FROM Products P1 WHERE P1.type = 'Laptop' AND P1.model IN (SELECT model FROM Laptops)
                                                         UNION ALL
                                                         SELECT P1.model FROM Products P1 WHERE P1.type = 'Printer' AND P1.model IN (SELECT model FROM Printers))))
        SET @FLAG = 0;
    RETURN @FLAG
END;
GO
ALTER TABLE Electronics.Products
    ADD violations4 BIT
        DEFAULT 1;
GO
UPDATE Electronics.Products
SET violations4 = Electronics.Constraint4(model);
SELECT DISTINCT maker, model, type FROM Electronics.Products
Where violations4 = 1;