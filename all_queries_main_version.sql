-- QUERY 1

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

CREATE OR REPLACE VIEW instructor_with_all_activities AS
SELECT * FROM
(SELECT inst.id AS inst_id, a.start_time, i.instructor_id AS individual, g.instructor_id AS group, e.instructor_id AS ensemble
FROM activity_info AS a
LEFT JOIN individual_lesson AS i ON i.activity_info_id=a.id
LEFT JOIN group_lesson AS g ON g.activity_info_id=a.id
LEFT JOIN ensemble AS e ON e.activity_info_id=a.id
LEFT JOIN instructor AS inst ON i.instructor_id=inst.id OR g.instructor_id=inst.id OR e.instructor_id=inst.id) AS lessonsview;



SELECT inst_id, COUNT(inst_id) AS number_of_lessons FROM
instructor_with_all_activities
WHERE extract(year from NOW())=extract(year from start_time) AND extract(month from NOW())=extract(month from start_time)
GROUP BY inst_id
HAVING COUNT(inst_id)>1;



-- QUERY 4

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