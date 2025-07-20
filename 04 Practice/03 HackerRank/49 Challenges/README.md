# Challenges

Julia asked her students to create some coding challenges. Write a query to print the *hacker_id*, *name*, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by *hacker_id*. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

**Input Format**

The following tables contain challenge data:

- *Hackers:* The *hacker_id* is the id of the hacker, and *name* is the name of the hacker.
    
    ![](https://s3.amazonaws.com/hr-challenge-images/19506/1458521004-cb4c077dd3-ScreenShot2016-03-21at6.06.54AM.png)
    
- *Challenges:* The *challenge_id* is the id of the challenge, and *hacker_id* is the id of the student who created the challenge.
    
    ![](https://s3.amazonaws.com/hr-challenge-images/19506/1458521079-549341d9ec-ScreenShot2016-03-21at6.07.03AM.png)
    

---

**Sample Input 0**

*Hackers* Table:

![](https://s3.amazonaws.com/hr-challenge-images/19506/1458521384-34c6866dae-ScreenShot2016-03-21at6.07.15AM.png)

*Challenges* Table:

![](https://s3.amazonaws.com/hr-challenge-images/19506/1458521410-befa8e1cd9-ScreenShot2016-03-21at6.07.25AM.png)

**Sample Output 0**

```
21283 Angela 6
88255 Patrick 5
96196 Lisa 1
```

**Sample Input 1**

*Hackers* Table:

![](https://s3.amazonaws.com/hr-challenge-images/19506/1458521469-87036deea3-ScreenShot2016-03-21at6.07.48AM.png)

*Challenges* Table:

![](https://s3.amazonaws.com/hr-challenge-images/19506/1458521490-358215cf0b-ScreenShot2016-03-21at6.07.58AM.png)

**Sample Output 1**

```
12299 Rose 6
34856 Angela 6
79345 Frank 4
80491 Patrick 3
81041 Lisa 1
```

**Explanation**

For *Sample Case 0*, we can get the following details:

![](https://s3.amazonaws.com/hr-challenge-images/19506/1458521677-fd04c384c0-ScreenShot2016-03-21at6.07.38AM.png)

Students 5077 and 62743 both created 4 challenges, but the maximum number of challenges created is  so these students are excluded from the result.

For *Sample Case 1*, we can get the following details:

![](https://s3.amazonaws.com/hr-challenge-images/19506/1458521836-24039e7523-ScreenShot2016-03-21at6.08.08AM.png)

Students 12299 and 34856 both created 6 challenges. Because 6 is the maximum number of challenges created, these students are included in the result.

### **Submissions:**

```sql
WITH join_table AS (
    SELECT 
        c.hacker_id, h.name,
        COUNT(challenge_id) AS number_of_challenges
    FROM challenges c
    LEFT JOIN hackers h
        ON c.hacker_id = h.hacker_id
    GROUP BY c.hacker_id, h.name
),
frekuensi_challenge AS (
    SELECT number_of_challenges, COUNT(*) AS frekuensi
    FROM join_table 
    GROUP BY number_of_challenges
)
SELECT t.hacker_id, t.name, f.number_of_challenges
FROM join_table t
LEFT JOIN frekuensi_challenge f
    ON t.number_of_challenges = f.number_of_challenges
WHERE f.frekuensi = 1 OR f.number_of_challenges = (SELECT MAX(number_of_challenges) FROM frekuensi_challenge)
ORDER BY f.number_of_challenges DESC, t.hacker_id;
```
