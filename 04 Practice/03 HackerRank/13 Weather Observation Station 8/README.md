# Weather Observation Station 8

Query the list of **CITY** names from **`STATION`** that do not start with vowels. Your result cannot contain duplicates.

### The **`STATION` Table is described as follows:**

![](https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where **LAT_N** is the northern latitude and **LONG_W** is the western longitude.

### **Submission:**

```sql
SELECT DISTINCT city
FROM station
WHERE LOWER(SUBSTR(city, 1, 1)) NOT IN ('a', 'i', 'u', 'e', 'o');
```
