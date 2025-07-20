# Revising Aggregations - The Sum Function

Query the total population of all cities in **CITY** where *District* is **California**.

### **Submissions:**

```sql
SELECT SUM(population)
FROM city
WHERE district = 'California';
```
