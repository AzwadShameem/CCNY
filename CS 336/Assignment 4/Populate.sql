-- Load Data
DROP TABLE IF EXISTS dbo.CitiBike;
GO
CREATE TABLE dbo.CitiBike(
    TripDuration FLOAT,
    StartTime VARCHAR(30),
    StartDay VARCHAR(9) DEFAULT NULL,
    EndTime VARCHAR(30),
    EndDay VARCHAR(9) DEFAULT NULL,
    StartStationID INT,
    StartStationName VARCHAR(64),
    StartStationLatitude FLOAT,
    StartStationLongitude FLOAT,
    EndStationID INT,
    EndStationName VARCHAR(64),
    EndStationLatitude FLOAT,
    EndStationLongitude FLOAT,
    BikeID INT,
    UserType VARCHAR(10),
    Birth VARCHAR(4),
    Gender INT
);
BULK INSERT CitiBike FROM 'C:\Users\azwad\IdeaProjects\CS_336\Assignment 4\data.txt'
     WITH (FIELDTERMINATOR  = '\t', ROWTERMINATOR = '\n', FIRSTROW = 2)

UPDATE CitiBike
    SET StartDay = DATENAME(WEEKDAY, StartTime),
        EndDay = DATENAME(WEEKDAY, EndTime);
GO
SELECT * FROM CitiBike;

-- Populate Stations Table
DROP TABLE IF EXISTS dbo.Stations;
GO
CREATE TABLE dbo.Stations(
    ID INT PRIMARY KEY,
    Name VARCHAR(64),
    Latitude FLOAT,
    Longitude FLOAT
);
INSERT INTO dbo.Stations
SELECT DISTINCT StartStationID, StartStationName, 
StartStationLatitude, StartStationLongitude
FROM dbo.CitiBike
INTERSECT
SELECT DISTINCT EndStationID, EndStationName, 
EndStationLatitude, EndStationLongitude 
FROM dbo.CitiBike
SELECT * FROM dbo.Stations;

-- Populate Trips Table
DROP TABLE IF EXISTS dbo.Trips;
GO
CREATE TABLE dbo.Trips(
    StationID INT PRIMARY KEY,
    MinTripDuration VARCHAR(30),
    MaxTripDuration VARCHAR(30),
    AvgTripDuration VARCHAR(30),
    NumUsers INT
);
INSERT INTO dbo.Trips
SELECT StartStationID, MIN(TripDuration), 
MAX(TripDuration), AVG(TripDuration), COUNT(StartStationID)
FROM dbo.CitiBike GROUP BY StartStationID ORDER BY StartStationID
SELECT * FROM dbo.Trips

-- Populate UsageByDay Table
DROP TABLE IF EXISTS dbo.UsageByDay;
GO
CREATE TABLE dbo.UsageByDay(
    StationID INT PRIMARY KEY,
    NumberUsersWeekday INT,
    NumberUsersWeekend INT
);
INSERT INTO dbo.UsageByDay
SELECT A.StartStationID, A.WeekdayUsers, B.WeekendUsers 
    FROM (SELECT StartStationID, COUNT(*) AS 'WeekdayUsers' FROM dbo.CitiBike
        WHERE StartDay IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') 
        GROUP BY StartStationID) A
    JOIN
    (SELECT StartStationID, COUNT(*) AS 'WeekendUsers' FROM dbo.CitiBike WHERE
            StartDay IN ('Saturday', 'Sunday')
     GROUP BY StartStationID) B
    ON A.StartStationID = B.StartStationID
SELECT * FROM dbo.UsageByDay;

-- Populate UsageByGender Table
DROP TABLE IF EXISTS dbo.UsageByGender;
GO
CREATE TABLE dbo.UsageByGender(
    StationID INT PRIMARY KEY,
    NumberMaleUsers INT,
    NumberFemaleUsers INT
);
INSERT INTO dbo.UsageByGender
SELECT A.StartStationID, A.MaleUsers, B.FemaleUsers FROM
    (SELECT StartStationID, COUNT(*) AS 'MaleUsers' FROM dbo.CitiBike
     WHERE Gender = 1 GROUP BY StartStationID) A
        JOIN
    (SELECT StartStationID, COUNT(*) AS 'FemaleUsers' FROM dbo.CitiBike
        WHERE Gender = 2 GROUP BY StartStationID) B ON A.StartStationID = B.StartStationID
SELECT * FROM dbo.UsageByGender;

-- Populate UsageByAge Table
DROP TABLE IF EXISTS dbo.UsageByAge;
GO
CREATE TABLE dbo.UsageByAge(
    StationID INT PRIMARY KEY,
    NumberUsersUnder18 INT,
    NumberUsers18To40 INT,
    NumberUsersOver40 INT
);
DECLARE @CURRENT_YEAR INT = 2013;
INSERT INTO dbo.UsageByAge
SELECT Z.StartStationID, Z.NumberUsersUnder18, Z.NumberUsers18To40, C.NumberUsersOver40 FROM
    (SELECT A.StartStationID, NumberUsersUnder18, NumberUsers18To40 FROM
        (SELECT StartStationID, COUNT(*) AS 'NumberUsersUnder18' FROM dbo.CitiBike
            WHERE Birth <> '\N' AND (@CURRENT_YEAR - CAST(Birth AS INT) < 18)
        GROUP BY StartStationID) A
        JOIN
        (SELECT StartStationID, COUNT(*) AS 'NumberUsers18To40' FROM CitiBike
            WHERE Birth <> '\N' AND (@CURRENT_YEAR - CAST(Birth AS INT) >= 18)
              AND (@CURRENT_YEAR - CAST(Birth AS INT) <= 40)
            GROUP BY StartStationID) B ON A.StartStationID = B.StartStationID) Z
        JOIN
        (SELECT StartStationID, COUNT(*) AS 'NumberUsersOver40' FROM CitiBike
            WHERE Birth <> '\N' AND (@CURRENT_YEAR - CAST(Birth AS INT) > 40)
                GROUP BY StartStationID) C ON Z.StartStationID = C.StartStationID
SELECT * FROM dbo.UsageByAge;
