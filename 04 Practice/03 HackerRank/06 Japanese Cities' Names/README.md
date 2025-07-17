# Japanese Cities' Names

Query the names of all the Japanese cities in the **CITY** table. The **COUNTRYCODE** for Japan is JPN.

### The **`CITY` Table is described as follows:**

![CITY.jpg](https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)

### **Submission:**

```sql
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';
```
