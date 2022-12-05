CREATE OR REPLACE VIEW ensemble_with_activityinfo_and_students AS
SELECT se.ensemble_id AS ensemble_id, e.max_student_amount AS max_students, eg.genre AS genre, extract(dow from a.start_time) AS day_of_week, a.start_time AS start_time FROM
(student_ensemble AS se
LEFT JOIN ensemble AS e ON se.ensemble_id=e.id
LEFT JOIN activity_info AS a ON e.activity_info_id=a.id
LEFT JOIN ensemble_genre AS eg ON e.ensemble_genre_id=eg.id);



CREATE OR REPLACE VIEW ensembles_coming_week_data AS
SELECT * FROM
(SELECT ensemble_id, COUNT(ensemble_id) AS current_enrolled FROM
ensemble_with_activityinfo_and_students
WHERE extract(week from NOW())=(extract(week from start_time)-1)
GROUP BY ensemble_id) AS enscount
LEFT JOIN
(SELECT ensemble_id AS ensemble_id_2, genre, day_of_week, max_students FROM
ensemble_with_activityinfo_and_students
WHERE extract(week from NOW())=(extract(week from start_time)-1)) AS ensinfo
ON enscount.ensemble_id=ensinfo.ensemble_id_2;



SELECT DISTINCT ensemble_id, current_enrolled, genre, day_of_week,
CASE
WHEN max_students=current_enrolled
THEN 'Fully booked'
WHEN (max_students-current_enrolled)<3
THEN '1-2 slots remaining'
WHEN (max_students-current_enrolled)>2
THEN 'More than 2 slots remaining'
END slots_available
FROM
ensembles_coming_week_data
ORDER BY genre, day_of_week;
