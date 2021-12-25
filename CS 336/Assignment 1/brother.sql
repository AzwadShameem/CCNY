USE `family-relations`;

-- Brother Table
DROP TABLE IF EXISTS BROTHER;
CREATE TABLE BROTHER(pid INT REFERENCES PERSONS(id), bid  INT REFERENCES PERSONS(id), PRIMARY KEY (pid, bid));

-- Insert Info Into Brother Table
INSERT INTO BROTHER
SELECT F1.pid AS 'personId', F2.pid AS 'bid'
FROM (SELECT * FROM Family WHERE pid IN (SELECT Id FROM PERSONS WHERE Sex = 'M')) F1,
     (SELECT * FROM Family WHERE pid IN (SELECT Id FROM PERSONS WHERE Sex = 'M')) F2
WHERE (F1.fid = F2.fid OR F1.mid = F2.mid) AND F1.pid <> F2.pid;

-- View All In Brother Table
SELECT * FROM BROTHER;
