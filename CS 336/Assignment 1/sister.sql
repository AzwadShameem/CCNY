USE `family-relations`;

-- Sister Table
DROP TABLE IF EXISTS SISTER;
CREATE TABLE SISTER(pid INT REFERENCES PERSONS(id), sid  INT REFERENCES PERSONS(id), PRIMARY KEY (pid, sid));

INSERT INTO SISTER
SELECT F1.pid AS 'personId', F2.pid AS 'sisterId'
FROM (SELECT * FROM Family WHERE pid IN (SELECT id FROM PERSONS WHERE Sex = 'F')) F1,
     (SELECT * FROM Family WHERE pid IN (SELECT Id FROM PERSONS WHERE Sex = 'F')) F2
WHERE (F1.fid = F2.fid OR F1.mid = F2.mid) AND F1.pid <> F2.pid;

-- View All In Sister Table
SELECT * FROM SISTER;
