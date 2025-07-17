# Weather Observation Station 7

Query the list of **CITY** names from **`STATION`** which have vowels (i.e., `a`, `e`, `i`, `o`, or `u`) as both their first and last characters. 
Your result cannot contain duplicates.

### The **`STATION` Table is described as follows:**

![](https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where **LAT_N** is the northern latitude and **LONG_W** is the western longitude.

### **Submission:**

```sql
SELECT city
FROM station
WHERE LOWER(SUBSTR(city, 1, 1)) IN ('a', 'e', 'i', 'o', 'u')
    AND LOWER(SUBSTR(city, -1, 1)) IN ('a', 'e', 'i', 'o', 'u');
```

```sql
WITH CTE AS (
    SELECT city
    FROM station 
    WHERE city LIKE 'a%' OR city LIKE 'e%' OR city LIKE 'i%' OR city LIKE 'o%' OR city LIKE 'u%'
)
SELECT city
FROM CTE
WHERE city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i' OR city LIKE '%o' OR city LIKE '%u';
```
