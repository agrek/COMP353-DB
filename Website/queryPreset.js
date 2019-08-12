var opt = document.getElementById('presetQuery'); 

// Query 1 INSERT 
opt.options[0].value = "CALL insertInstructor (666666666, 'Ray', 'Sfacelo', 'ray666@gmail.com', 51, '(514) 666-3232', 'MB', 10, 1020, 3, FALSE)";
// Query 1 DELETE
opt.options[1].value = "DELETE FROM Advisor WHERE ssn = 195310678";
// Query 1 UPDATE
opt.options[2].value = "UPDATE Instructor SET dept_id = 7 WHERE ssn = 817794537";
// Query 1 DISPLAY
opt.options[3].value = "SELECT concat(first_name, ' ', last_name)                       AS Professor,        concat(office_building_abbreviation, office_room_number) AS office,        phone,        email,        postal_code,        city FROM Person          INNER JOIN Employee ON Person.ssn = Employee.ssn          INNER JOIN Address ON Person.address = Address.id WHERE Person.ssn = 747652718;";

// Query 2 INSERT 
opt.options[4].value = "CALL insertStudent (777777777, 'Samuel', 'Eto', 'eto@gmail.com', 30, '(450) 123-1111')";
// Query 2 DELETE 
opt.options[5].value = "DELETE FROM Student WHERE ssn = 108906305";
// Query 2 UPDATE 
opt.options[6].value = "UPDATE Student S     INNER JOIN Person P ON P.ssn = S.ssn SET last_name = 'Bruceter' WHERE S.ssn = 373307205";
// Query 2 DISPLAY
opt.options[7].value = "SELECT concat(first_name, ' ', last_name) AS name,        gpa,        phone,        email,        postal_code,        city FROM Student          INNER JOIN Person P ON Student.ssn = P.ssn          INNER JOIN Address ON P.address = Address.id WHERE P.ssn = 667004396";

// Query 3 INSERT 
opt.options[8].value = "INSERT INTO TAPosition VALUES (64, 'Lab Instructor', 50, 965277745, 1000)";
// Query 3 DELETE 
opt.options[9].value = "DELETE FROM TAPosition WHERE section_id = 27";
// Query 3 UPDATE 
opt.options[10].value = "UPDATE TAPosition SET salary = 1220 WHERE assignee_ssn = 965277745   AND section_id = 64";
// Query 3 DISPLAY
opt.options[11].value = "SELECT concat(first_name, ' ', last_name) AS name,        phone,        email,        postal_code,        city,        section_id,        position,        term,        year,        salary,        course_code FROM TAPosition          INNER JOIN Person P ON assignee_ssn = P.ssn          INNER JOIN Address ON P.address = Address.id          INNER JOIN Section ON TAPosition.section_id = Section.id WHERE P.ssn = 965277745";

// Query 4
opt.options[12].value = "SELECT * FROM Campus";
// Query 5
opt.options[13].value = "SELECT B.name, B.abbreviation FROM Campus C INNER JOIN BuildingCampus BC on C.abbreviation = BC.campus INNER JOIN Building B on BC.address = B.address WHERE C.name = 'Loyola'";
// Query 6
opt.options[14].value = "SELECT name,        street,        city,        postal_code,        num_floors,        total_number_rooms,        room_floor,        count(room_number)                                                                AS room_per_floor,        group_concat(room_number, ' (', type, ')', ' [', equipment, ']' SEPARATOR '<br>') AS `room (type) [needs]` FROM (          SELECT name,                 A.street,                 A.city,                 A.postal_code,                 num_floors,                 Building.num_rooms  AS total_number_rooms,                 R.room_number,                 R.type,                 R.room_floor,                 group_concat(ifnull(quantity, ''), ifnull(equipment, '') ORDER BY equipment SEPARATOR                              ' & ') AS equipment           FROM Building                   LEFT JOIN Address A ON Building.address = A.id                   LEFT JOIN Room R ON Building.abbreviation = R.building_abbreviation                   LEFT JOIN RoomNeeds RN                             ON R.building_abbreviation = RN.building_abbreviation AND R.room_floor = RN.room_floor AND                                R.room_number = RN.room_number                   LEFT JOIN RoomOverhead RO ON RN.room_overhead_id = RO.id          WHERE Building.abbreviation = 'H'          GROUP BY R.room_number      ) temp GROUP BY room_floor";
// Query 7
opt.options[15].value = "SELECT Program.name, credits FROM Program          INNER JOIN Department ON Program.department_id = Department.id WHERE Department.name = 'Computer Science'";
// Query 8
opt.options[16].value = "SELECT code, Course.name AS course_name FROM Course          INNER JOIN Section ON Course.code = Section.course_code WHERE term = 'fall'   AND year = 2018   AND department_id IN (     SELECT id     FROM Department     WHERE name = 'Software Engineering' ) GROUP BY code";
// Query 9
opt.options[17].value = "SELECT code,        Course.name                        AS course_name,        Section.name                       AS section,        start_time,        end_time,        day,        Section.type,        Section.term,        credits,        concat(first_name, ' ', last_name) AS Professor,        count(student_ssn)                 AS num_students,        Section.building_abbreviation,        Section.room_floor,        Section.room_number,        capacity FROM Section          INNER JOIN Room ON Section.building_abbreviation = Room.building_abbreviation AND                             Section.room_floor = Room.room_floor AND                             Section.room_number = Room.room_number          INNER JOIN Instructor ON Section.instructor_ssn = Instructor.ssn          INNER JOIN Employee ON Instructor.ssn = Employee.ssn          INNER JOIN Person ON Employee.ssn = Person.ssn          INNER JOIN Course ON Section.course_code = Course.code          INNER JOIN SectionEnrollment ON Section.id = SectionEnrollment.section_id WHERE term = 'fall'   AND year = 2018   AND department_id = (     SELECT id     FROM Department     WHERE Department.name = 'Software Engineering' ) GROUP BY Section.id";
// Query 10
opt.options[18].value = "SELECT concat(first_name, ' ', last_name) AS name, Person.id FROM Person WHERE ssn IN (    SELECT student_ssn    FROM Studies    WHERE year = 2017 AND term = 'winter' 	AND program_id = (        SELECT id        FROM Program        WHERE name = 'Computer Science Undergraduate'    ))";
// Query 11
opt.options[19].value = "SELECT DISTINCT concat(first_name, ' ', last_name) AS Professor FROM Person WHERE ssn IN (     SELECT instructor_ssn     FROM Section     WHERE year = 2018       AND term = 'fall' )";
// Query 12
opt.options[20].value = "SELECT DISTINCT concat(first_name, ' ', last_name) AS supervisior FROM GradStudents          INNER JOIN Person ON supervisor_ssn = Person.ssn";
// Query 13
opt.options[21].value = "SELECT concat(first_name, ' ', last_name) AS advisor FROM Advisor          INNER JOIN Person ON Advisor.ssn = Person.ssn WHERE Advisor.ssn IN (     SELECT advisor_ssn     FROM Program     WHERE department_id IN (         SELECT id         FROM Department         WHERE name = 'Computer Science'     ) )";
// Query 14
opt.options[22].value = "SELECT DISTINCT concat(first_name, ' ', last_name) AS student_name, id FROM Person WHERE ssn IN (    SELECT ssn    FROM GradStudents    WHERE supervisor_ssn IN (        SELECT Instructor.ssn        FROM Instructor        WHERE Instructor.ssn IN (            SELECT ssn            FROM Person            WHERE first_name = 'Raymond'              AND last_name = 'Moreno'        )    ))";
// Query 15
opt.options[23].value = "SELECT assignee_ssn,position,concat(Person.first_name, ' ', Person.last_name) AS TA_name FROM Person  INNER JOIN TAPosition ON Person.ssn = assignee_ssn WHERE section_id IN (     SELECT Section.id     FROM Section     WHERE term = 'summer'       AND year = 2018       AND course_code = 'comp352' )";
// Query 16
opt.options[24].value = "SELECT concat(Person.first_name, ' ', Person.last_name) AS name, Person.id, sum(amount)AS funds FROM Person  INNER JOIN ResearchFundingApplications ON student_ssn = Person.ssn  LEFT JOIN ResearchFunds ON ResearchFundingApplications.research_fund_id = ResearchFunds.id GROUP BY ssn;";
// Query 17
opt.options[25].value = "SELECT Department.name    AS dep_name,count(Course.code) AS num_courses,concat(Person.first_name, ' ', Person.last_name) AS Chairman FROM Department  LEFT JOIN Course ON Department.id = Course.department_id  LEFT JOIN Instructor ON Instructor.ssn = chairman_ssn  LEFT JOIN Person ON chairman_ssn = Person.ssn GROUP BY Department.name";
// Query 18
opt.options[26].value = "SELECT Program.name, count(student_ssn) AS number_of_students FROM Program,      Studies WHERE program_id = id GROUP BY Program.name";
// Query 19
opt.options[27].value = "SELECT course_code FROM Section INNER JOIN SectionEnrollment ON Section.id = section_id WHERE year = 2018 AND term = 'winter' AND student_ssn = 934347739 GROUP BY course_code";
// Query 20
opt.options[28].value = "INSERT INTO SectionEnrollment VALUES (46, 752713919)";
// Query 21
opt.options[29].value = "DELETE FROM SectionEnrollment WHERE SectionEnrollment.student_ssn = 777777777   AND SectionEnrollment.section_id IN (     SELECT *     FROM (SELECT S.id   FROM Section S RIGHT JOIN SectionEnrollment ON S.id = SectionEnrollment.section_id   WHERE course_code = 'CHEM325') temp)";
// Query 22
opt.options[30].value = "SELECT concat(Person.first_name, ' ', Person.last_name)                                            AS name,      email,       Person.id,       Person.ssn,       Student.gpa,       group_concat(DISTINCT concat_WS(' ', course_code, '(', term, year, ') =', grade) SEPARATOR '<br><br>')      AS grades,       group_concat(DISTINCT concat_WS('-', Pub.title, Pub.type, Pub.date) SEPARATOR '<br><br>')       AS Publication,       group_concat(DISTINCT concat_WS('-', Ex.start_date, Ex.company, Ex.title) SEPARATOR '<br><br>') AS experience,       group_concat(DISTINCT concat_WS('-', Awards.name, Awards.date) SEPARATOR '<br><br>')            AS awards,       group_concat(DISTINCT Degree.name SEPARATOR '<br><br>')                                         AS degrees FROM Person         INNER JOIN Student ON Person.ssn = Student.ssn         LEFT JOIN Experience Ex ON Person.ssn = Ex.ssn         LEFT JOIN HasDegree ON Person.ssn = HasDegree.ssn         LEFT JOIN Degree ON degree_id = Degree.id         LEFT JOIN Awards ON Awards.ssn = Person.ssn         LEFT JOIN Publications Pub ON Person.ssn = Pub.ssn         LEFT JOIN CourseCompleted CC ON Person.ssn = CC.student_ssn WHERE Student_ssn = 934347739 GROUP BY Person.ssn";
