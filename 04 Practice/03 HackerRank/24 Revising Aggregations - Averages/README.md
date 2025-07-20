# Revising Aggregations - Averages

Query the average population of all cities in **CITY** where *District* is **California**.

### **Submissions:**

```sql
SELECT AVG(population)
FROM city
WHERE district = 'California';
```
