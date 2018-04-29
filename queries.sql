##Query for Extension
CREATE extension postgis;

##Query to create table
CREATE TABLE LOCATIONS (NAME VARCHAR(15),LOCATION geometry);

##Query to insert data in table
INSERT INTO LOCATIONS(NAME,LOCATION)
VALUES('Home',ST_GeomFromText('POINT(-118.28191 34.032433)')),
('Doheny',ST_GeomFromText('POINT(-118.284455 34.020582)')),
('SGM',ST_GeomFromText('POINT(-118.289171 34.021945)')),
('Cromwell',ST_GeomFromText('POINT(-118.287944 34.022463)')),
('Lyon',ST_GeomFromText('POINT(-118.287892 34.024250)')),
('Ver/Jeff',ST_GeomFromText('POINT(-118.291381 34.025360)')),
('Ver/Expo',ST_GeomFromText('POINT(-118.291348 34.018455)')),
('Fig/Expo',ST_GeomFromText('POINT(-118.282585 34.018499)')),
('Fig/Jeff',ST_GeomFromText('POINT(-118.280193 34.021898)'));

##Query to create the Convex Hull
CREATE TABLE ConvexPoints AS
 (SELECT ST_CONVEXHULL(ST_MULTI(ST_COLLECT(location)))  
  Hull   from   Locations);
SELECT   ST_ASTEXT(Hull)   Hull   FROM   ConvexPoints;

##Query to find the three nearest neighbors to home
SELECT N2.name 
FROM LOCATIONS AS N1, 
     LOCATIONS AS N2 
WHERE  N1.name = 'Home' 
      	AND N1.name <> N2.name 
ORDER  BY St_distance(N1.location, N2.location) 
LIMIT  3;


