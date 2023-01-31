WITH year_query 
AS
(SELECT
 created_date,
 complaint_type,
 agency,
 borough,
 EXTRACT(isoyear from created_date) as year
FROM `bigquery-public-data.new_york_311.311_service_requests`)

SELECT
  complaint_type,
  borough,
  COUNT(complaint_type) AS `value_occurrence` 
FROM year_query
WHERE year >= 2019 
AND year <= 2021
GROUP BY 
complaint_type,borough
ORDER BY 
  `value_occurrence` DESC 