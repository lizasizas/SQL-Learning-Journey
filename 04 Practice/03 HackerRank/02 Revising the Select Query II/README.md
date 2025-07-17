# Revising the Select Query II

Query the NAME field for all American cities in the **CITY** table with populations larger than `120000`. The **CountryCode** for America is `USA`.

### The **`CITY` Table is described as follows:**

![CITY.jpg](https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)

### **Submission:**

```sql
SELECT C.NAME
FROM CITY C
WHERE C.COUNTRYCODE = 'USA' AND C.POPULATION > 120000;;
```
