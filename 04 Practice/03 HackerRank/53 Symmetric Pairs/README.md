# Symmetric Pairs

You are given a table, *Functions*, containing two columns: *X* and *Y*.

![](https://s3.amazonaws.com/hr-challenge-images/12892/1443818798-51909e977d-1.png)

Two pairs *(X1, Y1)* and *(X2, Y2)* are said to be *symmetric* *pairs* if *X1 = Y2* and *X2 = Y1*.

Write a query to output all such *symmetric* *pairs* in ascending order by the value of *X*. List the rows such that *X1 ≤ Y1*.

**Sample Input**

![](https://s3.amazonaws.com/hr-challenge-images/12892/1443818693-b384c24e35-2.png)

**Sample Output**

```
20 20
20 21
22 23
```

### **Submission:**

```sql
WITH symmetric_pairs AS ( 
    SELECT f1.x, f1.y, f2.y AS ax, f2.x AS ay
    FROM functions f1 
    JOIN functions f2 
        ON f1.x = f2.y AND f1.y = f2.x 
), 
final_table AS (
    SELECT DISTINCT x, y 
    FROM symmetric_pairs 
    WHERE x < y
    UNION
    SELECT x, y 
    FROM functions 
    WHERE x = y 
    GROUP BY x, y 
    HAVING COUNT(*) > 1
)
SELECT x, y 
FROM final_table
ORDER BY x, y;
```
