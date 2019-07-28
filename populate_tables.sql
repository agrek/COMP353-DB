INSERT INTO LetterToGpa
VALUES ('A+', 4.30),
       ('A', 4.00),
       ('A-', 3.70),
       ('B+', 3.30),
       ('B', 3.00),
       ('B-', 2.70),
       ('C+', 2.30),
       ('C', 2.00),
       ('C-', 1.70),
       ('D+', 1.30),
       ('D', 1.00),
       ('D-', 0.70),
       ('F', 0.00),
       ('FNS', 0.00),
       ('R', 0.00),
       ('NR', 0.00);

INSERT INTO Department
VALUES (1, 'Computer Engineering'),
       (2, 'Physics'),
       (3, 'Computer Science'),
       (4, 'Software Engineering'),
       (5, 'Chemistry'),
       (6, 'English'),
       (7, 'Electrical Engineering'),
       (8, 'Mathematics'),
       (9, 'Economics'),
       (10, 'Psychology'),
       (11, 'General Engineering');

INSERT INTO Advisor
VALUES (DEFAULT, 'Ellen', 'Kirk', 'Engineering Building',44),
       (DEFAULT, 'Tobias', 'Farmer', 'Physics Building',12),
       (DEFAULT, 'Paige', 'Cannon', 'Chemistry Building',14),
       (DEFAULT, 'Leo', 'Salinas', 'Engineering Building',74),
       (DEFAULT, 'Rosie', 'Cobb', 'Math Building',587),
       (DEFAULT, 'Dominic', 'Jensen', 'Engineering Building',729),
       (DEFAULT, 'Scarlett', 'Bishop', 'English Building',534),
       (DEFAULT, 'Steve', 'Schultz', 'Psychology Building',36),
       (DEFAULT, 'Lucas', 'Wang', 'Computer Science Building',21),
       (DEFAULT, 'Lillian', 'Frazier', 'Business Building',511);

INSERT INTO Program
VALUES (1, 'Actuarial Mathematics Undergraduate', 'undergraduate', 90, 8, 5),
       (2, 'Actuarial Mathematics Graduate', 'graduate', 44, 8, 5),
       (3, 'Mathematics Undergraduate', 'undergraduate', 90, 8, 5),
       (4, 'Mathematics Graduate', 'graduate', 44, 8, 5),
       (5, 'Physics Undergraduate', 'undergraduate', 90, 2, 2),
       (6, 'Physics Graduate', 'graduate', 44, 2, 2),
       (7, 'English Literature Undergraduate', 'undergraduate', 90, 6, 7),
       (8, 'English Literature Graduate', 'graduate', 44, 6, 7),
       (9, 'Psychology Undergraduate', 'undergraduate', 90, 10, 8),
       (10, 'Psychology Graduate', 'graduate', 44, 10, 8),
       (11, 'Economics Undergraduate', 'undergraduate', 90, 9, 10),
       (12, 'Economics Graduate', 'graduate', 44, 9, 10),
       (13, 'Chemistry Undergraduate', 'undergraduate', 90, 5, 3),
       (14, 'Chemistry Graduate', 'graduate', 44, 5, 3),
       (15, 'Biochemistry Undergraduate', 'undergraduate', 90, 5, 3),
       (16, 'Biochemistry Graduate', 'graduate', 44, 5, 3),
       (17, 'Computer Systems Undergraduate', 'undergraduate', 90, 3, 9),
       (18, 'Computer Systems Graduate', 'graduate', 44, 3, 9),
       (19, 'Computer Science Undergraduate', 'undergraduate', 90, 3, 9),
       (20, 'Computer Science Graduate', 'graduate', 44, 3, 9),
       (21, 'Computer Engineering Undergraduate', 'undergraduate', 90, 1, 1),
       (22, 'Computer Engineering Graduate', 'graduate', 44, 1, 1),
       (23, 'Software Engineering Undergraduate', 'undergraduate', 90, 4, 4),
       (24, 'Software Engineering Graduate', 'graduate', 44, 4, 4),
       (25, 'Electrical Engineering Undergraduate', 'undergraduate', 90, 7, 6),
       (26, 'Electrical Engineering Graduate', 'graduate', 44, 7, 6),
       (27, 'General Engineering Undergraduate', 'undergraduate', 90, 11, NULL),
       (28, 'General Engineering Graduate', 'graduate', 44, 11, NULL);

INSERT INTO Course
VALUES ('COMP353', 'Databases', 3, '4.0'),
       ('COMP352', 'Data structures and algorithms', 3, '3.0'),
       ('SOEN341', 'Software processes', 4, '3.0'),
       ('SOEN342', 'Software requirements and specifications', 4, '3.5'),
       ('SOEN343', 'Software architecture and design 1', 4, '3.0'),
       ('COEN345', 'Software testing and validation', 1, '3.5'),
       ('ELEC331', 'Fundamentals of electrical power engineering', 7, '3.0'),
       ('ELEC251', 'Fundamentals of applied electromagnetics', 7, '3.0'),
       ('CHEM325', 'Organic Structure and Stereochemistry', 5, '3.5'),
       ('ECON221', 'Statistical methods 1', 9, '2.5'),
       ('ECON222', 'Statistical methods 2', 9, '3.0'),
       ('MATH209', 'Fundamental mathematics 2', 8, '3.0'),
       ('ENGL233', 'Critical reading', 6, '3.0'),
       ('PSYC255', 'Brain and behavior', 10, '3.0'),
       ('PHYS334', 'Thermodynamics', 2, '3.0'),
       ('PHYS393', 'Experimental thermodynamics', 2, '3.0');

INSERT INTO ProgramRequirements(program_id, course_code) VALUE
    (1, 'MATH209'),
    (3, 'MATH209'),
    (5, 'PHYS334'),
    (7, 'ENGL233'),
    (9, 'PSYC255'),
    (11, 'ECON221'),
    (11, 'ECON222'),
    (13, 'CHEM325'),
    (15, 'CHEM325'),
    (17, 'COMP352'),
    (17, 'COMP353'),
    (19, 'COMP352'),
    (19, 'COMP353'),
    (21, 'COMP352'),
    (21, 'SOEN341'),
    (21, 'COEN345'),
    (21, 'ELEC331'),
    (23, 'COMP352'),
    (23, 'SOEN341'),
    (23, 'SOEN342'),
    (23, 'SOEN343'),
    (25, 'COMP352'),
    (25, 'ELEC331'),
    (25, 'ELEC251');

INSERT INTO Student
VALUES (DEFAULT, 'Isabelle', 'Ramirez', '552 Broadway Street', NULL),
       (DEFAULT, 'Benjamin', 'Moore', '76 Chestnut Grove', NULL),
       (DEFAULT, 'Hannah', 'Hayes', '223 Abby Lane', NULL),
       (DEFAULT, 'Amber', 'Baker', '57 Mendip Close', NULL),
       (DEFAULT, 'David', 'Williams', '6398 Beverley Road', NULL),
       (DEFAULT, 'Mildred', 'Jackson', '764 Saint Mary Street', NULL),
       (DEFAULT, 'Josh', 'Murray', '7321 Church Street', NULL),
       (DEFAULT, 'Phoebe', 'Mitchell', '88 Elm Avenue', NULL),
       (DEFAULT, 'Imogen', 'Hughes', '1154 Charles Street', NULL),
       (DEFAULT, 'Luke', 'Washington', '62 Castle Street', NULL),
       (DEFAULT, 'Ella', 'Wright', '18 Norman Road', NULL),
       (DEFAULT, 'Harrison', 'Shaw', '709 Saint Andrews Road', NULL),
       (DEFAULT, 'Mohammed', 'Nguyen', '482 West Street', NULL),
       (DEFAULT, 'Alice', 'Ford', '4 Chapel Lane', NULL),
       (DEFAULT, 'James', 'West', '7622 Common Road', NULL),
       (DEFAULT, 'Harry', 'Cooke', '562 Coronation Street', NULL),
       (DEFAULT, 'Liam', 'Shaw', '709 Saint Andrews Road', NULL),
       (DEFAULT, 'Megan', 'Murray', '612 Chatsworth Road', NULL),
       (DEFAULT, 'Oliver', 'Gonzalez', '835 Maple Street', NULL),
       (DEFAULT, 'Allie', 'Hamilton', '9662 Brunswick Street', NULL),
       (DEFAULT, 'Brandon', 'Cassidy', '35 Hyacynth Drive', NULL),
       (DEFAULT, 'Justin', 'Santiago', '329 Pennant Road', NULL),
       (DEFAULT, 'Leonard', 'Li', '71 Drake Avenue', NULL),
       (DEFAULT, 'Jess', 'Singh', '732 Terrace Gardens', NULL),
       (DEFAULT, 'Declan', 'Simmons', '5 Balmoral Crescent', NULL),
       (DEFAULT, 'Maja', 'Little', '7 Barberry Avenue', NULL),
       (DEFAULT, 'Hugo', 'Harrison', '222 Mill hill Road', NULL),
       (DEFAULT, 'Christian', 'Gilbert', '41 Whitegates Road', NULL),
       (DEFAULT, 'Monica', 'Owen', '68 Blossom Road', NULL),
       (DEFAULT, 'Brian', 'Crawford', '90 Argosy Road', NULL),
       (DEFAULT, 'Gina', 'Wilkes', '72 Hamerton Road', NULL),
       (DEFAULT, 'Lloyd', 'Greene', '33 Danburry Road', NULL),
       (DEFAULT, 'Ewan', 'Ortega', '198 King George Road', NULL),
       (DEFAULT, 'Declan', 'Manning', '2 Easdale Street', NULL),
       (DEFAULT, 'Caitlin', 'Gill', '69 Douglas Way', NULL),
       (DEFAULT, 'Sara', 'Cole', '83 Salmon Street', NULL),
       (DEFAULT, 'Annie', 'Huang', '710 Howie Road', NULL),
       (DEFAULT, 'Jen', 'Carr', '944 Onslow Street', NULL),
       (DEFAULT, 'Aisha', 'Flores', '23 Liddel Street', NULL),
       (DEFAULT, 'Matilda', 'Beckett', '15 Columba Street', NULL),
       (DEFAULT, 'Francis', 'Smith', '536 Walter Street', NULL),
       (DEFAULT, 'Ella', 'Martin', '12 Barry Lane', NULL),
       (DEFAULT, 'Andrew', 'McDonald', '29 James Crescent', NULL),
       (DEFAULT, 'Scott', 'Griffiths', '68 Weller Road', NULL),
       (DEFAULT, 'Alexandria', 'Allen', '99 Copper Street', NULL),
       (DEFAULT, 'Ivan', 'Walters', '876 Main Street', NULL),
       (DEFAULT, 'Melanie', 'Armstrong', '98 Main Street', NULL),
       (DEFAULT, 'Justin', 'Taylor', '8 School Street', NULL),
       (49, 'Michael', 'Zadeh', '100 Wright Avenue', NULL);

INSERT INTO Instructor
VALUES (DEFAULT, 'Sophie', 'Morton', 3),
       (DEFAULT, 'Jacob', 'Hutchinson', 3),
       (DEFAULT, 'Chloe', 'Booth', 9),
       (DEFAULT, 'Ibrahim', 'Pham', 1),
       (DEFAULT, 'Aaron', 'Rice', 8),
       (DEFAULT, 'Elizabeth', 'Aguilar', 10),
       (DEFAULT, 'Rebecca', 'Ross', 4),
       (DEFAULT, 'Sebastien', 'Arnold', 7),
       (DEFAULT, 'Reuben', 'Pratt', 2),
       (DEFAULT, 'Travis', 'Cummings', 8),
       (DEFAULT, 'Molly', 'Byrne', 5),
       (DEFAULT, 'Charles', 'Mccoy', 7),
       (DEFAULT, 'Elizabeth', 'Ingram', 6);

INSERT INTO GradStudents
VALUES (3, 'thesis', 9),
       (6, 'course', NULL),
       (12, 'thesis', 8),
       (9, 'course', NULL),
       (8, 'course', NULL),
       (4, 'thesis', 8),
       (10, 'thesis', 6),
       (16, 'course', NULL),
       (7, 'thesis', 2),
       (13, 'thesis', 5),
       (21, 'thesis', 2),
       (22, 'thesis', 2),
       (23, 'thesis', 2),
       (24, 'thesis', 2),
       (25, 'thesis', 2),
       (26, 'thesis', 2),
       (27, 'thesis', 2),
       (28, 'thesis', 2),
       (29, 'thesis', 2),
       (30, 'thesis', 2),
       (31, 'thesis', 2),
       (32, 'thesis', 2),
       (33, 'thesis', 2),
       (34, 'thesis', 2),
       (35, 'thesis', 2),
       (36, 'thesis', 2),
       (37, 'thesis', 2),
       (38, 'thesis', 2),
       (39, 'thesis', 2),
       (40, 'thesis', 2),
       (41, 'course', NULL),
       (42, 'thesis', 3),
       (43, 'course', NULL),
       (44, 'thesis', 9),
       (45, 'thesis', 9),
       (46, 'thesis', 11),
       (47, 'course', NULL),
       (48, 'thesis', 4);

INSERT INTO ResearchFunds
VALUES (DEFAULT, 'Research Grant in Computer Science 2', 800),
       (DEFAULT, 'Research Grant in Computer Science 3', 1000),
       (DEFAULT, 'Research Grant in Computer Science 4', 1200),
       (DEFAULT, 'Research Grant in Computer Science 5', 1500),
       (DEFAULT, 'NSERC tier1', 20000),
       (DEFAULT, 'NSERC tier2', 17500),
       (DEFAULT, 'NSERC tier3', 8000),
       (DEFAULT, 'Engineering Design Grant', 35000),
       (DEFAULT, 'Pure Applied Science Graduate Funding', 18500),
       (DEFAULT, 'Graduate Fubding for Liberal Arts', 12500);

INSERT INTO ResearchFundingApplications
VALUES (DEFAULT, 'granted', 23, 1),
       (DEFAULT, 'granted', 31, 2),
       (DEFAULT, 'granted', 26, 3),
       (DEFAULT, 'granted', 29, 4),
       (DEFAULT, 'denied', 38, 2),
       (DEFAULT, 'denied', 31, 4),
       (DEFAULT, 'denied', 30, 1),
       (DEFAULT, 'denied', 30, 2),
       (DEFAULT, 'denied', 30, 3),
       (DEFAULT, 'denied', 30, 4),
       (DEFAULT, 'denied', 24, 3),
       (DEFAULT, 'granted', 44, 7),
       (DEFAULT, 'granted', 4, 6),
       (DEFAULT, 'applied', 45, 5),
       (DEFAULT, 'applied', 9, 5),
       (DEFAULT, 'denied', 10, 6),
       (DEFAULT, 'denied', 28, 6),
       (DEFAULT, 'denied', 21, 6),
       (DEFAULT, 'applied', 12, 8),
       (DEFAULT, 'applied', 3, 8),
       (DEFAULT, 'applied', 6, 8),
       (DEFAULT, 'applied', 9, 8),
       (DEFAULT, 'granted', 23, 9),
       (DEFAULT, 'denied', 46, 9),
       (DEFAULT, 'denied', 43, 10);


INSERT INTO Studies
VALUES (1, 17),
       (2, 1),
       (3, 26),
       (4, 26),
       (5, 23),
       (6, 2),
       (7, 19),
       (8, 12),
       (9, 24),
       (10, 10),
       (11, 3),
       (11, 5),
       (12, 26),
       (13, 4),
       (14, 21),
       (15, 15),
       (16, 19),
       (16, 17),
       (17, 9),
       (18, 7),
       (19, 11),
       (20, 13),
       (21, 19),
       (22, 19),
       (23, 19),
       (24, 19),
       (25, 19),
       (26, 19),
       (27, 19),
       (28, 19),
       (29, 19),
       (30, 19),
       (31, 19),
       (32, 19),
       (33, 19),
       (34, 19),
       (35, 19),
       (36, 19),
       (37, 19),
       (38, 19),
       (39, 19),
       (40, 19),
       (41, 26),
       (42, 12),
       (43, 8),
       (44, 6),
       (45, 6),
       (46, 16),
       (47, 18),
       (48, 20),
       (49, 27);


INSERT INTO TAPosition
VALUES (1, 'TA', 35, 21),
       (2, 'marker', 65, 23),
       (3, 'Lab Instructor', 50, 21),
       (4, 'TA', 25, 26),
       (5, 'TA', 25, 7),
       (6, 'marker', 65, 23),
       (7, 'TA', 50, 7),
       (8, 'TA', 25, 26),
       (9, 'TA', 25, 31),
       (10, 'marker', 65, 39),
       (11, 'TA', 50, 39),
       (12, 'TA', 35, 35),
       (13, 'TA', 35, 22),
       (14, 'marker', 90, 37),
       (15, 'TA', 25, 31),
       (16, 'TA', 25, 30),
       (17, 'marker', 90, 28),
       (18, 'TA', 25, 22),
       (19, 'TA', 25, 30),
       (20, 'marker', 90, 35),
       (21, 'TA', 30, 37),
       (22, 'TA', 30, 24),
       (23, 'marker', 70, 24),
       (24, 'TA', 25, 25),
       (25, 'TA', 25, 28),
       (26, 'marker', 80, 27),
       (27, 'TA', 30, 25),
       (28, 'TA', 30, 29),
       (29, 'marker', 75, 29),
       (30, 'TA', 25, 48),
       (31, 'TA', 25, 28),
       (32, 'Lab Instructor', 45, 48),
       (33, 'marker', 80, 27),
       (34, 'TA', 30, 12),
       (35, 'TA', 30, 4),
       (36, 'marker', 30, 12),
       (37, 'TA', 25, 4),
       (38, 'marker', 80, 41),
       (39, 'lab Instructor', 50, 46),
       (40, 'marker', 100, 46),
       (41, 'marker', 110, 42),
       (42, 'marker', 110, 42),
       (43, 'marker', 110, 6),
       (44, 'marker', 110, 6),
       (45, 'marker', 120, 13),
       (46, 'marker', 120, 13),
       (47, 'marker', 120, 47),
       (48, 'marker', 90, 43),
       (49, 'marker', 90, 43),
       (50, 'marker', 80, 10),
       (51, 'TA', 30, 44),
       (52, 'marker', 90, 45),
       (53, 'TA', 30, 12),
       (54, 'marker', 65, 32),
       (55, 'TA', 30, 32),
       (56, 'marker', 30, 33),
       (57, 'TA', 30, 33),
       (58, 'Lab Instructor', 50, 34),
       (59, 'TA', 25, 36),
       (60, 'marker', 90, 36);

INSERT INTO Class
VALUES ('H535', 120),
       ('H520', 135),
       ('H435', 120),
       ('H420', 135),
       ('H405', 60),
       ('H408', 40),
       ('H409', 50),
       ('H503', 40),
       ('H504', 55),
       ('H505', 60),
       ('H903', 135),
       ('H907', 135),
       ('FGC80', 80),
       ('H625', 90),
       ('H603', 60),
       ('H609', 60),
       ('FGB90', 100),
       ('JMB325', 40),
       ('JMB321', 60),
       ('JMB202', 130);

INSERT INTO TermToNumber
VALUES ('winter', 0),
       ('summer', 1),
       ('fall', 2),
       ('fall/winter', 3);

INSERT INTO Section
VALUES (1, 'AAA', 'COMP353', 'lecture', 'M, W', '14:45:00', '17:30:00', 'summer', '2018', 23, 1, 'H535'),
       (2, 'BBB', 'COMP353', 'lecture', 'Tu, Th', '13:45:00', '15:00:00', 'fall', '2018', 23, 1, 'H420'),
       (3, 'CCC', 'COMP353', 'lecture', 'M, F', '9:45:00', '11:00:00', 'winter', '2018', 39, 2, 'H520'),
       (4, 'AAT', 'COMP353', 'tutorial', 'M, W', '13:15:00', '14:05:00', 'summer', '2018', 21, 1, 'H503'),
       (5, 'BBTY', 'COMP353', 'tutorial', 'Tu', '9:15:00', '10:05:00', 'fall', '2018', 25, 1, 'H520'),
       (6, 'BBTX', 'COMP353', 'tutorial', 'Th', '9:15:00', '10:05:00', 'fall', '2018', 7, 1, 'H603'),
       (7, 'CCTX', 'COMP353', 'tutorial', 'M', '11:15:00', '13:05:00', 'winter', '2018', 26, 2, 'H505'),
       (8, 'CCTY', 'COMP353', 'tutorial', 'F', '11:15:00', '13:05:00', 'winter', '2018', 31, 2, 'H505'),
       (9, 'AAL', 'COMP353', 'lab', 'M, W', '8:45:00', '10:30:00', 'summer', '2018', 21, 1, 'H903'),
       (10, 'BBL', 'COMP353', 'lab', 'Th', '15:45:00', '17:30:00', 'fall', '2018', 7, 1, 'H907'),
       (11, 'CCL', 'COMP353', 'lab', 'F', '14:45:00', '17:30:00', 'winter', '2018', 39, 2, 'H903'),
       (12, 'AAA', 'COMP352', 'lecture', 'W, F', '14:45:00', '17:30:00', 'summer', '2018', 39, 2, 'H520'),
       (13, 'BBB', 'COMP352', 'lecture', 'M, W', '13:00:00', '14:15:00', 'fall', '2018', 37, 1, 'H535'),
       (14, 'CCC', 'COMP352', 'lecture', 'M, W', '9:45:00', '11:00:00', 'fall/winter', '2018', 28, 1, 'H435'),
       (15, 'AATX', 'COMP352', 'tutorial', 'W, F', '8:45:00', '9:30:00', 'summer', '2018', 31, 2, 'H409'),
       (16, 'AATY', 'COMP352', 'tutorial', 'W, F', '8:45:00', '9:30:00', 'summer', '2018', 39, 2, 'H504'),
       (17, 'BBTX', 'COMP352', 'tutorial', 'Tu', '8:45:00', '9:30:00', 'fall', '2018', 35, 1, 'H609'),
       (18, 'BBTY', 'COMP352', 'tutorial', 'W', '15:45:00', '17:30:00', 'fall', '2018', 22, 1, 'H503'),
       (19, 'CCTX', 'COMP352', 'tutorial', 'W', '15:45:00', '17:30:00', 'fall/winter', '2018', 31, 1, 'JMB321'),
       (20, 'CCTY', 'COMP352', 'tutorial', 'Th', '11:45:00', '13:30:00', 'fall/winter', '2018', 30, 1, 'H504'),
       (21, 'AAA', 'SOEN341', 'lecture', 'W, F', '8:45:00', '10:00:00', 'winter', '2018', 35, 7, 'FGC80'),
       (22, 'AATX', 'SOEN341', 'tutorial', 'F', '12:00:00', '12:50:00', 'winter', '2018', 30, 7, 'JMB321'),
       (23, 'AATY', 'SOEN341', 'tutorial', 'F', '10:00:00', '10:50:00', 'winter', '2018', 22, 7, 'JMB325'),
       (24, 'AAA', 'SOEN342', 'lecture', 'Tu, Th', '10:00:00', '12:15:00', 'fall', '2018', 25, 7, 'H435'),
       (25, 'AATX', 'SOEN342', 'tutorial', 'Th', '9:00:00', '9:45:00', 'fall', '2018', 24, 7, 'H504'),
       (26, 'AATY', 'SOEN342', 'tutorial', 'Tu', '12:30:00', '13:20:00', 'fall', '2018', 37, 7, 'H603'),
       (27, 'AAA', 'SOEN343', 'lecture', 'M, W', '10:45:00', '12:00:00', 'fall', '2018', 25, 7, 'H520'),
       (28, 'AATX', 'SOEN343', 'tutorial', 'M, W', '12:15:00', '13:05:00', 'fall', '2018', 27, 7, 'H408'),
       (29, 'AATY', 'SOEN343', 'tutorial', 'M, W', '13:15:00', '14:05:00', 'fall', '2018', 28, 7, 'H408'),
       (30, 'AAA', 'COEN345', 'lecture', 'Tu, Th', '13:15:00', '14:30:00', 'winter', '2018', 27, 4, 'H520'),
       (31, 'AATX', 'COEN345', 'tutorial', 'Tu', '14:30:00', '15:20:00', 'winter', '2018', 29, 4, 'H609'),
       (32, 'AATY', 'COEN345', 'tutorial', 'Th', '14:30:00', '15:20:00', 'winter', '2018', 31, 4, 'H409'),
       (33, 'AAL', 'COEN345', 'lab', 'F', '8:45:00', '10:15:00', 'winter', '2018', 48, 4, 'H907'),
       (34, 'AAA', 'ELEC331', 'lecture', 'M, W', '13:15:00', '14:30:00', 'winter', '2018', 12, 8, 'FGB90'),
       (35, 'AAT', 'ELEC331', 'tutorial', 'M', '10:15:00', '12:05:00', 'winter', '2018', 12, 8, 'H405'),
       (36, 'AAL', 'ELEC331', 'lab', 'Tu', '16:00:00', '18:30:00', 'winter', '2018', 4, 8, 'H903'),
       (37, 'AAA', 'ELEC251', 'lecture', 'Tu, Th', '15:15:00', '17:30:00', 'fall', '2018', 41, 12, 'H420'),
       (38, 'AAT', 'ELEC251', 'tutorial', 'Th', '17:45:00', '18:35:00', 'fall', '2018', 4, 12, 'H409'),
       (39, 'AAA', 'CHEM325', 'lecture', 'M', '18:00:00', '20:30:00', 'winter', '2018', 46, 11, 'JMB202'),
       (40, 'AAL', 'CHEM325', 'lab', 'W', '18:30:00', '22:30:00', 'winter', '2018', 46, 11, 'JMB202'),
       (41, 'AAA', 'ECON221', 'lecture', 'Tu, Th', '8:45:00', '10:00:00', 'fall', '2018', 42, 3, 'H420'),
       (42, 'BBB', 'ECON221', 'lecture', 'Tu, Th', '16:15:00', '17:30:00', 'winter', '2018', 42, 3, 'H535'),
       (43, 'AAA', 'ECON222', 'lecture', 'Tu, Th', '16:15:00', '17:30:00', 'fall', '2018', 6, 3, 'H435'),
       (44, 'BBB', 'ECON222', 'lecture', 'Tu, Th', '8:45:00', '10:00:00', 'winter', '2018', 6, 3, 'H420'),
       (45, 'AAA', 'MATH209', 'lecture', 'W, F', '10:15:00', '11:30:00', 'fall', '2018', 13, 5, 'H420'),
       (46, 'BBB', 'MATH209', 'lecture', 'Th', '19:00:00', '22:30:00', 'winter', '2018', 47, 10, 'H520'),
       (47, 'CCC', 'MATH209', 'lecture', 'W, F', '11:45:00', '13:15:00', 'summer', '2018', 13, 12, 'H435'),
       (48, 'AAA', 'ENGL233', 'lecture', 'Tu, Th', '8:45:00', '10:00:00', 'winter', '2018', 43, 13, 'H520'),
       (49, 'BBB', 'ENGL233', 'lecture', 'W, F', '13:45:00', '15:00:00', 'fall', '2018', 43, 13, 'H435'),
       (50, 'AAA', 'PSYC255', 'lecture', 'M, W', '14:00:00', '16:30:00', 'summer', '2018', 10, 6, 'H420'),
       (51, 'AAA', 'PHYS334', 'lecture', 'W, F', '12:45:00', '14:00:00', 'winter', '2018', 45, 9, 'H520'),
       (52, 'AAT', 'PHYS334', 'tutorial', 'W', '10:00:00', '10:50:00', 'winter', '2018', 44, 9, 'H505'),
       (53, 'AAL', 'PHYS393', 'lab', 'Th', '14:30', '17:30:00', 'winter', '2018', 44, 9, 'H907'),
       (54, 'QQQ', 'COMP352', 'lecture', 'W, F', '14:45:00', '17:30:00', 'summer', '2017', 32, 2, 'H520'),
       (55, 'QQTX', 'COMP352', 'tutorial', 'Tu', '8:45:00', '9:30:00', 'fall', '2017', 32, 2, 'H609'),
       (56, 'QQQ', 'ELEC331', 'lecture', 'M, W', '13:15:00', '14:30:00', 'winter', '2017', 33, 8, 'FGB90'),
       (57, 'QQT', 'ELEC331', 'tutorial', 'M', '10:15:00', '12:05:00', 'winter', '2017', 33, 8, 'H405'),
       (58, 'QQL', 'ELEC331', 'lab', 'Tu', '16:00:00', '18:30:00', 'winter', '2017', 4, 8, 'H903'),
       (59, 'QQQ', 'SOEN341', 'lecture', 'W, F', '8:45:00', '10:00:00', 'winter', '2017', 36, 7, 'FGC80'),
       (60, 'QQTX', 'SOEN341', 'tutorial', 'F', '12:00:00', '12:50:00', 'winter', '2017', 36, 7, 'JMB321');


INSERT INTO Requisites
VALUES ('COMP353', 'COMP352', 'prerequisite'),
       ('SOEN341', 'COMP352', 'prerequisite'),
       ('SOEN342', 'SOEN341', 'prerequisite'),
       ('SOEN343', 'SOEN341', 'prerequisite'),
       ('SOEN343', 'SOEN342', 'corequisite'),
       ('COEN345', 'SOEN341', 'prerequisite'),
       ('COEN345', 'ELEC331', 'prerequisite'),
       ('ECON222', 'ECON221', 'prerequisite'),
       ('PHYS393', 'PHYS334', 'corequisite');


INSERT INTO SectionEnrollment VALUE (41, 2, 'C+');
INSERT INTO SectionEnrollment VALUE (45, 2, 'A-');
INSERT INTO SectionEnrollment VALUE (48, 2, 'B');
INSERT INTO SectionEnrollment VALUE (12, 1, 'B+');
INSERT INTO SectionEnrollment VALUE (15, 1, 'B+');
INSERT INTO SectionEnrollment VALUE (2, 1, 'FNS');
INSERT INTO SectionEnrollment VALUE (5, 1, 'FNS');
INSERT INTO SectionEnrollment VALUE (10, 1, 'FNS');
INSERT INTO SectionEnrollment VALUE (3, 1, 'B');
INSERT INTO SectionEnrollment VALUE (7, 1, 'B');
INSERT INTO SectionEnrollment VALUE (11, 1, 'B');
INSERT INTO SectionEnrollment VALUE (34, 3, 'C-');
INSERT INTO SectionEnrollment VALUE (35, 3, 'C-');
INSERT INTO SectionEnrollment VALUE (36, 3, 'C-');
INSERT INTO SectionEnrollment VALUE (54, 4, 'B+');
INSERT INTO SectionEnrollment VALUE (55, 4, 'B+');
INSERT INTO SectionEnrollment VALUE (56, 4, 'B');
INSERT INTO SectionEnrollment VALUE (57, 4, 'B');
INSERT INTO SectionEnrollment VALUE (58, 4, 'B');
INSERT INTO SectionEnrollment VALUE (59, 4, 'B+');
INSERT INTO SectionEnrollment VALUE (60, 4, 'B+');
INSERT INTO SectionEnrollment VALUE (30, 4, 'A');
INSERT INTO SectionEnrollment VALUE (31, 4, 'A');
INSERT INTO SectionEnrollment VALUE (33, 4, 'A');
INSERT INTO SectionEnrollment VALUE (54, 5, 'C+');
INSERT INTO SectionEnrollment VALUE (55, 5, 'C+');
INSERT INTO SectionEnrollment VALUE (21, 5, 'B+');
INSERT INTO SectionEnrollment VALUE (22, 5, 'B+');
INSERT INTO SectionEnrollment VALUE (24, 5, 'A');
INSERT INTO SectionEnrollment VALUE (25, 5, 'A');
INSERT INTO SectionEnrollment VALUE (27, 5, 'A-');
INSERT INTO SectionEnrollment VALUE (28, 5, 'A-');
INSERT INTO SectionEnrollment VALUE (13, 6, 'B');
INSERT INTO SectionEnrollment VALUE (17, 6, 'B');
INSERT INTO SectionEnrollment VALUE (3, 6, 'B-');
INSERT INTO SectionEnrollment VALUE (7, 6, 'B-');
INSERT INTO SectionEnrollment VALUE (11, 6, 'B-');
INSERT INTO SectionEnrollment VALUE (14, 7, 'A+');
INSERT INTO SectionEnrollment VALUE (20, 7, 'A+');
INSERT INTO SectionEnrollment VALUE (41, 8, 'A-');
INSERT INTO SectionEnrollment VALUE (44, 8, 'A-');
INSERT INTO SectionEnrollment VALUE (54, 9, 'B-');
INSERT INTO SectionEnrollment VALUE (55, 9, 'B-');
INSERT INTO SectionEnrollment VALUE (2, 9, 'B+');
INSERT INTO SectionEnrollment VALUE (5, 9, 'B+');
INSERT INTO SectionEnrollment VALUE (10, 9, 'B+');
INSERT INTO SectionEnrollment VALUE (21, 9, 'A');
INSERT INTO SectionEnrollment VALUE (23, 9, 'A');
INSERT INTO SectionEnrollment VALUE (45, 10, 'A-');
INSERT INTO SectionEnrollment VALUE (45, 11, 'A');
INSERT INTO SectionEnrollment VALUE (51, 11, 'A+');
INSERT INTO SectionEnrollment VALUE (52, 11, 'A+');
INSERT INTO SectionEnrollment VALUE (53, 11, 'A+');
INSERT INTO SectionEnrollment VALUE (54, 12, 'B-');
INSERT INTO SectionEnrollment VALUE (55, 12, 'B-');
INSERT INTO SectionEnrollment VALUE (56, 12, 'A');
INSERT INTO SectionEnrollment VALUE (57, 12, 'A');
INSERT INTO SectionEnrollment VALUE (58, 12, 'A');
INSERT INTO SectionEnrollment VALUE (59, 12, 'B');
INSERT INTO SectionEnrollment VALUE (60, 12, 'B');
INSERT INTO SectionEnrollment VALUE (51, 13, 'C+');
INSERT INTO SectionEnrollment VALUE (52, 13, 'C+');
INSERT INTO SectionEnrollment VALUE (54, 14, 'C');
INSERT INTO SectionEnrollment VALUE (55, 14, 'C');
INSERT INTO SectionEnrollment VALUE (56, 14, 'C');
INSERT INTO SectionEnrollment VALUE (57, 14, 'C');
INSERT INTO SectionEnrollment VALUE (58, 14, 'C');
INSERT INTO SectionEnrollment VALUE (59, 14, 'A');
INSERT INTO SectionEnrollment VALUE (60, 14, 'A');
INSERT INTO SectionEnrollment VALUE (30, 14, 'B+');
INSERT INTO SectionEnrollment VALUE (31, 14, 'B+');
INSERT INTO SectionEnrollment VALUE (33, 14, 'B+');
INSERT INTO SectionEnrollment VALUE (39, 15, 'B');
INSERT INTO SectionEnrollment VALUE (40, 15, 'B');
INSERT INTO SectionEnrollment VALUE (12, 16, 'A+');
INSERT INTO SectionEnrollment VALUE (15, 16, 'A+');
INSERT INTO SectionEnrollment VALUE (3, 16, 'B');
INSERT INTO SectionEnrollment VALUE (8, 16, 'B');
INSERT INTO SectionEnrollment VALUE (11, 16, 'B');
INSERT INTO SectionEnrollment VALUE (50, 17, 'C');
INSERT INTO SectionEnrollment VALUE (42, 18, 'B+');
INSERT INTO SectionEnrollment VALUE (48, 18, 'B');
INSERT INTO SectionEnrollment VALUE (46, 19, 'B+');
INSERT INTO SectionEnrollment VALUE (39, 20, 'A');
INSERT INTO SectionEnrollment VALUE (40, 20, 'A');
INSERT INTO SectionEnrollment VALUE (54, 21, 'A-');
INSERT INTO SectionEnrollment VALUE (55, 21, 'A-');
INSERT INTO SectionEnrollment VALUE (21, 21, 'B');
INSERT INTO SectionEnrollment VALUE (22, 21, 'B');
INSERT INTO SectionEnrollment VALUE (24, 21, 'A-');
INSERT INTO SectionEnrollment VALUE (25, 21, 'A-');
INSERT INTO SectionEnrollment VALUE (27, 21, 'A-');
INSERT INTO SectionEnrollment VALUE (28, 21, 'A-');
INSERT INTO SectionEnrollment VALUE (54, 22, 'B-');
INSERT INTO SectionEnrollment VALUE (55, 22, 'B-');
INSERT INTO SectionEnrollment VALUE (2, 22, 'B');
INSERT INTO SectionEnrollment VALUE (6, 22, 'B');
INSERT INTO SectionEnrollment VALUE (10, 22, 'B');
INSERT INTO SectionEnrollment VALUE (45, 23, 'A+');
INSERT INTO SectionEnrollment VALUE (12, 24, 'A');
INSERT INTO SectionEnrollment VALUE (15, 24, 'A');
INSERT INTO SectionEnrollment VALUE (2, 24, 'C+');
INSERT INTO SectionEnrollment VALUE (5, 24, 'C+');
INSERT INTO SectionEnrollment VALUE (10, 24, 'C+');
INSERT INTO SectionEnrollment VALUE (12, 25, 'B');
INSERT INTO SectionEnrollment VALUE (15, 25, 'B');
INSERT INTO SectionEnrollment VALUE (3, 25, 'B+');
INSERT INTO SectionEnrollment VALUE (8, 25, 'B+');
INSERT INTO SectionEnrollment VALUE (11, 25, 'B+');
INSERT INTO SectionEnrollment VALUE (54, 26, 'C+');
INSERT INTO SectionEnrollment VALUE (55, 26, 'C+');
INSERT INTO SectionEnrollment VALUE (21, 26, 'A');
INSERT INTO SectionEnrollment VALUE (22, 26, 'A');
INSERT INTO SectionEnrollment VALUE (24, 26, 'A-');
INSERT INTO SectionEnrollment VALUE (25, 26, 'A-');
INSERT INTO SectionEnrollment VALUE (27, 26, 'A');
INSERT INTO SectionEnrollment VALUE (28, 26, 'A');
INSERT INTO SectionEnrollment VALUE (34, 27, 'B+');
INSERT INTO SectionEnrollment VALUE (35, 27, 'B+');
INSERT INTO SectionEnrollment VALUE (36, 27, 'B+');
INSERT INTO SectionEnrollment VALUE (54, 28, 'A');
INSERT INTO SectionEnrollment VALUE (55, 28, 'A');
INSERT INTO SectionEnrollment VALUE (1, 28, 'A-');
INSERT INTO SectionEnrollment VALUE (4, 28, 'A-');
INSERT INTO SectionEnrollment VALUE (9, 28, 'A-');
INSERT INTO SectionEnrollment VALUE (12, 29, 'A+');
INSERT INTO SectionEnrollment VALUE (15, 29, 'A+');
INSERT INTO SectionEnrollment VALUE (3, 29, 'C');
INSERT INTO SectionEnrollment VALUE (7, 29, 'C');
INSERT INTO SectionEnrollment VALUE (11, 29, 'C');
INSERT INTO SectionEnrollment VALUE (48, 30, 'B+');
INSERT INTO SectionEnrollment VALUE (54, 31, 'B');
INSERT INTO SectionEnrollment VALUE (55, 31, 'B');
INSERT INTO SectionEnrollment VALUE (1, 31, 'A');
INSERT INTO SectionEnrollment VALUE (4, 31, 'A');
INSERT INTO SectionEnrollment VALUE (9, 31, 'A');
INSERT INTO SectionEnrollment VALUE (54, 32, 'B+');
INSERT INTO SectionEnrollment VALUE (55, 32, 'B+');
INSERT INTO SectionEnrollment VALUE (1, 32, 'B+');
INSERT INTO SectionEnrollment VALUE (4, 32, 'B+');
INSERT INTO SectionEnrollment VALUE (9, 32, 'B+');
INSERT INTO SectionEnrollment VALUE (12, 33, 'B+');
INSERT INTO SectionEnrollment VALUE (15, 33, 'B+');
INSERT INTO SectionEnrollment VALUE (2, 33, 'C-');
INSERT INTO SectionEnrollment VALUE (5, 33, 'C-');
INSERT INTO SectionEnrollment VALUE (10, 33, 'C-');
INSERT INTO SectionEnrollment VALUE (54, 34, 'A');
INSERT INTO SectionEnrollment VALUE (55, 34, 'A');
INSERT INTO SectionEnrollment VALUE (56, 34, 'A-');
INSERT INTO SectionEnrollment VALUE (57, 34, 'A-');
INSERT INTO SectionEnrollment VALUE (58, 34, 'A-');
INSERT INTO SectionEnrollment VALUE (59, 34, 'B');
INSERT INTO SectionEnrollment VALUE (60, 34, 'B');
INSERT INTO SectionEnrollment VALUE (30, 34, 'B');
INSERT INTO SectionEnrollment VALUE (32, 34, 'B');
INSERT INTO SectionEnrollment VALUE (33, 34, 'B');
INSERT INTO SectionEnrollment VALUE (54, 35, 'A-');
INSERT INTO SectionEnrollment VALUE (55, 35, 'A-');
INSERT INTO SectionEnrollment VALUE (56, 35, 'C-');
INSERT INTO SectionEnrollment VALUE (57, 35, 'C-');
INSERT INTO SectionEnrollment VALUE (58, 35, 'C-');
INSERT INTO SectionEnrollment VALUE (59, 35, 'B+');
INSERT INTO SectionEnrollment VALUE (60, 35, 'B+');
INSERT INTO SectionEnrollment VALUE (30, 35, 'C+');
INSERT INTO SectionEnrollment VALUE (31, 35, 'C+');
INSERT INTO SectionEnrollment VALUE (33, 35, 'C+');
INSERT INTO SectionEnrollment VALUE (54, 36, 'A-');
INSERT INTO SectionEnrollment VALUE (55, 36, 'A-');
INSERT INTO SectionEnrollment VALUE (21, 36, 'C');
INSERT INTO SectionEnrollment VALUE (22, 36, 'C');
INSERT INTO SectionEnrollment VALUE (24, 36, 'B');
INSERT INTO SectionEnrollment VALUE (25, 36, 'B');
INSERT INTO SectionEnrollment VALUE (27, 36, 'B');
INSERT INTO SectionEnrollment VALUE (28, 36, 'B');
INSERT INTO SectionEnrollment VALUE (54, 37, 'B-');
INSERT INTO SectionEnrollment VALUE (55, 37, 'B-');
INSERT INTO SectionEnrollment VALUE (2, 37, 'A+');
INSERT INTO SectionEnrollment VALUE (6, 37, 'A+');
INSERT INTO SectionEnrollment VALUE (10, 37, 'A+');
INSERT INTO SectionEnrollment VALUE (54, 38, 'A+');
INSERT INTO SectionEnrollment VALUE (55, 38, 'A+');
INSERT INTO SectionEnrollment VALUE (2, 38, 'A-');
INSERT INTO SectionEnrollment VALUE (7, 38, 'A-');
INSERT INTO SectionEnrollment VALUE (10, 38, 'A-');
INSERT INTO SectionEnrollment VALUE (54, 39, 'B');
INSERT INTO SectionEnrollment VALUE (55, 39, 'B');
INSERT INTO SectionEnrollment VALUE (56, 39, 'A');
INSERT INTO SectionEnrollment VALUE (57, 39, 'A');
INSERT INTO SectionEnrollment VALUE (58, 39, 'A');
INSERT INTO SectionEnrollment VALUE (59, 39, 'C+');
INSERT INTO SectionEnrollment VALUE (60, 39, 'C+');
INSERT INTO SectionEnrollment VALUE (30, 39, 'B+');
INSERT INTO SectionEnrollment VALUE (31, 39, 'B+');
INSERT INTO SectionEnrollment VALUE (33, 39, 'B+');
INSERT INTO SectionEnrollment VALUE (54, 40, 'B');
INSERT INTO SectionEnrollment VALUE (55, 40, 'B');
INSERT INTO SectionEnrollment VALUE (1, 40, 'B-');
INSERT INTO SectionEnrollment VALUE (4, 40, 'B-');
INSERT INTO SectionEnrollment VALUE (9, 40, 'B-');
INSERT INTO SectionEnrollment VALUE (34, 41, 'B');
INSERT INTO SectionEnrollment VALUE (35, 41, 'B');
INSERT INTO SectionEnrollment VALUE (36, 41, 'B');
INSERT INTO SectionEnrollment VALUE (41, 42, 'B+');
INSERT INTO SectionEnrollment VALUE (44, 42, 'A-');
INSERT INTO SectionEnrollment VALUE (50, 43, 'B');
INSERT INTO SectionEnrollment VALUE (39, 44, 'A-');
INSERT INTO SectionEnrollment VALUE (40, 44, 'A-');
INSERT INTO SectionEnrollment VALUE (54, 45, 'B');
INSERT INTO SectionEnrollment VALUE (55, 45, 'B');
INSERT INTO SectionEnrollment VALUE (56, 45, 'C+');
INSERT INTO SectionEnrollment VALUE (57, 45, 'C+');
INSERT INTO SectionEnrollment VALUE (58, 45, 'C+');
INSERT INTO SectionEnrollment VALUE (59, 45, 'B');
INSERT INTO SectionEnrollment VALUE (60, 45, 'B');
INSERT INTO SectionEnrollment VALUE (30, 45, 'C');
INSERT INTO SectionEnrollment VALUE (32, 45, 'C');
INSERT INTO SectionEnrollment VALUE (33, 45, 'C');
INSERT INTO SectionEnrollment VALUE (51, 46, 'A');
INSERT INTO SectionEnrollment VALUE (52, 46, 'A');
INSERT INTO SectionEnrollment VALUE (53, 46, 'B-');
INSERT INTO SectionEnrollment VALUE (54, 47, 'B-');
INSERT INTO SectionEnrollment VALUE (55, 47, 'B-');
INSERT INTO SectionEnrollment VALUE (2, 47, 'A-');
INSERT INTO SectionEnrollment VALUE (7, 47, 'A-');
INSERT INTO SectionEnrollment VALUE (10, 47, 'A-');
INSERT INTO SectionEnrollment VALUE (12, 48, 'A-');
INSERT INTO SectionEnrollment VALUE (15, 48, 'A-');
INSERT INTO SectionEnrollment VALUE (2, 48, 'B');
INSERT INTO SectionEnrollment VALUE (5, 48, 'B');
INSERT INTO SectionEnrollment VALUE (10, 48, 'B');
INSERT INTO SectionEnrollment VALUE (54, 49, 'B+');
INSERT INTO SectionEnrollment VALUE (55, 49, 'B+');
INSERT INTO SectionEnrollment VALUE (56, 49, 'A');
INSERT INTO SectionEnrollment VALUE (57, 49, 'A');
INSERT INTO SectionEnrollment VALUE (58, 49, 'A');
INSERT INTO SectionEnrollment VALUE (59, 49, 'B');
INSERT INTO SectionEnrollment VALUE (60, 49, 'B');
INSERT INTO SectionEnrollment VALUE (30, 49, 'B+');
INSERT INTO SectionEnrollment VALUE (32, 49, 'B+');
INSERT INTO SectionEnrollment VALUE (33, 49, 'B+');

INSER INTO Building VALUE('H','Henry F. Hall Building',200,100,12,'SGW')
