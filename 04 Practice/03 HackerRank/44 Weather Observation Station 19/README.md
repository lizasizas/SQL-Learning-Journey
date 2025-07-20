# Weather Observation Station 19

Consider `P1(a,c)` and `P2(b,d)` to be two points on a 2D plane where `(a,b)` are the respective minimum and maximum values of *Northern Latitude* (*LAT_N*) and `(c,d)` are the respective minimum and maximum values of *Western Longitude* (*LONG_W*) in **STATION**.

Query the [Euclidean Distance](https://en.wikipedia.org/wiki/Euclidean_distance) between points  and  and *format your answer* to display  decimal digits.

**Input Format**

The **STATION** table is described as follows:

![](https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where *LAT_N* is the northern latitude and *LONG_W* is the western longitude.

### **Submission:**

```sql
WITH CTE AS (
    SELECT 
        MIN(lat_n) AS a,
        MAX(lat_n) AS b,
        MIN(long_w) AS c,
        MAX(long_w) AS d
    FROM station
)
SELECT CAST( ROUND( SQRT( POWER(a-b, 2) + POWER(c-d, 2) ), 4) AS DECIMAL(10,4))
FROM CTE;
```
