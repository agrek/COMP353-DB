# i. Create/Delete/Edit/Display a faculty member.

# ii. Create/Delete/Edit/Display a Student.

# iii. Create/Delete/Edit/Display a Teaching Assistant.

# iv. Give a list of all campuses.
SELECT *
FROM Campus;

# v. Give a list of buildings on a given campus.
SELECT name, abbreviation
FROM Building
WHERE campus IN (
    SELECT abbreviation
    FROM Campus
    WHERE name = 'Loyola'
);

# vi. Give details of a specific building (this include address of the building,
# number of floors, number of rooms in each floor, and details of each room
# such as room type, capacity of the room and existing facilities in the room
# if it is a classroom or a lab.

# vii. Get a list of all programs available in a specific department along with the
# number of credits required for completion in each program.

SELECT Program.name, credits
FROM Program
         INNER JOIN Department ON Program.department_id = Department.id
WHERE Department.name = 'Computer Science';

# viii. Get a list of all courses offered in a given term by a specific program.
SELECT code, Course.name AS course_name
FROM Course
         INNER JOIN Section ON Course.code = Section.course_code
WHERE term = 'summer'
  AND year = 2018
GROUP BY code;

# ix. Get the details of all the courses offered by a specific department for a
# specific term. Details include Course name, section, room location, start
# and end time, professor teaching the course, max class capacity and
# number of enrolled students.

SELECT code,
       Course.name                        AS course_name,
       Section.name                       AS section,
       start_time,
       end_time,
       day,
       Section.type,
       Section.term,
       credits,
       concat(first_name, ' ', last_name) AS Professor,
       count(student_ssn)                 AS num_students,
       Section.building_abbreviation,
       Section.room_floor,
       Section.room_number,
       capacity
FROM Section
         INNER JOIN Room ON Section.building_abbreviation = Room.building_abbreviation AND
                            Section.room_floor = Room.room_floor AND
                            Section.room_number = Room.room_number
         INNER JOIN Instructor ON Section.instructor_ssn = Instructor.ssn
         INNER JOIN Employee ON Instructor.ssn = Employee.ssn
         INNER JOIN Person ON Employee.ssn = Person.ssn
         INNER JOIN Course ON Section.course_code = Course.code
         INNER JOIN SectionEnrollment ON Section.id = SectionEnrollment.section_id
WHERE term = 'summer'
  AND year = 2018
  AND department_id = (
    SELECT id
    FROM Department
    WHERE Department.name = 'Computer Science'
)
GROUP BY Section.id;

# x. Find ID, first name and last name of all the students who are enrolled in a
# specific program in a given term.

SELECT concat(first_name, ' ', last_name) AS name, Person.ssn
FROM Person
WHERE ssn IN (
    SELECT ssn
    FROM Student
    WHERE ssn IN (
        SELECT student_ssn
        FROM Studies
        WHERE program_id = (
            SELECT id
            FROM Program
            WHERE name = 'Computer Science Undergraduate'
        )
    )
);

# xi. Find the name of all the instructors who taught a given course on a
# specific term.

SELECT DISTINCT concat(first_name, ' ', last_name) AS Professor
FROM Person
WHERE ssn IN (
    SELECT instructor_ssn
    FROM Section
    WHERE year = 2018
      AND term = 'fall'
);

# xii. Give a list of all supervisors in a given department.

SELECT DISTINCT concat(first_name, ' ', last_name) AS supervisior
FROM GradStudents
         INNER JOIN Person ON supervisor_ssn = Person.ssn;

# xiii. Give a list of all the advisors in a given department.

SELECT concat(first_name, ' ', last_name) AS advisior
FROM Advisor
         INNER JOIN Person ON Advisor.ssn = Person.ssn
WHERE Advisor.ssn IN (
    SELECT advisor_ssn
    FROM Program
    WHERE Program.id IN (
        SELECT id
        FROM Department
        WHERE name = 'Electrical Engineering'
    )
);

# xiv. Find the name and IDs of all the graduate students who are supervised by
# a specific Professor.

SELECT DISTINCT concat(first_name, ' ', last_name) AS student_name, ssn
FROM Person
WHERE ssn IN (
    SELECT ssn
    FROM GradStudents
    WHERE supervisor_ssn IN (
        SELECT Instructor.ssn
        FROM Instructor
        WHERE Instructor.ssn IN (
            SELECT ssn
            FROM Person
            WHERE first_name = 'Michael'
              AND last_name = 'Clarke'
        )
    )
);

# xv. Find the ID, name and assignment mandate of all the graduate students
# who are assigned as teaching assistants to a specific course on a given
# term.

SELECT assignee_ssn,
       position,
       concat(Person.first_name, ' ', Person.last_name) AS TA_name
FROM Person
         INNER JOIN TAPosition ON Person.ssn = assignee_ssn
WHERE section_id IN (
    SELECT Section.id
    FROM Section
    WHERE term = 'summer'
      AND year = 2018
      AND course_code = 'comp353'
);

# xvi. Find the name, IDs and total amount of funds received by all the graduate
# students who received research funds in a given term.

SELECT concat(Person.first_name, ' ', Person.last_name) AS name,
       sum(amount)                                      AS funds
FROM Person
         INNER JOIN ResearchFundingApplications ON student_ssn = Person.ssn
         LEFT JOIN ResearchFunds ON ResearchFundingApplications.research_fund_id = ResearchFunds.id
GROUP BY ssn;

# xvii. For each department, find the total number of courses offered by the
# department and the name of its chairman.

SELECT Department.name                                  AS dep_name,
       count(Course.code)                               AS num_courses,
       concat(Person.first_name, ' ', Person.last_name) AS Professor
FROM Department
         LEFT JOIN Course ON Department.id = Course.department_id
         LEFT JOIN Instructor ON Instructor.ssn = chairman_ssn
         LEFT JOIN Person ON chairman_ssn = Person.ssn
GROUP BY Department.name;

# xviii. For each program, find the total number of students enrolled into the
# program.

SELECT Program.name, count(student_ssn) AS number_of_students
FROM Program,
     Studies
WHERE program_id = id
GROUP BY Program.name;

# xix. Give a list of courses taken by a specific student in a given term.

SELECT count(DISTINCT course_code)                       AS count,
       group_concat(DISTINCT course_code SEPARATOR ', ') AS courses
FROM Section
         INNER JOIN SectionEnrollment ON Section.id = section_id
WHERE year = 2018
  AND term = 'fall'
  AND student_ssn = 645399011;

# xx. Register a student in a specific course.

# xxi. Drop a course for a specific student.

# xxii. Give a detailed report for a specific student (This include personal data,
# academic history, courses taken and grades received for each course,
# GPA, etc.)