SELECT item_count AS mode
FROM 
  (SELECT *, DENSE_RANK() OVER (ORDER BY order_occurrences DESC) AS rankk
  FROM items_per_order) AS new_table
WHERE rankk = 1;
