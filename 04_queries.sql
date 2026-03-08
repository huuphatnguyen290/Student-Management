USE Student_Management
GO
SELECT TOP 50
    s.student_ID,
    s.first_name,
    s.last_name,
    c.course_code,
    c.course_name,
    sec.section_id,
    sec.semester,
    sec.year,
    t.first_name AS teacher_first_name,
    t.last_name  AS teacher_last_name,
    e.enrollment_date,
    e.final_grade
FROM Enrollments e
JOIN Students s
    ON e.student_ID = s.student_ID
JOIN Sections sec
    ON e.section_id = sec.section_id
JOIN Courses c
    ON sec.course_id = c.course_id
JOIN Teachers t
    ON sec.teacher_id = t.teacher_ID
ORDER BY s.student_ID, sec.section_id;