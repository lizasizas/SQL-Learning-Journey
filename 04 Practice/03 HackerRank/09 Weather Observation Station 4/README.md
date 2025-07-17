# Weather Observation Station 4

Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

### The **`STATION` Table is described as follows:**

![](https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where **LAT_N** is the northern latitude and **LONG_W** is the western longitude.

### **Submission:**

```sql
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;
```
