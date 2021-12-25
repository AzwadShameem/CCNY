USE `family-relations`;

-- Query: Selecting Each Family Member as Child | Father | Mother
SELECT (SELECT Name FROM Persons WHERE Id = pId) AS 'Child',
       (SELECT Name FROM Persons WHERE Id = fId) AS 'Father',
       (SELECT Name FROM Persons WHERE Id = mId) AS 'Mother'
FROM Family;

-- Query: Selecting The Children Of A Given Couple
SET @spouse1ID := 4; -- Parent 1
SET @spouse2ID := 5; -- Parent 2
SELECT Name AS 'Child', Sex FROM Persons WHERE id IN
    (SELECT pid FROM FAMILY WHERE fid = @spouse1ID AND mid = @spouse2ID
                               OR fid = @spouse2ID AND mid = @spouse1ID);

-- Query: Selecting The Children Of A Given Person
SET @spouse1ID := 4; -- Parent 1
SELECT Name AS 'Child', Sex FROM Persons P WHERE id IN
    (SELECT pid FROM FAMILY WHERE fid = @spouse1ID OR mid = @spouse1ID);

-- Query: Selecting Grandparent of A Given Person
SET @personID := 1;
SELECT Name AS 'Given Person',
    (SELECT Name FROM Persons WHERE Id IN
        (SELECT fId FROM Family F2 WHERE F2.pId IN
            (SELECT fId FROM Family F1 WHERE F1.pId = @personID))) AS 'Paternal Grandfather',
    (SELECT Name FROM Persons WHERE Id IN
        (SELECT mId FROM Family F2 WHERE F2.pId IN
            (SELECT fId FROM Family F1 WHERE F1.pId = @personID))) AS 'Paternal Grandmother',
    (SELECT Name FROM Persons WHERE Id IN
        (SELECT fId FROM Family F2 WHERE F2.pId IN
            (SELECT mId FROM Family F1 WHERE F1.pId = @personID))) AS 'Maternal Grandfather',
    (SELECT Name FROM Persons WHERE Id IN
        (SELECT mId FROM Family F2 WHERE F2.pId IN
            (SELECT mId FROM Family F1 WHERE F1.pId = @personID))) AS 'Maternal Grandmother'
From Persons WHERE Id = @personID;

-- Query: Selecting Male Nephews of a given person
SET @personID := 10;
SELECT Id, Name AS 'Nephews of a Given Person', SEX AS 'Gender' FROM Persons WHERE Id IN
    (SELECT pId FROM Family WHERE fId IN
        (SELECT pId FROM Family WHERE mId = (SELECT mId FROM Family WHERE pId = @personID)
                                  AND fId = (SELECT fId FROM Family WHERE pId = @personID) AND SEX = 'M' AND NOT pId = @personID)
        OR mId IN (SELECT pId FROM Family WHERE mId = (SELECT mId FROM Family WHERE pId = @personID)

                                            AND fId = (SELECT fId FROM Family WHERE pId = @personID) AND SEX = 'M' AND NOT pId = @personID));

SELECT * FROM Persons WHERE id IN (SELECT pid FROM FAMILY WHERE fid = 13  OR mid = 13);