# i. Create/Delete/Edit/Display a faculty member.
# a) Create
INSERT INTO Person(ssn, id, first_name, last_name, email, address, phone)
VALUES (666666666, 78, 'Ray', 'Sfacelo', 'ray666@gmail.com', 51, '(514) 666-3232');

INSERT INTO Employee(ssn, retired, office_building_abbreviation, office_room_floor, office_room_number)
VALUES (666666666, 0, 'MB', 10, 1020);

INSERT INTO Instructor (ssn, dept_id, funding_available)
VALUES (666666666, 3, FALSE);

# b) Delete
DELETE
FROM Instructor
WHERE ssn = 666666666;

# c) Edit
UPDATE Instructor
SET dept_id = 7
WHERE ssn = 666666666;

# d) Display
SELECT concat(first_name, ' ', last_name)                       AS Professor,
       concat(office_building_abbreviation, office_room_number) AS office,
       phone,
       email,
       postal_code,
       city
FROM Person
         INNER JOIN Employee ON Person.ssn = Employee.ssn
         INNER JOIN Address ON Person.address = Address.id
WHERE Person.ssn = 666666666;

# ii. Create/Delete/Edit/Display a Student.
# a) Create
INSERT INTO Person(ssn, id, first_name, last_name, email, address, phone)
VALUES (777777777, 79, 'Samuel', 'Eto', 'eto@gmail.com', 30, '(450) 123-1111');

INSERT INTO Student(ssn)
VALUES (777777777);

INSERT INTO UGradStudents
VALUES (777777777);

# b) Delete
DELETE
FROM Student
WHERE ssn = 777777777;

# c) Edit
UPDATE UGradStudents UGS
    INNER JOIN Person P on P.ssn = UGS.ssn
SET last_name = 'Untermyer'
WHERE UGS.ssn = 777777777;

# d) Display
SELECT concat(first_name, ' ', last_name) AS name,
       gpa,
       phone,
       email,
       postal_code,
       city
FROM Student
         INNER JOIN Person P ON Student.ssn = P.ssn
         INNER JOIN Address ON P.address = Address.id
WHERE P.ssn = 108906305;

# iii. Create/Delete/Edit/Display a Teaching Assistant.
# a) Create
INSERT INTO TAPosition
VALUES (64, 'Lab Instructor', 50, 965277745, 1000);

# b) Delete
DELETE
FROM TAPosition
WHERE assignee_ssn = 965277745;

# c) Edit
UPDATE TAPosition
SET salary = 1220
WHERE assignee_ssn = 965277745
  AND section_id = 64;
-- in case TA gives multiple sections, we edit for a specific section (!)

# d) Display
SELECT concat(first_name, ' ', last_name) AS name,
       phone,
       email,
       postal_code,
       city,
       section_id,
       position,
       term,
       year,
       salary,
       course_code
FROM TAPosition
         INNER JOIN Person P ON assignee_ssn = P.ssn
         INNER JOIN Address ON P.address = Address.id
         INNER JOIN Section ON TAPosition.section_id = Section.id
WHERE P.ssn = 965277745;

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

-- subquery group_concat the equipment; main query group_concat the rooms
SELECT name,
       street,
       city,
       postal_code,
       num_floors,
       total_number_rooms,
       room_floor,
       count(room_number)                                                               AS room_per_floor,
       group_concat(room_number, ' (', type, ')', ' [', equipment, ']' SEPARATOR ' | ') AS rooms
FROM (
         SELECT name,
                A.street,
                A.city,
                A.postal_code,
                num_floors,
                Building.num_rooms                                                             AS total_number_rooms,
                R.room_number,
                R.type,
                R.room_floor,
                group_concat(ifnull(quantity, ''), ' ', ifnull(equipment, '') SEPARATOR ' & ') AS equipment

         FROM Building
                  LEFT JOIN Address A ON Building.address = A.id
                  LEFT JOIN Room R ON Building.abbreviation = R.building_abbreviation
                  LEFT JOIN RoomNeeds RN
                            ON R.building_abbreviation = RN.building_abbreviation AND R.room_floor = RN.room_floor AND
                               R.room_number = RN.room_number
                  LEFT JOIN RoomOverhead RO ON RN.room_overhead_id = RO.id
         WHERE Building.abbreviation = 'H'
         GROUP BY R.room_number
     ) temp
GROUP BY room_floor;

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
    SELECT student_ssn
    FROM Studies
    WHERE program_id = (
        SELECT id
        FROM Program
        WHERE name = 'Computer Science Undergraduate'
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
    WHERE department_id IN (
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
WHERE term = 'fall'
  AND year = 2018
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
FROM Program
INNER JOIN Studies S on Program.id = S.program_id
WHERE program_id = id
GROUP BY Program.name;

# xix. Give a list of courses taken by a specific student in a given term.

SELECT course_code
FROM Section
         INNER JOIN SectionEnrollment ON Section.id = section_id
WHERE year = 2018
  AND term = 'fall'
  AND student_ssn = 645399011
GROUP BY course_code;

# xx. Register a student in a specific course.

-- this is done on 2 steps in order to choose the section; subquerying the section would return multiple records (!)
SELECT id
FROM Section
WHERE course_code = 'MATH209';

INSERT INTO SectionEnrollment
VALUES (46, 752713919);

# xxi. Drop a course for a specific student.

DELETE
FROM SectionEnrollment
WHERE SectionEnrollment.student_ssn = 645399011
  AND SectionEnrollment.section_id IN (
    SELECT *
    FROM (SELECT S.id
          FROM Section S
                   RIGHT JOIN SectionEnrollment ON S.id = SectionEnrollment.section_id
          WHERE course_code = 'COMP352') temp);

-- insert it back for testing
-- INSERT INTO SectionEnrollment VALUES (54, 645399011);

-- display enrolled courses for testing
-- SELECT group_concat(DISTINCT course_code SEPARATOR ', ') AS enrolled
-- FROM SectionEnrollment
-- INNER JOIN Section S ON SectionEnrollment.section_id = S.id
-- WHERE student_ssn = 645399011;

# xxii. Give a detailed report for a specific student (This include personal data,
# academic history, courses taken and grades received for each course,
# GPA, etc.)

-- included publications, awards, experience; only 2 students have awards; 0 students have exp or publications (!)
SELECT concat(Person.first_name, ' ', Person.last_name)                                           AS name,
       email,
       Person.id,
       Person.ssn,
       Student.gpa,
       group_concat(DISTINCT concat_WS('-', Pub.title, Pub.type, Pub.date) SEPARATOR ' & ')       AS Publication,
       group_concat(DISTINCT concat_WS('-', Ex.start_date, Ex.company, Ex.title) SEPARATOR ' & ') AS experience,
       group_concat(DISTINCT concat_WS('-', Awards.name, Awards.date) SEPARATOR ' & ')            AS awards,
       group_concat(DISTINCT Degree.name SEPARATOR ', ')                                          AS degrees,
       group_concat(CC.course_code, '= \'', CC.grade, '\'' SEPARATOR '\r\n')                      AS grades
FROM Person
         INNER JOIN Student ON Person.ssn = Student.ssn
         LEFT JOIN Experience Ex ON Person.ssn = Ex.ssn
         LEFT JOIN HasDegree ON Person.ssn = HasDegree.ssn
         LEFT JOIN Degree ON degree_id = Degree.id
         LEFT JOIN Awards ON Awards.ssn = Person.ssn
         LEFT JOIN Publications Pub ON Person.ssn = Pub.ssn
         LEFT JOIN CourseCompleted CC ON Person.ssn = CC.student_ssn
WHERE Student_ssn = 934347739
GROUP BY Person.ssn;