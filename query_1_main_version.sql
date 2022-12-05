CREATE OR REPLACE VIEW all_activites_with_info AS
SELECT a.start_time AS start_time, g.id AS g_id, i.id AS i_id, e.id AS e_id FROM
(activity_info AS a LEFT JOIN individual_lesson AS i ON i.activity_info_id=a.id
LEFT JOIN group_lesson AS g ON g.activity_info_id=a.id
LEFT JOIN ensemble AS e ON e.activity_info_id=a.id);



SELECT extract(month from start_time) AS month, COUNT(*) AS total_amount, COUNT(g_id) AS group_amount, COUNT(i_id) AS individual_amount, COUNT(e_id) AS ensemble_amount
FROM all_activites_with_info
WHERE extract(year from start_time)='2022'
GROUP BY extract(month from start_time)
ORDER BY extract(month from start_time);