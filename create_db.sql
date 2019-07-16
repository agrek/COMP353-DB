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
