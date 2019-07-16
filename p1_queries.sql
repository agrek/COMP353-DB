/*	I
	Find ID, first name and last name of all the students who have taken
	Database course and received an A or A+ grade for the course.
*/
SELECT first_name, last_name, id
FROM Student
WHERE id IN (
    SELECT student_id
    FROM SectionEnrollment
    WHERE (grade = 'a+' OR grade = 'a')
      AND section_id IN (
        SELECT id
        FROM Section
        WHERE course_code IN (
            SELECT id
            FROM Course
            WHERE code = 'comp353'
        )
    )
);
-- i like this alternative better because it shows grade and course code
SELECT DISTINCT student_id, first_name, last_name, grade, code
FROM Student
         INNER JOIN SectionEnrollment ON SectionEnrollment.student_id = Student.id
         INNER JOIN Section ON SectionEnrollment.section_id = Section.id
         INNER JOIN Course ON Course.code = Section.course_code
WHERE (grade = 'a+' OR grade = 'a')
  AND Course.code = 'comp353';

/*	II
	Find ID, first name, last name and number of programs of students who
	are enrolled in at least two different programs in the Computer Science
	department.
*/
SELECT Student.id,
       concat(first_name, ' ', last_name) AS name,
       count(*)                           AS num_programs,
       Department.name                    AS dep_name
FROM Student
         INNER JOIN Studies ON Student.id = student_id
         INNER JOIN Program ON program_id = Program.id
         INNER JOIN Department ON Program.department_id = Department.id
WHERE Department.name = 'Computer Science'
GROUP BY Student.id
HAVING count(*) > 1;

/*	III
	Find the name of all the instructors who taught Comp 352 in the fall term
	of 2018 but have never taught the same course before.
*/
SELECT concat(first_name, ' ', last_name) AS name,
       start_time,
       term
FROM Instructor
         INNER JOIN Section ON Instructor.id = Section.instructor_id
         INNER JOIN Course ON course_code = Course.code
WHERE Course.code = 'comp352'
  AND term = 'fall'
  AND type = 'lecture'
  AND start_time BETWEEN '2019/00/00' AND '2020/00/00'
  AND NOT (start_time < '2019/00/00');
-- irreconcilable dates and terms

/*	IV
	Find the name of all the programs offered by the Computer Science
	department along with the number of credits required for completion in
	each program.
*/
SELECT Program.name AS prog_name, credits
FROM Program
         INNER JOIN Department ON department_id = Department.id
WHERE Department.name = 'Computer Science';

/*	V
	Find the name and IDs of all the undergraduate students who do not have
	an advisor.
*/
SELECT concat(Advisor.first_name, ' ', Advisor.last_name) AS Adv_name,
       advisor_id,
       concat(Student.first_name, ' ', Student.last_name) AS student_name,
       student_id,
       Program.name                                       AS prog_name
FROM Advisor
         RIGHT JOIN Program ON advisor_id = Advisor.id
         INNER JOIN Studies ON Program.id = Studies.program_id
         INNER JOIN Student ON Studies.student_id = Student.id
WHERE advisor_id IS NULL;

/*	VI
	Find the ID, name and assignment mandate of all the graduate students
	who are assigned as teaching assistants to Comp 353 for the summer term
	of 2019.
*/
SELECT TAPosition.id                                             AS TA_ID,
       assignee_id,
       concat(Instructor.first_name, ' ', +Instructor.last_name) AS Professor,
       concat(Student.first_name, ' ', Student.last_name)        AS TA_name,
       term,
       start_time
FROM Student
         INNER JOIN GradStudents ON Student.id = GradStudents.id
         INNER JOIN Instructor ON GradStudents.supervisor_id = Instructor.id
         INNER JOIN TAPosition ON Student.id = assignee_id
         INNER JOIN Section ON ta_id = Student.id
WHERE term = 'summer'
  AND start_time BETWEEN '2019/00/00' AND '2020/00/00'
  AND Section.course_code IN (
    SELECT Code
    FROM Course
    WHERE code = 'comp353'
)
GROUP BY Student.id;

/*	VII
	Find the name of all the supervisors in the Computer Science department
	who have supervised at least 20 students,
*/
SELECT concat(first_name, ' ', last_name) AS TA, count(*) AS count
FROM GradStudents
         INNER JOIN Instructor ON supervisor_id = Instructor.id
GROUP BY Instructor.first_name
HAVING count >= 20;

/*	VIII
	Find the details of all the courses offered by the Computer Science
	department for the summer term of 2019. Details include Course name,
	section, room location, start and end time, professor teaching the course,
	max class capacity and number of enrolled students.
*/
SELECT Course.code,
       Course.name                                              AS course_name,
       Section.name                                             AS section,
       credits,
       start_time,
       end_time,
       capacity,
       concat(Instructor.first_name, ' ', Instructor.last_name) AS Professor,
       count(DISTINCT student_id)                               AS num_students
FROM Section
         INNER JOIN Instructor ON Section.instructor_id = Instructor.id
         INNER JOIN SectionEnrollment ON Section.id = SectionEnrollment.section_id
         INNER JOIN Course ON Section.course_code = Course.code
         INNER JOIN Class ON Section.room_number = Class.room_number
WHERE term = 'summer'
  AND start_time BETWEEN '2019/00/00' AND '2020/00/00'
  AND department_id IN (
    SELECT id
    FROM Department
    WHERE Department.name = 'Computer Science'
)
GROUP BY Course.code;

/*	IX
	For each department, find the total number of courses offered by the department.
*/
SELECT Department.name AS dep_name, count(Course.department_id) AS num_courses
FROM Department,
     Course
WHERE Course.department_id = Department.id
GROUP BY Department.name;

/*	X
	For each program, find the total number of students enrolled into the program.
*/
SELECT Program.name, count(student_id) AS number_of_students
FROM Program,
     Studies
WHERE program_id = id
GROUP BY Program.name;
