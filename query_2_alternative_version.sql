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
