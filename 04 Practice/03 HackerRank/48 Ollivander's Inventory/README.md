# Ollivander's Inventory

Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each *non-evil* wand of high power and age. Write a query to print the *id*, *age*, *coins_needed*, and *power* of the wands that Ron's interested in, sorted in order of descending *power*. If more than one wand has same power, sort the result in order of descending *age*.

**Input Format**

The following tables contain data on the wands in Ollivander's inventory:

- *Wands:* The *id* is the id of the wand, *code* is the code of the wand, *coins_needed* is the total number of gold galleons needed to buy the wand, and *power* denotes the quality of the wand (the higher the power, the better the wand is).
    
    ![](https://s3.amazonaws.com/hr-challenge-images/19502/1458538092-b2a8163a74-ScreenShot2016-03-08at12.13.39AM.png)
    
- *Wands_Property:* The *code* is the code of the wand, *age* is the age of the wand, and *is_evil* denotes whether the wand is good for the dark arts. If the value of *is_evil* is *0*, it means that the wand is not evil. The mapping between *code* and *age* is one-one, meaning that if there are two pairs,  and , then  and .
    
    ![](https://s3.amazonaws.com/hr-challenge-images/19502/1458538221-18c4092b7d-ScreenShot2016-03-08at12.13.53AM.png)
    

---

**Sample Input**

*Wands* Table:

![](https://s3.amazonaws.com/hr-challenge-images/19502/1458538559-51bf29644e-ScreenShot2016-03-21at10.34.41AM.png)

*Wands_Property* Table:

![](https://s3.amazonaws.com/hr-challenge-images/19502/1458538583-fd514566f9-ScreenShot2016-03-21at10.34.28AM.png)

**Sample Output**

`9 45 1647 10
12 17 9897 10
1 20 3688 8
15 40 6018 7
19 20 7651 6
11 40 7587 5
10 20 504 5
18 40 3312 3
20 17 5689 3
5 45 6020 2
14 40 5408 1`

**Explanation**

The data for wands of *age 45* (code 1):

![](https://s3.amazonaws.com/hr-challenge-images/19502/1458539700-2f319702ab-ScreenShot2016-03-21at11.23.06AM.png)

- The minimum number of galleons needed for `wand(age=45, power=2) = 6020`
- The minimum number of galleons needed for `wand(age=45, power=10) = 1647`

The data for wands of *age 40* (code 2):

![](https://s3.amazonaws.com/hr-challenge-images/19502/1458539909-ab79f7ff95-ScreenShot2016-03-21at11.23.14AM.png)

- The minimum number of galleons needed for `wand(age=40, power=1) = 5408`
- The minimum number of galleons needed for `wand(age=40, power=3) = 3312`
- The minimum number of galleons needed for `wand(age=40, power=5) = 7587`
- The minimum number of galleons needed for `wand(age=40, power=7) = 6018`

The data for wands of *age 20* (code 4):

![](https://s3.amazonaws.com/hr-challenge-images/19502/1458540035-d950b9c900-ScreenShot2016-03-21at11.23.25AM.png)

- The minimum number of galleons needed for `wand(age=20, power=5) = 504`
- The minimum number of galleons needed for `wand(age=20, power=6) = 7651`
- The minimum number of galleons needed for `wand(age=20, power=8) = 3688`

The data for wands of *age 17* (code 5):

![](https://s3.amazonaws.com/hr-challenge-images/19502/1458540132-79fd7b916b-ScreenShot2016-03-21at11.23.34AM.png)

- The minimum number of galleons needed for `wand(age=17, power=3) = 5689`
- The minimum number of galleons needed for `wand(age=17, power=10) = 9897`

### **Submission:**

```sql
WITH join_table AS (
    SELECT
        w.id, w.code, w.coins_needed, p.age, w.power
    FROM wands w
    LEFT JOIN wands_property p
        ON w.code = p.code
    WHERE p.is_evil = 0
),
final_table AS (
    SELECT id, age, power, coins_needed,
        MIN(coins_needed) OVER (PARTITION BY age, power) AS min_coins
    FROM join_table
)
SELECT id, age, coins_needed, power
FROM final_table
WHERE coins_needed = min_coins
ORDER BY power DESC, age DESC;
```
