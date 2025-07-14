SELECT
    co.continent, FLOOR(AVG(ci.population))
FROM city ci
JOIN country co
    ON ci.countrycode = co.code
GROUP BY co.continent;
