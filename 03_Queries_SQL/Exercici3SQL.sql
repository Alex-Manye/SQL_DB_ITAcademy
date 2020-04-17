/*Exercici 1*/
SELECT 
    COUNT(*)
FROM
    USFlight_jueves.flights;

/*Exercici 2*/

SELECT DISTINCT Origin, AVG(ArrDelay) as prom_arribades, AVG(DepDelay) as prom_sortides
FROM USFlight_jueves.flights
GROUP BY Origin 
ORDER BY Origin ASC;

/*Exercici 3*/

SELECT Origin, colYear, colMonth, ArrDelay as prom_arribades
FROM USFlight_jueves.flights
ORDER BY Origin, colYear, colMonth ASC;

/*Exercici 4*/

SELECT City, colYear, colMonth, ArrDelay as prom_arribades
FROM USFlight_jueves.flights
  JOIN USFlight_jueves.airports
    ON USFlight_jueves.flights.origin = USFlight_jueves.airports.iata
ORDER BY City, colYear, colMonth ASC;

/*Exercici 5*/

SELECT uniqueCarrier, colYear, colMonth, SUM(cancelled) AS total_cancelled
FROM USFlight_jueves.flights
WHERE cancelled != 0
GROUP BY colYear, colMonth
ORDER BY  total_cancelled DESC;

/*Exercici 6*/

SELECT tailNum, SUM(distance) AS total_distance
FROM USFlight_jueves.flights
GROUP BY tailNum
ORDER BY total_distance DESC
LIMIT 10;

/*Exercici 7*/

SELECT  uniqueCarrier, AVG(arrDelay) as AvgDelay
FROM USFlight_jueves.flights
GROUP BY uniqueCarrier
HAVING AvgDelay >10
ORDER BY uniqueCarrier DESC;

/*
Preguntar Jose -> cuando ponia WHERE AvgDelay>10 en vez de HAVING daba error Unknown column AvgDelay in where clause
Aunque se que HAVING  solo se aplica a los grupos en su totalidad y WHERE, que se aplica a filas individuales.*/