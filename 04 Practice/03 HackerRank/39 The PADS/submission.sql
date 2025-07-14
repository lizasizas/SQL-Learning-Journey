SELECT
    CASE WHEN occupation = 'Doctor' THEN CONCAT(name, '(D)')
        WHEN occupation = 'Actor' THEN CONCAT(name, '(A)')
        WHEN occupation = 'Singer' THEN CONCAT(name, '(S)')
        WHEN occupation = 'Professor' THEN CONCAT(name, '(P)') END
FROM occupations
ORDER BY name;
SELECT CONCAT('There are a total of ', COUNT(name), ' ', LOWER(occupation), 's.')
FROM occupations
GROUP BY occupation
ORDER BY COUNT(name), occupation;

-- oracle
SELECT
    CASE WHEN occupation = 'Doctor' THEN name || '(D)'
        WHEN occupation = 'Actor' THEN name || '(A)'
        WHEN occupation = 'Singer' THEN name || '(S)'
        WHEN occupation = 'Professor' THEN name || '(P)' END
FROM occupations
ORDER BY name;
SELECT 'There are a total of '  || COUNT(name) || ' ' || LOWER(occupation) || 's.'
FROM occupations
GROUP BY occupation
ORDER BY COUNT(name), occupation;
