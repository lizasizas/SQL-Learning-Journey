# Average Population of Each Continent

Given the **CITY** and **COUNTRY** tables, query the names of all the continents (*COUNTRY.Continent*) and their respective average city populations (*CITY.Population*) rounded *down* to the nearest integer.

**Note:** *CITY.CountryCode* and *COUNTRY.Code* are matching key columns.

### **Submissions:**

```sql
SELECT
    co.continent, FLOOR(AVG(ci.population))
FROM city ci
JOIN country co
    ON ci.countrycode = co.code
GROUP BY co.continent;
```
