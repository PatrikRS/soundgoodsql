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