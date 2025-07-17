# Higher Than 75 Marks

Query the **Name** of any student in **STUDENTS** who scored higher than `75` Marks. Order your output by the *last three characters* of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending **ID**.

### The **`STUDENTS` Table is described as follows:**

![](https://s3.amazonaws.com/hr-challenge-images/12896/1443815243-94b941f556-1.png)

**Sample Input**

| **ID** | **Name** | **Marks** |
| --- | --- | --- |
| 1 | Ashley | 81 |
| 2 | Samantha | 75 |
| 3 | Julia | 76 |
| 4 | Belvet | 84 |

**Sample Output**

``Ashley``

``Julia``

``Belvet``

### **Submissions:**

```sql
SELECT name
FROM students
WHERE marks > 75
ORDER BY SUBSTR(name, -3);
```
