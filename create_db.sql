# https://dev.mysql.com/doc/refman/8.0/en/drop-table.html
# https://tableplus.io/blog/2018/08/mysql-how-to-drop-all-tables.html
# CREATE DATABASE IF NOT EXISTS arc353_1;
USE arc353_1;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS arc353_1.Area;
DROP TABLE IF EXISTS arc353_1.Address;
DROP TABLE IF EXISTS arc353_1.Advisor;
DROP TABLE IF EXISTS arc353_1.Awards;
DROP TABLE IF EXISTS arc353_1.Building;
DROP TABLE IF EXISTS arc353_1.BuildingCampus;
DROP TABLE IF EXISTS arc353_1.Campus;
DROP TABLE IF EXISTS arc353_1.Contract;
DROP TABLE IF EXISTS arc353_1.Course;
DROP TABLE IF EXISTS arc353_1.CourseCompleted;
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

CREATE TABLE Area
(
    city        VARCHAR(45) NOT NULL,
    postal_code VARCHAR(6)  NOT NULL,
    province    VARCHAR(45) NOT NULL,
    CONSTRAINT Area_pk
        PRIMARY KEY (city, postal_code)
);

CREATE TABLE Address
(
    id           INT AUTO_INCREMENT,
    street       VARCHAR(45) NOT NULL,
    city         VARCHAR(45) NOT NULL,
    postal_code  VARCHAR(6)  NOT NULL,
    apt          INT         NULL,
    civic_number INT         NOT NULL,
    CONSTRAINT Address_pk
        PRIMARY KEY (id),
    CONSTRAINT Address_uq
        UNIQUE (civic_number, street, city, postal_code, apt),
    CONSTRAINT Address_Area_city_fk
        FOREIGN KEY (city, postal_code) REFERENCES Area (city, postal_code)
            ON UPDATE CASCADE
);

CREATE TABLE Campus
(
    abbreviation VARCHAR(45) NOT NULL,
    name         VARCHAR(45) NOT NULL,
    CONSTRAINT Campus_pk
        PRIMARY KEY (abbreviation)
);

CREATE TABLE BuildingCampus
(
    address INT         NOT NULL,
    campus  VARCHAR(45) NOT NULL,
    CONSTRAINT Building_pk
        PRIMARY KEY (address),
    CONSTRAINT BuildingCampus_abbreviation_fk
        FOREIGN KEY (campus) REFERENCES Campus (abbreviation)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT BuildingCampus_Address_id_fk
        FOREIGN KEY (address) REFERENCES Address (id)
            ON UPDATE CASCADE
);

CREATE TABLE Building
(
    abbreviation VARCHAR(45) NOT NULL,
    name         VARCHAR(90) NOT NULL,
    num_rooms    INT DEFAULT 0,
    num_floors   INT DEFAULT 0,
    address      INT         NOT NULL,
    CONSTRAINT Building_pk
        PRIMARY KEY (abbreviation),

    CONSTRAINT Building_Address_id_fk
        FOREIGN KEY (address) REFERENCES BuildingCampus (address)
            ON UPDATE CASCADE
);

CREATE TABLE Room
(
    building_abbreviation VARCHAR(45)                     NOT NULL,
    type                  ENUM ('lab', 'class', 'office') NOT NULL,
    capacity              INT                             NOT NULL,
    room_floor            INT(2)                          NOT NULL,
    room_number           INT                             NOT NULL,
    CONSTRAINT Room_pk
        PRIMARY KEY (building_abbreviation, room_floor, room_number),
    CONSTRAINT Room_Building_abbreviation_fk
        FOREIGN KEY (building_abbreviation) REFERENCES Building (abbreviation)
            ON UPDATE CASCADE
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
        FOREIGN KEY (room_overhead_id) REFERENCES RoomOverhead (id)
            ON UPDATE CASCADE,
    CONSTRAINT RoomNeeds_Room_building_abbreviation_room_number_fk
        FOREIGN KEY (building_abbreviation, room_floor, room_number) REFERENCES Room (building_abbreviation, room_floor, room_number)
            ON UPDATE CASCADE
);

CREATE TABLE Person
(
    ssn        INT         NOT NULL,
    id         INT AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name  VARCHAR(45) NOT NULL,
    email      VARCHAR(45) NULL,
    address    INT         NULL,
    phone      VARCHAR(14) NULL,
    CONSTRAINT Person_pk
        PRIMARY KEY (ssn),
    CONSTRAINT Person_uq
        UNIQUE (id, email),
    CONSTRAINT Person_Address_id_fk
        FOREIGN KEY (address) REFERENCES Address (id)
            ON UPDATE CASCADE
);

CREATE TABLE Employee
(
    ssn                          INT         NOT NULL,
    retired                      BOOL DEFAULT FALSE,
    office_building_abbreviation VARCHAR(45) NULL,
    office_room_floor            INT(2)      NULL,
    office_room_number           INT(3)      NULL,
    CONSTRAINT Employee_pk
        PRIMARY KEY (ssn),
    CONSTRAINT Employee_Person_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Person (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Employee_Building_abbreviation_fk
        FOREIGN KEY (office_building_abbreviation, office_room_floor, office_room_number) REFERENCES Room (building_abbreviation, room_floor, room_number)
            ON UPDATE CASCADE
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
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Student
(
    ssn INT           NOT NULL,
    gpa DECIMAL(3, 2) NULL,
    CONSTRAINT Student_pk
        PRIMARY KEY (ssn),
    CONSTRAINT Student_Person_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Person (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE
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
    ssn               INT NOT NULL,
    dept_id           INT NOT NULL,
    funding_available BOOL DEFAULT FALSE,
    CONSTRAINT Instructor_pk
        PRIMARY KEY (ssn),
    CONSTRAINT Instructor_Department_id_fk
        FOREIGN KEY (dept_id) REFERENCES Department (id)
            ON UPDATE CASCADE,
    CONSTRAINT Instructor_Employee_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Employee (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE Department
    ADD CONSTRAINT Department_Chairman_ssn_fk
        FOREIGN KEY (chairman_ssn) REFERENCES Instructor (ssn)
            ON UPDATE CASCADE ON DELETE SET NULL;

CREATE TABLE UGradStudents
(
    ssn INT,
    CONSTRAINT GradStudents_pk
        PRIMARY KEY (ssn),
    CONSTRAINT Undergrad_Student_id_fk
        FOREIGN KEY (ssn) REFERENCES Student (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE GradStudents
(
    ssn            INT                       NULL,
    type           ENUM ('thesis', 'course') NOT NULL,
    supervisor_ssn INT                       NULL,
    CONSTRAINT GradStudents_pk
        PRIMARY KEY (ssn),
    CONSTRAINT GradStudents_Instructor_ssn_fk
        FOREIGN KEY (supervisor_ssn) REFERENCES Instructor (ssn)
            ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Grad_Student_id_fk
        FOREIGN KEY (ssn) REFERENCES Student (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE
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
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Publications
(
    ssn       INT                            NOT NULL,
    type      ENUM ('conference', 'journal') NULL,
    date      DATE                           NOT NULL,
    title     VARCHAR(90)                    NOT NULL,
    publisher VARCHAR(45)                    NOT NULL,
    CONSTRAINT Publications_pk
        PRIMARY KEY (ssn, date, title, publisher),
    CONSTRAINT Publications_Person_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Person (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Awards
(
    ssn  INT         NOT NULL,
    date DATE        NOT NULL,
    name VARCHAR(90) NOT NULL,
    CONSTRAINT Awards_pk
        PRIMARY KEY (ssn, date, name),
    CONSTRAINT Awards_Person_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Person (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Degree
(
    institution VARCHAR(90) NOT NULL,
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
        FOREIGN KEY (degree_id) REFERENCES Degree (id)
            ON UPDATE CASCADE,
    CONSTRAINT HasDegree_Person_ssn_fk
        FOREIGN KEY (ssn) REFERENCES Person (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE LetterToGpa
(
    letter ENUM ('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F', 'FNS', 'R', 'NR') NOT NULL,
    gpa    DECIMAL(3, 2)                                                                                    NOT NULL,
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
            ON UPDATE CASCADE ON DELETE CASCADE
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
    CONSTRAINT Program_uq
        UNIQUE (name),
    CONSTRAINT Program_Advisor_ssn_fk
        FOREIGN KEY (advisor_ssn) REFERENCES Advisor (ssn)
            ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Program_Department_id_fk
        FOREIGN KEY (department_id) REFERENCES Department (id)
            ON UPDATE CASCADE
);

CREATE TABLE Studies
(
    student_ssn INT         NOT NULL,
    program_id  INT         NOT NULL,
    term        VARCHAR(45) NOT NULL,
    year        INT         NOT NULL,
    CONSTRAINT Program_pk
        PRIMARY KEY (student_ssn, program_id),
    CONSTRAINT Studies_Program_id_fk
        FOREIGN KEY (program_id) REFERENCES Program (id)
            ON UPDATE CASCADE,
    CONSTRAINT Studies_Student_id_fk
        FOREIGN KEY (student_ssn) REFERENCES Student (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE
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
            ON UPDATE CASCADE
);

CREATE TABLE CourseCompleted
(
    student_ssn INT                                                                                                           NOT NULL,
    course_code VARCHAR(16)                                                                                                   NOT NULL,
    year        INT(4)                                                                                                        NOT NULL,
    term        VARCHAR(45)                                                                                                   NOT NULL,
    grade       ENUM ('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F', 'FNS', 'R', 'NR') DEFAULT NULL NULL,
    CONSTRAINT CourseCompleted_pk
        PRIMARY KEY (student_ssn, course_code, year, term),
    CONSTRAINT CourseCompleted_Course_code_fk
        FOREIGN KEY (course_code) REFERENCES Course (code)
            ON UPDATE CASCADE,
    CONSTRAINT CourseCompleted_LetterToGpa_letter_fk
        FOREIGN KEY (grade) REFERENCES LetterToGpa (letter)
            ON UPDATE CASCADE,
    CONSTRAINT CourseCompleted_Student_ssn_fk
        FOREIGN KEY (student_ssn) REFERENCES Student (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE TermToNumber
(
    term       VARCHAR(45) NOT NULL,
    term_order INT(1)      NOT NULL,
    CONSTRAINT TermToNumber_pk
        PRIMARY KEY (term)
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
    instructor_ssn        INT(9)      NULL,
    building_abbreviation VARCHAR(45) NULL,
    room_floor            INT(2)      NULL,
    room_number           INT(3)      NOT NULL,
    CONSTRAINT Section_pk
        PRIMARY KEY (id),
    CONSTRAINT Section_uq
        UNIQUE (course_code, name),
    CONSTRAINT Section_Building_abbreviation_num_rooms_fk
        FOREIGN KEY (building_abbreviation, room_floor, room_number) REFERENCES Room (building_abbreviation, room_floor, room_number)
            ON UPDATE CASCADE,
    CONSTRAINT Section_Course_code_fk
        FOREIGN KEY (course_code) REFERENCES Course (code)
            ON UPDATE CASCADE,
    CONSTRAINT Section_Instructor_ssn_fk
        FOREIGN KEY (instructor_ssn) REFERENCES Instructor (ssn)
            ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT term_name_fk
        FOREIGN KEY (term) REFERENCES TermToNumber (term)
            ON UPDATE CASCADE
);

CREATE TABLE TAPosition
(
    section_id   INT         NOT NULL,
    position     VARCHAR(45) NOT NULL,
    hours        INT(3)      NOT NULL,
    assignee_ssn INT         NULL,
    salary       INT         NOT NULL,
    CONSTRAINT TAPosition_pk
        PRIMARY KEY (section_id),
    CONSTRAINT TAPosition_Section_id_fk
        FOREIGN KEY (section_id) REFERENCES Section (id)
            ON UPDATE CASCADE,
    CONSTRAINT TA_GradStudents_id_fk
        FOREIGN KEY (assignee_ssn) REFERENCES GradStudents (ssn)
            ON UPDATE CASCADE ON DELETE SET NULL
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
    year             INT(4)                                NOT NULL,
    term             VARCHAR(45)                           NOT NULL,
    CONSTRAINT ResearchFundingApplications_pk
        PRIMARY KEY (id),
    CONSTRAINT ResearchFundingApplications_GradStudents_ssn_fk
        FOREIGN KEY (student_ssn) REFERENCES GradStudents (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT ResearchFundingApplications_ResearchFunds_id_fk
        FOREIGN KEY (research_fund_id) REFERENCES ResearchFunds (id)
            ON UPDATE CASCADE
);

CREATE TABLE SectionEnrollment
(
    section_id  INT NOT NULL,
    student_ssn INT NULL,
    CONSTRAINT SectionEnrollment_pk
        PRIMARY KEY (section_id, student_ssn),
    CONSTRAINT SectionEnrollment_Section_id_fk
        FOREIGN KEY (section_id) REFERENCES Section (id)
            ON UPDATE CASCADE,
    CONSTRAINT SectionEnrollment_Student_ssn_fk
        FOREIGN KEY (student_ssn) REFERENCES Student (ssn)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Requisites
(
    course_code VARCHAR(16)                          NOT NULL,
    req_code    VARCHAR(16)                          NOT NULL,
    type        ENUM ('prerequisite', 'corequisite') NOT NULL,
    CONSTRAINT Requisites_pk
        PRIMARY KEY (course_code, req_code),
    CONSTRAINT Requisites_Course_code_fk
        FOREIGN KEY (course_code) REFERENCES Course (code)
            ON UPDATE CASCADE,
    CONSTRAINT Requisites_Course_code_fk_2
        FOREIGN KEY (req_code) REFERENCES Course (code)
            ON UPDATE CASCADE
);

CREATE TABLE ProgramRequirements
(
    program_id  INT         NOT NULL,
    course_code VARCHAR(16) NOT NULL,
    CONSTRAINT ProgramRequirements_pk
        PRIMARY KEY (program_id, course_code),
    CONSTRAINT ProgramRequirements_Course_code_fk
        FOREIGN KEY (course_code) REFERENCES Course (code)
            ON UPDATE CASCADE,
    CONSTRAINT ProgramRequirements_Program_id_fk
        FOREIGN KEY (program_id) REFERENCES Program (id)
            ON UPDATE CASCADE
);

