SELECT DISTINCT enscount.ensemble_id, enscount.current_enrolled, ensinfo.genre, ensinfo.day_of_week,
CASE
WHEN ensinfo.max_students=enscount.current_enrolled
THEN 'Fully booked'
WHEN (ensinfo.max_students-enscount.current_enrolled)<3
THEN '1-2 slots remaining'
WHEN (ensinfo.max_students-enscount.current_enrolled)>2
THEN 'More than 2 slots remaining'
END slots_available
FROM
(SELECT ensemble_id, COUNT(ensemble_id) AS current_enrolled FROM
(SELECT se.ensemble_id AS ensemble_id, e.max_student_amount AS max_students, eg.genre AS genre, extract(dow from a.start_time) AS day_of_week FROM
(student_ensemble AS se
LEFT JOIN ensemble AS e ON se.ensemble_id=e.id
LEFT JOIN activity_info AS a ON e.activity_info_id=a.id
LEFT JOIN ensemble_genre AS eg ON e.ensemble_genre_id=eg.id)
WHERE extract(week from NOW())=(extract(week from start_time)-1)) AS ensembleview
GROUP BY ensemble_id) AS enscount
LEFT JOIN
(SELECT ensemble_id, genre, day_of_week, max_students FROM
(SELECT se.ensemble_id AS ensemble_id, e.max_student_amount AS max_students, eg.genre AS genre, extract(dow from a.start_time) AS day_of_week FROM
(student_ensemble AS se
LEFT JOIN ensemble AS e ON se.ensemble_id=e.id
LEFT JOIN activity_info AS a ON e.activity_info_id=a.id
LEFT JOIN ensemble_genre AS eg ON e.ensemble_genre_id=eg.id)
WHERE extract(week from NOW())=(extract(week from start_time)-1)) AS ensembleview) AS ensinfo ON enscount.ensemble_id=ensinfo.ensemble_id
ORDER BY genre, day_of_week;