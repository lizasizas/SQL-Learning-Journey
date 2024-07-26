SELECT 
	(
  SELECT
    COUNT(device_type) AS laptop_views
  FROM viewership
  WHERE device_type = 'laptop'
  ) AS laptop_views,
  COUNT(device_type) AS mobile_views
FROM viewership
WHERE device_type IN ('tablet', 'phone');
