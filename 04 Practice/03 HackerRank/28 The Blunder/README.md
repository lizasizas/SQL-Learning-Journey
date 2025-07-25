# The Blunder

Samantha was tasked with calculating the average monthly salaries for all employees in the **EMPLOYEES** table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

**Input Format**

The **EMPLOYEES** table is described as follows:

![](https://s3.amazonaws.com/hr-challenge-images/12893/1443817108-adc2235c81-1.png)

**Sample Input**

![](https://s3.amazonaws.com/hr-challenge-images/12893/1443817161-299cc6eb7f-2.png)

**Sample Output**

`2061`

**Explanation**

The table below shows the salaries *without zeros* as they were entered by Samantha:

![](https://s3.amazonaws.com/hr-challenge-images/12893/1443817229-eb00d44a3b-3.png)

### **Submission:**

```sql
WITH CTE AS (
    SELECT e.*, TO_NUMBER(NULLIF(REPLACE(TO_CHAR(salary), '0'), '')) AS without_zero
    FROM employees e
)
SELECT CEIL(AVG(salary) - AVG(without_zero))
FROM CTE;
```
