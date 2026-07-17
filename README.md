 SQL Data Analysis — E-Commerce Order Insights

 Overview:

This project applies core SQL techniques to a cleaned e-commerce dataset in order to extract measurable business insight from raw transactional data. The objective was to demonstrate proficiency in structured querying,filtering, sorting, grouping, and aggregating  and to translate those query results into findings relevant to business decision-making.

All queries were executed against a dataset of 1,200 order records and validated for accuracy before being reported.

 Objectives:

- Write `SELECT` statements to retrieve targeted subsets of order data
- Apply `WHERE` clauses using equality, comparison, pattern matching, and range conditions
- Sort result sets using `ORDER BY`
- Aggregate data using `GROUP BY` in combination with `COUNT`, `SUM`, and `AVG`
- Extend the analysis using `HAVING` and percentage-of-total calculations

 Methodology:

The analysis follows SQL's actual logical execution order — `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `ORDER BY` — rather than the order queries are typically written in. This principle guided two specific decisions: aliases defined in `SELECT` are never referenced in that same query's `WHERE` clause, and `HAVING`, not `WHERE`, is used whenever a filter condition depends on an aggregate function. Filtering rows before grouping also keeps each aggregation pass operating on the smallest possible dataset.



 Skills Demonstrated:

`SELECT` · `WHERE` (equality, comparison, `LIKE`, `AND`, `BETWEEN`, `IN`) · `ORDER BY` · `GROUP BY` · `COUNT` / `SUM` / `AVG` · `HAVING` · percentage-of-total via correlated subquery

