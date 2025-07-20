# Japan Population

Query the sum of the populations for all Japanese cities in **CITY**. The *COUNTRYCODE* for Japan is **JPN**.

### **Submissions:**

```sql
SELECT SUM(population)
FROM city
WHERE countrycode = 'JPN';
```
