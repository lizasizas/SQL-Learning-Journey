# Weather Observation Station 6

Query the list of **CITY** names starting with vowels (i.e., `a`, `e`, `i`, `o`, or `u`) from **STATION**. Your result cannot contain duplicates.

### The **`STATION` Table is described as follows:**

![](https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where **LAT_N** is the northern latitude and **LONG_W** is the western longitude.

### **Submission:**

```sql
SELECT city
FROM station
WHERE city LIKE 'a%' OR city LIKE 'i%' OR city LIKE 'u%' OR city LIKE 'e%' OR city LIKE 'o%';
```
