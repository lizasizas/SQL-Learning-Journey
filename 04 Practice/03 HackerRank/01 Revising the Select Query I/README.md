# Revising the Select Query I

Query all columns for all American cities in the **CITY** table with populations larger than `100000`. The **CountryCode** for America is `USA`.

### The **`CITY` Table is described as follows:**

![CITY.jpg](https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)

### **Submission:**

```sql
SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA';
```
