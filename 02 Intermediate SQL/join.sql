-- INNER JOIN

SELECT 
    c.name AS country, 
    l.name AS language, 
    official
FROM countries AS c
INNER JOIN languages AS l
USING(code);

SELECT 
    c.code AS country_code, 
    name, 
    year, 
    inflation_rate
FROM countries AS c 
INNER JOIN economies AS e
ON c.code = e.code;

-- Outer Joins, Cross Joins and Self Joins

SELECT 
	name, 
	e.year, 
	fertility_rate, 
	unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code  
	AND e.year = p.year;

SELECT name, region, gdp_percapita
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010;

SELECT 
    countries.name AS 
    country, 
    languages.name AS language, 
    percent
FROM languages
RIGHT JOIN countries
USING(code)
ORDER BY language;

SELECT 
	name AS country, 
	code, 
	region, 
	basic_unit
FROM countries
FULL JOIN currencies
USING (code)
WHERE region = 'North America'
	OR name IS NULL
ORDER BY region;

SELECT 
	c1.name AS country, 
    region, 
    l.name AS language,
	basic_unit, 
    frac_unit
FROM countries AS c1 
FULL JOIN languages AS l
USING(code)
FULL JOIN currencies AS c2
USING(code)
WHERE region LIKE 'M%esia';

SELECT 
	c.name AS country, 
	l.name AS language
FROM countries AS c
INNER JOIN languages AS l
USING(code)
WHERE 
	c.code IN ('PAK','IND')
	AND l.code in ('PAK','IND');

SELECT 
	c.name AS country,
	region,
	life_expectancy AS life_exp
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
WHERE year = 2010
ORDER BY life_exp
LIMIT 5;

SELECT 
	p1.country_code,
	p1.size AS size2010, 
	p2.size AS size2015
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code
WHERE p1.year = 2010
	AND p2.year = 2015;
    
-- UNION and UNION FULL

SELECT *
FROM economies2015  
UNION
SELECT *
FROM economies2019
ORDER BY code, year;

SELECT code, year
FROM economies
UNION ALL
SELECT country_code, year
FROM populations
ORDER BY code, year;