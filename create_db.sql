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
SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE Student
(
    id         INT(8) AUTO_INCREMENT,
    first_name VARCHAR(255)  NOT NULL,
    last_name  VARCHAR(255)  NOT NULL,
    address    VARCHAR(255),
    gpa        DECIMAL(3, 2) NULL,
    CONSTRAINT Student_pk
        PRIMARY KEY (id)
);

CREATE TABLE Department
(
    id   INT(8) AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT Department_pk
        PRIMARY KEY (id),
    CONSTRAINT Department_uq
        UNIQUE (name)
);

CREATE TABLE Instructor
(
    id         INT(8) AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name  VARCHAR(255) NULL,
    dept_id    INT(8)       NOT NULL,
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
    name        VARCHAR(255) NOT NULL,
    hours       INT(3)       NOT NULL,
    assignee_id INT(8)       NULL,
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
    first_name VARCHAR(255) NOT NULL,
    last_name  VARCHAR(255) NOT NULL,
    office     VARCHAR(255) NULL,
    CONSTRAINT Advisor_pk
        PRIMARY KEY (id)
);

CREATE TABLE Program
(
    id            INT(8) AUTO_INCREMENT,
    name          VARCHAR(255) NOT NULL,
    type          VARCHAR(255) NOT NULL,
    credits       SMALLINT     NOT NULL,
    department_id INT(8)       NOT NULL,
    advisor_id    INT(8)       NULL,
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
    id            INT(8) AUTO_INCREMENT,
    name          VARCHAR(255)  NOT NULL,
    code          VARCHAR(255)  NOT NULL,
    department_id INT(8)        NOT NULL,
    credits       DECIMAL(3, 2) NOT NULL,
    CONSTRAINT Course_pk
        PRIMARY KEY (id),
    CONSTRAINT Course_uq
        UNIQUE (id, name, code),
    CONSTRAINT Course_Department_id_fk
        FOREIGN KEY (department_id) REFERENCES Department (id)
);

CREATE TABLE Class
(
    room_number VARCHAR(255) NOT NULL,
    capacity    INT          NULL,
    CONSTRAINT Class_pk
        PRIMARY KEY (room_number)
);

CREATE TABLE Section
(
    id            INT(8) AUTO_INCREMENT,
    name          VARCHAR(255) NOT NULL,
    course_id     INT(8)       NOT NULL,
    type          VARCHAR(255) NOT NULL,
    day           VARCHAR(255) NOT NULL,
    start_time    DATETIME     NOT NULL,
    end_time      DATETIME     NOT NULL,
    term          VARCHAR(255) NOT NULL,
    ta_id         INT(8)       NULL,
    instructor_id INT(8)       NULL,
    room_number   VARCHAR(255) NULL,
    CONSTRAINT Section_pk
        PRIMARY KEY (id),
    CONSTRAINT Section_uq
        UNIQUE (course_id, name),
    CONSTRAINT Section_Class_room_number_fk
        FOREIGN KEY (room_number) REFERENCES Class (room_number),
    CONSTRAINT Section_Course_id_fk
        FOREIGN KEY (course_id) REFERENCES Course (id),
    CONSTRAINT Section_Instructor_id_fk
        FOREIGN KEY (instructor_id) REFERENCES Instructor (id),
    CONSTRAINT Section_TA_assignee_fk
        FOREIGN KEY (ta_id) REFERENCES TAPosition (assignee_id)
);

CREATE TABLE ResearchFunds
(
    id     INT(8) AUTO_INCREMENT,
    name   VARCHAR(255) NOT NULL,
    amount INT          NULL,
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
    course_id INT(8)                               NOT NULL,
    req_id    INT(8)                               NOT NULL,
    type      ENUM ('prerequisite', 'corequisite') NOT NULL,
    CONSTRAINT Requisites_pk
        PRIMARY KEY (course_id, req_id),
    CONSTRAINT Requisites_Course_id_fk
        FOREIGN KEY (course_id) REFERENCES Course (id),
    CONSTRAINT Requisites_Course_id_fk_2
        FOREIGN KEY (req_id) REFERENCES Course (id)
);