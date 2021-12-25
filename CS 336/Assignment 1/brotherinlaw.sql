USE `family-relations`;

-- SPOUSES Table
DROP TABLE IF EXISTS BROTHERINLAW;
CREATE TABLE BROTHERINLAW(bid INT REFERENCES PERSONS(id), pid  INT REFERENCES PERSONS(id), PRIMARY KEY (bid, pid));

INSERT INTO BROTHERINLAW
-- If person is a male
-- A Male's Sister's Husband
 SELECT P1.Id AS 'In-Law', P2.Id FROM PERSONS P1, PERSONS P2 WHERE P1.Sex = 'M' AND P1.id != P2.id AND P2.id IN
     (SELECT hid FROM SPOUSES WHERE wid IN
         (SELECT sid FROM BROTHERSISTER WHERE bid = P1.id))
UNION
--  A Male's Wife's Brother
SELECT P1.id AS 'In-Law Id', P2.id FROM PERSONS P1, PERSONS P2 WHERE P1.Sex = 'M' AND P1.id != P2.id AND P2.id IN
    (SELECT bid FROM BROTHERSISTER WHERE sid IN
        (SELECT wid FROM SPOUSES WHERE hid = P1.id))

UNION
-- A Male's Wife's Sister's Husband
SELECT P1.id AS 'In-Law', P2.id FROM PERSONS P1, PERSONS P2 WHERE P1.Sex = 'M' AND P1.id != P2.id AND P2.id IN
    (SELECT hid FROM SPOUSES WHERE wid IN
        (SELECT sid FROM SISTER WHERE pid IN
            (SELECT wid FROM SPOUSES WHERE hid = P1.id)))

-- Female

UNION
-- A Female's Husband's Brother
SELECT P1.id 'In-Law', P2.id FROM PERSONS P1, PERSONS P2 WHERE P1.Sex = 'M' AND P1.id != P2.id AND P1.id IN
    (SELECT bid FROM BROTHER WHERE pid IN
        (SELECT hid FROM SPOUSES WHERE wid = P2.id))

UNION
-- A Female's Sister's Husband
SELECT P1.id AS 'In-Law', P2.id FROM PERSONS P1, PERSONS P2 WHERE P1.Sex = 'M' AND P1.id != P2.id AND P1.id IN
    (SELECT hid FROM SPOUSES WHERE wid IN
        (SELECT sid FROM SISTER WHERE pid = P2.id))

UNION
-- A Female's Husband's Sister's Husband
SELECT P1.id AS 'In-Law Id', P2.id FROM PERSONS P1, PERSONS P2 WHERE P1.Sex = 'M' AND P1.id != P2.id AND P1.id IN
    (SELECT hid FROM SPOUSES WHERE wid IN
        (SELECT sid FROM BROTHERSISTER WHERE bid IN
            (SELECT hid FROM SPOUSES WHERE wid = P2.id)));

SELECT * FROM BROTHERINLAW;