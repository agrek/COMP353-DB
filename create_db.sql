# https://dev.mysql.com/doc/refman/8.0/en/drop-table.html
# https://tableplus.io/blog/2018/08/mysql-how-to-drop-all-tables.html
# CREATE DATABASE IF NOT EXISTS arc353_1;
USE arc353_1;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS arc353_1.Address;
DROP TABLE IF EXISTS arc353_1.Advisor;
DROP TABLE IF EXISTS arc353_1.Awards;
DROP TABLE IF EXISTS arc353_1.Building;
DROP TABLE IF EXISTS arc353_1.Campus;
DROP TABLE IF EXISTS arc353_1.Contract;
DROP TABLE IF EXISTS arc353_1.Course;
DROP TABLE IF EXISTS arc353_1.Degree;
DROP TABLE IF EXISTS arc353_1.Department;
DROP TABLE IF EXISTS arc353_1.Employee;
DROP TABLE IF EXISTS arc353_1.Experience;
DROP TABLE IF EXISTS arc353_1.GradStudents;
DROP TABLE IF EXISTS arc353_1.HasDegree;
DROP TABLE IF EXISTS arc353_1.Instructor;
DROP TABLE IF EXISTS arc353_1.Instructor;
DROP TABLE IF EXISTS arc353_1.LetterToGpa;
DROP TABLE IF EXISTS arc353_1.Person;
DROP TABLE IF EXISTS arc353_1.Program;
DROP TABLE IF EXISTS arc353_1.ProgramRequirements;
DROP TABLE IF EXISTS arc353_1.Publications;
DROP TABLE IF EXISTS arc353_1.Requisites;
DROP TABLE IF EXISTS arc353_1.ResearchFundingApplications;
DROP TABLE IF EXISTS arc353_1.ResearchFunds;
DROP TABLE IF EXISTS arc353_1.Room;
DROP TABLE IF EXISTS arc353_1.RoomOverhead;
DROP TABLE IF EXISTS arc353_1.RoomNeeds;
DROP TABLE IF EXISTS arc353_1.Section;
DROP TABLE IF EXISTS arc353_1.SectionEnrollment;
DROP TABLE IF EXISTS arc353_1.Student;
DROP TABLE IF EXISTS arc353_1.Studies;
DROP TABLE IF EXISTS arc353_1.TAPosition;
DROP TABLE IF EXISTS arc353_1.TermToNumber;
DROP TABLE IF EXISTS arc353_1.UGradStudents;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Address
(
    id           INT AUTO_INCREMENT,
    street       VARCHAR(45) NOT NULL,
    city         VARCHAR(45) NOT NULL,
    province     VARCHAR(45) NOT NULL,
    postal_code  VARCHAR(6)  NOT NULL,
    apt          INT         NULL,
    civic_number INT         NOT NULL,
    CONSTRAINT Address_pk
        PRIMARY KEY (civic_number, street, city, province, postal_code, apt),
    CONSTRAINT Address_uq
        UNIQUE (id)
);

CREATE TABLE Campus
(
    abbreviation VARCHAR(45) NOT NULL,
    name         VARCHAR(45) NOT NULL,
    CONSTRAINT Campus_pk
        PRIMARY KEY (abbreviation)
);

CREATE TABLE Building
(
    abbreviation VARCHAR(45) NOT NULL,
    name         VARCHAR(45) NOT NULL,
    num_rooms    INT         NULL,
    num_labs     INT         NOT NULL,
    num_floors   INT         NOT NULL,
    campus       VARCHAR(45) NOT NULL,
    CONSTRAINT Building_pk
        PRIMARY KEY (abbreviation),
    CONSTRAINT Building_Campus_abbreviation_fk
        FOREIGN KEY (campus) REFERENCES Campus (abbreviation)
);

CREATE TABLE Room
(
    building_abbreviation VARCHAR(45)                     NOT NULL,
    type                  ENUM ('lab', 'class', 'office') NOT NULL,
    capacity              INT                             NOT NULL,
    room_number           INT                             NOT NULL,
    room_floor            INT(2)                          NOT NULL,
    CONSTRAINT Room_pk
        PRIMARY KEY (building_abbreviation, room_floor, room_number),
    CONSTRAINT Room_Building_abbreviation_fk
        FOREIGN KEY (building_abbreviation) REFERENCES Building (abbreviation)
);

CREATE TABLE RoomOverhead
(
    id        INT AUTO_INCREMENT,
    equipment VARCHAR(45) NOT NULL,
    CONSTRAINT RoomOverhead_pk
        PRIMARY KEY (id),
    CONSTRAINT RoomOverhead_uq
        UNIQUE (equipment)
);

CREATE TABLE RoomNeeds
(
    building_abbreviation VARCHAR(45)   NOT NULL,
    room_floor            INT(2)        NOT NULL,
    room_number           INT(3)        NOT NULL,
    quantity              INT DEFAULT 0 NOT NULL,
    room_overhead_id      INT           NOT NULL,
    CONSTRAINT RoomNeeds_pk
        PRIMARY KEY (building_abbreviation, room_floor, room_number, room_overhead_id),
    CONSTRAINT RoomNeeds_RoomOverhead_id_fk
        FOREIGN KEY (room_overhead_id) REFERENCES RoomOverhead (id),
    CONSTRAINT RoomNeeds_Room_building_abbreviation_room_number_fk
        FOREIGN KEY (building_abbreviation, room_floor, room_number) REFERENCES Room (building_abbreviation, room_floor, room_number)
);

CREATE TABLE Person
(
    ssn        INT         NOT NULL,
    id         INT AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name  VARCHAR(45) NOT NULL,
    email      VARCHAR(45) NOT NULL,
    address    INT         NOT NULL,
    phone      INT(10)     NULL,
    CONSTRAINT Person_pk
        PRIMARY KEY (ssn),
    CONSTRAINT Person_uq
        UNIQUE (id, email),
    CONSTRAINT Person_Address_id_fk
        FOREIGN KEY (address) REFERENCES Address (id)
);

CREATE TABLE Employee
(
    ssn                          INT                NOT NULL,
    retired                      BOOL DEFAULT FALSE NOT NULL,
    office_building_abbreviation VARCHAR(45)        NULL,
    office_room_floor            INT(2)             NULL,
    office_room_number           INT(3)             NULL,
    CONSTRAINT Employee_pk
        PRIMARY KEY (ssn),
    CONSTRAINT Employee_Person_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Person (ssn),
    CONSTRAINT Advisor_Building_abbreviation_fk
        FOREIGN KEY (office_building_abbreviation, office_room_floor, office_room_number) REFERENCES Room (building_abbreviation, room_floor, room_number)

);

CREATE TABLE Contract
(
    ssn        INT                             NOT NULL,
    status     ENUM ('full-time', 'part-time') NULL,
    salary     INT                             NOT NULL,
    start_date DATETIME                        NOT NULL,
    end_date   DATETIME                        NOT NULL,
    CONSTRAINT Contract_pk
        PRIMARY KEY (ssn, start_date, end_date),
    CONSTRAINT Contract_Employee_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Employee (ssn)
);

CREATE TABLE Student
(
    ssn INT           NOT NULL,
    gpa DECIMAL(3, 2) NULL,
    CONSTRAINT Student_Person_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Person (ssn)
);

CREATE TABLE Department
(
    id           INT AUTO_INCREMENT,
    name         VARCHAR(45) NOT NULL,
    chairman_ssn INT         NULL,
    CONSTRAINT Department_pk
        PRIMARY KEY (id),
    CONSTRAINT Department_uq
        UNIQUE (name)
);

CREATE TABLE Instructor
(
    ssn               INT  NOT NULL,
    dept_id           INT  NOT NULL,
    funding_available BOOL NOT NULL,
    CONSTRAINT Instructor_pk
        PRIMARY KEY (ssn),
    CONSTRAINT Instructor_Department_id_fk
        FOREIGN KEY (dept_id) REFERENCES Department (id),
    CONSTRAINT Instructor_Employee_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Employee (ssn)
);

ALTER TABLE Department
    ADD CONSTRAINT Department_Instructor_ssn_fk
        FOREIGN KEY (chairman_ssn) REFERENCES Instructor (ssn);

CREATE TABLE UGradStudents
(
    ssn INT,
    CONSTRAINT GradStudents_pk
        PRIMARY KEY (ssn),
    CONSTRAINT Undergrad_Student_id_fk
        FOREIGN KEY (ssn) REFERENCES Student (ssn)
);

CREATE TABLE GradStudents
(
    ssn            INT                       NULL,
    type           ENUM ('thesis', 'course') NOT NULL,
    supervisor_ssn INT                       NOT NULL,
    CONSTRAINT GradStudents_pk
        PRIMARY KEY (ssn),
    CONSTRAINT GradStudents_Instructor_ssn_fk
        FOREIGN KEY (supervisor_ssn) REFERENCES Instructor (ssn),
    CONSTRAINT Grad_Student_id_fk
        FOREIGN KEY (ssn) REFERENCES Student (ssn)
);

CREATE TABLE Experience
(
    ssn        INT         NOT NULL,
    title      VARCHAR(45) NOT NULL,
    company    VARCHAR(45) NOT NULL,
    start_date DATE        NOT NULL,
    end_date   DATE        NOT NULL,
    CONSTRAINT HasExperience_pk
        PRIMARY KEY (ssn, title, company, start_date, end_date),
    CONSTRAINT Experience_Person_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Person (ssn)
);

CREATE TABLE Publications
(
    ssn       INT                            NOT NULL,
    type      ENUM ('conference', 'journal') NULL,
    date      DATE                           NOT NULL,
    title     VARCHAR(45)                    NOT NULL,
    publisher VARCHAR(45)                    NOT NULL,
    CONSTRAINT Publications_pk
        PRIMARY KEY (ssn, date, title, publisher),
    CONSTRAINT Publications_Person_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Person (ssn)
);

CREATE TABLE Awards
(
    ssn  INT         NOT NULL,
    name VARCHAR(45) NOT NULL,
    date DATE        NOT NULL,
    CONSTRAINT Awards_pk
        PRIMARY KEY (ssn, date, name),
    CONSTRAINT Awards_Person_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Person (ssn)
);

CREATE TABLE Degree
(
    institution VARCHAR(45) NOT NULL,
    name        VARCHAR(45) NOT NULL,
    id          INT AUTO_INCREMENT,
    CONSTRAINT Degree_pk
        PRIMARY KEY (institution, name),
    CONSTRAINT Degree_uq
        UNIQUE (id)
);

CREATE TABLE HasDegree
(
    ssn       INT           NOT NULL,
    date      DATE          NOT NULL,
    degree_id INT           NULL,
    gpa       DECIMAL(3, 2) NULL,
    CONSTRAINT HasDegree_pk
        PRIMARY KEY (ssn, degree_id),
    CONSTRAINT HasDegree_Degree_id_fk
        FOREIGN KEY (degree_id) REFERENCES Degree (id),
    CONSTRAINT HasDegree_Student_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Student (ssn)
);

CREATE TABLE LetterToGpa
(
    letter ENUM ('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F', 'FNS', 'R', 'NR') DEFAULT 'NR' NOT NULL,
    gpa    DECIMAL(3, 2)                                                                                                 NOT NULL,
    CONSTRAINT LetterToGpa_pk
        PRIMARY KEY (letter)
);

CREATE TABLE Advisor
(
    ssn INT NOT NULL,
    CONSTRAINT Advisor_pk
        PRIMARY KEY (ssn),
    CONSTRAINT Advisor_Employee_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Employee (ssn)
);

CREATE TABLE Program
(
    id            INT AUTO_INCREMENT,
    name          VARCHAR(45) NOT NULL,
    type          VARCHAR(45) NOT NULL,
    credits       SMALLINT    NOT NULL,
    department_id INT         NOT NULL,
    advisor_ssn   INT         NULL,
    CONSTRAINT Program_pk
        PRIMARY KEY (id),
    CONSTRAINT Program_Advisor_ssn_fk
        FOREIGN KEY (advisor_ssn) REFERENCES Advisor (ssn),
    CONSTRAINT Program_Department_id_fk
        FOREIGN KEY (department_id) REFERENCES Department (id)
);

CREATE UNIQUE INDEX Program_uq
    ON Program (name);

CREATE TABLE Studies
(
    student_ssn INT NOT NULL,
    program_id  INT NOT NULL,
    CONSTRAINT Program_pk
        PRIMARY KEY (student_ssn, program_id),
    CONSTRAINT Studies_Program_id_fk
        FOREIGN KEY (program_id) REFERENCES Program (id),
    CONSTRAINT Studies_Student_id_fk
        FOREIGN KEY (student_ssn) REFERENCES Student (ssn)
);

CREATE TABLE Course
(
    code          VARCHAR(16)   NOT NULL,
    name          VARCHAR(45)   NOT NULL,
    department_id INT           NOT NULL,
    credits       DECIMAL(3, 2) NOT NULL,
    CONSTRAINT Course_pk
        PRIMARY KEY (code),
    CONSTRAINT Course_uq
        UNIQUE (name),
    CONSTRAINT Course_Department_id_fk
        FOREIGN KEY (department_id) REFERENCES Department (id)
);

CREATE TABLE TermToNumber
(
    term       VARCHAR(45) NOT NULL,
    term_order INT(1)      NOT NULL,
    CONSTRAINT TermToNumber_pk
        PRIMARY KEY (term)
);

CREATE TABLE TAPosition
(
    ssn          INT AUTO_INCREMENT,
    position     VARCHAR(45) NOT NULL,
    hours        INT(3)      NOT NULL,
    assignee_ssn INT         NULL,
    salary       INT         NOT NULL,
    CONSTRAINT TA_pk
        PRIMARY KEY (ssn),
    CONSTRAINT TA_GradStudents_id_fk
        FOREIGN KEY (assignee_ssn) REFERENCES GradStudents (ssn)
);

CREATE TABLE Section
(
    id                    INT AUTO_INCREMENT,
    name                  VARCHAR(45) NOT NULL,
    course_code           VARCHAR(16) NOT NULL,
    type                  VARCHAR(45) NOT NULL,
    day                   VARCHAR(45) NOT NULL,
    start_time            TIME        NOT NULL,
    end_time              TIME        NOT NULL,
    term                  VARCHAR(45) NOT NULL,
    year                  INT(4)      NOT NULL,
    ta_ssn                INT         NULL,
    instructor_ssn        INT         NULL,
    building_abbreviation VARCHAR(45) NULL,
    room_floor            INT(2)      NULL,
    room_number           INT(3)      NOT NULL,
    CONSTRAINT Section_pk
        PRIMARY KEY (id),
    CONSTRAINT Section_uq
        UNIQUE (course_code, name),
    CONSTRAINT Section_Building_abbreviation_num_rooms_fk
        FOREIGN KEY (building_abbreviation, room_floor, room_number) REFERENCES Room (building_abbreviation, room_floor, room_number),
    CONSTRAINT Section_Course_code_fk
        FOREIGN KEY (course_code) REFERENCES Course (code),
    CONSTRAINT Section_Instructor_id_fk
        FOREIGN KEY (instructor_ssn) REFERENCES Instructor (ssn),
    CONSTRAINT Section_TA_assignee_fk
        FOREIGN KEY (ta_ssn) REFERENCES TAPosition (assignee_ssn),
    CONSTRAINT term_name_fk
        FOREIGN KEY (term) REFERENCES TermToNumber (term)
);

CREATE TABLE ResearchFunds
(
    id     INT AUTO_INCREMENT,
    name   VARCHAR(45) NOT NULL,
    amount INT         NULL,
    CONSTRAINT ResearchFunds_pk
        PRIMARY KEY (id),
    CONSTRAINT ResearchFunds_uq
        UNIQUE (name)
);

CREATE TABLE ResearchFundingApplications
(
    id               INT AUTO_INCREMENT,
    status           ENUM ('Applied', 'Granted', 'Denied') NOT NULL,
    student_ssn      INT                                   NULL,
    research_fund_id INT                                   NOT NULL,
    CONSTRAINT ResearchFundingApplications_pk
        PRIMARY KEY (id),
    CONSTRAINT ResearchFundingApplications_GradStudents_ssn_fk
        FOREIGN KEY (student_ssn) REFERENCES GradStudents (ssn),
    CONSTRAINT ResearchFundingApplications_ResearchFunds_id_fk
        FOREIGN KEY (research_fund_id) REFERENCES ResearchFunds (id)
);

CREATE TABLE SectionEnrollment
(
    section_id  INT                                      NOT NULL,
    student_ssn INT                                      NULL,
    grade       ENUM ('A+', 'D-', 'F', 'FNS', 'R', 'NR') NULL,
    CONSTRAINT SectionEnrollment_pk
        PRIMARY KEY (section_id, student_ssn),
    CONSTRAINT SectionEnrollment_LetterToGpa_letter_fk
        FOREIGN KEY (grade) REFERENCES LetterToGpa (letter),
    CONSTRAINT SectionEnrollment_Section_id_fk
        FOREIGN KEY (section_id) REFERENCES Section (id),
    CONSTRAINT SectionEnrollment_Student_ssn_fk
        FOREIGN KEY (student_ssn) REFERENCES Student (ssn)
);

CREATE TABLE Requisites
(
    course_code VARCHAR(16)                          NOT NULL,
    req_code    VARCHAR(16)                          NOT NULL,
    type        ENUM ('prerequisite', 'corequisite') NOT NULL,
    CONSTRAINT Requisites_pk
        PRIMARY KEY (course_code, req_code),
    CONSTRAINT Requisites_Course_code_fk
        FOREIGN KEY (course_code) REFERENCES Course (code),
    CONSTRAINT Requisites_Course_code_fk_2
        FOREIGN KEY (req_code) REFERENCES Course (code)
);

CREATE TABLE ProgramRequirements
(
    program_id  INT         NOT NULL,
    course_code VARCHAR(16) NOT NULL,
    CONSTRAINT ProgramRequirements_pk
        PRIMARY KEY (program_id, course_code),
    CONSTRAINT ProgramRequirements_Course_code_fk
        FOREIGN KEY (course_code) REFERENCES Course (code),
    CONSTRAINT ProgramRequirements_Program_id_fk
        FOREIGN KEY (program_id) REFERENCES Program (id)
);


DROP TRIGGER IF EXISTS gpaTrigger;
DELIMITER //
CREATE TRIGGER gpaTrigger

    AFTER INSERT
    ON SectionEnrollment
    FOR EACH ROW

BEGIN
    /******************* Update GPA *******************/

    DROP TEMPORARY TABLE IF EXISTS tempResult;
    DROP TEMPORARY TABLE IF EXISTS allGrades;

    CREATE TEMPORARY TABLE allGrades AS (SELECT grade, credits, gpa, credits * gpa mult
                                         FROM Course,
                                              Section,
                                              SectionEnrollment

                                                  INNER JOIN LetterToGpa ON grade = letter

                                         WHERE section_id = Section.id
                                           AND Section.course_code = Course.code
                                           AND type = 'lecture'
                                           AND student_ssn = NEW.student_ssn);

    SELECT SUM(credits) INTO @sumCredits FROM allGrades;
    SELECT SUM(mult) INTO @sumMult FROM allGrades;
    CREATE TEMPORARY TABLE tempResult
    (
        resultGPA FLOAT(8)
    );

    INSERT INTO tempResult VALUES (@sumMult / @sumCredits);
    UPDATE Student SET gpa=(@sumMult / @sumCredits) WHERE ssn = NEW.student_ssn;

END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS secEnrollmentTrigger;
DELIMITER //
CREATE TRIGGER secEnrollmentTrigger

    BEFORE INSERT
    ON SectionEnrollment
    FOR EACH ROW

BEGIN
    /******************* Multiple Sections of Same Course Check *******************/

    DROP TEMPORARY TABLE IF EXISTS secInfo;
    CREATE TEMPORARY TABLE secInfo AS (SELECT course_code, type, term, year FROM Section WHERE id = NEW.section_id);
    SELECT COUNT(*)
    INTO @multipleSecs
    FROM (SELECT Section.id
          FROM Section
                   INNER JOIN SectionEnrollment SE ON Section.id = SE.section_id
                   INNER JOIN secInfo ON Section.course_code = secInfo.course_code
          WHERE student_ssn = NEW.student_ssn
            AND Section.type = secInfo.type
            AND Section.year = secInfo.year
            AND Section.term = secInfo.term) r;

    IF (@multipleSecs > 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'A student cannot register to two different sections of same type,term, and year';

    END IF;

    /******************* Prerequisites Check *******************/

    DROP TEMPORARY TABLE IF EXISTS Course_Code;
    DROP TEMPORARY TABLE IF EXISTS req_table;
    DROP TEMPORARY TABLE IF EXISTS req_secs;
    DROP TEMPORARY TABLE IF EXISTS req_secs2;
    DROP TEMPORARY TABLE IF EXISTS fail_grade;

    CREATE TEMPORARY TABLE Course_Code AS (SELECT course_code FROM Section WHERE id = NEW.section_id);
    CREATE TEMPORARY TABLE req_table AS (SELECT req_code
                                         FROM Requisites
                                                  INNER JOIN Course_Code ON Requisites.course_code = Course_Code.course_code
                                         WHERE type = 'prerequisite');
    -- req_secs has all sections given for the prereqs classes
    CREATE TEMPORARY TABLE req_secs AS (SELECT id, Section.course_code
                                        FROM Section
                                                 INNER JOIN req_table ON Section.course_code = req_table.req_code);
    CREATE TEMPORARY TABLE req_secs2 AS (SELECT * FROM req_secs);

    CREATE TEMPORARY TABLE fail_grade AS (
        SELECT Section.course_code, grade
        FROM Section,
             SectionEnrollment,
             req_table,
             req_secs
        WHERE Section.id = SectionEnrollment.section_id
          AND req_table.req_code = Section.course_code
          AND SectionEnrollment.student_ssn = NEW.student_ssn
          AND req_secs.course_code = req_table.req_code
          AND (grade = 'F' OR grade = 'FNS' OR grade = 'R' OR grade = 'NR')
    );

    SELECT count(*) INTO @numFail FROM fail_grade;
    SELECT count(*) INTO @num_Pre FROM req_table;

    SELECT count(*)
    INTO @notTaken
    FROM (SELECT Section.course_code, grade
          FROM Section,
               SectionEnrollment,
               req_table
          WHERE Section.id = SectionEnrollment.section_id
            AND req_table.req_code = Section.course_code
            AND SectionEnrollment.student_ssn = NEW.student_ssn) t;
    IF (@numFail > 0 OR ((@notTaken = 0) AND (@num_Pre > 0))) THEN
        /*DELETE FROM SectionEnrollment WHERE student_ssn=NEW.student_ssn;*/
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'The student did not meet the prerequisites requirement for the course';
    END IF;

    /******************* Student Time Conflict Check *******************/

    DROP TEMPORARY TABLE IF EXISTS numbers;
    DROP TEMPORARY TABLE IF EXISTS newRow;
    DROP TEMPORARY TABLE IF EXISTS separatedNew;
    DROP TEMPORARY TABLE IF EXISTS newEntry;
    DROP TEMPORARY TABLE IF EXISTS oldStuSec;
    DROP TEMPORARY TABLE IF EXISTS separatedOld;
    DROP TEMPORARY TABLE IF EXISTS oldSecs;
    DROP TEMPORARY TABLE IF EXISTS conflictSecs;

    -- numbers table is used for how many possible days can there be
    CREATE TEMPORARY TABLE numbers
    (
        n INT PRIMARY KEY
    );
    INSERT INTO numbers VALUES (1), (2);

    -- Created because of need to operate on the NEW data in the form of a table
    CREATE TEMPORARY TABLE newRow AS (SELECT Section.id,
                                             start_time,
                                             end_time,
                                             day,
                                             term,
                                             year
                                      FROM Section
                                      WHERE Section.id = NEW.section_id);

    SELECT year INTO @year FROM newRow;
    SELECT term INTO @term FROM newRow;

    -- Separating the inserted row into two if there was two days in it
    CREATE TEMPORARY TABLE separatedNew AS (SELECT newRow.id,
                                                   SUBSTRING_INDEX(SUBSTRING_INDEX(newRow.day, ', ', numbers.n), ', ',
                                                                   -1) day
                                            FROM numbers
                                                     INNER JOIN newRow
                                                                ON CHAR_LENGTH(newRow.day)
                                                                       - CHAR_LENGTH(REPLACE(newRow.day, ', ', '')) >=
                                                                   numbers.n - 1
                                            ORDER BY id, n);

    CREATE TEMPORARY TABLE newEntry AS (SELECT newRow.id,
                                               separatedNew.day,
                                               start_time,
                                               end_time,
                                               term,
                                               year
                                        FROM newRow
                                                 INNER JOIN separatedNew ON separatedNew.id = newRow.id);

    /* Fetching all sections taken by the student in same year, and term*/
    CREATE TEMPORARY TABLE oldStuSec AS (SELECT Section.id, day, start_time, end_time, term, year
                                         FROM Section
                                                  INNER JOIN SectionEnrollment SE ON Section.id = SE.section_id
                                         WHERE SE.student_ssn = NEW.student_ssn
                                           AND year = @year
                                           AND term = @term);

    CREATE TEMPORARY TABLE separatedOld AS (SELECT oldStuSec.id,
                                                   SUBSTRING_INDEX(SUBSTRING_INDEX(oldStuSec.day, ', ', numbers.n),
                                                                   ', ', -1) day
                                            FROM numbers
                                                     INNER JOIN oldStuSec
                                                                ON CHAR_LENGTH(oldStuSec.day)
                                                                       -
                                                                   CHAR_LENGTH(REPLACE(oldStuSec.day, ', ', '')) >=
                                                                   numbers.n - 1
                                            ORDER BY id, n);

    CREATE TEMPORARY TABLE oldSecs AS (SELECT Section.id,
                                              separatedOld.day,
                                              start_time,
                                              end_time,
                                              term,
                                              year
                                       FROM Section
                                                INNER JOIN separatedOld ON separatedOld.id = Section.id);

    CREATE TEMPORARY TABLE conflictSecs AS (SELECT oldSecs.day         d1,
                                                   newEntry.day        d2,
                                                   oldSecs.start_time  s1,
                                                   newEntry.start_time s2,
                                                   oldSecs.end_time    e1,
                                                   newEntry.end_time   e2
                                            FROM oldSecs
                                                     INNER JOIN newEntry ON oldSecs.day = newEntry.day
                                            WHERE ((oldSecs.start_time >= newEntry.start_time) AND
                                                   (oldSecs.start_time < newEntry.end_time))
                                               OR ((newEntry.start_time >= oldSecs.start_time) AND
                                                   (newEntry.start_time < oldSecs.end_time))
    );

    SELECT count(*) INTO @confCount FROM conflictSecs;

    IF @confCount > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'The section conflicts with other sections taken by the student in the same semester';
    END IF;

END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS secTrig;

DELIMITER //
CREATE TRIGGER secTrig
    BEFORE INSERT
    ON Section
    FOR EACH ROW
BEGIN
    /******************* TA Total Hours Check *******************/
    SELECT SUM(hours)
    INTO @totalHours
    FROM (SELECT DISTINCT (TAPosition.ssn), hours
          FROM TAPosition
                   INNER JOIN Section ON assignee_ssn = ta_ssn
          WHERE ta_ssn = NEW.ta_ssn
            AND year = NEW.year) t;

    IF (@totalHours > 260) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The TA exceeds the max hours permitted in a year of 260 hours';
    END IF;

    /******************* TA GPA Check *******************/

    SELECT gpa INTO @applicantGpa FROM Student WHERE ssn = NEW.ta_ssn;
    IF @applicantGpa < 3.2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'The student does not meet the minimum GPA required for a TA which is 3.2';
    END IF;

    /******************* Time Conflict Checks *******************/
    DROP TEMPORARY TABLE IF EXISTS numbers;
    DROP TEMPORARY TABLE IF EXISTS newRow;
    DROP TEMPORARY TABLE IF EXISTS separatedNew;
    DROP TEMPORARY TABLE IF EXISTS newEntry;
    DROP TEMPORARY TABLE IF EXISTS oldInstSec;
    DROP TEMPORARY TABLE IF EXISTS oldTASec;
    DROP TEMPORARY TABLE IF EXISTS separatedOld;
    DROP TEMPORARY TABLE IF EXISTS oldSecs;
    DROP TEMPORARY TABLE IF EXISTS conflictSecs;

    -- numbers table is used for how many possible days can there be
    CREATE TEMPORARY TABLE numbers
    (
        n INT PRIMARY KEY
    );
    INSERT INTO numbers VALUES (1), (2);

    -- Created because of need to operate on the NEW data in the form of a table
    CREATE TEMPORARY TABLE newRow
    (
        id            INT(8),
        start_time    TIME,
        end_time      TIME,
        day           VARCHAR(45),
        term          VARCHAR(45),
        year          INT(8),
        instructor_id INT(8),
        ta_id         INT(8),
        room_number   INT(11)
    );
    INSERT INTO newRow
    VALUES (NEW.id, NEW.start_time, NEW.end_time, NEW.day, NEW.term, NEW.year, NEW.instructor_ssn, NEW.ta_ssn, NEW.room_number);

    -- Separating the inserted row into two if there was two days in it
    CREATE TEMPORARY TABLE separatedNew AS (SELECT newRow.id,
                                                   SUBSTRING_INDEX(SUBSTRING_INDEX(newRow.day, ', ', numbers.n), ', ',
                                                                   -1) day
                                            FROM numbers
                                                     INNER JOIN newRow
                                                                ON CHAR_LENGTH(newRow.day)
                                                                       - CHAR_LENGTH(REPLACE(newRow.day, ', ', '')) >=
                                                                   numbers.n - 1
                                            ORDER BY id, n);

    CREATE TEMPORARY TABLE newEntry AS (SELECT newRow.id,
                                               separatedNew.day,
                                               start_time,
                                               end_time,
                                               term,
                                               year,
                                               ta_id,
                                               instructor_id,
                                               building_abbreviation,
                                               room_number
                                        FROM newRow
                                                 INNER JOIN separatedNew ON separatedNew.id = newRow.id);

    /******************* Room Time Conflict Check *******************/
        /* Fetching all sections taught in same building, room_number, year, and term*/
        CREATE TEMPORARY TABLE oldRoomSec AS (SELECT Section.id, day, start_time, end_time, term, year, room_number
                                              FROM Section
                                              WHERE building_abbreviation = NEW.building_abbreviation
                                                AND room_number = NEW.room_number
                                                AND year = NEW.year
                                                AND term = NEW.term);

        CREATE TEMPORARY TABLE separatedOld AS (SELECT oldRoomSec.id,
                                                       SUBSTRING_INDEX(SUBSTRING_INDEX(oldRoomSec.day, ', ', numbers.n),
                                                                       ', ', -1) day
                                                FROM numbers
                                                         INNER JOIN oldRoomSec
                                                                    ON CHAR_LENGTH(oldRoomSec.day)
                                                                           -
                                                                       CHAR_LENGTH(REPLACE(oldRoomSec.day, ', ', '')) >=
                                                                       numbers.n - 1
                                                ORDER BY id, n);

        CREATE TEMPORARY TABLE oldSecs AS (SELECT Section.id,
                                                  separatedOld.day,
                                                  start_time,
                                                  end_time,
                                                  term,
                                                  year,
                                                  building_abbreviation,
                                                  room_number
                                           FROM Section
                                                    INNER JOIN separatedOld ON separatedOld.id = Section.id);

        CREATE TEMPORARY TABLE conflictSecs AS (SELECT oldSecs.day         d1,
                                                       newEntry.day        d2,
                                                       oldSecs.start_time  s1,
                                                       newEntry.start_time s2,
                                                       oldSecs.end_time    e1,
                                                       newEntry.end_time   e2
                                                FROM oldSecs
                                                         INNER JOIN newEntry ON oldSecs.day = newEntry.day
                                                WHERE ((oldSecs.start_time >= newEntry.start_time) AND
                                                       (oldSecs.start_time < newEntry.end_time))
                                                   OR ((newEntry.start_time >= oldSecs.start_time) AND
                                                       (newEntry.start_time < oldSecs.end_time))
        );

        SELECT count(*) INTO @confCount FROM conflictSecs;

        IF (@confCount > 0) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                    'The room is already reserved for another section he teaches';
        END IF;

    /******************* Instructor Time Conflict Check *******************/
    IF NEW.type = 'lecture' THEN

        /* Fetching all sections taught by the instructor in same year, and term*/
        CREATE TEMPORARY TABLE oldInstSec AS (SELECT Section.id, day, start_time, end_time, term, year, instructor_ssn
                                              FROM Section
                                              WHERE type = 'lecture'
                                                AND instructor_ssn = NEW.instructor_ssn
                                                AND year = NEW.year
                                                AND term = NEW.term);

        CREATE TEMPORARY TABLE separatedOld AS (SELECT oldInstSec.id,
                                                       SUBSTRING_INDEX(SUBSTRING_INDEX(oldInstSec.day, ', ', numbers.n),
                                                                       ', ', -1) day
                                                FROM numbers
                                                         INNER JOIN oldInstSec
                                                                    ON CHAR_LENGTH(oldInstSec.day)
                                                                           -
                                                                       CHAR_LENGTH(REPLACE(oldInstSec.day, ', ', '')) >=
                                                                       numbers.n - 1
                                                ORDER BY id, n);

        CREATE TEMPORARY TABLE oldSecs AS (SELECT Section.id,
                                                  separatedOld.day,
                                                  start_time,
                                                  end_time,
                                                  term,
                                                  year,
                                                  instructor_ssn
                                           FROM Section
                                                    INNER JOIN separatedOld ON separatedOld.id = Section.id);

        CREATE TEMPORARY TABLE conflictSecs AS (SELECT oldSecs.day         d1,
                                                       newEntry.day        d2,
                                                       oldSecs.start_time  s1,
                                                       newEntry.start_time s2,
                                                       oldSecs.end_time    e1,
                                                       newEntry.end_time   e2
                                                FROM oldSecs
                                                         INNER JOIN newEntry ON oldSecs.day = newEntry.day
                                                WHERE ((oldSecs.start_time >= newEntry.start_time) AND
                                                       (oldSecs.start_time < newEntry.end_time))
                                                   OR ((newEntry.start_time >= oldSecs.start_time) AND
                                                       (newEntry.start_time < oldSecs.end_time))
        );

        SELECT count(*) INTO @confCount FROM conflictSecs;

        IF (@confCount > 0) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                    'The instructor has a time conflict with another section he teaches';
        END IF;

        /******************* TA Time Conflict Check *******************/
    ELSEIF NEW.type = 'tutorial' OR NEW.type = 'lab' THEN
        /* Fetching all tutorial and lab sections taught by the TA in same year, and term*/
        CREATE TEMPORARY TABLE oldTASec AS (SELECT Section.id, day, start_time, end_time, term, year, ta_ssn
                                            FROM Section
                                            WHERE (type = 'tutorial' OR type = 'lab')
                                              AND ta_ssn = NEW.ta_ssn
                                              AND year = NEW.year
                                              AND term = NEW.term);

        CREATE TEMPORARY TABLE separatedOld AS (SELECT oldTASec.id,
                                                       SUBSTRING_INDEX(SUBSTRING_INDEX(oldTASec.day, ', ', numbers.n),
                                                                       ', ', -1) day
                                                FROM numbers
                                                         INNER JOIN oldTASec
                                                                    ON CHAR_LENGTH(oldTASec.day)
                                                                           -
                                                                       CHAR_LENGTH(REPLACE(oldTASec.day, ', ', '')) >=
                                                                       numbers.n - 1
                                                ORDER BY id, n);

        CREATE TEMPORARY TABLE oldSecs AS (SELECT Section.id,
                                                  separatedOld.day,
                                                  start_time,
                                                  end_time,
                                                  term,
                                                  year,
                                                  ta_ssn
                                           FROM Section
                                                    INNER JOIN separatedOld ON separatedOld.id = Section.id);

        CREATE TEMPORARY TABLE conflictSecs AS (SELECT oldSecs.day         d1,
                                                       newEntry.day        d2,
                                                       oldSecs.start_time  s1,
                                                       newEntry.start_time s2,
                                                       oldSecs.end_time    e1,
                                                       newEntry.end_time   e2
                                                FROM oldSecs
                                                         INNER JOIN newEntry ON oldSecs.day = newEntry.day
                                                WHERE ((oldSecs.start_time >= newEntry.start_time) AND
                                                       (oldSecs.start_time < newEntry.end_time))
                                                   OR ((newEntry.start_time >= oldSecs.start_time) AND
                                                       (newEntry.start_time < oldSecs.end_time))
        );

        SELECT count(*) INTO @confCount FROM conflictSecs;

        IF (@confCount > 0) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The TA has a time conflict with another section he teaches';
        END IF;

    END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS researchTrigger;
DELIMITER //
CREATE TRIGGER researchTrigger

    BEFORE INSERT
    ON ResearchFundingApplications
    FOR EACH ROW

BEGIN

    SELECT gpa INTO @applicantGpa FROM Student WHERE ssn = NEW.student_ssn;
    SELECT type
    INTO @stuType
    FROM Student
             INNER JOIN GradStudents GS ON Student.ssn = GS.ssn
    WHERE Student.ssn = NEW.student_ssn;

    IF @applicantGpa < 3 AND @stuType = 'thesis' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'The student does not meet the minimum GPA required for research funding which is 3';
    END IF;

END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS taPositionTrigger;
DELIMITER //
CREATE TRIGGER taPositionTrigger

    BEFORE INSERT
    ON TAPosition
    FOR EACH ROW

BEGIN

    SELECT gpa INTO @applicantGpa FROM Student WHERE ssn = NEW.assignee_ssn;
    IF @applicantGpa < 3.2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'The student does not meet the minimum GPA required for a TA position which is 3.2';
    END IF;

END;
//
DELIMITER ;
