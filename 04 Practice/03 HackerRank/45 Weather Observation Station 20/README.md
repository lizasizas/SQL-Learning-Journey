# Weather Observation Station 20

A [*median*](https://en.wikipedia.org/wiki/Median) is defined as a number separating the higher half of a data set from the lower half. 
Query the *median* of the *Northern Latitudes* (`*LAT_N*`) from **STATION** and round your answer to `4` decimal places.

**Input Format**

The **STATION** table is described as follows:

![](https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where *LAT_N* is the northern latitude and *LONG_W* is the western longitude.

### **Submission:**

```sql
-- Oracle
WITH CTE AS (
    SELECT lat_n,
        ROW_NUMBER() OVER (ORDER BY lat_n) roww
    FROM station
)
SELECT ROUND(lat_n, 4)
FROM CTE
WHERE roww = (SELECT CEIL(COUNT(*)/2.0) FROM station);
```

```sql
-- MS SQL Server
WITH CTE AS (
    SELECT lat_n,
        ROW_NUMBER() OVER (ORDER BY lat_n) AS roww
    FROM station
)
SELECT CAST(ROUND(lat_n, 4) AS DECIMAL(10,4))
FROM CTE
WHERE roww = (
    SELECT CEILING(1.0 * COUNT(*) / 2.0) FROM station
);
```
