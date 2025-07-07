SELECT MAX(earnings), COUNT(name)
FROM (SELECT *, (months*salary) AS earnings FROM Employee) AS new_table
WHERE earnings = (SELECT MAX(months*salary) FROM Employee);
