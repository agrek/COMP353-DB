/*
 1) A student can register in a course only if he/she got a passing grade
        in all the prerequisite courses for the course to be registered.
 */

SELECT DISTINCT course_code
FROM CourseCompleted
WHERE student_ssn = 889993771;

SELECT *
FROM Section
WHERE id = 2;

INSERT INTO SectionEnrollment
VALUES (2, 889993771);

/*
 2) Students are restricted to register in only one section of the same
    course in a given term.
 */

SELECT id, course_code, type, year, term
FROM SectionEnrollment
         INNER JOIN Section S ON SectionEnrollment.section_id = S.id
WHERE student_ssn = 399437700
  AND id = 5;

SELECT id, course_code, type, year, term
FROM Section
WHERE id = 6;

INSERT INTO SectionEnrollment
VALUES (6, 399437700);

/*
    3) Sections are assigned to different classrooms and different time slots.
 */

SELECT id,
       course_code,
       type,
       year,
       term,
       day,
       start_time,
       end_time,
       building_abbreviation,
       room_floor,
       room_number
FROM Section
WHERE id = 1;

INSERT INTO Section
VALUES (100, 'A23', 'RoomViolation', 'lecture', 'M, W', '14:45:00', '17:00:00', 'summer', '2018', 254156867, 'H', 5,
        535);

/*
    4) One instructor cannot be assigned to two sections in a conflicting time-slots.
 */

SELECT id,
       course_code,
       type,
       day,
       start_time,
       end_time,
       year,
       term,
       instructor_ssn
FROM Section
WHERE id = 1;

INSERT INTO Section
VALUES (101, 'A24', 'InstViolation', 'lecture', 'M, W', '15:00:00', '17:00:00', 'summer', '2018', 254156867, 'H', 9,
        903);

/*
    5) One student cannot take two different classes in a conflicting time-slots.
 */

SELECT id,
       course_code,
       type,
       day,
       start_time,
       end_time,
       year,
       term
FROM SectionEnrollment
         INNER JOIN Section S ON SectionEnrollment.section_id = S.id
WHERE student_ssn = 399437700
  AND id = 12;

SELECT id,
       course_code,
       type,
       day,
       start_time,
       end_time,
       year,
       term
FROM Section
WHERE id = 50;

INSERT INTO SectionEnrollment
VALUES (50, 399437700);

/*
    6) Students enrolled in a Thesis based program can apply for research funding
    if available under their supervisor.
 */
SELECT GradStudents.ssn, supervisor_ssn, funding_available
FROM GradStudents
         INNER JOIN Instructor I ON GradStudents.supervisor_ssn = I.ssn
WHERE funding_available = FALSE
  AND GradStudents.ssn = 881132104;

INSERT INTO ResearchFundingApplications
VALUES (26, 'granted', 881132104, 1, 2018, 'fall');

/*
    7) Only graduate students with GPA 3.0 and above are eligible to apply for
    research funding.
 */

SELECT ssn, gpa
FROM Student
WHERE ssn = 779332036
  AND ssn IN (SELECT ssn FROM GradStudents);

INSERT INTO ResearchFundingApplications
VALUES (26, 'granted', 779332036, 1, 2018, 'fall');

/*
    8) Graduate students who have a GPA of 3.2 and above are eligible to apply
    for teaching assistantship
 */

SELECT ssn, gpa
FROM Student
WHERE ssn = 779332036
  AND ssn IN (SELECT ssn FROM GradStudents);

INSERT INTO TAPosition
VALUES (3, 'marker', 20, 779332036, 750);

/*
    9) Graduate students are eligible to apply for a maximum of two teaching
    assistant positions per term
 */

SELECT assignee_ssn, year, term
FROM TAPosition
         INNER JOIN Section ON section_id = id
WHERE assignee_ssn = 177921799;

SELECT id, year, term
FROM Section
WHERE id = 3;

INSERT INTO TAPosition
VALUES (3, 'marker', 20, 177921799, 750);

/*
    10) the total work hours of a teaching assistant cannot exceed a maximum
    of 260 hours per academic year.
 */

SELECT section_id, hours, year, term
FROM TAPosition
         INNER JOIN Section ON section_id = id
WHERE assignee_ssn = 309348312
  AND year = 2018;

INSERT INTO TAPosition
VALUES (3, 'marker', 30, 309348312, 750);

/*
    11) Update the gpa of a student automatically upon the student completion of a course
 */

SELECT ssn, gpa
FROM Student
WHERE ssn = 399437700;

# Test insert
INSERT INTO CourseCompleted
VALUES (399437700, 'ENGL233', 2018, 'fall', 'A+');

SELECT ssn, gpa
FROM Student
WHERE ssn = 399437700;

# Test update
UPDATE CourseCompleted
SET grade = 'B+'
WHERE student_ssn = 399437700
  AND course_code = 'ENGL233'
  AND year = 2018
  AND term = 'fall';

SELECT ssn, gpa
FROM Student
WHERE ssn = 399437700;

# Test delete
DELETE
FROM CourseCompleted
WHERE student_ssn = 399437700
  AND course_code = 'ENGL233'
  AND year = 2018
  AND term = 'fall';

SELECT ssn, gpa
FROM Student
WHERE ssn = 399437700;

/*
    12) Update number of rooms, floors for a building upon insert, update, delete of a room
 */

SELECT *
FROM Building
WHERE abbreviation = 'EV';

INSERT INTO Room
VALUES ('EV', 'office', 3, 5, 536);

SELECT *
FROM Building
WHERE abbreviation = 'EV';

DELETE
FROM Room
WHERE building_abbreviation = 'EV'
  AND room_floor = 5
  AND room_number = 536;

SELECT *
FROM Building
WHERE abbreviation = 'EV';

UPDATE Room
SET building_abbreviation = 'EV'
WHERE building_abbreviation = 'H'
  AND room_floor = 9
  AND room_number = 906;

SELECT *
FROM Building
WHERE abbreviation = 'EV';

/*
    13) Number of enrolled students in a section cannot exceed the capacity of a room
 */

SELECT COUNT(*)
FROM SectionEnrollment
WHERE section_id = 48;

SELECT building_abbreviation, room_floor, room_number
FROM Section
WHERE id = 48;

UPDATE Room
SET capacity = 3
WHERE building_abbreviation = 'H'
  AND room_floor = 5
  AND room_number = 520;

INSERT INTO SectionEnrollment
VALUES (48, 399437700);

UPDATE SectionEnrollment
SET section_id = 48
WHERE section_id = 2
  AND student_ssn = 399437700;

/*
    14) End_time should be after start_time in Section
 */

INSERT INTO Section
VALUES (102, 'A24', 'COMP353', 'lecture', 'M, W', '15:00:00', '13:00:00', 'summer', '2018', 000000000, 'H', 9, 903);
