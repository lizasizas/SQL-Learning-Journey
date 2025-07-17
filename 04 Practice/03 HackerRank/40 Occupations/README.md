# Occupations

[Pivot](https://en.wikipedia.org/wiki/Pivot_table) the *Occupation* column in **OCCUPATIONS** so that each *Name* is sorted alphabetically and displayed underneath its corresponding *Occupation*. The output should consist of four columns (*Doctor*, *Professor*, *Singer*, and *Actor*) in that specific order, with their respective names listed alphabetically under each column.

**Note:** Print **NULL** when there are no more names corresponding to an occupation.

**Input Format**

The **OCCUPATIONS** table is described as follows:

![](https://s3.amazonaws.com/hr-challenge-images/12889/1443816414-2a465532e7-1.png)

*Occupation* will only contain one of the following values: **Doctor**, **Professor**, **Singer** or **Actor**.

**Sample Input**

![](https://s3.amazonaws.com/hr-challenge-images/12890/1443817648-1b2b8add45-2.png)

**Sample Output**

```
Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
```

**Explanation**

The first column is an alphabetically ordered list of Doctor names.

The second column is an alphabetically ordered list of Professor names.

### **Submissions:**

```sql
WITH CTE AS (
    SELECT name, occupation, ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS row_number
    FROM occupations
)
SELECT
    MAX(CASE WHEN occupation = 'Doctor' THEN name END) AS doctor,
    MAX(CASE WHEN occupation = 'Professor' THEN name END) AS professor,
    MAX(CASE WHEN occupation = 'Singer' THEN name END) AS singer,
    MAX(CASE WHEN occupation = 'Actor' THEN name END) AS actor
FROM CTE
GROUP BY row_number
ORDER BY row_number;
```
