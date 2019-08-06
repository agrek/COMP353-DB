-- interpolate this script if you're planning to run
-- p2_queries.sql in succession in order to restore
-- the db to its initial instance

-- i. a) Create a faculty member.
DELETE
FROM Instructor
where ssn = 666666666;

-- i. b) Delete a faculty member.
INSERT INTO Person(ssn, id, first_name, last_name, email, address, phone)
VALUES (195310678, 73, 'Johnny', 'Bryant', 'skajan@gmail.com', 73, '(774) 739-3054');

INSERT INTO Employee(ssn, retired, office_building_abbreviation, office_room_floor, office_room_number)
VALUES (195310678, 0, 'EV', 5, 530);

INSERT INTO Advisor(ssn)
VALUES (195310678);

UPDATE Program
SET advisor_ssn = 195310678
WHERE name = 'Economics Undergraduate'
   OR name = 'Economics Graduate';

INSERT INTO Publications
VALUES (195310678, 'journal', '2016-01-25', 'Data Structures and algorithms, what should be ignored!', 'Pearson');

INSERT INTO Awards
VALUES (195310678, '2017-02-21', 'IEEE Edison Medal');

INSERT INTO HasDegree
VALUES (195310678, '2012-10-28', 61, 2.75);

INSERT INTO Contract
VALUES (195310678, 'part-time', 91999.03, '2009-10-09', '2019-04-29');

-- i. c) Edit a faculty member.
UPDATE Instructor
SET dept_id = 1
WHERE ssn = 817794537;

-- ii. a) Create a Student.
DELETE
FROM Student
WHERE ssn = 777777777;

-- ii. b) Delete a Student.
INSERT INTO Person(ssn, id, first_name, last_name, email, address, phone)
VALUES (108906305, 18, 'Darla', 'Warren', 'stevelim@icloud.com', 18, '(912) 453-5668');

INSERT INTO Student(ssn)
VALUES (108906305);

INSERT INTO UGradStudents
VALUES (108906305);

INSERT INTO Studies
VALUES (108906305, 7);

INSERT INTO CourseCompleted(student_ssn, course_code, year, term, grade)
VALUES (108906305, 'ECON221', 2018, 'winter', 'B+'),
       (108906305, 'ENGL233', 2018, 'winter', 'B');

INSERT INTO SectionEnrollment
VALUES (42, 108906305),
       (48, 108906305);

-- ii. c) Edit a Student.
UPDATE Student S
    INNER JOIN Person P ON P.ssn = S.ssn
SET last_name = 'Nichols'
WHERE S.ssn = 373307205;

-- iii. a) Create a Teaching Assistant.
DELETE
FROM TAPosition
WHERE section_id = 64
  AND assignee_ssn = 965277745;

-- iii b) Delete
INSERT INTO TAPosition
VALUES (27, 'marker', 30, 814392875, 1000);

-- iii. c) Edit a Teaching Assistant.
UPDATE TAPosition
SET salary = 1000
WHERE assignee_ssn = 965277745
  AND section_id = 64;

-- xx. Register for section
DELETE
FROM SectionEnrollment
WHERE section_id = 46
  AND student_ssn = 752713919;

-- xxi. Drop
INSERT INTO SectionEnrollment
VALUES (53, 157682678);
