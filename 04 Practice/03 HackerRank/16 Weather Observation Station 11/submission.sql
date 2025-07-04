SELECT DISTINCT city
FROM station
WHERE LOWER(SUBSTR(city, 1, 1)) NOT IN ('a', 'i', 'u', 'e', 'o')
    OR LOWER(SUBSTR(city, -1, 1)) NOT IN ('a', 'i', 'u', 'e', 'o');
