# Pharmacy Analytics (Part 2) [CVS Health SQL Interview Question]

CVS Health is analyzing its pharmacy sales data, and how well different products are selling in the market. Each drug is exclusively manufactured by a single manufacturer.

Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and calculate the total amount of losses incurred.

Output the manufacturer's name, the number of drugs associated with losses, and the total losses in absolute value. Display the results sorted in descending order with the highest losses displayed at the top.

If you like this question, try out [Pharmacy Analytics (Part 3)](https://datalemur.com/questions/total-drugs-sales)!

### **`pharmacy_sales` Table:**

| Column Name | Type |
| --- | --- |
| product_id | integer |
| units_sold | integer |
| total_sales | decimal |
| cogs | decimal |
| manufacturer | varchar |
| drug | varchar |

### **`pharmacy_sales` Example Input:**

| product_id | units_sold | total_sales | cogs | manufacturer | drug |
| --- | --- | --- | --- | --- | --- |
| 156 | 89514 | 3130097.00 | 3427421.73 | Biogen | Acyclovir |
| 25 | 222331 | 2753546.00 | 2974975.36 | AbbVie | Lamivudine and Zidovudine |
| 50 | 90484 | 2521023.73 | 2742445.90 | Eli Lilly | Dermasorb TA Complete Kit |
| 98 | 110746 | 813188.82 | 140422.87 | Biogen | Medi-Chord |

### **Example Output:**

| manufacturer | drug_count | total_loss |
| --- | --- | --- |
| Biogen | 1 | 297324.73 |
| AbbVie | 1 | 221429.36 |
| Eli Lilly | 1 | 221422.17 |

### **Explanation:**

The first three rows indicate that some drugs resulted in losses. Among these, Biogen had the highest losses, followed by AbbVie and Eli Lilly. However, the Medi-Chord drug manufactured by Biogen reported a profit and was excluded from the result.

### **Submissions:**

```sql
SELECT
  manufacturer,
  COUNT(DISTINCT drug) AS drug_count,
  ABS(SUM(total_sales) - SUM(cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs <= 0 
GROUP BY manufacturer
ORDER BY total_loss DESC;
```

### **Output:**

![Result](https://github.com/lizasizas/SQL-Learning-Journey/blob/main/04%20Practice/01%20DataLemur/Pharmacy%20Analytics%20(Part%202)/Screenshot%202024-08-02%20160031.png
)

### **Another Solution:**

```sql
-- without ABS()
SELECT
  manufacturer,
  COUNT(drug) AS drug_count, 
  SUM(cogs - total_sales) AS total_loss
FROM pharmacy_sales
WHERE cogs > total_sales
GROUP BY manufacturer
ORDER BY total_loss DESC;
```
