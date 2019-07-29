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
       (10, 'Psychology' ),
       (11, 'General Engineering');


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

INSERT INTO Address(id,street,city,province,postal_code,apt,civic_number) VALUES
 (1,'Golden Leaf','Thetford-Mines','Québec','G6G1M8',638,321)
,(2,'Birchwood','Lacolle','Québec','E5A2N2',495,133)
,(3,'Grasskamp','Kamsack','Saskatchewan','R2J3N6',485,211)
,(4,'Menomonie','Barraute','Québec','P0M7H8',468,12)
,(5,'Melby','Saint-Rémi','Québec','K1G9K2',246,267)
,(6,'Graceland','Mont-Saint-Hilaire','Québec','J3H9K9',24,87)
,(7,'Pennsylvania','Lac-Brome','Québec','L9G9N2',989,279)
,(8,'Mallard','Richmond','Québec','V6Z8N7',986,140)
,(9,'Bowman','Wabana','Newfoundland and Labrador','V7X1D2',972,214)
,(10,'Dwight','Kamloops','British Columbia','H9P9B2',217,227)
,(11,'Summerview','Neepawa','Manitoba','H3Z8G5',702,390)
,(12,'Eggendart','Burgeo','Newfoundland and Labrador','N9A6H4',910,140)
,(13,'Annamark','Carleton-sur-Mer','Québec','P0T0J8',934,455)
,(14,'Shoshone','Winnipeg','Manitoba','R3L9J8',760,179)
,(15,'Pepper Wood','White City','Saskatchewan','P0W9K8',758,409)
,(16,'Mockingbird','Catalina','Newfoundland and Labrador','B2V6D3',471,191)
,(17,'Rieder','Mirabel','Québec','J5K9D3',978,313)
,(18,'Scoville','Mont-Tremblant','Québec','J8E9H2',912,4)
,(19,'Gerald','Lewisporte','Newfoundland and Labrador','M2K9N2',563,132)
,(20,'Hanson','Biggar','Saskatchewan','N1S9C2',645,144)
,(21,'Melrose','Melville','Saskatchewan','S7W7H3',362,7)
,(22,'Fulton','Meadow Lake','Saskatchewan','S9X9D3',446,301)
,(23,'Carberry','Sainte-Martine','Québec','A1C9D3',417,62)
,(24,'Shopko','Kindersley','Saskatchewan','C1C9H2',489,483)
,(25,'Elmside','Spirit River','Alberta','V2G9H1',975,192)
,(26,'Havey','Waterloo','Québec','V9J0J2',575,9)
,(27,'Elmside','Harrison Brook','New Brunswick','E7E6F2',942,274)
,(28,'Holmberg','Barraute','Québec','P0M6J6',79,61)
,(29,'Lighthouse Bay','Lanigan','Saskatchewan','J7A2D2',286,182)
,(30,'Lindbergh','Morinville','Alberta','T8R6F2',920,159)
,(31,'Bashford','Sainte-Adèle','Québec','J8B8H4',226,171)
,(32,'Elka','Ottawa','Ontario','J8Y8H2',938,89)
,(33,'Superior','Vanderhoof','British Columbia','G9A8D2',544,192)
,(34,'Meadow Valley','Charlemagne','Québec','J6V7G2',737,412)
,(35,'Sugar','Mercier','Québec','J6R8C2',778,154)
,(36,'Pierstorff','Marathon','Ontario','P6A9H2',253,190)
,(37,'Nova','Biggar','Saskatchewan','N1S9F6',650,30)
,(38,'Center','New Glasgow','Nova Scotia','B2H9H2',3,20)
,(39,'Lawn','Montréal-Est','Québec','J4N9H4',662,188)
,(40,'Caliangt','Sainte-Thérèse','Québec','J7G8H7',74,485)
,(41,'Cascade','Sherwood Park','Alberta','T8A1K8',541,438)
,(42,'Ronald Regan','Altona','Manitoba','K1W2M9',846,387)
,(43,'Karstens','Edson','Alberta','T7E7H3',38,93)
,(44,'Scofield','Ferme-Neuve','Québec','V5Y7H2',869,424)
,(45,'Autumn Leaf','Collingwood','Ontario','L9Y9J9',785,126)
,(46,'Golf View','Varennes','Québec','J3X7H5',671,67)
,(47,'Tomscot','Varennes','Québec','J3X9G2',94,292)
,(48,'Arapahoe','Belfast','Prince Edward Island','L6S8H2',415,77)
,(49,'Merry','Ottawa','Ontario','J8Y8D2',494,335)
,(50,'Columbus','Otterburn Park','Québec','L6G8K2',155,335)
,(51,'Marcy','Orillia','Ontario','L3V7F2',524,76)
,(52,'Monica','Taber','Alberta','T1G9F2',353,33)
,(53,'Truax','Saint-Jérôme','Québec','J7Z8G2',761,373)
,(54,'Merchant','Kerrobert','Saskatchewan','T1P9D2',436,125)
,(55,'Eagan','Alberton','Prince Edward Island','P7K9G4',938,120)
,(56,'Golden Leaf','Pangnirtung','Nunavut','M5TH5F',442,228)
,(57,'Michigan','La Sarre','Québec','J9Z8GD',85,105)
,(58,'Columbus','Port Hawkesbury','Nova Scotia','B9A8H5',444,258)
,(59,'Golf','Mont-Tremblant','Québec','J8E3K8',550,146)
,(60,'Logan','Malartic','Québec','X0GJ9D',589,319)
,(61,'Shasta','Okanagan','British Columbia','T0P8G4',211,88)
,(62,'Manitowish','Bassano','Alberta','M5G9F4',582,360)
,(63,'Hazelcrest','Kelowna','British Columbia','V1Y9G4',116,314)
,(64,'Ludington','Pembroke','Ontario','K8B9F2',677,182)
,(65,'Annamark','Sainte-Anne-de-Bellevue','Québec','H9X8G2',979,488)
,(66,'Arkansas','Hudson','Québec','J0NF2F',715,365)
,(67,'Morning','Saint-Sauveur','Québec','J0R8H8',57,207)
,(68,'Lerdahl','Conception Bay South','Newfoundland and Labrador','A1X9U9',754,90)
,(69,'Warbler','Bécancour','Québec','G9H7G2',649,430)
,(70,'Fremont','Rayside-Balfour','Ontario','G9THI2',570,248)
,(71,'Vermont','Lachute','Québec','J8H75E',888,257)
,(72,'Carberry','Kirkland','Québec','H9JH9H',641,370)
,(73,'Main Street','Montreal','Québec','H8K1M9',875,932);

INSERT INTO Campus VALUES('LOY','Loyola'),
('SGW','Sir George Williams');

INSERT INTO Building VALUES('H','Henry F. Hall Building',200,100,12,'SGW'),
('EV','Engineering, Computer Science and Visual Arts Integrated Complex',300,50,15,'SGW'),
('VA','Visual Arts Building',25,0,5,'SGW'),
('B','B Annex',30,10,3,'SGW'),
('CI','CI Annex',19,0,3,'SGW'),
('CL','CL Annex',49,3,3,'SGW'),
('D','D Annex',10,6,1,'SGW'),
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

INSERT INTO Room(building_abbreviation,type,capacity,room_floor,room_number) VALUES ('H','lab',20,900,906),
('H','lab',20,9,900),
('H','lab',20,9,901),
('H','lab',20,9,903),
('H','lab',20,9,905),
('H','lab',20,9,907),
('H','lab',20,9,909),
('H','lab',20,9,912),
('H','lab',30,9,934),
('H','lab',30,9,935),
('H','lab',30,9,938),
('H','lab',30,9,939),
('H','lab',30,9,940),
('H','lab',30,9,941),
('H','lab',30,9,945),
('H','lab',30,9,955),
('H','class',40,4,400),
('H','class',40,4,401),
('H','class',40,4,402),
('H','class',40,4,403),
('H','class',40,4,404),
('H','class',60,4,405),
('H','class',60,4,406),
('H','class',60,4,407),
('H','class',80,4,408),
('H','class',80,4,409),
('H','class',120,4,410),
('H','class',120,4,420),
('H','class',120,4,430),
('H','class',120,4,435),
('H','class',40,5,500),
('H','class',40,5,501),
('H','class',40,5,502),
('H','class',40,5,503),
('H','class',40,5,504),
('H','class',60,5,505),
('H','class',60,5,506),
('H','class',60,5,507),
('H','class',80,5,508),
('H','class',80,5,509),
('H','class',120,5,510),
('H','class',120,5,520),
('H','class',120,5,530),
('H','class',120,5,535),
('H','class',40,6,600),
('H','class',40,6,601),
('H','class',40,6,602),
('H','class',40,6,603),
('H','class',40,6,604),
('H','class',60,6,605),
('H','class',60,6,606),
('H','class',60,6,607),
('H','class',80,6,608),
('H','class',80,6,609),
('H','class',120,6,610),
('H','class',120,6,620),
('H','class',120,6,630),
('H','class',40,8,800),
('H','class',40,8,801),
('H','class',40,8,802),
('H','class',40,8,803),
('H','class',40,8,804),
('H','class',60,8,805),
('H','class',60,8,806),
('H','class',60,8,807),
('H','class',80,8,808),
('H','class',80,8,809),
('H','class',120,8,810),
('H','class',120,8,820),
('H','class',120,8,830),
('MB','class',300,2,230),
('MB','class',200,2,240),
('MB','class',50,2,250),
('MB','class',50,2,260),
('MB','class',70,2,270),
('MB','class',90,2,280),
('MB','class',30,2,290),
('MB','class',60,2,298),
('MB','class',40,3,330),
('MB','class',40,3,321),
('MB','class',55,3,340),
('MB','class',55,3,350),
('MB','class',80,3,360),
('MB','class',75,3,370),
('MB','class',45,3,380),
('MB','class',100,3,390),
('MB','class',90,3,398),
('FG','class',100,-3,80),
('MB','office',1,9,920),
('MB','office',1,9,925),
('MB','office',1,9,930),
('MB','office',1,9,935),
('MB','office',1,9,940),
('MB','office',1,9,945),
('MB','office',1,9,950),
('MB','office',1,9,960),
('MB','office',1,10,1020),
('MB','office',1,10,1025),
('MB','office',1,10,1030),
('MB','office',1,10,1035),
('MB','office',1,10,1040),
('MB','office',1,10,1045),
('MB','office',1,10,1050),
('MB','office',3,10,1060),
('EV','office',1,3,321),
('EV','office',1,3,322),
('EV','office',1,3,323),
('EV','office',1,3,324),
('EV','office',1,3,325),
('EV','office',1,3,329),
('EV','office',1,3,330),
('EV','office',3,3,335),
('EV','office',1,4,421),
('EV','office',1,4,422),
('EV','office',1,4,423),
('EV','office',1,4,424),
('EV','office',1,4,425),
('EV','office',1,4,429),
('EV','office',1,4,430),
('EV','office',3,4,435),
('EV','office',1,5,521),
('EV','office',1,5,522),
('EV','office',1,5,523),
('EV','office',1,5,524),
('EV','office',1,5,525),
('EV','office',1,5,529),
('EV','office',1,5,530),
('EV','office',3,5,535);


INSERT INTO RoomOverhead VALUES(1 ,'projector'),
(2 ,'computers');

INSERT INTO RoomNeeds VALUES('H',9,940,20,2),
('H',9,900,20,2),
('H',9,901,20,2),
('H',9,903,20,2),
('H',9,905,20,2),
('H',9,900,1,1),
('H',9,901,1,1),
('H',9,903,1,1),
('H',9,905,1,1),
('EV',5,521,1,2),
('EV',5,522,1,2),
('EV',5,523,1,2),
('EV',5,524,1,2),
('EV',5,525,1,2),
('EV',5,529,1,2),
('EV',5,530,1,2),
('EV',5,535,1,2),
('MB',10,1025,1,2),
('MB',10,1060,1,2);

/* 1-50 are students, 51-63 are instructors, 64-73 are advisors*/
INSERT INTO Person(ssn,id,first_name,last_name,email,address,phone)
VALUES (399437700,1,'Lisa','Wood','mddallara@outlook.com',1,'(403) 514-9924')
,(889993771,2,'Amber','Cooper','dinther@verizon.net',2,'(592) 897-0202')
,(779332036,3,'Oscar','Howell','jlbaumga@verizon.net',3,'(350) 923-6398')
,(245007722,4,'Irvin','Collins','bflong@gmail.com',4,'(830) 292-9556')
,(645399011,5,'Roosevelt','Parsons','nighthawk@aol.com',5,'(922) 438-2495')
,(445761402,6,'Eugene','Greer','kimvette@aol.com',6,'(448) 202-4787')
,(616004712,7,'Gwen','Dunn','trygstad@me.com',7,'(465) 977-5315')
,(223680290,8,'Laurence','Mack','keijser@me.com',8,'(641) 479-9069')
,(453920929,9,'Sheldon','Walsh','mhouston@msn.com',9,'(786) 344-0911')
,(146344051,10,'Brandy','Harmon','michiel@yahoo.com',10,'(208) 774-0062')
,(157682678,11,'Jason','Bush','penna@yahoo.ca',11,'(833) 702-8131')
,(448602365,12,'Faith','Rhodes','evans@comcast.net',12,'(438) 939-2912')
,(309348312,13,'Victoria','Anderson','emmanuel@outlook.com',13,'(758) 836-9762')
,(635775881,14,'Chad','Mcgee','thaljef@yahoo.ca',14,'(596) 727-9159')
,(563383616,15,'Lauren','Singleton','mwitte@outlook.com',15,'(731) 427-4268')
,(891468783,16,'Joy','Cook','boser@yahoo.ca',16,'(814) 404-9107')
,(610091459,17,'Donnie','Lyons','thrymm@aol.com',17,'(580) 454-4662')
,(108906305,18,'Darla','Warren','stevelim@icloud.com',18,'(912) 453-5668')
,(667004396,19,'David','Goodwin','camenisch@gmail.com',19,'(476) 246-3507')
,(752713919,20,'Neil','Vargas','jipsen@outlook.com',20,'(452) 251-8619')
,(882108144,21,'Tracey','Reese','martyloo@verizon.net',21,'(478) 734-4935')
,(809493224,22,'Maryann','Valdez','jorgb@yahoo.ca',22,'(250) 799-1843')
,(814392875,23,'Henrietta','Daniels','chrisj@sbcglobal.net',23,'(977) 945-9937')
,(426299656,24,'Arlene','Ellis','dawnsong@icloud.com',24,'(547) 296-5056')
,(357320964,25,'Theodore','Adkins','thomasj@yahoo.ca',25,'(679) 611-3155')
,(881132104,26,'Bryan','Ballard','morain@verizon.net',26,'(729) 868-0315')
,(508203017,27,'Carrie','Castillo','dbanarse@optonline.net',27,'(998) 310-3785')
,(907806961,28,'Sean','Cobb','reziac@sbcglobal.net',28,'(649) 827-4398')
,(656597000,29,'Pat','Mccarthy','sisyphus@msn.com',29,'(851) 528-9575')
,(477176451,30,'Shelly','Boone','smpeters@outlook.com',30,'(249) 627-9019')
,(964663021,31,'Darin','Manning','darin@comcast.net',31,'(511) 386-6187')
,(249691790,32,'Guadalupe','Peters','nanop@yahoo.com',32,'(492) 946-4252')
,(665452486,33,'Isaac','Norman','mhouston@comcast.net',33,'(607) 728-8791')
,(481996433,34,'Jermaine','Carlson','cumarana@hotmail.com',34,'(667) 469-0700')
,(786482339,35,'Larry','Johnston','keijser@yahoo.com',35,'(255) 292-9004')
,(927819640,36,'Jim','Schmidt','juerd@outlook.com',36,'(463) 366-6356')
,(867304329,37,'Hilda','Fields','fallorn@me.com',37,'(471) 219-1553')
,(195238750,38,'Loretta','Rogers','tromey@sbcglobal.net',38,'(239) 294-4463')
,(934347739,39,'Eleanor','Mathis','tokuhirom@verizon.net',39,'(709) 521-6059')
,(246771994,40,'Ryan','Ward','treit@optonline.net',40,'(395) 738-6557')
,(403876313,41,'Velma','Ramsey','hikoza@hotmail.com',41,'(965) 280-9438')
,(683192608,42,'Emilio','Ryan','adillon@live.com',42,'(234) 301-6725')
,(635804780,43,'Percy','Garcia','nighthawk@optonline.net',43,'(782) 573-6533')
,(177921799,44,'William','Silva','amimojo@verizon.net',44,'(794) 346-7807')
,(965277745,45,'Alfredo','Tyler','haddawy@yahoo.com',45,'(776) 644-3167')
,(406932598,46,'Jill','Quinn','sisyphus@outlook.com',46,'(657) 531-3968')
,(204794691,47,'Bradley','Carr','ryanshaw@mac.com',47,'(919) 326-5447')
,(293904265,48,'Herbert','Paul','novanet@comcast.net',48,'(245) 652-5496')
,(373307205,49,'Katherine','Nichols','ehood@icloud.com',49,'(617) 906-1699')
,(295600928,50,'Nelson','Gregory','dieman@verizon.net',50,'(969) 611-7919')
,(254156867,51,'Mildred','Austin','tubesteak@msn.com',51,'(713) 982-6756')
,(803179891,52,'Raymond','Moreno','floxy@gmail.com',52,'(974) 275-6290')
,(394025466,53,'Phillip','Chapman','bjoern@sbcglobal.net',53,'(614) 826-9918')
,(226130537,54,'Sam','Ruiz','dkeeler@outlook.com',54,'(330) 891-8718')
,(206289429,55,'Alison','Hicks','eurohack@yahoo.com',55,'(656) 711-7218')
,(472665242,56,'Ivan','Shelton','khris@msn.com',56,'(463) 962-8797')
,(842440083,57,'Muriel','Fleming','rfisher@msn.com',57,'(882) 676-4107')
,(747652718,58,'Nadine','Wade','kosact@aol.com',58,'(498) 455-5033')
,(575933767,59,'Michael','Clarke','mavilar@sbcglobal.net',59,'(223) 462-5346')
,(415879768,60,'Bobby','Clayton','janusfury@mac.com',60,'(996) 579-2594')
,(330264593,61,'Greg','Horton','kourai@gmail.com',61,'(529) 408-7982')
,(817794537,62,'Simon','Gonzalez','simone@optonline.net',62,'(663) 272-2620')
,(477887758,63,'Lynn','Griffin','msloan@yahoo.ca',63,'(682) 641-0701')
,(772846507,64,'Cheryl','Wilson','milton@gmail.com',64,'(265) 261-0469')
,(332012250,65,'Erica','Ferguson','monkeydo@me.com',65,'(462) 596-8712')
,(502405693,66,'Hugh','Vaughn','arebenti@outlook.com',66,'(813) 428-1066')
,(813718676,67,'Geneva','Morgan','benanov@yahoo.ca',67,'(498) 707-1947')
,(565829795,68,'Eric','Mckenzie','anicolao@yahoo.ca',68,'(647) 220-5384')
,(904560284,69,'Shawna','Zimmerman','gozer@icloud.com',69,'(498) 549-7404')
,(430977343,70,'Annette','Ramirez','maratb@hotmail.com',70,'(745) 677-9130')
,(195731807,71,'Irving','Goodman','rtanter@yahoo.ca',71,'(880) 839-1310')
,(269828604,72,'Mathew','Glover','wiseb@outlook.com',72,'(489) 434-5259')
,(195310678,73,'Johnny','Bryant','skajan@gmail.com',73,'(774) 739-3054');



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

INSERT INTO Employee(ssn,retired,office_building_abbreviation,office_room_floor,office_room_number) VALUES
 (254156867,0,'EV',3,321)
,(803179891,0,'EV',3,322)
,(394025466,0,'EV',3,323)
,(226130537,0,'EV',3,324)
,(206289429,0,'EV',3,325)
,(472665242,0,'EV',3,329)
,(842440083,0,'EV',3,330)
,(747652718,0,'EV',3,335)
,(575933767,0,'EV',4,421)
,(415879768,0,'EV',4,422)
,(330264593,0,'EV',4,423)
,(817794537,0,'EV',4,424)
,(477887758,0,'EV',4,425)
,(772846507,0,'EV',4,429)
,(332012250,0,'EV',4,430)
,(502405693,0,'EV',4,435)
,(813718676,0,'EV',5,521)
,(565829795,0,'EV',5,522)
,(904560284,0,'EV',5,523)
,(430977343,0,'EV',5,524)
,(195731807,0,'EV',5,525)
,(269828604,0,'EV',5,529)
,(195310678,0,'EV',5,530);


INSERT INTO Instructor
VALUES (254156867 ,3, 1, TRUE), /* 1 - 51 */
       (803179891 ,3, 1, FALSE), /* 2 - 52 */
       (394025466 ,9, 1, TRUE), /* 3 - 53 */
       (226130537, 1, 0, TRUE), /* 4 - 54 */
       (206289429, 8, 1, FALSE), /* 5 - 55 */
       (472665242, 10, 1, TRUE), /* 6 - 56 */
       (842440083, 4, 1, TRUE), /* 7 - 57 */
       (747652718, 7, 0, FALSE), /* 8 - 58 */
       (575933767, 2, 0, TRUE), /* 9 - 59 */
       (415879768, 8, 1, TRUE), /* 10 - 60 */
       (330264593, 5, 1, TRUE), /* 11 - 61 */
       (817794537, 7, 1, TRUE), /* 12 - 62 */
       (477887758, 6, 1, TRUE); /* 13 - 63 */

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

INSERT INTO Program
VALUES (1, 'Actuarial Mathematics Undergraduate', 'undergraduate', 90, 8, 565829795),
       (2, 'Actuarial Mathematics Graduate', 'graduate', 44, 8, 565829795),
       (3, 'Mathematics Undergraduate', 'undergraduate', 90, 8, 565829795),
       (4, 'Mathematics Graduate', 'graduate', 44, 8, 565829795),
       (5, 'Physics Undergraduate', 'undergraduate', 90, 2, 332012250),
       (6, 'Physics Graduate', 'graduate', 44, 2, 332012250),
       (7, 'English Literature Undergraduate', 'undergraduate', 90, 6, 430977343),
       (8, 'English Literature Graduate', 'graduate', 44, 6, 430977343),
       (9, 'Psychology Undergraduate', 'undergraduate', 90, 10, 195731807),
       (10, 'Psychology Graduate', 'graduate', 44, 10, 195731807),
       (11, 'Economics Undergraduate', 'undergraduate', 90, 9, 195310678),
       (12, 'Economics Graduate', 'graduate', 44, 9, 195310678),
       (13, 'Chemistry Undergraduate', 'undergraduate', 90, 5, 502405693),
       (14, 'Chemistry Graduate', 'graduate', 44, 5, 502405693),
       (15, 'Biochemistry Undergraduate', 'undergraduate', 90, 5, 502405693),
       (16, 'Biochemistry Graduate', 'graduate', 44, 5, 502405693),
       (17, 'Computer Systems Undergraduate', 'undergraduate', 90, 3, 269828604),
       (18, 'Computer Systems Graduate', 'graduate', 44, 3, 269828604),
       (19, 'Computer Science Undergraduate', 'undergraduate', 90, 3, 269828604),
       (20, 'Computer Science Graduate', 'graduate', 44, 3, 269828604),
       (21, 'Computer Engineering Undergraduate', 'undergraduate', 90, 1, 772846507),
       (22, 'Computer Engineering Graduate', 'graduate', 44, 1, 772846507),
       (23, 'Software Engineering Undergraduate', 'undergraduate', 90, 4, 813718676),
       (24, 'Software Engineering Graduate', 'graduate', 44, 4, 813718676),
       (25, 'Electrical Engineering Undergraduate', 'undergraduate', 90, 7, 904560284),
       (26, 'Electrical Engineering Graduate', 'graduate', 44, 7, 904560284),
       (27, 'General Engineering Undergraduate', 'undergraduate', 90, 11, NULL),
       (28, 'General Engineering Graduate', 'graduate', 44, 11, NULL);

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

INSERT INTO GradStudents
VALUES (779332036, 'thesis', 575933767),
       (445761402, 'course', NULL),
       (448602365, 'thesis', 747652718),
       (453920929, 'course', NULL),
       (223680290, 'course', NULL),
       (245007722, 'thesis', 747652718),
       (146344051, 'thesis', 472665242),
       (891468783, 'course', NULL),
       (616004712, 'thesis', 803179891),
       (309348312, 'thesis', 206289429),
       (882108144, 'thesis', 803179891),
       (809493224, 'thesis', 803179891),
       (814392875, 'thesis', 803179891),
       (426299656, 'thesis', 803179891),
       (357320964, 'thesis', 803179891),
       (881132104, 'thesis', 803179891),
       (508203017, 'thesis', 803179891),
       (907806961, 'thesis', 803179891),
       (656597000, 'thesis', 803179891),
       (477176451, 'thesis', 803179891),
       (964663021, 'thesis', 803179891),
       (249691790, 'thesis', 803179891),
       (665452486, 'thesis', 803179891),
       (481996433, 'thesis', 803179891),
       (786482339, 'thesis', 803179891),
       (927819640, 'thesis', 803179891),
       (867304329, 'thesis', 803179891),
       (195238750, 'thesis', 803179891),
       (934347739, 'thesis', 803179891),
       (246771994, 'thesis', 803179891),
       (403876313, 'course', NULL),
       (683192608, 'thesis', 394025466),
       (635804780, 'course', NULL),
       (177921799, 'thesis', 575933767),
       (965277745, 'thesis', 575933767),
       (406932598, 'thesis', 330264593),
       (204794691, 'course', NULL),
       (293904265, 'thesis', 226130537);

INSERT INTO ResearchFunds
VALUES (1, 'Research Grant in Computer Science 2', 800),
       (2, 'Research Grant in Computer Science 3', 1000),
       (3, 'Research Grant in Computer Science 4', 1200),
       (4, 'Research Grant in Computer Science 5', 1500),
       (5, 'NSERC tier1', 20000),
       (6, 'NSERC tier2', 17500),
       (7, 'NSERC tier3', 8000),
       (8, 'Engineering Design Grant', 35000),
       (9, 'Pure Applied Science Graduate Funding', 18500),
       (10, 'Graduate Fubding for Liberal Arts', 12500);

INSERT INTO ResearchFundingApplications
VALUES (1, 'granted', 814392875, 1),
       (2, 'granted', 964663021, 2),
       (3, 'granted', 881132104, 3),
       (4, 'granted', 656597000, 4),
       (5, 'denied', 195238750, 2),
       (6, 'denied', 964663021, 4),
       (7, 'denied', 477176451, 1),
       (8, 'denied', 477176451, 2),
       (9, 'denied', 477176451, 3),
       (10, 'denied', 477176451, 4),
       (11, 'denied', 426299656, 3),
       (12, 'granted', 177921799, 7),
       (13, 'granted', 245007722, 6),
       (14, 'applied', 965277745, 5),
       (15, 'applied', 453920929, 5),
       (16, 'denied', 146344051, 6),
       (17, 'denied', 907806961, 6),
       (18, 'denied', 882108144, 6),
       (19, 'applied', 448602365, 8),
       (20, 'applied', 779332036, 8),
       (21, 'applied', 445761402, 8),
       (22, 'applied', 453920929, 8),
       (23, 'granted', 814392875, 9),
       (24, 'denied', 406932598, 9),
       (25, 'denied', 635804780, 10);


INSERT INTO Studies
VALUES (399437700, 17),
       (889993771, 1),
       (779332036, 26),
       (245007722, 26),
       (645399011, 23),
       (445761402, 2),
       (616004712, 19),
       (223680290, 12),
       (453920929, 24),
       (146344051, 10),
       (157682678, 3),
       (448602365, 26),
       (309348312, 4),
       (635775881, 21),
       (563383616, 15),
       (891468783, 19),
       (610091459, 9),
       (108906305, 7),
       (667004396, 11),
       (752713919, 13),
       (882108144, 19),
       (809493224, 19),
       (814392875, 19),
       (426299656, 19),
       (357320964, 19),
       (881132104, 19),
       (508203017, 19),
       (907806961, 19),
       (656597000, 19),
       (477176451, 19),
       (964663021, 19),
       (249691790, 19),
       (665452486, 19),
       (481996433, 19),
       (786482339, 19),
       (927819640, 19),
       (867304329, 19),
       (195238750, 19),
       (934347739, 19),
       (246771994, 19),
       (403876313, 26),
       (683192608, 12),
       (635804780, 8),
       (177921799, 6),
       (965277745, 6),
       (406932598, 16),
       (204794691, 18),
       (293904265, 20),
       (373307205, 27),
       (295600928, 27);


INSERT INTO TAPosition
VALUES (1, 'TA', 35, 882108144, 1000),
       (2, 'marker', 65, 814392875, 1000),
       (3, 'Lab Instructor', 50, 882108144, 1000),
       (4, 'TA', 25, 881132104, 800),
       (5, 'TA', 25, 616004712, 1000),
       (6, 'marker', 65, 814392875, 1000),
       (7, 'TA', 50, 616004712, 1000),
       (8, 'TA', 25, 881132104, 1000),
       (9, 'TA', 25, 964663021, 1000),
       (10, 'marker', 65, 934347739, 1000),
       (11, 'TA', 50, 934347739, 1000),
       (12, 'TA', 35, 786482339, 1000),
       (13, 'TA', 35, 809493224, 1000),
       (14, 'marker', 90, 867304329, 2000),
       (15, 'TA', 25, 964663021, 1200),
       (16, 'TA', 25, 477176451, 1000),
       (17, 'marker', 90, 907806961, 1000),
       (18, 'TA', 25, 809493224, 1000),
       (19, 'TA', 25, 477176451, 100),
       (20, 'marker', 90, 786482339, 1300),
       (21, 'TA', 30, 867304329, 1000),
       (22, 'TA', 30, 426299656, 1000),
       (23, 'marker', 70, 426299656, 1000),
       (24, 'TA', 25, 357320964, 1000),
       (25, 'TA', 25, 907806961, 1000),
       (26, 'marker', 80, 508203017, 1000),
       (27, 'TA', 30, 357320964, 1000),
       (28, 'TA', 30, 656597000, 1000),
       (29, 'marker', 75, 656597000, 1000),
       (30, 'TA', 25, 293904265, 1000),
       (31, 'TA', 25, 907806961, 1000),
       (32, 'Lab Instructor', 45, 293904265, 1000),
       (33, 'marker', 80, 508203017, 1000),
       (34, 'TA', 30, 448602365, 1000),
       (35, 'TA', 30, 245007722, 1000),
       (36, 'marker', 30, 448602365, 1000),
       (37, 'TA', 25, 245007722, 1000),
       (38, 'marker', 80, 403876313, 1050),
       (39, 'lab Instructor', 50, 406932598, 1000),
       (40, 'marker', 100, 406932598, 1000),
       (41, 'marker', 110, 683192608, 1000),
       (42, 'marker', 110, 683192608, 1000),
       (43, 'marker', 110, 445761402, 1000),
       (44, 'marker', 110, 445761402, 1000),
       (45, 'marker', 120, 309348312, 1000),
       (46, 'marker', 120, 309348312, 1000),
       (47, 'marker', 120, 204794691, 1000),
       (48, 'marker', 90, 635804780, 1000),
       (49, 'marker', 90, 635804780, 1000),
       (50, 'marker', 80, 146344051, 1000),
       (51, 'TA', 30, 177921799, 1000),
       (52, 'marker', 90, 965277745, 1000),
       (53, 'TA', 30, 448602365, 1000),
       (54, 'marker', 65, 249691790, 1000),
       (55, 'TA', 30, 249691790, 1100),
       (56, 'marker', 30, 665452486, 1000),
       (57, 'TA', 30, 665452486, 1000),
       (58, 'Lab Instructor', 50, 481996433, 1000),
       (59, 'TA', 25, 927819640, 1000),
       (60, 'marker', 90, 927819640, 1000);


INSERT INTO TermToNumber
VALUES ('winter', 0),
       ('summer', 1),
       ('fall', 2),
       ('fall/winter', 3);

INSERT INTO Section
VALUES (1, 'AAA', 'COMP353', 'lecture', 'M, W', '14:45:00', '17:30:00', 'summer', '2018', 814392875, 254156867, 'H', 5, 535);
       INSERT INTO Section VALUES (2, 'BBB', 'COMP353', 'lecture', 'Tu, Th', '13:45:00', '15:00:00', 'fall', '2018', 814392875, 254156867, 'H',4,420);
       INSERT INTO Section VALUES (3, 'CCC', 'COMP353', 'lecture', 'M, F', '9:45:00', '11:00:00', 'winter', '2018', 934347739, 803179891, 'H',5,520);
       INSERT INTO Section VALUES (4, 'AAT', 'COMP353', 'tutorial', 'M, W', '13:15:00', '14:05:00', 'summer', '2018', 882108144, 254156867, 'H',5,503);
       INSERT INTO Section VALUES (5, 'BBTY', 'COMP353', 'tutorial', 'Tu', '9:15:00', '10:05:00', 'fall', '2018', 357320964, 254156867, 'H',5,520);
       INSERT INTO Section VALUES (6, 'BBTX', 'COMP353', 'tutorial', 'Th', '9:15:00', '10:05:00', 'fall', '2018', 616004712, 254156867, 'H',6,603);
       INSERT INTO Section VALUES (7, 'CCTX', 'COMP353', 'tutorial', 'M', '11:15:00', '13:05:00', 'winter', '2018', 881132104, 803179891, 'H',5,505);
       INSERT INTO Section VALUES (8, 'CCTY', 'COMP353', 'tutorial', 'F', '11:15:00', '13:05:00', 'winter', '2018', 964663021, 803179891, 'H',5,505);
       INSERT INTO Section VALUES (9, 'AAL', 'COMP353', 'lab', 'M, W', '8:45:00', '10:30:00', 'summer', '2018', 882108144, 254156867, 'H',9,903);
       INSERT INTO Section VALUES (10, 'BBL', 'COMP353', 'lab', 'Th', '15:45:00', '17:30:00', 'fall', '2018', 616004712, 254156867, 'H',9,907);
       INSERT INTO Section VALUES (11, 'CCL', 'COMP353', 'lab', 'F', '14:45:00', '17:30:00', 'winter', '2018', 934347739, 803179891, 'H',9,903);
       INSERT INTO Section VALUES (12, 'AAA', 'COMP352', 'lecture', 'W, F', '14:45:00', '17:30:00', 'summer', '2018', 934347739, 803179891, 'H',5,520);
       INSERT INTO Section VALUES (13, 'BBB', 'COMP352', 'lecture', 'M, W', '13:00:00', '14:15:00', 'fall', '2018', 867304329, 254156867, 'H',5,535);
       INSERT INTO Section VALUES (14, 'CCC', 'COMP352', 'lecture', 'M, W', '9:45:00', '11:00:00', 'fall/winter', '2018', 907806961, 254156867, 'H',4,435);
       INSERT INTO Section VALUES (15, 'AATX', 'COMP352', 'tutorial', 'W, F', '8:45:00', '9:30:00', 'summer', '2018', 964663021, 803179891, 'H',4,409);
       INSERT INTO Section VALUES (16, 'AATY', 'COMP352', 'tutorial', 'W, F', '8:45:00', '9:30:00', 'summer', '2018', 934347739, 803179891, 'H',5,504);
       INSERT INTO Section VALUES (17, 'BBTX', 'COMP352', 'tutorial', 'Tu', '8:45:00', '9:30:00', 'fall', '2018', 786482339, 254156867, 'H',6,609);
       INSERT INTO Section VALUES (18, 'BBTY', 'COMP352', 'tutorial', 'W', '15:45:00', '17:30:00', 'fall', '2018', 809493224, 254156867, 'H',5,503);
       INSERT INTO Section VALUES (19, 'CCTX', 'COMP352', 'tutorial', 'W', '15:45:00', '17:30:00', 'fall/winter', '2018', 964663021, 254156867, 'MB',3,321);
       INSERT INTO Section VALUES (20, 'CCTY', 'COMP352', 'tutorial', 'Th', '11:45:00', '13:30:00', 'fall/winter', '2018', 477176451, 254156867, 'H',5,504);
       INSERT INTO Section VALUES (21, 'AAA', 'SOEN341', 'lecture', 'W, F', '8:45:00', '10:00:00', 'winter', '2018', 786482339, 842440083, 'FG', -3, 80);
       INSERT INTO Section VALUES (22, 'AATX', 'SOEN341', 'tutorial', 'F', '12:00:00', '12:50:00', 'winter', '2018', 477176451, 842440083, 'MB', 3, 321);
       INSERT INTO Section VALUES (23, 'AATY', 'SOEN341', 'tutorial', 'F', '10:00:00', '10:50:00', 'winter', '2018', 809493224, 842440083, 'MB', 3, 325);
       INSERT INTO Section VALUES (24, 'AAA', 'SOEN342', 'lecture', 'Tu, Th', '10:00:00', '12:15:00', 'fall', '2018', 357320964, 842440083, 'H',4,435);
       INSERT INTO Section VALUES (25, 'AATX', 'SOEN342', 'tutorial', 'Th', '9:00:00', '9:45:00', 'fall', '2018', 426299656, 842440083, 'H',5,504);
       INSERT INTO Section VALUES (26, 'AATY', 'SOEN342', 'tutorial', 'Tu', '12:30:00', '13:20:00', 'fall', '2018', 867304329, 842440083, 'H',6,603);
       INSERT INTO Section VALUES (27, 'AAA', 'SOEN343', 'lecture', 'M, W', '10:45:00', '12:00:00', 'fall', '2018', 357320964, 842440083, 'H',5,520);
       INSERT INTO Section VALUES (28, 'AATX', 'SOEN343', 'tutorial', 'M, W', '12:15:00', '13:05:00', 'fall', '2018', 508203017, 842440083, 'H',4,408);
       INSERT INTO Section VALUES (29, 'AATY', 'SOEN343', 'tutorial', 'M, W', '13:15:00', '14:05:00', 'fall', '2018', 907806961, 842440083, 'H',4,408);
       INSERT INTO Section VALUES (30, 'AAA', 'COEN345', 'lecture', 'Tu, Th', '13:15:00', '14:30:00', 'winter', '2018', 508203017, 226130537, 'H',5,520);
       INSERT INTO Section VALUES (31, 'AATX', 'COEN345', 'tutorial', 'Tu', '14:30:00', '15:20:00', 'winter', '2018', 656597000, 226130537, 'H',6,609);
       INSERT INTO Section VALUES (32, 'AATY', 'COEN345', 'tutorial', 'Th', '14:30:00', '15:20:00', 'winter', '2018', 964663021, 226130537, 'H',4,409);
       INSERT INTO Section VALUES (33, 'AAL', 'COEN345', 'lab', 'F', '8:45:00', '10:15:00', 'winter', '2018', 293904265, 226130537, 'H',9,907);
       INSERT INTO Section VALUES (34, 'AAA', 'ELEC331', 'lecture', 'M, W', '13:15:00', '14:30:00', 'winter', '2018', 448602365, 747652718, 'FG',-2,90);
       INSERT INTO Section VALUES (35, 'AAT', 'ELEC331', 'tutorial', 'M', '10:15:00', '12:05:00', 'winter', '2018', 448602365, 747652718, 'H',4,405);
       INSERT INTO Section VALUES (36, 'AAL', 'ELEC331', 'lab', 'Tu', '16:00:00', '18:30:00', 'winter', '2018', 245007722, 747652718, 'H',9,903);
       INSERT INTO Section VALUES (37, 'AAA', 'ELEC251', 'lecture', 'Tu, Th', '15:15:00', '17:30:00', 'fall', '2018', 403876313, 817794537, 'H',4,420);
       INSERT INTO Section VALUES (38, 'AAT', 'ELEC251', 'tutorial', 'Th', '17:45:00', '18:35:00', 'fall', '2018', 245007722, 817794537, 'H',4,409);
       INSERT INTO Section VALUES (39, 'AAA', 'CHEM325', 'lecture', 'M', '18:00:00', '20:30:00', 'winter', '2018', 406932598, 330264593, 'MB',2,202);
       INSERT INTO Section VALUES (40, 'AAL', 'CHEM325', 'lab', 'W', '18:30:00', '22:30:00', 'winter', '2018', 406932598, 330264593, 'MB', 2,202);
       INSERT INTO Section VALUES (41, 'AAA', 'ECON221', 'lecture', 'Tu, Th', '8:45:00', '10:00:00', 'fall', '2018', 683192608, 394025466, 'H',4,420);
       INSERT INTO Section VALUES (42, 'BBB', 'ECON221', 'lecture', 'Tu, Th', '16:15:00', '17:30:00', 'winter', '2018', 683192608, 394025466, 'H',5,535);
       INSERT INTO Section VALUES (43, 'AAA', 'ECON222', 'lecture', 'Tu, Th', '16:15:00', '17:30:00', 'fall', '2018', 445761402, 394025466, 'H',4,435);
       INSERT INTO Section VALUES (44, 'BBB', 'ECON222', 'lecture', 'Tu, Th', '8:45:00', '10:00:00', 'winter', '2018', 445761402, 394025466, 'H',4,420);
       INSERT INTO Section VALUES (45, 'AAA', 'MATH209', 'lecture', 'W, F', '10:15:00', '11:30:00', 'fall', '2018', 309348312, 206289429, 'H',4,420);
       INSERT INTO Section VALUES (46, 'BBB', 'MATH209', 'lecture', 'Th', '19:00:00', '22:30:00', 'winter', '2018', 204794691, 415879768, 'H',5,520);
       INSERT INTO Section VALUES (47, 'CCC', 'MATH209', 'lecture', 'W, F', '11:45:00', '13:15:00', 'summer', '2018', 309348312, 817794537, 'H',4,435);
       INSERT INTO Section VALUES (48, 'AAA', 'ENGL233', 'lecture', 'Tu, Th', '8:45:00', '10:00:00', 'winter', '2018', 635804780, 477887758, 'H',5,520);
       INSERT INTO Section VALUES (49, 'BBB', 'ENGL233', 'lecture', 'W, F', '13:45:00', '15:00:00', 'fall', '2018', 635804780, 477887758, 'H',4,435);
       INSERT INTO Section VALUES (50, 'AAA', 'PSYC255', 'lecture', 'M, W', '14:00:00', '16:30:00', 'summer', '2018', 146344051, 472665242, 'H',4,420);
       INSERT INTO Section VALUES (51, 'AAA', 'PHYS334', 'lecture', 'W, F', '12:45:00', '14:00:00', 'winter', '2018', 965277745, 575933767, 'H',5,520);
       INSERT INTO Section VALUES (52, 'AAT', 'PHYS334', 'tutorial', 'W', '10:00:00', '10:50:00', 'winter', '2018', 177921799, 575933767, 'H',5,505);
       INSERT INTO Section VALUES (53, 'AAL', 'PHYS393', 'lab', 'Th', '14:30', '17:30:00', 'winter', '2018', 177921799, 575933767, 'H',9,907);
       INSERT INTO Section VALUES (54, 'QQQ', 'COMP352', 'lecture', 'W, F', '14:45:00', '17:30:00', 'summer', '2017', 249691790, 803179891, 'H',5,520);
       INSERT INTO Section VALUES (55, 'QQTX', 'COMP352', 'tutorial', 'Tu', '8:45:00', '9:30:00', 'fall', '2017', 249691790, 803179891, 'H',6,609);
       INSERT INTO Section VALUES (56, 'QQQ', 'ELEC331', 'lecture', 'M, W', '13:15:00', '14:30:00', 'winter', '2017', 665452486, 747652718, 'FG',-2, 90);
       INSERT INTO Section VALUES (57, 'QQT', 'ELEC331', 'tutorial', 'M', '10:15:00', '12:05:00', 'winter', '2017', 665452486, 747652718, 'H',4,405);
       INSERT INTO Section VALUES (58, 'QQL', 'ELEC331', 'lab', 'Tu', '16:00:00', '18:30:00', 'winter', '2017', 245007722, 747652718, 'H',9,903);
       INSERT INTO Section VALUES (59, 'QQQ', 'SOEN341', 'lecture', 'W, F', '8:45:00', '10:00:00', 'winter', '2017', 927819640, 842440083, 'FG',-3,80);
       INSERT INTO Section VALUES (60, 'QQTX', 'SOEN341', 'tutorial', 'F', '12:00:00', '12:50:00', 'winter', '2017', 927819640, 842440083, 'MB', 3,321);


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


INSERT INTO SectionEnrollment VALUE (41, 889993771, 'C+');
INSERT INTO SectionEnrollment VALUE (45, 889993771, 'A-');
INSERT INTO SectionEnrollment VALUE (48, 889993771, 'B');
INSERT INTO SectionEnrollment VALUE (12, 399437700, 'B+');
INSERT INTO SectionEnrollment VALUE (15, 399437700, 'B+');
INSERT INTO SectionEnrollment VALUE (2, 399437700, 'FNS');
INSERT INTO SectionEnrollment VALUE (5, 399437700, 'FNS');
INSERT INTO SectionEnrollment VALUE (10, 399437700, 'FNS');
INSERT INTO SectionEnrollment VALUE (3, 399437700, 'B');
INSERT INTO SectionEnrollment VALUE (7, 399437700, 'B');
INSERT INTO SectionEnrollment VALUE (11, 399437700, 'B');
INSERT INTO SectionEnrollment VALUE (34, 779332036, 'C-');
INSERT INTO SectionEnrollment VALUE (35, 779332036, 'C-');
INSERT INTO SectionEnrollment VALUE (36, 779332036, 'C-');
INSERT INTO SectionEnrollment VALUE (54, 245007722, 'B+');
INSERT INTO SectionEnrollment VALUE (55, 245007722, 'B+');
INSERT INTO SectionEnrollment VALUE (56, 245007722, 'B');
INSERT INTO SectionEnrollment VALUE (57, 245007722, 'B');
INSERT INTO SectionEnrollment VALUE (58, 245007722, 'B');
INSERT INTO SectionEnrollment VALUE (59, 245007722, 'B+');
INSERT INTO SectionEnrollment VALUE (60, 245007722, 'B+');
INSERT INTO SectionEnrollment VALUE (30, 245007722, 'A');
INSERT INTO SectionEnrollment VALUE (31, 245007722, 'A');
INSERT INTO SectionEnrollment VALUE (33, 245007722, 'A');
INSERT INTO SectionEnrollment VALUE (54, 645399011, 'C+');
INSERT INTO SectionEnrollment VALUE (55, 645399011, 'C+');
INSERT INTO SectionEnrollment VALUE (21, 645399011, 'B+');
INSERT INTO SectionEnrollment VALUE (22, 645399011, 'B+');
INSERT INTO SectionEnrollment VALUE (24, 645399011, 'A');
INSERT INTO SectionEnrollment VALUE (25, 645399011, 'A');
INSERT INTO SectionEnrollment VALUE (27, 645399011, 'A-');
INSERT INTO SectionEnrollment VALUE (28, 645399011, 'A-');
INSERT INTO SectionEnrollment VALUE (13, 445761402, 'B');
INSERT INTO SectionEnrollment VALUE (17, 445761402, 'B');
INSERT INTO SectionEnrollment VALUE (3, 445761402, 'B-');
INSERT INTO SectionEnrollment VALUE (7, 445761402, 'B-');
INSERT INTO SectionEnrollment VALUE (11, 445761402, 'B-');
INSERT INTO SectionEnrollment VALUE (14, 616004712, 'A+');
INSERT INTO SectionEnrollment VALUE (20, 616004712, 'A+');
INSERT INTO SectionEnrollment VALUE (41, 223680290, 'A-');
INSERT INTO SectionEnrollment VALUE (44, 223680290, 'A-');
INSERT INTO SectionEnrollment VALUE (54, 453920929, 'B-');
INSERT INTO SectionEnrollment VALUE (55, 453920929, 'B-');
INSERT INTO SectionEnrollment VALUE (2, 453920929, 'B+');
INSERT INTO SectionEnrollment VALUE (5, 453920929, 'B+');
INSERT INTO SectionEnrollment VALUE (10, 453920929, 'B+');
INSERT INTO SectionEnrollment VALUE (21, 453920929, 'A');
INSERT INTO SectionEnrollment VALUE (23, 453920929, 'A');
INSERT INTO SectionEnrollment VALUE (45, 146344051, 'A-');
INSERT INTO SectionEnrollment VALUE (45, 157682678, 'A');
INSERT INTO SectionEnrollment VALUE (51, 157682678, 'A+');
INSERT INTO SectionEnrollment VALUE (52, 157682678, 'A+');
INSERT INTO SectionEnrollment VALUE (53, 157682678, 'A+');
INSERT INTO SectionEnrollment VALUE (54, 448602365, 'B-');
INSERT INTO SectionEnrollment VALUE (55, 448602365, 'B-');
INSERT INTO SectionEnrollment VALUE (56, 448602365, 'A');
INSERT INTO SectionEnrollment VALUE (57, 448602365, 'A');
INSERT INTO SectionEnrollment VALUE (58, 448602365, 'A');
INSERT INTO SectionEnrollment VALUE (59, 448602365, 'B');
INSERT INTO SectionEnrollment VALUE (60, 448602365, 'B');
INSERT INTO SectionEnrollment VALUE (51, 309348312, 'C+');
INSERT INTO SectionEnrollment VALUE (52, 309348312, 'C+');
INSERT INTO SectionEnrollment VALUE (54, 635775881, 'C');
INSERT INTO SectionEnrollment VALUE (55, 635775881, 'C');
INSERT INTO SectionEnrollment VALUE (56, 635775881, 'C');
INSERT INTO SectionEnrollment VALUE (57, 635775881, 'C');
INSERT INTO SectionEnrollment VALUE (58, 635775881, 'C');
INSERT INTO SectionEnrollment VALUE (59, 635775881, 'A');
INSERT INTO SectionEnrollment VALUE (60, 635775881, 'A');
INSERT INTO SectionEnrollment VALUE (30, 635775881, 'B+');
INSERT INTO SectionEnrollment VALUE (31, 635775881, 'B+');
INSERT INTO SectionEnrollment VALUE (33, 635775881, 'B+');
INSERT INTO SectionEnrollment VALUE (39, 563383616, 'B');
INSERT INTO SectionEnrollment VALUE (40, 563383616, 'B');
INSERT INTO SectionEnrollment VALUE (12, 891468783, 'A+');
INSERT INTO SectionEnrollment VALUE (15, 891468783, 'A+');
INSERT INTO SectionEnrollment VALUE (3, 891468783, 'B');
INSERT INTO SectionEnrollment VALUE (8, 891468783, 'B');
INSERT INTO SectionEnrollment VALUE (11, 891468783, 'B');
INSERT INTO SectionEnrollment VALUE (50, 610091459, 'C');
INSERT INTO SectionEnrollment VALUE (42, 108906305, 'B+');
INSERT INTO SectionEnrollment VALUE (48, 108906305, 'B');
INSERT INTO SectionEnrollment VALUE (46, 667004396, 'B+');
INSERT INTO SectionEnrollment VALUE (39, 752713919, 'A');
INSERT INTO SectionEnrollment VALUE (40, 752713919, 'A');
INSERT INTO SectionEnrollment VALUE (54, 882108144, 'A-');
INSERT INTO SectionEnrollment VALUE (55, 882108144, 'A-');
INSERT INTO SectionEnrollment VALUE (21, 882108144, 'B');
INSERT INTO SectionEnrollment VALUE (22, 882108144, 'B');
INSERT INTO SectionEnrollment VALUE (24, 882108144, 'A-');
INSERT INTO SectionEnrollment VALUE (25, 882108144, 'A-');
INSERT INTO SectionEnrollment VALUE (27, 882108144, 'A-');
INSERT INTO SectionEnrollment VALUE (28, 882108144, 'A-');
INSERT INTO SectionEnrollment VALUE (54, 809493224, 'B-');
INSERT INTO SectionEnrollment VALUE (55, 809493224, 'B-');
INSERT INTO SectionEnrollment VALUE (2, 809493224, 'B');
INSERT INTO SectionEnrollment VALUE (6, 809493224, 'B');
INSERT INTO SectionEnrollment VALUE (10, 809493224, 'B');
INSERT INTO SectionEnrollment VALUE (45, 814392875, 'A+');
INSERT INTO SectionEnrollment VALUE (12, 426299656, 'A');
INSERT INTO SectionEnrollment VALUE (15, 426299656, 'A');
INSERT INTO SectionEnrollment VALUE (2, 426299656, 'C+');
INSERT INTO SectionEnrollment VALUE (5, 426299656, 'C+');
INSERT INTO SectionEnrollment VALUE (10, 426299656, 'C+');
INSERT INTO SectionEnrollment VALUE (12, 357320964, 'B');
INSERT INTO SectionEnrollment VALUE (15, 357320964, 'B');
INSERT INTO SectionEnrollment VALUE (3, 357320964, 'B+');
INSERT INTO SectionEnrollment VALUE (8, 357320964, 'B+');
INSERT INTO SectionEnrollment VALUE (11, 357320964, 'B+');
INSERT INTO SectionEnrollment VALUE (54, 881132104, 'C+');
INSERT INTO SectionEnrollment VALUE (55, 881132104, 'C+');
INSERT INTO SectionEnrollment VALUE (21, 881132104, 'A');
INSERT INTO SectionEnrollment VALUE (22, 881132104, 'A');
INSERT INTO SectionEnrollment VALUE (24, 881132104, 'A-');
INSERT INTO SectionEnrollment VALUE (25, 881132104, 'A-');
INSERT INTO SectionEnrollment VALUE (27, 881132104, 'A');
INSERT INTO SectionEnrollment VALUE (28, 881132104, 'A');
INSERT INTO SectionEnrollment VALUE (34, 508203017, 'B+');
INSERT INTO SectionEnrollment VALUE (35, 508203017, 'B+');
INSERT INTO SectionEnrollment VALUE (36, 508203017, 'B+');
INSERT INTO SectionEnrollment VALUE (54, 907806961, 'A');
INSERT INTO SectionEnrollment VALUE (55, 907806961, 'A');
INSERT INTO SectionEnrollment VALUE (1, 907806961, 'A-');
INSERT INTO SectionEnrollment VALUE (4, 907806961, 'A-');
INSERT INTO SectionEnrollment VALUE (9, 907806961, 'A-');
INSERT INTO SectionEnrollment VALUE (12, 656597000, 'A+');
INSERT INTO SectionEnrollment VALUE (15, 656597000, 'A+');
INSERT INTO SectionEnrollment VALUE (3, 656597000, 'C');
INSERT INTO SectionEnrollment VALUE (7, 656597000, 'C');
INSERT INTO SectionEnrollment VALUE (11, 656597000, 'C');
INSERT INTO SectionEnrollment VALUE (48, 477176451, 'B+');
INSERT INTO SectionEnrollment VALUE (54, 964663021, 'B');
INSERT INTO SectionEnrollment VALUE (55, 964663021, 'B');
INSERT INTO SectionEnrollment VALUE (1, 964663021, 'A');
INSERT INTO SectionEnrollment VALUE (4, 964663021, 'A');
INSERT INTO SectionEnrollment VALUE (9, 964663021, 'A');
INSERT INTO SectionEnrollment VALUE (54, 249691790, 'B+');
INSERT INTO SectionEnrollment VALUE (55, 249691790, 'B+');
INSERT INTO SectionEnrollment VALUE (1, 249691790, 'B+');
INSERT INTO SectionEnrollment VALUE (4, 249691790, 'B+');
INSERT INTO SectionEnrollment VALUE (9, 249691790, 'B+');
INSERT INTO SectionEnrollment VALUE (12, 665452486, 'B+');
INSERT INTO SectionEnrollment VALUE (15, 665452486, 'B+');
INSERT INTO SectionEnrollment VALUE (2, 665452486, 'C-');
INSERT INTO SectionEnrollment VALUE (5, 665452486, 'C-');
INSERT INTO SectionEnrollment VALUE (10, 665452486, 'C-');
INSERT INTO SectionEnrollment VALUE (54, 481996433, 'A');
INSERT INTO SectionEnrollment VALUE (55, 481996433, 'A');
INSERT INTO SectionEnrollment VALUE (56, 481996433, 'A-');
INSERT INTO SectionEnrollment VALUE (57, 481996433, 'A-');
INSERT INTO SectionEnrollment VALUE (58, 481996433, 'A-');
INSERT INTO SectionEnrollment VALUE (59, 481996433, 'B');
INSERT INTO SectionEnrollment VALUE (60, 481996433, 'B');
INSERT INTO SectionEnrollment VALUE (30, 481996433, 'B');
INSERT INTO SectionEnrollment VALUE (32, 481996433, 'B');
INSERT INTO SectionEnrollment VALUE (33, 481996433, 'B');
INSERT INTO SectionEnrollment VALUE (54, 786482339, 'A-');
INSERT INTO SectionEnrollment VALUE (55, 786482339, 'A-');
INSERT INTO SectionEnrollment VALUE (56, 786482339, 'C-');
INSERT INTO SectionEnrollment VALUE (57, 786482339, 'C-');
INSERT INTO SectionEnrollment VALUE (58, 786482339, 'C-');
INSERT INTO SectionEnrollment VALUE (59, 786482339, 'B+');
INSERT INTO SectionEnrollment VALUE (60, 786482339, 'B+');
INSERT INTO SectionEnrollment VALUE (30, 786482339, 'C+');
INSERT INTO SectionEnrollment VALUE (31, 786482339, 'C+');
INSERT INTO SectionEnrollment VALUE (33, 786482339, 'C+');
INSERT INTO SectionEnrollment VALUE (54, 927819640, 'A-');
INSERT INTO SectionEnrollment VALUE (55, 927819640, 'A-');
INSERT INTO SectionEnrollment VALUE (21, 927819640, 'C');
INSERT INTO SectionEnrollment VALUE (22, 927819640, 'C');
INSERT INTO SectionEnrollment VALUE (24, 927819640, 'B');
INSERT INTO SectionEnrollment VALUE (25, 927819640, 'B');
INSERT INTO SectionEnrollment VALUE (27, 927819640, 'B');
INSERT INTO SectionEnrollment VALUE (28, 927819640, 'B');
INSERT INTO SectionEnrollment VALUE (54, 867304329, 'B-');
INSERT INTO SectionEnrollment VALUE (55, 867304329, 'B-');
INSERT INTO SectionEnrollment VALUE (2, 867304329, 'A+');
INSERT INTO SectionEnrollment VALUE (6, 867304329, 'A+');
INSERT INTO SectionEnrollment VALUE (10, 867304329, 'A+');
INSERT INTO SectionEnrollment VALUE (54, 195238750, 'A+');
INSERT INTO SectionEnrollment VALUE (55, 195238750, 'A+');
INSERT INTO SectionEnrollment VALUE (2, 195238750, 'A-');
INSERT INTO SectionEnrollment VALUE (7, 195238750, 'A-');
INSERT INTO SectionEnrollment VALUE (10, 195238750, 'A-');
INSERT INTO SectionEnrollment VALUE (54, 934347739, 'B');
INSERT INTO SectionEnrollment VALUE (55, 934347739, 'B');
INSERT INTO SectionEnrollment VALUE (56, 934347739, 'A');
INSERT INTO SectionEnrollment VALUE (57, 934347739, 'A');
INSERT INTO SectionEnrollment VALUE (58, 934347739, 'A');
INSERT INTO SectionEnrollment VALUE (59, 934347739, 'C+');
INSERT INTO SectionEnrollment VALUE (60, 934347739, 'C+');
INSERT INTO SectionEnrollment VALUE (30, 934347739, 'B+');
INSERT INTO SectionEnrollment VALUE (31, 934347739, 'B+');
INSERT INTO SectionEnrollment VALUE (33, 934347739, 'B+');
INSERT INTO SectionEnrollment VALUE (54, 246771994, 'B');
INSERT INTO SectionEnrollment VALUE (55, 246771994, 'B');
INSERT INTO SectionEnrollment VALUE (1, 246771994, 'B-');
INSERT INTO SectionEnrollment VALUE (4, 246771994, 'B-');
INSERT INTO SectionEnrollment VALUE (9, 246771994, 'B-');
INSERT INTO SectionEnrollment VALUE (34, 403876313, 'B');
INSERT INTO SectionEnrollment VALUE (35, 403876313, 'B');
INSERT INTO SectionEnrollment VALUE (36, 403876313, 'B');
INSERT INTO SectionEnrollment VALUE (41, 683192608, 'B+');
INSERT INTO SectionEnrollment VALUE (44, 683192608, 'A-');
INSERT INTO SectionEnrollment VALUE (50, 635804780, 'B');
INSERT INTO SectionEnrollment VALUE (39, 177921799, 'A-');
INSERT INTO SectionEnrollment VALUE (40, 177921799, 'A-');
INSERT INTO SectionEnrollment VALUE (54, 965277745, 'B');
INSERT INTO SectionEnrollment VALUE (55, 965277745, 'B');
INSERT INTO SectionEnrollment VALUE (56, 965277745, 'C+');
INSERT INTO SectionEnrollment VALUE (57, 965277745, 'C+');
INSERT INTO SectionEnrollment VALUE (58, 965277745, 'C+');
INSERT INTO SectionEnrollment VALUE (59, 965277745, 'B');
INSERT INTO SectionEnrollment VALUE (60, 965277745, 'B');
INSERT INTO SectionEnrollment VALUE (30, 965277745, 'C');
INSERT INTO SectionEnrollment VALUE (32, 965277745, 'C');
INSERT INTO SectionEnrollment VALUE (33, 965277745, 'C');
INSERT INTO SectionEnrollment VALUE (51, 406932598, 'A');
INSERT INTO SectionEnrollment VALUE (52, 406932598, 'A');
INSERT INTO SectionEnrollment VALUE (53, 406932598, 'B-');
INSERT INTO SectionEnrollment VALUE (54, 204794691, 'B-');
INSERT INTO SectionEnrollment VALUE (55, 204794691, 'B-');
INSERT INTO SectionEnrollment VALUE (2, 204794691, 'A-');
INSERT INTO SectionEnrollment VALUE (7, 204794691, 'A-');
INSERT INTO SectionEnrollment VALUE (10, 204794691, 'A-');
INSERT INTO SectionEnrollment VALUE (12, 293904265, 'A-');
INSERT INTO SectionEnrollment VALUE (15, 293904265, 'A-');
INSERT INTO SectionEnrollment VALUE (2, 293904265, 'B');
INSERT INTO SectionEnrollment VALUE (5, 293904265, 'B');
INSERT INTO SectionEnrollment VALUE (10, 293904265, 'B');
INSERT INTO SectionEnrollment VALUE (54, 373307205, 'B+');
INSERT INTO SectionEnrollment VALUE (55, 373307205, 'B+');
INSERT INTO SectionEnrollment VALUE (56, 373307205, 'A');
INSERT INTO SectionEnrollment VALUE (57, 373307205, 'A');
INSERT INTO SectionEnrollment VALUE (58, 373307205, 'A');
INSERT INTO SectionEnrollment VALUE (59, 373307205, 'B');
INSERT INTO SectionEnrollment VALUE (60, 373307205, 'B');
INSERT INTO SectionEnrollment VALUE (30, 373307205, 'B+');
INSERT INTO SectionEnrollment VALUE (32, 373307205, 'B+');
INSERT INTO SectionEnrollment VALUE (33, 373307205, 'B+');


INSERT INTO Experience VALUES
(254156867,'Electrical Technician','Concordia University','2011-09-22','2015-09-04'),
       (803179891,'Teacher Assistant','McGill','2017-08-01','2017-09-30'),
       (394025466,'Manager','Ford Motor','2015-03-02','2017-09-05'),
       (226130537,'Engineer','Schindler','1993-09-08','1999-09-01'),
       (206289429,'Coordinator','Gasprom','1975-07-05','2007-11-11'),
       (472665242,'Business Owner','Matrinox','1983-09-04','2000-01-01'),
       (842440083,'Assistant Professor','Oxford University','2016-01-09','2019-03-02'),
       (747652718,'Developer','Uber','2016-02-20','2017-09-09'),
       (575933767,'Seller','Pfizer','2003-04-03','2005-02-21'),
       (415879768,'Biomedical Development','Aventis','2001-09-23','2014-04-01'),
       (330264593,'Researcher','Kroger','1999-12-29','2001-09-01'),
       (817794537,'Coordinator','Sears','2011-10-10','2019-05-09'),
       (477887758,'Teacher Assistant','University of Washington','2015-04-07','2018-01-01' ),
        (772846507,'Engineer','Air France','1992-11-11','1998-08-12'),
        (332012250,'Assistant Professor','University of Toronto','2007-07-07','2014-12-23'),
        (502405693,'Engineer','Embraer','2009-08-09','2009-12-31'),
        (813718676,'Manager','Aldo','2017-08-23','2017-12-02'),
        (565829795,'Engineer','ElectroMac','2008-08-09','2018-09-08'),
        (904560284,'Lab Assistant','Essess University','2008-11-11','2009-09-12' ),
        (430977343,'Teacher Assistant','ZTH','2002-02-09','2005-11-13' ),
        (195731807,'Military Reserve','Canadian Army','2015-12-12','2016-07-09'),
        (269828604,'Manager','Toyota','2001-09-04','2008-09-09'),
        (195310678,'Engineer','STM','2012-01-16','2016-09-09');


INSERT INTO Publications VALUES
(254156867,'conference','1991-01-03','Q-Bits, soon a reality!','Akashic'),
(803179891,'conference','1991-10-02','New Species soon extinct','Dzanc'),
(394025466,'journal','1992-01-29','VHDL, Verilog and Others','McSweeney'),
(226130537,'journal','1993-11-25','Thinking and questioning, the step toward the new philosophy','Folio'),
(206289429,'conference','1994-02-01','ANOVA Enhanced','McGraw Hill'),
(472665242,'journal','1997-04-11','Not new, but still used extensively, 68K','Deitel'),
(842440083,'conference','1999-07-23','Artificial Intelligence not for yesterday','Phaidon'),
(747652718,'journal','1999-10-13','Energy Consumption, not the whole story','Concordia University'),
(575933767,'conference','1999-11-18','Ignore me, Ignore yourself','Century'),
(415879768,'conference','2001-05-24','Vikings, the real first','Freikr'),
(330264593,'conference','2003-01-29','China, the truth behind centuries of domination','Twainer'),
(817794537,'conference','2003-07-19','Moore s Law is it really the end?','Bakeena'),
(477887758,'journal','2003-07-28','Women vs Men, who wins what?','prakvist'),
(772846507,'journal','2004-02-17','Metallurgy, the start of the industrial revolution','Vlotriv'),
(332012250,'conference','2004-06-18','A mouse, how has is been?','Bird'),
(502405693,'conference','2005-07-12','Six Sigma, the real deal','McGraw Hill'),
(813718676,'conference','2005-09-21','Tesla s coil, optimization theory','Elsevier'),
(565829795,'journal','2006-03-27','Digital Signal Processing, from voice to ears','Victoria University'),
(904560284,'journal','2016-06-29','Drones, their impact on the environment','Direins'),
(430977343,'journal','2007-04-27','Oled, Definition and Complains','Vle'),
(195731807,'journal','2007-12-13','Anxiety, a tool for the future','University of Glasgow'),
(269828604,'journal','2008-03-22','Ignorance, Political Science for it','New York Times'),
(195310678,'journal','2016-01-25','Data Structures and algorithms, what should be ignored!','Pearson');

