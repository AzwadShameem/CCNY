-- Constraint 1
DROP PROCEDURE IF EXISTS Electronics.pConstraint1;
GO
CREATE PROCEDURE Electronics.pConstraint1 @maker CHAR, @model INT, @type VARCHAR(7)
AS
BEGIN
    IF (@maker NOT IN (SELECT P.maker FROM Electronics.Products P, Electronics.Products Q
           WHERE P.maker = Q.maker AND P.type = 'PC' AND Q.type = 'Laptop'))
       PRINT 'Maker:	' + @maker + ' Model:	' + CAST(@model AS CHAR(4)) + ' Type:	' + @type;
END;
GO
DECLARE @maker CHAR;
DECLARE @model INT;
DECLARE @type CHAR(7);
DECLARE Cursor1 CURSOR FOR SELECT * FROM Electronics.Products;
OPEN Cursor1;
FETCH NEXT FROM Cursor1 INTO @maker, @model, @type;
WHILE @@FETCH_STATUS = 0
BEGIN
EXECUTE Electronics.pConstraint1 @maker, @model, @type;
FETCH NEXT FROM Cursor1 INTO @maker, @model, @type;
END
CLOSE Cursor1;
DEALLOCATE Cursor1;

-- Constraint 2
DROP PROCEDURE IF EXISTS Electronics.pConstraint2
GO
CREATE PROCEDURE Electronics.pConstraint2 @maker CHAR, @model INT, @type VARCHAR(64)
AS
BEGIN
    IF (@maker NOT IN (SELECT DISTINCT P.maker FROM Electronics.PCs P, Electronics.Laptops L
                       WHERE P.maker = L.maker AND P.speed > ALL (SELECT L1.speed FROM Electronics.Laptops L1)))
        PRINT 'Maker:    ' + @maker + ' Model:    ' + CAST(@model AS CHAR(4)) + ' Type:    ' + @type;
END;
GO
DECLARE @maker CHAR;
DECLARE @model INT;
DECLARE @type VARCHAR(64);
DECLARE Cursor2 CURSOR FOR SELECT * FROM Electronics.Products;
OPEN Cursor2;
FETCH NEXT FROM Cursor2 INTO @maker, @model, @type;
WHILE @@FETCH_STATUS = 0
    BEGIN
        EXECUTE Electronics.pConstraint2 @maker, @model, @type;
        FETCH NEXT FROM Cursor2 INTO @maker, @model, @type;
    END
CLOSE Cursor2;
DEALLOCATE Cursor2;

-- Constraint 3
DROP PROCEDURE IF EXISTS Electronics.pConstraint3
GO
CREATE PROCEDURE Electronics.pConstraint3 @maker CHAR, @model INT, @type VARCHAR(64)
AS
BEGIN
    IF (@model NOT IN (SELECT L.model FROM Electronics.PCs P, Electronics.Laptops L
                       WHERE L.ram > P.ram AND L.price <= P.price))
        PRINT 'Maker:    ' + @maker + ' Model:    ' + CAST(@model AS CHAR(4)) + ' Type:    ' + @type;
END;
GO
DECLARE @maker CHAR;
DECLARE @model INT;
DECLARE @type VARCHAR(64);
DECLARE Cursor3 CURSOR FOR SELECT * FROM Electronics.Products;
OPEN Cursor3;
FETCH NEXT FROM Cursor3 INTO @maker, @model, @type;
WHILE @@FETCH_STATUS = 0
    BEGIN
        EXECUTE Electronics.pConstraint3 @maker, @model, @type;
        FETCH NEXT FROM Cursor3 INTO @maker, @model, @type;
    END
CLOSE Cursor3;
DEALLOCATE Cursor3;

-- Constraint 4
DROP PROCEDURE IF EXISTS Electronics.pConstraint4
GO
CREATE PROCEDURE ELectronics.pConstraint4 @maker CHAR, @model INT, @type VARCHAR(64)
AS
BEGIN
    IF (@model NOT IN (SELECT P1.model FROM Electronics.Products P1 WHERE P1.model NOT IN
        (SELECT P2.model FROM Electronics.Products P2 WHERE P2.type = 'PC' AND P2.model IN (SELECT model FROM PCs)
         UNION ALL
         SELECT P3.model FROM Electronics.Products P3 WHERE P3.type = 'Laptop' AND P3.model IN (SELECT model FROM Laptops)
         UNION ALL
         SELECT P4.model FROM Electronics.Products P4 WHERE P4.type = 'Printer' AND P4.model IN (SELECT model FROM Printers))))
        PRINT 'Maker:    ' + @maker + ' Model:    ' + CAST(@model AS CHAR(4)) + ' Type:    ' + @type;
END;
GO
DECLARE @maker CHAR;
DECLARE @model INT;
DECLARE @type VARCHAR(64);
DECLARE Cursor4 CURSOR FOR SELECT * FROM Electronics.Products;
OPEN Cursor4;
FETCH NEXT FROM Cursor4 INTO @maker, @model, @type;
WHILE @@FETCH_STATUS = 0
    BEGIN
        EXECUTE Electronics.pConstraint4 @maker, @model, @type;
        FETCH NEXT FROM Cursor4 INTO @maker, @model, @type;
    END
CLOSE Cursor4;
DEALLOCATE Cursor4;
