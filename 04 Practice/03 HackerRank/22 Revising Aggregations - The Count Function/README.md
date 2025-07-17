# Revising Aggregations - The Count Function

Query a count of the number of cities in **CITY** having a Population larger than `100000`

### The **`CITY` Table is described as follows:**

![CITY.jpg](https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)

### **Submission:**

```sql
SELECT COUNT(name)
FROM city
WHERE population > 100000;
```
