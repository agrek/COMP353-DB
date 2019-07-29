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
VALUES (1, 'Computer Engineering', 226130537),
       (2, 'Physics', 575933767),
       (3, 'Computer Science', 254156867),
       (4, 'Software Engineering', 842440083),
       (5, 'Chemistry', 330264593),
       (6, 'English', 477887758),
       (7, 'Electrical Engineering', 817794537),
       (8, 'Mathematics', 415879768),
       (9, 'Economics', 394025466),
       (10, 'Psychology', 472665242),
       (11, 'General Engineering', NULL);



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

/* 1-50 are students, 51-63 are instructors, 64-73 are advisors*/
INSERT INTO Person(ssn,id,first_name,last_name,email) VALUES
 (399437700,1,'Lisa','Wood','mddallara@outlook.com')
,(889993771,2,'Amber','Cooper','dinther@verizon.net')
,(779332036,3,'Oscar','Howell','jlbaumga@verizon.net')
,(245007722,4,'Irvin','Collins','bflong@gmail.com')
,(645399011,5,'Roosevelt','Parsons','nighthawk@aol.com')
,(445761402,6,'Eugene','Greer','kimvette@aol.com')
,(616004712,7,'Gwen','Dunn','trygstad@me.com')
,(223680290,8,'Laurence','Mack','keijser@me.com')
,(453920929,9,'Sheldon','Walsh','mhouston@msn.com')
,(146344051,10,'Brandy','Harmon','michiel@yahoo.com')
,(157682678,11,'Jason','Bush','penna@yahoo.ca')
,(448602365,12,'Faith','Rhodes','evans@comcast.net')
,(309348312,13,'Victoria','Anderson','emmanuel@outlook.com')
,(635775881,14,'Chad','Mcgee','thaljef@yahoo.ca')
,(563383616,15,'Lauren','Singleton','mwitte@outlook.com')
,(891468783,16,'Joy','Cook','boser@yahoo.ca')
,(610091459,17,'Donnie','Lyons','thrymm@aol.com')
,(108906305,18,'Darla','Warren','stevelim@icloud.com')
,(667004396,19,'David','Goodwin','camenisch@gmail.com')
,(752713919,20,'Neil','Vargas','jipsen@outlook.com')
,(882108144,21,'Tracey','Reese','martyloo@verizon.net')
,(809493224,22,'Maryann','Valdez','jorgb@yahoo.ca')
,(814392875,23,'Henrietta','Daniels','chrisj@sbcglobal.net')
,(426299656,24,'Arlene','Ellis','dawnsong@icloud.com')
,(357320964,25,'Theodore','Adkins','thomasj@yahoo.ca')
,(881132104,26,'Bryan','Ballard','morain@verizon.net')
,(508203017,27,'Carrie','Castillo','dbanarse@optonline.net')
,(907806961,28,'Sean','Cobb','reziac@sbcglobal.net')
,(656597000,29,'Pat','Mccarthy','sisyphus@msn.com')
,(477176451,30,'Shelly','Boone','smpeters@outlook.com')
,(964663021,31,'Darin','Manning','darin@comcast.net')
,(249691790,32,'Guadalupe','Peters','nanop@yahoo.com')
,(665452486,33,'Isaac','Norman','mhouston@comcast.net')
,(481996433,34,'Jermaine','Carlson','cumarana@hotmail.com')
,(786482339,35,'Larry','Johnston','keijser@yahoo.com')
,(927819640,36,'Jim','Schmidt','juerd@outlook.com')
,(867304329,37,'Hilda','Fields','fallorn@me.com')
,(195238750,38,'Loretta','Rogers','tromey@sbcglobal.net')
,(934347739,39,'Eleanor','Mathis','tokuhirom@verizon.net')
,(246771994,40,'Ryan','Ward','treit@optonline.net')
,(403876313,41,'Velma','Ramsey','hikoza@hotmail.com')
,(683192608,42,'Emilio','Ryan','adillon@live.com')
,(635804780,43,'Percy','Garcia','nighthawk@optonline.net')
,(177921799,44,'William','Silva','amimojo@verizon.net')
,(965277745,45,'Alfredo','Tyler','haddawy@yahoo.com')
,(406932598,46,'Jill','Quinn','sisyphus@outlook.com')
,(204794691,47,'Bradley','Carr','ryanshaw@mac.com')
,(293904265,48,'Herbert','Paul','novanet@comcast.net')
,(373307205,49,'Katherine','Nichols','ehood@icloud.com')
,(295600928,50,'Nelson','Gregory','dieman@verizon.net')
,(254156867,51,'Mildred','Austin','tubesteak@msn.com')
,(803179891,52,'Raymond','Moreno','floxy@gmail.com')
,(394025466,53,'Phillip','Chapman','bjoern@sbcglobal.net')
,(226130537,54,'Sam','Ruiz','dkeeler@outlook.com')
,(206289429,55,'Alison','Hicks','eurohack@yahoo.com')
,(472665242,56,'Ivan','Shelton','khris@msn.com')
,(842440083,57,'Muriel','Fleming','rfisher@msn.com')
,(747652718,58,'Nadine','Wade','kosact@aol.com')
,(575933767,59,'Michael','Clarke','mavilar@sbcglobal.net')
,(415879768,60,'Bobby','Clayton','janusfury@mac.com')
,(330264593,61,'Greg','Horton','kourai@gmail.com')
,(817794537,62,'Simon','Gonzalez','simone@optonline.net')
,(477887758,63,'Lynn','Griffin','msloan@yahoo.ca')
,(772846507,64,'Cheryl','Wilson','milton@gmail.com')
,(332012250,65,'Erica','Ferguson','monkeydo@me.com')
,(502405693,66,'Hugh','Vaughn','arebenti@outlook.com')
,(813718676,67,'Geneva','Morgan','benanov@yahoo.ca')
,(565829795,68,'Eric','Mckenzie','anicolao@yahoo.ca')
,(904560284,69,'Shawna','Zimmerman','gozer@icloud.com')
,(430977343,70,'Annette','Ramirez','maratb@hotmail.com')
,(195731807,71,'Irving','Goodman','rtanter@yahoo.ca')
,(269828604,72,'Mathew','Glover','wiseb@outlook.com')
,(195310678,73,'Johnny','Bryant','skajan@gmail.com');;

INSERT INTO Student(ssn) VALUES
 (399437700) -- 1
,(889993771)
,(779332036)
,(245007722)
,(645399011) -- 5
,(445761402)
,(616004712)
,(223680290)
,(453920929)
,(146344051) -- 10
,(157682678)
,(448602365)
,(309348312)
,(635775881)
,(563383616) -- 15
,(891468783)
,(610091459)
,(108906305)
,(667004396)
,(752713919) -- 20
,(882108144)
,(809493224)
,(814392875)
,(426299656)
,(357320964) -- 25
,(881132104)
,(508203017)
,(907806961)
,(656597000)
,(477176451) -- 30
,(964663021)
,(249691790)
,(665452486)
,(481996433)
,(786482339) -- 35
,(927819640)
,(867304329)
,(195238750)
,(934347739)
,(246771994) -- 40
,(403876313)
,(683192608)
,(635804780)
,(177921799)
,(965277745) -- 45
,(406932598)
,(204794691)
,(293904265)
,(373307205)
,(295600928); -- 50



INSERT INTO Instructor
VALUES (254156867 ,3, 1), /* 1 - 51 */
       (803179891 ,3, 1), /* 2 - 52 */
       (394025466 ,9, 1), /* 3 - 53 */
       (226130537, 1, 0), /* 4 - 54 */
       (206289429, 8, 1), /* 5 - 55 */
       (472665242, 10, 1), /* 6 - 56 */
       (842440083, 4, 1), /* 7 - 57 */
       (747652718, 7, 0), /* 8 - 58 */
       (575933767, 2, 0), /* 9 - 59 */
       (415879768, 8, 1), /* 10 - 60 */
       (330264593, 5, 1), /* 11 - 61 */
       (817794537, 7, 1), /* 12 - 62 */
       (477887758, 6, 1); /* 13 - 63 */

INSERT INTO Advisor(ssn) VALUES
 (772846507) /* 1 - 64 */
,(332012250)
,(502405693)
,(813718676)
,(565829795)
,(904560284)
,(430977343)
,(195731807)
,(269828604)
,(195310678); /* 10 - 73 */


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

INSERT INTO Campus('LOY','Loyola'),
('SGW','Sir George Williams');

INSERT INTO Building VALUE('H','Henry F. Hall Building',200,100,12,'SGW'),
('EV','Engineering, Computer Science and Visual Arts Integrated Complex',300,50,15,'SGW'),
('VA','Visual Arts Building',25,0,5,'SGW'),
('B','B Annex',30,10,3,'SGW'),
('CI','CI Annex',19,0,3,'SGW'),
('CL','CL Annex',49,3,3,'SGW'),
('D','D Annex',10,6,1),
('EN','EN Annex',56,0,6,'SGW'),
('FA','FA Annex',10,10,3,'SGW'),
('FB','Faubourg Building',50,0,6,'SGW'),
('FG','Faubourg Ste-Catherine Building',35,0,5,'SGW'),
('GA','Grey Nuns Annex',10,10,4,'SGW'),
('GM','Guy De Maisonneuve Building',16,0,8,'SGW'),
('GN','Grey Nuns Building',30,0,4,'SGW'),
('K','K Annex',10,38,4,'SGW'),
('LB','J.W. McConnell Building',10,5,3,'SGW'),
('M','M Annex',10,6,3,'SGW'),
('MB','John Molson Building',100,45,15,'SGW'),
('AD','Administration Building',10,0,5,'LOY'),
('BB','BB Annex',10,4,5,'LOY'),
('HA','Hingston Hall, Wing HA',46,23,5,'LOY'),
('SH','Solar House',7,4,5,'LOY'),
('PC','Performing Centre',1,0,2,'LOY'),
('CC','Central Building',133,0,3,'LOY'),
('TA','Terrebonne Building',44,0,4,'LOY'),
('RA','Recreational and Complex Building',34,6,3,'LOY'),
('HC','Hingston Hall, Wing HC',45,4,4,'LOY'),
('FC','F.C. Smith Building',34,4,4,'LOY');

INSERT INTO Room('H','lab',20,900),
('H','lab',20,900),
('H','lab',20,901),
('H','lab',20,903),
('H','lab',20,905),
('H','lab',20,907),
('H','lab',20,909),
('H','lab',20,912),
('H','lab',30,934),
('H','lab',30,935),
('H','lab',30,938),
('H','lab',30,939),
('H','lab',30,940),
('H','lab',30,941),
('H','lab',30,945),
('H','lab',30,955),
('H','class',40,400),
('H','class',40,401),
('H','class',40,402),
('H','class',40,403),
('H','class',40,404),
('H','class',60,405),
('H','class',60,406),
('H','class',60,407),
('H','class',80,408),
('H','class',80,409),
('H','class',120,410),
('H','class',120,420),
('H','class',120,430),
('H','class',40,500),
('H','class',40,501),
('H','class',40,502),
('H','class',40,503),
('H','class',40,504),
('H','class',60,505),
('H','class',60,506),
('H','class',60,507),
('H','class',80,508),
('H','class',80,509),
('H','class',120,510),
('H','class',120,520),
('H','class',120,530),
('H','class',40,600),
('H','class',40,601),
('H','class',40,602),
('H','class',40,603),
('H','class',40,604),
('H','class',60,605),
('H','class',60,606),
('H','class',60,607),
('H','class',80,608),
('H','class',80,609),
('H','class',120,610),
('H','class',120,620),
('H','class',120,630),
('H','class',40,800),
('H','class',40,801),
('H','class',40,802),
('H','class',40,803),
('H','class',40,804),
('H','class',60,805),
('H','class',60,806),
('H','class',60,807),
('H','class',80,808),
('H','class',80,809),
('H','class',120,810),
('H','class',120,820),
('H','class',120,830),
('MB','class',300,230),
('MB','class',200,240),
('MB','class',50,250),
('MB','class',50,260),
('MB','class',70,270),
('MB','class',90,280),
('MB','class',30,290),
('MB','class',60,298),
('MB','class',40,330),
('MB','class',55,340),
('MB','class',55,350),
('MB','class',80,360),
('MB','class',75,370),
('MB','class',45,380),
('MB','class',100,390),
('MB','class',90,398),
('MB','office',1,920),
('MB','office',1,925),
('MB','office',1,930),
('MB','office',1,935),
('MB','office',1,940),
('MB','office',1,945),
('MB','office',1,950),
('MB','office',1,960),
('MB','office',1,1020),
('MB','office',1,1025),
('MB','office',1,1030),
('MB','office',1,1035),
('MB','office',1,1040),
('MB','office',1,1045),
('MB','office',1,1050),
('MB','office',3,1060),
('EV','office',1,321),
('EV','office',1,322),
('EV','office',1,323),
('EV','office',1,324),
('EV','office',1,325),
('EV','office',1,329),
('EV','office',1,330),
('EV','office',3,335),
('EV','office',1,421),
('EV','office',1,422),
('EV','office',1,423),
('EV','office',1,424),
('EV','office',1,425),
('EV','office',1,429),
('EV','office',1,430),
('EV','office',3,435),
('EV','office',1,521),
('EV','office',1,522),
('EV','office',1,523),
('EV','office',1,524),
('EV','office',1,525),
('EV','office',1,529),
('EV','office',1,530),
('EV','office',3,535);




