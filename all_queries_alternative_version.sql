-- QUERY 1

SELECT extract(month from a.start_time) AS month, COUNT(*) AS total_amount, COUNT(g.id) AS group_amount, COUNT(i.id) AS individual_amount, COUNT(e.id) AS ensemble_amount
FROM activity_info AS a LEFT JOIN individual_lesson AS i ON i.activity_info_id=a.id
LEFT JOIN group_lesson AS g ON g.activity_info_id=a.id
LEFT JOIN ensemble AS e ON e.activity_info_id=a.id
WHERE extract(year from a.start_time)='2022'
GROUP BY extract(month from a.start_time)
ORDER BY extract(month from a.start_time);



-- QUERY 2

SELECT row_amount AS sibling_amount, COUNT(row_amount) AS students_with_sibling_amount FROM
(SELECT CASE
WHEN si.student_1_id IS NOT NULL THEN
COUNT(si.student_1_id)
WHEN si.student_1_id IS NULL THEN
0
END row_amount
FROM (student AS st
LEFT JOIN sibling AS si
ON st.id=si.student_1_id)
GROUP BY si.student_1_id) AS countview
GROUP BY row_amount
ORDER BY row_amount;



-- QUERY 3

SELECT inst_id, COUNT(inst_id) AS number_of_lessons FROM
(SELECT inst.id AS inst_id, a.start_time, i.instructor_id AS individual, g.instructor_id AS group, e.instructor_id AS ensemble
FROM activity_info AS a
LEFT JOIN individual_lesson AS i ON i.activity_info_id=a.id
LEFT JOIN group_lesson AS g ON g.activity_info_id=a.id
LEFT JOIN ensemble AS e ON e.activity_info_id=a.id
LEFT JOIN instructor AS inst ON i.instructor_id=inst.id OR g.instructor_id=inst.id OR e.instructor_id=inst.id) AS lessonsview
WHERE extract(year from NOW())=extract(year from start_time) AND extract(month from NOW())=extract(month from start_time)
GROUP BY inst_id
HAVING COUNT(inst_id)>1;



-- QUERY 4

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