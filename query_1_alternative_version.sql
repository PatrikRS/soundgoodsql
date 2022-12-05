SELECT extract(month from a.start_time) AS month, COUNT(*) AS total_amount, COUNT(g.id) AS group_amount, COUNT(i.id) AS individual_amount, COUNT(e.id) AS ensemble_amount
FROM activity_info AS a LEFT JOIN individual_lesson AS i ON i.activity_info_id=a.id
LEFT JOIN group_lesson AS g ON g.activity_info_id=a.id
LEFT JOIN ensemble AS e ON e.activity_info_id=a.id
WHERE extract(year from a.start_time)='2022'
GROUP BY extract(month from a.start_time)
ORDER BY extract(month from a.start_time);