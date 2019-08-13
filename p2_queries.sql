-- i. a) Create a faculty member.
DROP PROCEDURE IF EXISTS insertInstructor;
DELIMITER //
CREATE PROCEDURE insertInstructor(IN SSN1 INT(9), IN fn VARCHAR(45), IN ln VARCHAR(45), IN em VARCHAR(45),
                                  IN address1 INT, IN ph VARCHAR(14), IN bAbb VARCHAR(45),
                                  IN oFloor INT(2), IN oNum INT(3), IN deptID INT, IN fundingAv BOOL)
BEGIN

    INSERT INTO Person(ssn, first_name, last_name, email, address, phone)
    VALUES (SSN1, fn, ln, em, address1, ph);

    INSERT INTO Employee(ssn, office_building_abbreviation, office_room_floor, office_room_number)
    VALUES (SSN1, bAbb, oFloor, oNum);

    INSERT INTO Instructor (ssn, dept_id, funding_available)
    VALUES (SSN1, deptID, fundingAv);

END //
DELIMITER ;

CALL insertInstructor(666666666, 'Ray', 'Sfacelo', 'ray666@gmail.com', 51, '(514) 666-3232', 'MB', 10, 1020, 3, FALSE);

-- i. b) Delete a faculty member.
DELETE
FROM Person
WHERE ssn = 195310678;

-- i. c) Edit a faculty member.
UPDATE Instructor
SET dept_id = 7
WHERE ssn = 817794537;

-- i. d) Display a faculty member.
SELECT concat(first_name, ' ', last_name)                       AS Professor,
       concat(office_building_abbreviation, office_room_number) AS office,
       phone,
       email,
       postal_code,
       city
FROM Person
         INNER JOIN Employee ON Person.ssn = Employee.ssn
         INNER JOIN Address ON Person.address = Address.id
WHERE Person.ssn = 747652718;

-- ii. a) Create a Student.
DROP PROCEDURE IF EXISTS insertStudent;
DELIMITER //
CREATE PROCEDURE insertStudent(IN SSN1 INT(9), IN fn VARCHAR(45), IN ln VARCHAR(45), IN em VARCHAR(45),
                               IN address1 INT, IN ph VARCHAR(14))
BEGIN

    INSERT INTO Person(ssn, first_name, last_name, email, address, phone)
    VALUES (SSN1, fn, ln, em, address1, ph);

    INSERT INTO Student(ssn)
    VALUES (SSN1);

    INSERT INTO UGradStudents
    VALUES (SSN1);

END //
DELIMITER ;

CALL insertStudent(777777777, 'Samuel', 'Eto', 'eto@gmail.com', 30, '(450) 123-1111');

-- ii. b) Delete a Student.
DELETE
FROM Student
WHERE ssn = 108906305;

-- ii. c) Edit a Student.
UPDATE Student S
    INNER JOIN Person P ON P.ssn = S.ssn
SET last_name = 'Bruceter'
WHERE S.ssn = 373307205;

-- ii. d) Display a Student.
SELECT concat(first_name, ' ', last_name) AS name,
       gpa,
       phone,
       email,
       postal_code,
       city
FROM Student
         INNER JOIN Person P ON Student.ssn = P.ssn
         INNER JOIN Address ON P.address = Address.id
WHERE P.ssn = 667004396;

-- iii. a) Create a Teaching Assistant.
INSERT INTO TAPosition
VALUES (64, 'Lab Instructor', 50, 965277745, 1000);

-- iii. b) Delete a Teaching Assistant.
-- display the TA's positions first
SELECT assignee_ssn,
       position,
       section_id,
       course_code,
       salary,
       concat(Person.first_name, ' ', Person.last_name) AS TA_name
FROM Person
         INNER JOIN TAPosition ON Person.ssn = assignee_ssn
         INNER JOIN Section S ON TAPosition.section_id = S.id
WHERE assignee_ssn = 814392875;

DELETE
FROM TAPosition
WHERE section_id = 27;

-- iii. c) Edit a Teaching Assistant.
UPDATE TAPosition
SET salary = 1220
WHERE assignee_ssn = 965277745
  AND section_id = 64;

-- iii. d) Display a Teaching Assistant.
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

-- iv. Give a list of all campuses.

SELECT *
FROM Campus;

-- v. Give a list of buildings on a given campus. TODO: update in website

SELECT B.name, B.abbreviation
FROM Campus C
         INNER JOIN BuildingCampus BC ON C.abbreviation = BC.campus
         INNER JOIN Building B ON BC.address = B.address
WHERE C.name = 'Loyola';

-- vi. Give details of a specific building (this include address of the building,
-- number of floors, number of rooms in each floor, and details of each room
-- such as room type, capacity of the room and existing facilities in the room
-- if it is a classroom or a lab.

-- subquery group_concat the equipment; main query group_concat the rooms
SELECT name,
       street,
       city,
       postal_code,
       num_floors,
       total_number_rooms,
       room_floor,
       count(room_number)                                                                AS room_per_floor,
       group_concat(room_number, ' (', type, ')', ' [', equipment, ']' SEPARATOR '\r\n') AS `room (type) needs`
FROM (
         SELECT name,
                A.street,
                A.city,
                A.postal_code,
                num_floors,
                Building.num_rooms  AS total_number_rooms,
                R.room_number,
                R.type,
                R.room_floor,
                group_concat(ifnull(quantity, ''), ifnull(equipment, '') ORDER BY equipment SEPARATOR
                             ' & ') AS equipment

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

-- vii. Get a list of all programs available in a specific department along with the
-- number of credits required for completion in each program.

SELECT Program.name, credits
FROM Program
         INNER JOIN Department ON Program.department_id = Department.id
WHERE Department.name = 'Computer Science';

-- viii. Get a list of all courses offered in a given term by a specific program.

SELECT code, Course.name AS course_name
FROM Course
         INNER JOIN Section ON Course.code = Section.course_code
WHERE term = 'fall'
  AND year = 2018
  AND department_id IN (
    SELECT id
    FROM Department
    WHERE name = 'Software Engineering'
)
GROUP BY code;

-- ix. Get the details of all the courses offered by a specific department for a
-- specific term. Details include Course name, section, room location, start
-- and end time, professor teaching the course, max class capacity and
-- number of enrolled students.

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
WHERE term = 'fall'
  AND year = 2018
  AND department_id = (
    SELECT id
    FROM Department
    WHERE Department.name = 'Software Engineering'
)
GROUP BY Section.id;

-- x. Find ID, first name and last name of all the students who are enrolled in a
-- specific program in a given term.

SELECT concat(first_name, ' ', last_name) AS name, Person.id
FROM Person
WHERE ssn IN (
    SELECT student_ssn
    FROM Studies
    WHERE year = 2017
      AND term = 'winter'
      AND program_id = (
        SELECT id
        FROM Program
        WHERE name = 'Computer Science Undergraduate'
    )
);

-- xi. Find the name of all the instructors who taught a given course on a
-- specific term.

SELECT DISTINCT concat(first_name, ' ', last_name) AS Professor
FROM Person
WHERE ssn IN (
    SELECT instructor_ssn
    FROM Section
    WHERE year = 2018
      AND term = 'fall'
);

-- xii. Give a list of all supervisors in a given department.

SELECT DISTINCT concat(first_name, ' ', last_name) AS supervisior
FROM GradStudents
         INNER JOIN Person ON supervisor_ssn = Person.ssn;

-- xiii. Give a list of all the advisors in a given department.

SELECT concat(first_name, ' ', last_name) AS advisor
FROM Advisor
         INNER JOIN Person ON Advisor.ssn = Person.ssn
WHERE Advisor.ssn IN (
    SELECT advisor_ssn
    FROM Program
    WHERE department_id IN (
        SELECT id
        FROM Department
        WHERE name = 'Computer Science'
    )
);

-- xiv. Find the name and IDs of all the graduate students who are supervised by
-- a specific Professor.

SELECT DISTINCT concat(first_name, ' ', last_name) AS student_name, id
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
            WHERE first_name = 'Raymond'
              AND last_name = 'Moreno'
        )
    )
);

-- xv. Find the ID, name and assignment mandate of all the graduate students
-- who are assigned as teaching assistants to a specific course on a given
-- term.

SELECT id,
       position,
       concat(Person.first_name, ' ', Person.last_name) AS TA_name
FROM Person
         INNER JOIN TAPosition ON Person.ssn = assignee_ssn
WHERE section_id IN (
    SELECT Section.id
    FROM Section
    WHERE term = 'fall'
      AND year = 2018
      AND course_code = 'comp353'
);

-- xvi. Find the name, IDs and total amount of funds received by all the graduate
-- students who received research funds in a given term.

SELECT concat(Person.first_name, ' ', Person.last_name) AS name,
       sum(amount)                                      AS funds
FROM GradStudents GS
         INNER JOIN Person ON Person.ssn = GS.ssn
         INNER JOIN ResearchFundingApplications ON student_ssn = Person.ssn
         LEFT JOIN ResearchFunds ON ResearchFundingApplications.research_fund_id = ResearchFunds.id
WHERE term = 'fall'
  AND year = 2018
  AND status = 'granted'
GROUP BY GS.ssn;

-- xvii. For each department, find the total number of courses offered by the
-- department and the name of its chairman.

SELECT Department.name                                  AS dep_name,
       count(Course.code)                               AS num_courses,
       concat(Person.first_name, ' ', Person.last_name) AS Professor
FROM Department
         LEFT JOIN Course ON Department.id = Course.department_id
         LEFT JOIN Instructor ON Instructor.ssn = chairman_ssn
         LEFT JOIN Person ON chairman_ssn = Person.ssn
GROUP BY Department.name;

-- xviii. For each program, find the total number of students enrolled into the
-- program.

SELECT Program.name, count(student_ssn) AS number_of_students
FROM Program
         INNER JOIN Studies S ON Program.id = S.program_id
WHERE program_id = id
GROUP BY Program.name;

-- xix. Give a list of courses taken by a specific student in a given term.

SELECT course_code
FROM Section
         INNER JOIN SectionEnrollment ON Section.id = section_id
WHERE year = 2018
  AND term = 'winter'
  AND student_ssn = 934347739
GROUP BY course_code;

-- xx. Register a student in a specific course.

SELECT S.id,
       term,
       year,
       day,
       start_time,
       end_time,
       concat(Person.first_name, ' ', Person.last_name) AS Professorr
FROM Section S
         INNER JOIN Instructor I ON S.instructor_ssn = I.ssn
         INNER JOIN Person ON Person.ssn = instructor_ssn
WHERE course_code = 'MATH209';

INSERT INTO SectionEnrollment
VALUES (46, 752713919);

-- xxi. Drop a course for a specific student.

DELETE
FROM SectionEnrollment
WHERE SectionEnrollment.student_ssn = 157682678
  AND SectionEnrollment.section_id IN (SELECT id FROM Section WHERE course_code = 'PHYS393')
  AND SectionEnrollment.section_id NOT IN (
    SELECT *
    FROM (SELECT section_id
          FROM SectionEnrollment SE
                   INNER JOIN Section S ON SE.section_id = S.id
                   INNER JOIN Student St ON SE.student_ssn = St.ssn
                   INNER JOIN CourseCompleted CC ON St.ssn = CC.student_ssn AND
                                                    S.term = CC.term AND
                                                    S.course_code = CC.course_code AND
                                                    S.year = CC.year
          WHERE SE.student_ssn = 157682678
         ) temp);

-- insert it back for testing/demo
# INSERT INTO SectionEnrollment
# VALUES (53, 157682678);

-- display enrolled courses for testing/demo
# SELECT group_concat(DISTINCT course_code SEPARATOR '\r\n') AS enrolled
# FROM SectionEnrollment
#          INNER JOIN Section S ON SectionEnrollment.section_id = S.id
# WHERE student_ssn = 157682678;

-- xxii. Give a detailed report for a specific student (This include personal data,
-- academic history, courses taken and grades received for each course,
-- GPA, etc.)

SELECT concat(Person.first_name, ' ', Person.last_name)                                            AS name,
       email,
       Person.id,
       Person.ssn,
       Student.gpa,
       group_concat(DISTINCT concat_WS(' ', course_code, grade, term, year) SEPARATOR '\r\n')      AS grades,
       group_concat(DISTINCT concat_WS('-', Pub.title, Pub.type, Pub.date) SEPARATOR '\r\n')       AS Publication,
       group_concat(DISTINCT concat_WS('-', Ex.start_date, Ex.company, Ex.title) SEPARATOR '\r\n') AS experience,
       group_concat(DISTINCT concat_WS('-', Awards.name, Awards.date) SEPARATOR '\r\n')            AS awards,
       group_concat(DISTINCT Degree.name SEPARATOR '\r\n')                                         AS degrees
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