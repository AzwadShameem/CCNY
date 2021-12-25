import requests
import pyodbc
key = ""

def getServer():
    return pyodbc.connect(r'Driver=SQL Server;'
                          r'Server=(local);'
                          r'Database=master;'
                          r'Trusted_Connection=yes;')


def getZipCode(latitude, longitude):
    url = "http://www.mapquestapi.com/geocoding/v1/reverse?key"+key + \
          "location="+str(latitude)+","+ str(longitude) + \
          "&includeRoadMetadata=true&includeNearestIntersection=true"
    return str(requests.post(url).json()).split("'postalCode': '")[1][0:5]


def getZipcodes(connection):
    latitude, longitude, zipcode = [], [], []
    cursor = connection.cursor()
    try:
        # For every latitude and longitude add a zipcode into stations table
        cursor.execute("SELECT LATITUDE, LONGITUDE FROM STATIONS")
        while True:
            row = cursor.fetchone()
            if not row:
                break
            else:
                latitude.append(str(row[0]))
                longitude.append(str(row[1]))
                zipcode.append(getZipCode(float(row[0]), float(row[1])))
    except Exception as e:
        pass
    finally:
        cursor.close()
    return latitude, longitude, zipcode


def updateZipcodes(connection, latitude, longitude, zipcode):
    # Checking if ZIPCODE column exists
    cursor = connection.cursor()
    try:
        cursor.execute("ALTER TABLE Stations ADD ZIPCODE INTEGER").commit()
    except Exception as e:
        pass
    finally:
        cursor.close()

    # Update ZIPCODE column
    cursor = connection.cursor()
    try:
        for i in range(len(zipcode)):
            cursor.execute("UPDATE STATIONS SET ZIPCODE = " + zipcode[i] +
                           " WHERE Latitude = " + latitude[i] +
                           " AND Longitude = " + longitude[i]).commit()
    except AttributeError:
        print("Error: attributes don't match")
    finally:
        cursor.close()


def popularZipcode(connection):
    cursor = connection.cursor().execute("SELECT ZIPCODE, SUM(NumUsers) as 'TotalUsers' " +
                                         "FROM dbo.Stations, dbo.Trips WHERE ID = StationID " +
                                         "GROUP BY ZIPCODE ORDER BY SUM(NumUsers) DESC")
    zipcode = cursor.fetchone()[0]
    cursor.close()
    return zipcode


if __name__ == '__main__':
    server = getServer()
    latitudes, longitudes, zipcodes = getZipcodes(server)
    updateZipcodes(server, latitudes, longitudes, zipcodes)
    print(popularZipcode(server))
    server.close()
