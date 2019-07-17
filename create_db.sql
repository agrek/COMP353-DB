# https://dev.mysql.com/doc/refman/8.0/en/drop-table.html
# https://tableplus.io/blog/2018/08/mysql-how-to-drop-all-tables.html
CREATE DATABASE IF NOT EXISTS arc353_1;
USE arc353_1;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS arc353_1.Student;
DROP TABLE IF EXISTS arc353_1.LetterToGpa;
DROP TABLE IF EXISTS arc353_1.Studies;
DROP TABLE IF EXISTS arc353_1.Department;
DROP TABLE IF EXISTS arc353_1.Program;
DROP TABLE IF EXISTS arc353_1.Studies;
DROP TABLE IF EXISTS arc353_1.Course;
DROP TABLE IF EXISTS arc353_1.Section;
DROP TABLE IF EXISTS arc353_1.Instructor;
DROP TABLE IF EXISTS arc353_1.GradStudents;
DROP TABLE IF EXISTS arc353_1.TAPosition;
DROP TABLE IF EXISTS arc353_1.Class;
DROP TABLE IF EXISTS arc353_1.Advisor;
DROP TABLE IF EXISTS arc353_1.ResearchFunds;
DROP TABLE IF EXISTS arc353_1.ResearchFundingApplications;
DROP TABLE IF EXISTS arc353_1.SectionEnrollment;
DROP TABLE IF EXISTS arc353_1.Requisites;
DROP TABLE IF EXISTS arc353_1.ProgramRequirements;
DROP TABLE IF EXISTS arc353_1.TermToNumber;
SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE Student
(
    id         INT(8) AUTO_INCREMENT,
    first_name VARCHAR(45)   NOT NULL,
    last_name  VARCHAR(45)   NOT NULL,
    address    VARCHAR(45),
    gpa        DECIMAL(3, 2) NULL,
    CONSTRAINT Student_pk
        PRIMARY KEY (id)
);

CREATE TABLE Department
(
    id   INT(8) AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    CONSTRAINT Department_pk
        PRIMARY KEY (id),
    CONSTRAINT Department_uq
        UNIQUE (name)
);

CREATE TABLE Instructor
(
    id         INT(8) AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name  VARCHAR(45) NULL,
    dept_id    INT(8)      NOT NULL,
    CONSTRAINT Instructor_pk
        PRIMARY KEY (id),
    CONSTRAINT Instructor_Department_id_fk
        FOREIGN KEY (dept_id) REFERENCES Department (id)
);

CREATE TABLE GradStudents
(
    id            INT(8),
    type          ENUM ('thesis', 'course') NOT NULL,
    supervisor_id INT(8)                    NULL,
    CONSTRAINT GradStudents_pk
        PRIMARY KEY (id),
    CONSTRAINT GradStudents_Instructor_id_fk
        FOREIGN KEY (supervisor_id) REFERENCES Instructor (id),
    CONSTRAINT Undergrad_Student_id_fk
        FOREIGN KEY (id) REFERENCES Student (id)
);

CREATE TABLE TAPosition
(
    id          INT(8) AUTO_INCREMENT,
    position    VARCHAR(45) NOT NULL,
    hours       INT(3)      NOT NULL,
    assignee_id INT(8)      NULL,
    CONSTRAINT TA_pk
        PRIMARY KEY (id),
    CONSTRAINT TA_GradStudents_id_fk
        FOREIGN KEY (assignee_id) REFERENCES GradStudents (id)
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
    id         INT(8) AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name  VARCHAR(45) NOT NULL,
    office     VARCHAR(45) NULL,
    CONSTRAINT Advisor_pk
        PRIMARY KEY (id)
);

CREATE TABLE Program
(
    id            INT(8) AUTO_INCREMENT,
    name          VARCHAR(45) NOT NULL,
    type          VARCHAR(45) NOT NULL,
    credits       SMALLINT    NOT NULL,
    department_id INT(8)      NOT NULL,
    advisor_id    INT(8)      NULL,
    CONSTRAINT Program_pk
        PRIMARY KEY (id),
    CONSTRAINT Program_uq
        UNIQUE (name),
    CONSTRAINT Program_Advisor_id_fk
        FOREIGN KEY (advisor_id) REFERENCES Advisor (id),
    CONSTRAINT Program_Department_id_fk
        FOREIGN KEY (department_id) REFERENCES Department (id)
);

CREATE TABLE Studies
(
    student_id INT(8) NOT NULL,
    program_id INT(8) NOT NULL,
    CONSTRAINT Program_pk
        PRIMARY KEY (student_id, program_id),
    CONSTRAINT Studies_Program_id_fk
        FOREIGN KEY (program_id) REFERENCES Program (id),
    CONSTRAINT Studies_Student_id_fk
        FOREIGN KEY (student_id) REFERENCES Student (id)
);

CREATE TABLE Course
(
    code          VARCHAR(16)   NOT NULL,
    name          VARCHAR(45)   NOT NULL,
    department_id INT(8)        NOT NULL,
    credits       DECIMAL(3, 2) NOT NULL,
    CONSTRAINT Course_pk
        PRIMARY KEY (code),
    CONSTRAINT Course_uq
        UNIQUE (name),
    CONSTRAINT Course_Department_id_fk
        FOREIGN KEY (department_id) REFERENCES Department (id)
);

CREATE TABLE Class
(
    room_number VARCHAR(45) NOT NULL,
    capacity    INT         NULL,
    CONSTRAINT Class_pk
        PRIMARY KEY (room_number)
);

CREATE TABLE Section
(
    id            INT(8) AUTO_INCREMENT,
    name          VARCHAR(45) NOT NULL,
    course_code   VARCHAR(16) NOT NULL,
    type          VARCHAR(45) NOT NULL,
    day           VARCHAR(45) NOT NULL,
    start_time    TIME        NOT NULL,
    end_time      TIME        NOT NULL,
    term          VARCHAR(45) NOT NULL,
    year          INT(4)      NOT NULL,
    ta_id         INT(8)      NULL,
    instructor_id INT(8)      NULL,
    room_number   VARCHAR(45) NULL,
    CONSTRAINT Section_pk
        PRIMARY KEY (id),
    CONSTRAINT Section_uq
        UNIQUE (course_code, name),
    CONSTRAINT Section_Class_room_number_fk
        FOREIGN KEY (room_number) REFERENCES Class (room_number),
    CONSTRAINT Section_Course_code_fk
        FOREIGN KEY (course_code) REFERENCES Course (code),
    CONSTRAINT Section_Instructor_id_fk
        FOREIGN KEY (instructor_id) REFERENCES Instructor (id),
    CONSTRAINT Section_TA_assignee_fk
        FOREIGN KEY (ta_id) REFERENCES TAPosition (assignee_id)
);

CREATE TABLE ResearchFunds
(
    id     INT(8) AUTO_INCREMENT,
    name   VARCHAR(45) NOT NULL,
    amount INT         NULL,
    CONSTRAINT ResearchFunds_pk
        PRIMARY KEY (id),
    CONSTRAINT ResearchFunds_uq
        UNIQUE (name)
);

CREATE TABLE ResearchFundingApplications
(
    id               INT(8) AUTO_INCREMENT,
    status           ENUM ('Applied', 'Granted', 'Denied') NOT NULL,
    student_id       INT(8)                                NULL,
    research_fund_id INT(8)                                NOT NULL,
    CONSTRAINT ResearchFundingApplications_pk
        PRIMARY KEY (id),
    CONSTRAINT ResearchFundingApplications_GradStudents_id_fk
        FOREIGN KEY (student_id) REFERENCES GradStudents (id),
    CONSTRAINT ResearchFundingApplications_ResearchFunds_id_fk
        FOREIGN KEY (research_fund_id) REFERENCES ResearchFunds (id)
);

CREATE TABLE SectionEnrollment
(
    section_id INT(8)                                                                                           NOT NULL,
    student_id INT(8)                                                                                           NULL,
    grade      ENUM ('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F', 'FNS', 'R', 'NR') NULL,
    CONSTRAINT SectionEnrollment_pk
        PRIMARY KEY (section_id, student_id),
    CONSTRAINT SectionEnrollment_LetterToGpa_letter_fk
        FOREIGN KEY (grade) REFERENCES LetterToGpa (letter),
    CONSTRAINT SectionEnrollment_Section_id_fk
        FOREIGN KEY (section_id) REFERENCES Section (id),
    CONSTRAINT SectionEnrollment_Student_id_fk
        FOREIGN KEY (student_id) REFERENCES Student (id)
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
    program_id  INT(8)      NOT NULL,
    course_code VARCHAR(16) NOT NULL,
    CONSTRAINT ProgramRequirements_pk
        PRIMARY KEY (program_id, course_code),
    CONSTRAINT ProgramRequirements_Course_code_fk
        FOREIGN KEY (course_code) REFERENCES Course (code),
    CONSTRAINT ProgramRequirements_Program_id_fk
        FOREIGN KEY (program_id) REFERENCES Program (id)
);


DROP TRIGGER IF EXISTS preReqTrig;

DELIMITER //
CREATE TRIGGER preReqTrig
    BEFORE INSERT
    ON SectionEnrollment
    FOR EACH ROW
BEGIN

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
          AND SectionEnrollment.student_id = NEW.student_id
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
            AND SectionEnrollment.student_id = NEW.student_id) t;
    IF (@numFail > 0 OR ((@notTaken = 0) AND (@num_Pre > 0))) THEN
        /*DELETE FROM SectionEnrollment WHERE student_id=NEW.student_id;*/
        SIGNAL SQLSTATE '45000';
    END IF;

END;
//
DELIMITER ;

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
                                           AND course_code = Course.code
                                           AND type = 'lecture'
                                           AND student_id = NEW.student_id);

    SELECT SUM(credits) INTO @sumCredits FROM allGrades;
    SELECT SUM(mult) INTO @sumMult FROM allGrades;
    CREATE TEMPORARY TABLE tempResult
    (
        resultGPA FLOAT(8)
    );

    INSERT INTO tempResult VALUES (@sumMult / @sumCredits);
    UPDATE Student SET gpa=(@sumMult / @sumCredits) WHERE id = NEW.student_id;
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
    FROM (SELECT DISTINCT (TAPosition.id), hours
          FROM TAPosition
                   INNER JOIN Section ON assignee_id = ta_id
          WHERE ta_id = NEW.ta_id
            AND year = NEW.year) t;

    IF (@totalHours > 260) THEN
        SIGNAL SQLSTATE '55000';
    END IF;

    /******************* TA GPA Check *******************/

    SELECT gpa INTO @applicantGpa FROM Student WHERE id = NEW.ta_id;
    IF @applicantGpa < 3.2 THEN
        SIGNAL SQLSTATE '75000';
    END IF;

    /******************* Instructor Time Conflict Check *******************/
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
        ta_id         INT(8)
    );
    INSERT INTO newRow
    VALUES (NEW.id, NEW.start_time, NEW.end_time, NEW.day, NEW.term, NEW.year, NEW.instructor_id, NEW.ta_id);

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
                                               instructor_id
                                        FROM newRow
                                                 INNER JOIN separatedNew ON separatedNew.id = newRow.id);

    IF NEW.type = 'lecture' THEN

        /* Fetching all sections taught by the instructor in same year, and term*/
        CREATE TEMPORARY TABLE oldInstSec AS (SELECT Section.id, day, start_time, end_time, term, year, instructor_id
                                              FROM Section
                                              WHERE type = 'lecture'
                                                AND instructor_id = NEW.instructor_id
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
                                                  instructor_id
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
            SIGNAL SQLSTATE '60000';
        END IF;

        /******************* TA Time Conflict Check *******************/
    ELSEIF NEW.type = 'tutorial' OR NEW.type = 'lab' THEN
        /* Fetching all tutorial and lab sections taught by the TA in same year, and term*/
        CREATE TEMPORARY TABLE oldTASec AS (SELECT Section.id, day, start_time, end_time, term, year, ta_id
                                            FROM Section
                                            WHERE (type = 'tutorial' OR type = 'lab')
                                              AND ta_id = NEW.ta_id
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
                                                  ta_id
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
            SIGNAL SQLSTATE '65000';
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

    SELECT gpa INTO @applicantGpa FROM Student WHERE id = NEW.student_id;
    SELECT type
    INTO @stuType
    FROM Student
             INNER JOIN GradStudents GS ON Student.id = GS.id
    WHERE Student.id = NEW.student_id;

    IF @applicantGpa < 3 AND @stuType = 'thesis' THEN
        SIGNAL SQLSTATE '70000';
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

    SELECT gpa INTO @applicantGpa FROM Student WHERE id = NEW.assignee_id;
    IF @applicantGpa < 3.2 THEN
        SIGNAL SQLSTATE '75000';
    END IF;

END;
//
DELIMITER ;