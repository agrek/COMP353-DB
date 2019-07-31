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

INSERT INTO Department (id, name)
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

INSERT INTO Address(id, street, city, province, postal_code, apt, civic_number)
VALUES (1, 'Golden Leaf', 'Thetford-Mines', 'Québec', 'G6G1M8', 638, 321)
     , (2, 'Birchwood', 'Lacolle', 'Québec', 'E5A2N2', 495, 133)
     , (3, 'Grasskamp', 'Kamsack', 'Saskatchewan', 'R2J3N6', 485, 211)
     , (4, 'Menomonie', 'Barraute', 'Québec', 'P0M7H8', 468, 12)
     , (5, 'Melby', 'Saint-Rémi', 'Québec', 'K1G9K2', 246, 267)
     , (6, 'Graceland', 'Mont-Saint-Hilaire', 'Québec', 'J3H9K9', 24, 87)
     , (7, 'Pennsylvania', 'Lac-Brome', 'Québec', 'L9G9N2', 989, 279)
     , (8, 'Mallard', 'Richmond', 'Québec', 'V6Z8N7', 986, 140)
     , (9, 'Bowman', 'Wabana', 'Newfoundland and Labrador', 'V7X1D2', 972, 214)
     , (10, 'Dwight', 'Kamloops', 'British Columbia', 'H9P9B2', 217, 227)
     , (11, 'Summerview', 'Neepawa', 'Manitoba', 'H3Z8G5', 702, 390)
     , (12, 'Eggendart', 'Burgeo', 'Newfoundland and Labrador', 'N9A6H4', 910, 140)
     , (13, 'Annamark', 'Carleton-sur-Mer', 'Québec', 'P0T0J8', 934, 455)
     , (14, 'Shoshone', 'Winnipeg', 'Manitoba', 'R3L9J8', 760, 179)
     , (15, 'Pepper Wood', 'White City', 'Saskatchewan', 'P0W9K8', 758, 409)
     , (16, 'Mockingbird', 'Catalina', 'Newfoundland and Labrador', 'B2V6D3', 471, 191)
     , (17, 'Rieder', 'Mirabel', 'Québec', 'J5K9D3', 978, 313)
     , (18, 'Scoville', 'Mont-Tremblant', 'Québec', 'J8E9H2', 912, 4)
     , (19, 'Gerald', 'Lewisporte', 'Newfoundland and Labrador', 'M2K9N2', 563, 132)
     , (20, 'Hanson', 'Biggar', 'Saskatchewan', 'N1S9C2', 645, 144)
     , (21, 'Melrose', 'Melville', 'Saskatchewan', 'S7W7H3', 362, 7)
     , (22, 'Fulton', 'Meadow Lake', 'Saskatchewan', 'S9X9D3', 446, 301)
     , (23, 'Carberry', 'Sainte-Martine', 'Québec', 'A1C9D3', 417, 62)
     , (24, 'Shopko', 'Kindersley', 'Saskatchewan', 'C1C9H2', 489, 483)
     , (25, 'Elmside', 'Spirit River', 'Alberta', 'V2G9H1', 975, 192)
     , (26, 'Havey', 'Waterloo', 'Québec', 'V9J0J2', 575, 9)
     , (27, 'Elmside', 'Harrison Brook', 'New Brunswick', 'E7E6F2', 942, 274)
     , (28, 'Holmberg', 'Barraute', 'Québec', 'P0M6J6', 79, 61)
     , (29, 'Lighthouse Bay', 'Lanigan', 'Saskatchewan', 'J7A2D2', 286, 182)
     , (30, 'Lindbergh', 'Morinville', 'Alberta', 'T8R6F2', 920, 159)
     , (31, 'Bashford', 'Sainte-Adèle', 'Québec', 'J8B8H4', 226, 171)
     , (32, 'Elka', 'Ottawa', 'Ontario', 'J8Y8H2', 938, 89)
     , (33, 'Superior', 'Vanderhoof', 'British Columbia', 'G9A8D2', 544, 192)
     , (34, 'Meadow Valley', 'Charlemagne', 'Québec', 'J6V7G2', 737, 412)
     , (35, 'Sugar', 'Mercier', 'Québec', 'J6R8C2', 778, 154)
     , (36, 'Pierstorff', 'Marathon', 'Ontario', 'P6A9H2', 253, 190)
     , (37, 'Nova', 'Biggar', 'Saskatchewan', 'N1S9F6', 650, 30)
     , (38, 'Center', 'New Glasgow', 'Nova Scotia', 'B2H9H2', 3, 20)
     , (39, 'Lawn', 'Montréal-Est', 'Québec', 'J4N9H4', 662, 188)
     , (40, 'Caliangt', 'Sainte-Thérèse', 'Québec', 'J7G8H7', 74, 485)
     , (41, 'Cascade', 'Sherwood Park', 'Alberta', 'T8A1K8', 541, 438)
     , (42, 'Ronald Regan', 'Altona', 'Manitoba', 'K1W2M9', 846, 387)
     , (43, 'Karstens', 'Edson', 'Alberta', 'T7E7H3', 38, 93)
     , (44, 'Scofield', 'Ferme-Neuve', 'Québec', 'V5Y7H2', 869, 424)
     , (45, 'Autumn Leaf', 'Collingwood', 'Ontario', 'L9Y9J9', 785, 126)
     , (46, 'Golf View', 'Varennes', 'Québec', 'J3X7H5', 671, 67)
     , (47, 'Tomscot', 'Varennes', 'Québec', 'J3X9G2', 94, 292)
     , (48, 'Arapahoe', 'Belfast', 'Prince Edward Island', 'L6S8H2', 415, 77)
     , (49, 'Merry', 'Ottawa', 'Ontario', 'J8Y8D2', 494, 335)
     , (50, 'Columbus', 'Otterburn Park', 'Québec', 'L6G8K2', 155, 335)
     , (51, 'Marcy', 'Orillia', 'Ontario', 'L3V7F2', 524, 76)
     , (52, 'Monica', 'Taber', 'Alberta', 'T1G9F2', 353, 33)
     , (53, 'Truax', 'Saint-Jérôme', 'Québec', 'J7Z8G2', 761, 373)
     , (54, 'Merchant', 'Kerrobert', 'Saskatchewan', 'T1P9D2', 436, 125)
     , (55, 'Eagan', 'Alberton', 'Prince Edward Island', 'P7K9G4', 938, 120)
     , (56, 'Golden Leaf', 'Pangnirtung', 'Nunavut', 'M5TH5F', 442, 228)
     , (57, 'Michigan', 'La Sarre', 'Québec', 'J9Z8GD', 85, 105)
     , (58, 'Columbus', 'Port Hawkesbury', 'Nova Scotia', 'B9A8H5', 444, 258)
     , (59, 'Golf', 'Mont-Tremblant', 'Québec', 'J8E3K8', 550, 146)
     , (60, 'Logan', 'Malartic', 'Québec', 'X0GJ9D', 589, 319)
     , (61, 'Shasta', 'Okanagan', 'British Columbia', 'T0P8G4', 211, 88)
     , (62, 'Manitowish', 'Bassano', 'Alberta', 'M5G9F4', 582, 360)
     , (63, 'Hazelcrest', 'Kelowna', 'British Columbia', 'V1Y9G4', 116, 314)
     , (64, 'Ludington', 'Pembroke', 'Ontario', 'K8B9F2', 677, 182)
     , (65, 'Annamark', 'Sainte-Anne-de-Bellevue', 'Québec', 'H9X8G2', 979, 488)
     , (66, 'Arkansas', 'Hudson', 'Québec', 'J0NF2F', 715, 365)
     , (67, 'Morning', 'Saint-Sauveur', 'Québec', 'J0R8H8', 57, 207)
     , (68, 'Lerdahl', 'Conception Bay South', 'Newfoundland and Labrador', 'A1X9U9', 754, 90)
     , (69, 'Warbler', 'Bécancour', 'Québec', 'G9H7G2', 649, 430)
     , (70, 'Fremont', 'Rayside-Balfour', 'Ontario', 'G9THI2', 570, 248)
     , (71, 'Vermont', 'Lachute', 'Québec', 'J8H75E', 888, 257)
     , (72, 'Carberry', 'Kirkland', 'Québec', 'H9JH9H', 641, 370)
     , (73, 'Main Street', 'Montreal', 'Québec', 'H8K1M9', 875, 932);

INSERT INTO Campus
VALUES ('LOY', 'Loyola'),
       ('SGW', 'Sir George Williams'),
       ('CAS1', 'Campus1'),
       ('CAS2', 'Campus2'),
       ('CAS3', 'Campus3');

INSERT INTO Building
VALUES ('H', 'Henry F. Hall Building', 200, 100, 12, 'SGW'),
       ('EV', 'Engineering, Computer Science and Visual Arts Integrated Complex', 300, 50, 15, 'SGW'),
       ('VA', 'Visual Arts Building', 25, 0, 5, 'SGW'),
       ('B', 'B Annex', 30, 10, 3, 'SGW'),
       ('CI', 'CI Annex', 19, 0, 3, 'SGW'),
       ('CL', 'CL Annex', 49, 3, 3, 'SGW'),
       ('D', 'D Annex', 10, 6, 1, 'SGW'),
       ('EN', 'EN Annex', 56, 0, 6, 'SGW'),
       ('FA', 'FA Annex', 10, 10, 3, 'SGW'),
       ('FB', 'Faubourg Building', 50, 0, 6, 'SGW'),
       ('FG', 'Faubourg Ste-Catherine Building', 35, 0, 5, 'SGW'),
       ('GA', 'Grey Nuns Annex', 10, 10, 4, 'SGW'),
       ('GM', 'Guy De Maisonneuve Building', 16, 0, 8, 'SGW'),
       ('GN', 'Grey Nuns Building', 30, 0, 4, 'SGW'),
       ('K', 'K Annex', 10, 38, 4, 'SGW'),
       ('LB', 'J.W. McConnell Building', 10, 5, 3, 'SGW'),
       ('M', 'M Annex', 10, 6, 3, 'SGW'),
       ('MB', 'John Molson Building', 100, 45, 15, 'SGW'),
       ('AD', 'Administration Building', 10, 0, 5, 'LOY'),
       ('BB', 'BB Annex', 10, 4, 5, 'LOY'),
       ('HA', 'Hingston Hall, Wing HA', 46, 23, 5, 'LOY'),
       ('SH', 'Solar House', 7, 4, 5, 'LOY'),
       ('PC', 'Performing Centre', 1, 0, 2, 'LOY'),
       ('CC', 'Central Building', 133, 0, 3, 'LOY'),
       ('TA', 'Terrebonne Building', 44, 0, 4, 'LOY'),
       ('RA', 'Recreational and Complex Building', 34, 6, 3, 'LOY'),
       ('HC', 'Hingston Hall, Wing HC', 45, 4, 4, 'LOY'),
       ('FC', 'F.C. Smith Building', 34, 4, 4, 'LOY');

INSERT INTO Room(building_abbreviation, type, capacity, room_floor, room_number)
VALUES ('H', 'lab', 20, 900, 906),
       ('H', 'lab', 20, 9, 900),
       ('H', 'lab', 20, 9, 901),
       ('H', 'lab', 20, 9, 903),
       ('H', 'lab', 20, 9, 905),
       ('H', 'lab', 20, 9, 907),
       ('H', 'lab', 20, 9, 909),
       ('H', 'lab', 20, 9, 912),
       ('H', 'lab', 30, 9, 934),
       ('H', 'lab', 30, 9, 935),
       ('H', 'lab', 30, 9, 938),
       ('H', 'lab', 30, 9, 939),
       ('H', 'lab', 30, 9, 940),
       ('H', 'lab', 30, 9, 941),
       ('H', 'lab', 30, 9, 945),
       ('H', 'lab', 30, 9, 955),
       ('H', 'class', 40, 4, 400),
       ('H', 'class', 40, 4, 401),
       ('H', 'class', 40, 4, 402),
       ('H', 'class', 40, 4, 403),
       ('H', 'class', 40, 4, 404),
       ('H', 'class', 60, 4, 405),
       ('H', 'class', 60, 4, 406),
       ('H', 'class', 60, 4, 407),
       ('H', 'class', 80, 4, 408),
       ('H', 'class', 80, 4, 409),
       ('H', 'class', 120, 4, 410),
       ('H', 'class', 120, 4, 420),
       ('H', 'class', 120, 4, 430),
       ('H', 'class', 120, 4, 435),
       ('H', 'class', 40, 5, 500),
       ('H', 'class', 40, 5, 501),
       ('H', 'class', 40, 5, 502),
       ('H', 'class', 40, 5, 503),
       ('H', 'class', 40, 5, 504),
       ('H', 'class', 60, 5, 505),
       ('H', 'class', 60, 5, 506),
       ('H', 'class', 60, 5, 507),
       ('H', 'class', 80, 5, 508),
       ('H', 'class', 80, 5, 509),
       ('H', 'class', 120, 5, 510),
       ('H', 'class', 120, 5, 520),
       ('H', 'class', 120, 5, 530),
       ('H', 'class', 120, 5, 535),
       ('H', 'class', 40, 6, 600),
       ('H', 'class', 40, 6, 601),
       ('H', 'class', 40, 6, 602),
       ('H', 'class', 40, 6, 603),
       ('H', 'class', 40, 6, 604),
       ('H', 'class', 60, 6, 605),
       ('H', 'class', 60, 6, 606),
       ('H', 'class', 60, 6, 607),
       ('H', 'class', 80, 6, 608),
       ('H', 'class', 80, 6, 609),
       ('H', 'class', 120, 6, 610),
       ('H', 'class', 120, 6, 620),
       ('H', 'class', 120, 6, 630),
       ('H', 'class', 40, 8, 800),
       ('H', 'class', 40, 8, 801),
       ('H', 'class', 40, 8, 802),
       ('H', 'class', 40, 8, 803),
       ('H', 'class', 40, 8, 804),
       ('H', 'class', 60, 8, 805),
       ('H', 'class', 60, 8, 806),
       ('H', 'class', 60, 8, 807),
       ('H', 'class', 80, 8, 808),
       ('H', 'class', 80, 8, 809),
       ('H', 'class', 120, 8, 810),
       ('H', 'class', 120, 8, 820),
       ('H', 'class', 120, 8, 830),
       ('MB', 'class', 300, 2, 230),
       ('MB', 'class', 200, 2, 240),
       ('MB', 'class', 50, 2, 250),
       ('MB', 'class', 50, 2, 260),
       ('MB', 'class', 70, 2, 270),
       ('MB', 'class', 90, 2, 280),
       ('MB', 'class', 30, 2, 290),
       ('MB', 'class', 60, 2, 298),
       ('MB', 'class', 40, 3, 325),
       ('MB', 'class', 40, 3, 330),
       ('MB', 'class', 40, 3, 321),
       ('MB', 'class', 55, 3, 340),
       ('MB', 'class', 55, 3, 350),
       ('MB', 'class', 80, 3, 360),
       ('MB', 'class', 75, 3, 370),
       ('MB', 'class', 45, 3, 380),
       ('MB', 'class', 100, 3, 390),
       ('MB', 'class', 90, 3, 398),
       ('FG', 'class', 100, -3, 80),
       ('FG', 'class', 100, -2, 90),
       ('MB', 'office', 1, 9, 920),
       ('MB', 'office', 1, 9, 925),
       ('MB', 'office', 1, 9, 930),
       ('MB', 'office', 1, 9, 935),
       ('MB', 'office', 1, 9, 940),
       ('MB', 'office', 1, 9, 945),
       ('MB', 'office', 1, 9, 950),
       ('MB', 'office', 1, 9, 960),
       ('MB', 'office', 1, 10, 1020),
       ('MB', 'office', 1, 10, 1025),
       ('MB', 'office', 1, 10, 1030),
       ('MB', 'office', 1, 10, 1035),
       ('MB', 'office', 1, 10, 1040),
       ('MB', 'office', 1, 10, 1045),
       ('MB', 'office', 1, 10, 1050),
       ('MB', 'office', 3, 10, 1060),
       ('EV', 'office', 1, 3, 321),
       ('EV', 'office', 1, 3, 322),
       ('EV', 'office', 1, 3, 323),
       ('EV', 'office', 1, 3, 324),
       ('EV', 'office', 1, 3, 325),
       ('EV', 'office', 1, 3, 329),
       ('EV', 'office', 1, 3, 330),
       ('EV', 'office', 3, 3, 335),
       ('EV', 'office', 1, 4, 421),
       ('EV', 'office', 1, 4, 422),
       ('EV', 'office', 1, 4, 423),
       ('EV', 'office', 1, 4, 424),
       ('EV', 'office', 1, 4, 425),
       ('EV', 'office', 1, 4, 429),
       ('EV', 'office', 1, 4, 430),
       ('EV', 'office', 3, 4, 435),
       ('EV', 'office', 1, 5, 521),
       ('EV', 'office', 1, 5, 522),
       ('EV', 'office', 2, 5, 523),
       ('EV', 'office', 1, 5, 524),
       ('EV', 'office', 1, 5, 525),
       ('EV', 'office', 1, 5, 529),
       ('EV', 'office', 1, 5, 530),
       ('EV', 'office', 3, 5, 535);


INSERT INTO RoomOverhead
VALUES (1, 'projector'),
       (2, 'computers');

INSERT INTO RoomNeeds
VALUES ('H', 9, 940, 20, 2),
       ('H', 9, 900, 20, 2),
       ('H', 9, 901, 20, 2),
       ('H', 9, 903, 20, 2),
       ('H', 9, 905, 20, 2),
       ('H', 9, 900, 1, 1),
       ('H', 9, 901, 1, 1),
       ('H', 9, 903, 1, 1),
       ('H', 9, 905, 1, 1),
       ('EV', 5, 521, 1, 2),
       ('EV', 5, 522, 1, 2),
       ('EV', 5, 523, 1, 2),
       ('EV', 5, 524, 1, 2),
       ('EV', 5, 525, 1, 2),
       ('EV', 5, 529, 1, 2),
       ('EV', 5, 530, 1, 2),
       ('EV', 5, 535, 1, 2),
       ('MB', 10, 1025, 1, 2),
       ('MB', 10, 1060, 1, 2);

/* 1-50 are students, 51-63 are instructors, 64-73 are advisors*/
INSERT INTO Person(ssn, id, first_name, last_name, email, address, phone)
VALUES (399437700, 1, 'Lisa', 'Wood', 'mddallara@outlook.com', 1, '(403) 514-9924')
     , (889993771, 2, 'Amber', 'Cooper', 'dinther@verizon.net', 2, '(592) 897-0202')
     , (779332036, 3, 'Oscar', 'Howell', 'jlbaumga@verizon.net', 3, '(350) 923-6398')
     , (245007722, 4, 'Irvin', 'Collins', 'bflong@gmail.com', 4, '(830) 292-9556')
     , (645399011, 5, 'Roosevelt', 'Parsons', 'nighthawk@aol.com', 5, '(922) 438-2495')
     , (445761402, 6, 'Eugene', 'Greer', 'kimvette@aol.com', 6, '(448) 202-4787')
     , (616004712, 7, 'Gwen', 'Dunn', 'trygstad@me.com', 7, '(465) 977-5315')
     , (223680290, 8, 'Laurence', 'Mack', 'keijser@me.com', 8, '(641) 479-9069')
     , (453920929, 9, 'Sheldon', 'Walsh', 'mhouston@msn.com', 9, '(786) 344-0911')
     , (146344051, 10, 'Brandy', 'Harmon', 'michiel@yahoo.com', 10, '(208) 774-0062')
     , (157682678, 11, 'Jason', 'Bush', 'penna@yahoo.ca', 11, '(833) 702-8131')
     , (448602365, 12, 'Faith', 'Rhodes', 'evans@comcast.net', 12, '(438) 939-2912')
     , (309348312, 13, 'Victoria', 'Anderson', 'emmanuel@outlook.com', 13, '(758) 836-9762')
     , (635775881, 14, 'Chad', 'Mcgee', 'thaljef@yahoo.ca', 14, '(596) 727-9159')
     , (563383616, 15, 'Lauren', 'Singleton', 'mwitte@outlook.com', 15, '(731) 427-4268')
     , (891468783, 16, 'Joy', 'Cook', 'boser@yahoo.ca', 16, '(814) 404-9107')
     , (610091459, 17, 'Donnie', 'Lyons', 'thrymm@aol.com', 17, '(580) 454-4662')
     , (108906305, 18, 'Darla', 'Warren', 'stevelim@icloud.com', 18, '(912) 453-5668')
     , (667004396, 19, 'David', 'Goodwin', 'camenisch@gmail.com', 19, '(476) 246-3507')
     , (752713919, 20, 'Neil', 'Vargas', 'jipsen@outlook.com', 20, '(452) 251-8619')
     , (882108144, 21, 'Tracey', 'Reese', 'martyloo@verizon.net', 21, '(478) 734-4935')
     , (809493224, 22, 'Maryann', 'Valdez', 'jorgb@yahoo.ca', 22, '(250) 799-1843')
     , (814392875, 23, 'Henrietta', 'Daniels', 'chrisj@sbcglobal.net', 23, '(977) 945-9937')
     , (426299656, 24, 'Arlene', 'Ellis', 'dawnsong@icloud.com', 24, '(547) 296-5056')
     , (357320964, 25, 'Theodore', 'Adkins', 'thomasj@yahoo.ca', 25, '(679) 611-3155')
     , (881132104, 26, 'Bryan', 'Ballard', 'morain@verizon.net', 26, '(729) 868-0315')
     , (508203017, 27, 'Carrie', 'Castillo', 'dbanarse@optonline.net', 27, '(998) 310-3785')
     , (907806961, 28, 'Sean', 'Cobb', 'reziac@sbcglobal.net', 28, '(649) 827-4398')
     , (656597000, 29, 'Pat', 'Mccarthy', 'sisyphus@msn.com', 29, '(851) 528-9575')
     , (477176451, 30, 'Shelly', 'Boone', 'smpeters@outlook.com', 30, '(249) 627-9019')
     , (964663021, 31, 'Darin', 'Manning', 'darin@comcast.net', 31, '(511) 386-6187')
     , (249691790, 32, 'Guadalupe', 'Peters', 'nanop@yahoo.com', 32, '(492) 946-4252')
     , (665452486, 33, 'Isaac', 'Norman', 'mhouston@comcast.net', 33, '(607) 728-8791')
     , (481996433, 34, 'Jermaine', 'Carlson', 'cumarana@hotmail.com', 34, '(667) 469-0700')
     , (786482339, 35, 'Larry', 'Johnston', 'keijser@yahoo.com', 35, '(255) 292-9004')
     , (927819640, 36, 'Jim', 'Schmidt', 'juerd@outlook.com', 36, '(463) 366-6356')
     , (867304329, 37, 'Hilda', 'Fields', 'fallorn@me.com', 37, '(471) 219-1553')
     , (195238750, 38, 'Loretta', 'Rogers', 'tromey@sbcglobal.net', 38, '(239) 294-4463')
     , (934347739, 39, 'Eleanor', 'Mathis', 'tokuhirom@verizon.net', 39, '(709) 521-6059')
     , (246771994, 40, 'Ryan', 'Ward', 'treit@optonline.net', 40, '(395) 738-6557')
     , (403876313, 41, 'Velma', 'Ramsey', 'hikoza@hotmail.com', 41, '(965) 280-9438')
     , (683192608, 42, 'Emilio', 'Ryan', 'adillon@live.com', 42, '(234) 301-6725')
     , (635804780, 43, 'Percy', 'Garcia', 'nighthawk@optonline.net', 43, '(782) 573-6533')
     , (177921799, 44, 'William', 'Silva', 'amimojo@verizon.net', 44, '(794) 346-7807')
     , (965277745, 45, 'Alfredo', 'Tyler', 'haddawy@yahoo.com', 45, '(776) 644-3167')
     , (406932598, 46, 'Jill', 'Quinn', 'sisyphus@outlook.com', 46, '(657) 531-3968')
     , (204794691, 47, 'Bradley', 'Carr', 'ryanshaw@mac.com', 47, '(919) 326-5447')
     , (293904265, 48, 'Herbert', 'Paul', 'novanet@comcast.net', 48, '(245) 652-5496')
     , (373307205, 49, 'Katherine', 'Nichols', 'ehood@icloud.com', 49, '(617) 906-1699')
     , (295600928, 50, 'Nelson', 'Gregory', 'dieman@verizon.net', 50, '(969) 611-7919')
     , (254156867, 51, 'Mildred', 'Austin', 'tubesteak@msn.com', 51, '(713) 982-6756')
     , (803179891, 52, 'Raymond', 'Moreno', 'floxy@gmail.com', 52, '(974) 275-6290')
     , (394025466, 53, 'Phillip', 'Chapman', 'bjoern@sbcglobal.net', 53, '(614) 826-9918')
     , (226130537, 54, 'Sam', 'Ruiz', 'dkeeler@outlook.com', 54, '(330) 891-8718')
     , (206289429, 55, 'Alison', 'Hicks', 'eurohack@yahoo.com', 55, '(656) 711-7218')
     , (472665242, 56, 'Ivan', 'Shelton', 'khris@msn.com', 56, '(463) 962-8797')
     , (842440083, 57, 'Muriel', 'Fleming', 'rfisher@msn.com', 57, '(882) 676-4107')
     , (747652718, 58, 'Nadine', 'Wade', 'kosact@aol.com', 58, '(498) 455-5033')
     , (575933767, 59, 'Michael', 'Clarke', 'mavilar@sbcglobal.net', 59, '(223) 462-5346')
     , (415879768, 60, 'Bobby', 'Clayton', 'janusfury@mac.com', 60, '(996) 579-2594')
     , (330264593, 61, 'Greg', 'Horton', 'kourai@gmail.com', 61, '(529) 408-7982')
     , (817794537, 62, 'Simon', 'Gonzalez', 'simone@optonline.net', 62, '(663) 272-2620')
     , (477887758, 63, 'Lynn', 'Griffin', 'msloan@yahoo.ca', 63, '(682) 641-0701')
     , (772846507, 64, 'Cheryl', 'Wilson', 'milton@gmail.com', 64, '(265) 261-0469')
     , (332012250, 65, 'Erica', 'Ferguson', 'monkeydo@me.com', 65, '(462) 596-8712')
     , (502405693, 66, 'Hugh', 'Vaughn', 'arebenti@outlook.com', 66, '(813) 428-1066')
     , (813718676, 67, 'Geneva', 'Morgan', 'benanov@yahoo.ca', 67, '(498) 707-1947')
     , (565829795, 68, 'Eric', 'Mckenzie', 'anicolao@yahoo.ca', 68, '(647) 220-5384')
     , (904560284, 69, 'Shawna', 'Zimmerman', 'gozer@icloud.com', 69, '(498) 549-7404')
     , (430977343, 70, 'Annette', 'Ramirez', 'maratb@hotmail.com', 70, '(745) 677-9130')
     , (195731807, 71, 'Irving', 'Goodman', 'rtanter@yahoo.ca', 71, '(880) 839-1310')
     , (269828604, 72, 'Mathew', 'Glover', 'wiseb@outlook.com', 72, '(489) 434-5259')
     , (195310678, 73, 'Johnny', 'Bryant', 'skajan@gmail.com', 73, '(774) 739-3054')
     , (000000000, 74, 'Dummy', 'Person', NULL, NULL, NULL)
     , (111111111, 75, 'Mohammad', 'Qalam', 'mqalam@hotmail.com', 73, '(111) 222-1213')
     , (222222222, 76, 'Myckael', 'Walther', 'mycka@outlook.com', 71, '(222) 222-1213')
     , (333333333, 77, 'Gwen', 'Legate', 'glega@outlook.com', 70, '(333) 222-1213');



INSERT INTO Student(ssn)
VALUES (399437700) -- 1
     , (889993771)
     , (779332036)
     , (245007722)
     , (645399011) -- 5
     , (445761402)
     , (616004712)
     , (223680290)
     , (453920929)
     , (146344051) -- 10
     , (157682678)
     , (448602365)
     , (309348312)
     , (635775881)
     , (563383616) -- 15
     , (891468783)
     , (610091459)
     , (108906305)
     , (667004396)
     , (752713919) -- 20
     , (882108144)
     , (809493224)
     , (814392875)
     , (426299656)
     , (357320964) -- 25
     , (881132104)
     , (508203017)
     , (907806961)
     , (656597000)
     , (477176451) -- 30
     , (964663021)
     , (249691790)
     , (665452486)
     , (481996433)
     , (786482339) -- 35
     , (927819640)
     , (867304329)
     , (195238750)
     , (934347739)
     , (246771994) -- 40
     , (403876313)
     , (683192608)
     , (635804780)
     , (177921799)
     , (965277745) -- 45
     , (406932598)
     , (204794691)
     , (293904265)
     , (373307205)
     , (295600928);-- 50

INSERT INTO Employee(ssn, retired, office_building_abbreviation, office_room_floor, office_room_number)
VALUES (254156867, 0, 'EV', 3, 321)
     , (803179891, 0, 'EV', 3, 322)
     , (394025466, 0, 'EV', 3, 323)
     , (226130537, 0, 'EV', 3, 324)
     , (206289429, 0, 'EV', 3, 325)
     , (472665242, 0, 'EV', 3, 329)
     , (842440083, 0, 'EV', 3, 330)
     , (747652718, 0, 'EV', 3, 335)
     , (575933767, 0, 'EV', 4, 421)
     , (415879768, 0, 'EV', 4, 422)
     , (330264593, 0, 'EV', 4, 423)
     , (817794537, 0, 'EV', 4, 424)
     , (477887758, 0, 'EV', 4, 425)
     , (772846507, 0, 'EV', 4, 429)
     , (332012250, 0, 'EV', 4, 430)
     , (502405693, 0, 'EV', 4, 435)
     , (813718676, 0, 'EV', 5, 521)
     , (565829795, 0, 'EV', 5, 522)
     , (904560284, 0, 'EV', 5, 523)
     , (430977343, 0, 'EV', 5, 524)
     , (195731807, 0, 'EV', 5, 525)
     , (269828604, 0, 'EV', 5, 529)
     , (195310678, 0, 'EV', 5, 530)
     , (000000000, 0, NULL, NULL, NULL)
     , (111111111, 0, 'EV', 5, 535)
     , (222222222, 0, 'EV', 5, 523)
     , (333333333, 0, 'EV', 5, 535);
;


INSERT INTO UGradStudents
VALUES (399437700)
     , (889993771)
     , (645399011)
     , (157682678)
     , (635775881)
     , (563383616)
     , (610091459)
     , (108906305)
     , (667004396)
     , (752713919)
     , (373307205)
     , (295600928);


INSERT INTO Instructor
VALUES (254156867, 3, TRUE), /* 1 - 51 */
       (803179891, 3, TRUE), /* 2 - 52 */
       (394025466, 9, TRUE), /* 3 - 53 */
       (226130537, 1, FALSE), /* 4 - 54 */
       (206289429, 8, TRUE), /* 5 - 55 */
       (472665242, 10, TRUE), /* 6 - 56 */
       (842440083, 4, TRUE), /* 7 - 57 */
       (747652718, 7, FALSE), /* 8 - 58 */
       (575933767, 2, FALSE), /* 9 - 59 */
       (415879768, 8, TRUE), /* 10 - 60 */
       (330264593, 5, TRUE), /* 11 - 61 */
       (817794537, 7, TRUE), /* 12 - 62 */
       (477887758, 6, TRUE), /* 13 - 63 */
       (000000000, 1, FALSE),
       (111111111, 3, FALSE),
       (222222222, 3, FALSE),
       (333333333, 3, TRUE);

UPDATE Department SET chairman_ssn = 254156867 WHERE id = 3;
UPDATE Department SET chairman_ssn = 394025466 WHERE id = 9;
UPDATE Department SET chairman_ssn = 226130537 WHERE id = 1;
UPDATE Department SET chairman_ssn = 206289429 WHERE id = 8;
UPDATE Department SET chairman_ssn = 472665242 WHERE id = 10;
UPDATE Department SET chairman_ssn = 842440083 WHERE id = 4;
UPDATE Department SET chairman_ssn = 330264593 WHERE id = 5;
UPDATE Department SET chairman_ssn = 575933767 WHERE id = 2;
UPDATE Department SET chairman_ssn = 747652718 WHERE id = 7;
UPDATE Department SET chairman_ssn = 477887758 WHERE id = 6;


INSERT INTO Advisor(ssn)
VALUES (772846507) /* 1 - 64 */
     , (332012250)
     , (502405693)
     , (813718676)
     , (565829795)
     , (904560284)
     , (430977343)
     , (195731807)
     , (269828604)
     , (195310678); /* 10 - 73 */

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
       (18, 'Computer Systems Graduate', 'graduate', 44, 3, 772846507),
       (19, 'Computer Science Undergraduate', 'undergraduate', 90, 3, 813718676),
       (20, 'Computer Science Graduate', 'graduate', 44, 3, 269828604),
       (21, 'Computer Engineering Undergraduate', 'undergraduate', 90, 1, 772846507),
       (22, 'Computer Engineering Graduate', 'graduate', 44, 1, 772846507),
       (23, 'Software Engineering Undergraduate', 'undergraduate', 90, 4, 813718676),
       (24, 'Software Engineering Graduate', 'graduate', 44, 4, 813718676),
       (25, 'Electrical Engineering Undergraduate', 'undergraduate', 90, 7, 904560284),
       (26, 'Electrical Engineering Graduate', 'graduate', 44, 7, 904560284),
       (27, 'General Engineering Undergraduate', 'undergraduate', 90, 11, NULL),
       (28, 'General Engineering Graduate', 'graduate', 44, 11, NULL),
       (29, 'Applied Computer Science Graduate', 'graduate', 50, 3, 904560284);


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
    (23, 'COMP353'),
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
       (809493224, 'thesis', 254156867),
       (814392875, 'thesis', 111111111),
       (426299656, 'thesis', 803179891),
       (357320964, 'thesis', 803179891),
       (881132104, 'thesis', 222222222),
       (508203017, 'thesis', 803179891),
       (907806961, 'thesis', 803179891),
       (656597000, 'thesis', 333333333),
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
VALUES (1, 'granted', 814392875, 1, 2018, 'fall'),
       (2, 'granted', 964663021, 2, 2018, 'fall'),
       (3, 'granted', 881132104, 3, 2018, 'fall'),
       (4, 'granted', 656597000, 4, 2018, 'fall'),
       (5, 'denied', 195238750, 2, 2018, 'winter'),
       (6, 'denied', 964663021, 4, 2018, 'fall'),
       (7, 'denied', 477176451, 1, 2018, 'fall'),
       (8, 'denied', 477176451, 2, 2019, 'winter'),
       (9, 'denied', 477176451, 3, 2017, 'fall'),
       (10, 'denied', 477176451, 4, 2018, 'summer'),
       (11, 'denied', 426299656, 3, 2018, 'fall'),
       (12, 'granted', 177921799, 7, 2018, 'fall'),
       (13, 'granted', 245007722, 6, 2018, 'fall'),
       (14, 'applied', 965277745, 5, 2018, 'summer'),
       (15, 'applied', 453920929, 5, 2018, 'fall'),
       (16, 'denied', 146344051, 6, 2018, 'winter'),
       (17, 'denied', 907806961, 6, 2018, 'fall'),
       (18, 'denied', 882108144, 6, 2018, 'fall'),
       (19, 'applied', 448602365, 8, 2018, 'fall'),
       (20, 'applied', 779332036, 8, 2018, 'fall'),
       (21, 'applied', 445761402, 8, 2018, 'winter'),
       (22, 'applied', 453920929, 8, 2018, 'fall'),
       (23, 'granted', 814392875, 9, 2018, 'summer'),
       (24, 'denied', 406932598, 9, 2018, 'fall'),
       (25, 'denied', 635804780, 10, 2018, 'summer');


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

INSERT INTO TermToNumber
VALUES ('winter', 0),
       ('summer', 1),
       ('fall', 2),
       ('fall/winter', 3);

INSERT INTO Section
VALUES (1, 'AAA', 'COMP353', 'lecture', 'M, W', '14:45:00', '17:30:00', 'summer', '2018', 254156867, 'H', 5,
        535)
     , (2, 'BBB', 'COMP353', 'lecture', 'Tu, Th', '13:45:00', '15:00:00', 'fall', '2018', 254156867, 'H', 4,
        420)
     , (3, 'CCC', 'COMP353', 'lecture', 'M, F', '9:45:00', '11:00:00', 'winter', '2018', 803179891, 'H', 5,
        520)
     , (4, 'AAT', 'COMP353', 'tutorial', 'M, W', '13:15:00', '14:05:00', 'summer', '2018', 254156867, 'H', 5,
        503)
     , (5, 'BBTY', 'COMP353', 'tutorial', 'Tu', '9:15:00', '10:05:00', 'fall', '2018', 254156867, 'H', 5,
        520)
     , (6, 'BBTX', 'COMP353', 'tutorial', 'Th', '9:15:00', '10:05:00', 'fall', '2018', 254156867, 'H', 6,
        603)
     , (7, 'CCTX', 'COMP353', 'tutorial', 'M', '11:15:00', '13:05:00', 'winter', '2018', 803179891, 'H', 5,
        505)
     , (8, 'CCTY', 'COMP353', 'tutorial', 'F', '11:15:00', '13:05:00', 'winter', '2018', 803179891, 'H', 5,
        505)
     , (9, 'AAL', 'COMP353', 'lab', 'M, W', '8:45:00', '10:30:00', 'summer', '2018', 254156867, 'H', 9, 903)
     , (10, 'BBL', 'COMP353', 'lab', 'Th', '15:45:00', '17:30:00', 'fall', '2018', 254156867, 'H', 9, 907)
     , (11, 'CCL', 'COMP353', 'lab', 'F', '14:45:00', '17:30:00', 'winter', '2018', 803179891, 'H', 9, 903)
     , (12, 'AAA', 'COMP352', 'lecture', 'W, F', '14:45:00', '17:30:00', 'summer', '2018', 803179891, 'H', 5,
        520)
     , (13, 'BBB', 'COMP352', 'lecture', 'M, W', '13:00:00', '14:15:00', 'summer', '2018', 254156867, 'H', 5,
        535)
     , (14, 'CCC', 'COMP352', 'lecture', 'M, W', '9:45:00', '11:00:00', 'summer', '2018', 111111111, 'H', 4,
        435)
     , (15, 'AATX', 'COMP352', 'tutorial', 'W, F', '8:45:00', '9:30:00', 'summer', '2018', 803179891, 'H', 4,
        409)
     , (16, 'AATY', 'COMP352', 'tutorial', 'W, F', '8:45:00', '9:30:00', 'summer', '2018', 803179891, 'H', 5,
        504)
     , (17, 'BBTX', 'COMP352', 'tutorial', 'Tu', '8:45:00', '9:30:00', 'fall', '2018', 254156867, 'H', 6,
        609)
     , (18, 'BBTY', 'COMP352', 'tutorial', 'W', '15:45:00', '17:30:00', 'fall', '2018', 254156867, 'H', 5,
        503)
     , (19, 'CCTX', 'COMP352', 'tutorial', 'W', '15:45:00', '17:30:00', 'fall/winter', '2018', 254156867,
        'MB', 3, 321)
     , (20, 'CCTY', 'COMP352', 'tutorial', 'Th', '11:45:00', '13:30:00', 'fall/winter', '2018', 254156867,
        'H', 5, 504)
     , (21, 'AAA', 'SOEN341', 'lecture', 'W, F', '8:45:00', '10:00:00', 'fall', '2018', 842440083, 'FG', -3,
        80)
     , (22, 'AATX', 'SOEN341', 'tutorial', 'F', '12:00:00', '12:50:00', 'fall', '2018', 842440083, 'MB', 3,
        321)
     , (23, 'AATY', 'SOEN341', 'tutorial', 'F', '10:00:00', '10:50:00', 'fall', '2018', 842440083, 'MB', 3,
        325)
     , (24, 'AAA', 'SOEN342', 'lecture', 'Tu, Th', '10:00:00', '12:15:00', 'fall', '2018', 842440083, 'H', 4,
        435)
     , (25, 'AATX', 'SOEN342', 'tutorial', 'Th', '9:00:00', '9:45:00', 'fall', '2018', 842440083, 'H', 5,
        504)
     , (26, 'AATY', 'SOEN342', 'tutorial', 'Tu', '12:30:00', '13:20:00', 'fall', '2018', 842440083, 'H', 6,
        603)
     , (27, 'AAA', 'SOEN343', 'lecture', 'M, W', '10:45:00', '12:00:00', 'fall', '2018', 842440083, 'H', 5,
        520)
     , (28, 'AATX', 'SOEN343', 'tutorial', 'M, W', '12:15:00', '13:05:00', 'fall', '2018', 842440083, 'H', 4,
        408)
     , (29, 'AATY', 'SOEN343', 'tutorial', 'M, W', '13:15:00', '14:05:00', 'fall', '2018', 842440083, 'H', 4,
        408)
     , (30, 'AAA', 'COEN345', 'lecture', 'Tu, Th', '13:15:00', '14:30:00', 'winter', '2018', 226130537, 'H',
        5, 520)
     , (31, 'AATX', 'COEN345', 'tutorial', 'Tu', '14:30:00', '15:20:00', 'winter', '2018', 226130537, 'H', 6,
        609)
     , (32, 'AATY', 'COEN345', 'tutorial', 'Th', '14:30:00', '15:20:00', 'winter', '2018', 226130537, 'H', 4,
        409)
     , (33, 'AAL', 'COEN345', 'lab', 'F', '8:45:00', '10:15:00', 'winter', '2018', 226130537, 'H', 9, 907)
     , (34, 'AAA', 'ELEC331', 'lecture', 'M, W', '13:15:00', '14:30:00', 'winter', '2018', 747652718, 'FG',
        -2, 90)
     , (35, 'AAT', 'ELEC331', 'tutorial', 'M', '10:15:00', '12:05:00', 'winter', '2018', 747652718, 'H', 4,
        405)
     , (36, 'AAL', 'ELEC331', 'lab', 'Tu', '16:00:00', '18:30:00', 'winter', '2018', 747652718, 'H', 9, 903)
     , (37, 'AAA', 'ELEC251', 'lecture', 'Tu, Th', '15:15:00', '17:30:00', 'fall', '2018', 817794537, 'H', 4,
        420)
     , (38, 'AAT', 'ELEC251', 'tutorial', 'Th', '17:45:00', '18:35:00', 'fall', '2018', 817794537, 'H', 4,
        409)
     , (39, 'AAA', 'CHEM325', 'lecture', 'M', '18:00:00', '20:30:00', 'winter', '2018', 330264593, 'MB', 2,
        230)
     , (40, 'AAL', 'CHEM325', 'lab', 'W', '18:30:00', '22:30:00', 'winter', '2018', 330264593, 'H', 9, 900)
     , (41, 'AAA', 'ECON221', 'lecture', 'Tu, Th', '8:45:00', '10:00:00', 'fall', '2018', 394025466, 'H', 4,
        420)
     , (42, 'BBB', 'ECON221', 'lecture', 'Su', '16:15:00', '16:30:00', 'winter', '2018', 394025466, 'H',
        5, 535)
     , (43, 'AAA', 'ECON222', 'lecture', 'Tu, Th', '16:15:00', '17:30:00', 'fall', '2018', 394025466, 'H', 4,
        435)
     , (44, 'BBB', 'ECON222', 'lecture', 'Tu, Th', '8:45:00', '9:00:00', 'winter', '2018', 394025466, 'H',
        4, 420)
     , (45, 'AAA', 'MATH209', 'lecture', 'W, F', '10:15:00', '11:30:00', 'fall', '2018', 206289429, 'H', 4,
        420)
     , (46, 'BBB', 'MATH209', 'lecture', 'Sa', '19:00:00', '19:30:00', 'winter', '2018', 415879768, 'H', 5,
        520)
     , (47, 'CCC', 'MATH209', 'lecture', 'W, F', '11:45:00', '13:15:00', 'summer', '2018', 817794537, 'H', 4,
        435)
     , (48, 'AAA', 'ENGL233', 'lecture', 'Tu, Th', '8:45:00', '10:00:00', 'winter', '2018', 477887758, 'H',
        5, 520)
     , (49, 'BBB', 'ENGL233', 'lecture', 'W, F', '13:45:00', '15:00:00', 'fall', '2018', 477887758, 'H', 4,
        435)
     , (50, 'AAA', 'PSYC255', 'lecture', 'M, W', '14:00:00', '16:30:00', 'summer', '2018', 472665242, 'H', 4,
        420)
     , (51, 'AAA', 'PHYS334', 'lecture', 'Sa', '12:45:00', '13:00:00', 'winter', '2018', 575933767, 'H', 5,
        520)
     , (52, 'AAT', 'PHYS334', 'tutorial', 'W', '10:00:00', '10:50:00', 'winter', '2018', 575933767, 'H', 5,
        505)
     , (53, 'AAL', 'PHYS393', 'lab', 'Th', '14:30', '17:30:00', 'winter', '2018', 575933767, 'H', 9, 907)
     , (54, 'QQQ', 'COMP352', 'lecture', 'W, F', '14:45:00', '17:30:00', 'summer', '2018', 222222222, 'MB', 3,
        390)
     , (55, 'QQTX', 'COMP352', 'tutorial', 'Tu', '8:45:00', '9:30:00', 'fall', '2017', 803179891, 'H', 6,
        609)
     , (56, 'QQQ', 'ELEC331', 'lecture', 'M, W', '13:15:00', '14:30:00', 'winter', '2017', 747652718, 'FG',
        -2, 90)
     , (57, 'QQT', 'ELEC331', 'tutorial', 'M', '10:15:00', '12:05:00', 'winter', '2017', 747652718, 'H', 4,
        405)
     , (58, 'QQL', 'ELEC331', 'lab', 'Tu', '16:00:00', '18:30:00', 'winter', '2017', 747652718, 'H', 9, 903)
     , (59, 'QQQ', 'SOEN341', 'lecture', 'W, F', '8:45:00', '10:00:00', 'winter', '2017', 842440083, 'FG',
        -3, 80)
     , (60, 'QQTX', 'SOEN341', 'tutorial', 'F', '12:00:00', '12:50:00', 'winter', '2017', 842440083, 'MB', 3,
        321)
     , (61, 'RQW', 'COMP352', 'lecture', 'F', '14:00:00', '15:00:00', 'summer', '2018', 333333333, 'MB', 3,
        380)
     , (62, 'RQA', 'COMP352', 'lecture', 'W', '14:00:00', '15:00:00', 'summer', '2017', 333333333, 'H', 5,
        520)
     , (63, 'CBB', 'COMP352', 'lecture', 'M, W', '9:45:00', '11:00:00', 'winter', '2018', 111111111, 'H', 4,
        435)
     , (64, 'CBA', 'COMP352', 'lecture', 'M, W', '9:45:00', '11:00:00', 'fall', '2018', 111111111, 'H', 4,
        435)
     , (65, 'BCL', 'COMP353', 'lab', 'Th', '12:45:00', '14:30:00', 'fall', '2018', 254156867, 'H', 9, 907);


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


INSERT INTO SectionEnrollment VALUE (41, 889993771, 'C+')
    , (45, 889993771, 'A-')
    , (48, 889993771, 'B')
    , (12, 399437700, 'B+')
    , (15, 399437700, 'B+')
    , (2, 399437700, 'FNS')
    , (5, 399437700, 'FNS')
    , (10, 399437700, 'FNS')
    , (3, 399437700, 'B')
    , (7, 399437700, 'B')
    , (11, 399437700, 'B')
    , (34, 779332036, 'C-')
    , (35, 779332036, 'C-')
    , (36, 779332036, 'C-')
    , (54, 245007722, 'B+')
    , (55, 245007722, 'B+')
    , (56, 245007722, 'B')
    , (57, 245007722, 'B')
    , (58, 245007722, 'B')
    , (59, 245007722, 'B+')
    , (60, 245007722, 'B+')
    , (30, 245007722, 'A')
    , (31, 245007722, 'A')
    , (33, 245007722, 'A')
    , (54, 645399011, 'C+')
    , (55, 645399011, 'C+')
    , (21, 645399011, 'B+')
    , (22, 645399011, 'B+')
    , (24, 645399011, 'A')
    , (25, 645399011, 'A')
    , (27, 645399011, 'A-')
    , (28, 645399011, 'A-')
    , (13, 445761402, 'A+')
    , (17, 445761402, 'A+')
    , (3, 445761402, 'A+')
    , (7, 445761402, 'A+')
    , (11, 445761402, 'A+')
    , (14, 616004712, 'A+')
    , (20, 616004712, 'A+')
    , (41, 223680290, 'A-')
    , (44, 223680290, 'A-')
    , (54, 453920929, 'B-')
    , (55, 453920929, 'B-')
    , (2, 453920929, 'B+')
    , (5, 453920929, 'B+')
    , (10, 453920929, 'B+')
    , (21, 453920929, 'A')
    , (23, 453920929, 'A')
    , (45, 146344051, 'A-')
    , (45, 157682678, 'A')
    , (51, 157682678, 'A+')
    , (52, 157682678, 'A+')
    , (53, 157682678, 'A+')
    , (54, 448602365, 'B-')
    , (55, 448602365, 'B-')
    , (56, 448602365, 'A')
    , (57, 448602365, 'A')
    , (58, 448602365, 'A')
    , (59, 448602365, 'B')
    , (60, 448602365, 'B')
    , (51, 309348312, 'A')
    , (52, 309348312, 'A')
    , (54, 635775881, 'C')
    , (55, 635775881, 'C')
    , (56, 635775881, 'C')
    , (57, 635775881, 'C')
    , (58, 635775881, 'C')
    , (59, 635775881, 'A')
    , (60, 635775881, 'A')
    , (30, 635775881, 'B+')
    , (31, 635775881, 'B+')
    , (33, 635775881, 'B+')
    , (39, 563383616, 'B')
    , (40, 563383616, 'B')
    , (12, 891468783, 'A+')
    , (15, 891468783, 'A+')
    , (3, 891468783, 'B')
    , (8, 891468783, 'B')
    , (11, 891468783, 'B')
    , (50, 610091459, 'C')
    , (42, 108906305, 'B+')
    , (48, 108906305, 'B')
    , (46, 667004396, 'B+')
    , (39, 752713919, 'A')
    , (40, 752713919, 'A')
    , (54, 882108144, 'A-')
    , (55, 882108144, 'A-')
    , (21, 882108144, 'B')
    , (22, 882108144, 'B')
    , (24, 882108144, 'A-')
    , (25, 882108144, 'A-')
    , (27, 882108144, 'A-')
    , (28, 882108144, 'A-')
    , (54, 809493224, 'A+')
    , (55, 809493224, 'A+')
    , (2, 809493224, 'A+')
    , (6, 809493224, 'A+')
    , (10, 809493224, 'A+')
    , (45, 814392875, 'A+')
    , (12, 426299656, 'A')
    , (15, 426299656, 'A')
    , (2, 426299656, 'A')
    , (5, 426299656, 'A')
    , (10, 426299656, 'A')
    , (12, 357320964, 'A+')
    , (15, 357320964, 'A+')
    , (3, 357320964, 'A+')
    , (8, 357320964, 'A+')
    , (11, 357320964, 'A+')
    , (54, 881132104, 'C+')
    , (55, 881132104, 'C+')
    , (21, 881132104, 'A')
    , (22, 881132104, 'A')
    , (24, 881132104, 'A-')
    , (25, 881132104, 'A-')
    , (27, 881132104, 'A')
    , (28, 881132104, 'A')
    , (34, 508203017, 'B+')
    , (35, 508203017, 'B+')
    , (36, 508203017, 'B+')
    , (54, 907806961, 'A')
    , (55, 907806961, 'A')
    , (12, 656597000, 'A+')
    , (15, 656597000, 'A+')
    , (3, 656597000, 'A+')
    , (7, 656597000, 'A+')
    , (11, 656597000, 'A+')
    , (48, 477176451, 'B+')
    , (54, 964663021, 'A')
    , (55, 964663021, 'A')
    , (54, 249691790, 'B+')
    , (55, 249691790, 'B+')
    , (12, 665452486, 'A+')
    , (15, 665452486, 'A+')
    , (2, 665452486, 'A+')
    , (5, 665452486, 'A+')
    , (10, 665452486, 'A+')
    , (54, 481996433, 'A')
    , (55, 481996433, 'A')
    , (56, 481996433, 'A-')
    , (57, 481996433, 'A-')
    , (58, 481996433, 'A-')
    , (59, 481996433, 'B')
    , (60, 481996433, 'B')
    , (30, 481996433, 'B')
    , (32, 481996433, 'B')
    , (33, 481996433, 'B')
    , (54, 786482339, 'A')
    , (55, 786482339, 'A')
    , (56, 786482339, 'A')
    , (57, 786482339, 'A')
    , (58, 786482339, 'A')
    , (59, 786482339, 'A')
    , (60, 786482339, 'A')
    , (30, 786482339, 'A')
    , (31, 786482339, 'A')
    , (33, 786482339, 'A')
    , (54, 927819640, 'A')
    , (55, 927819640, 'A')
    , (21, 927819640, 'A')
    , (22, 927819640, 'A')
    , (24, 927819640, 'A')
    , (25, 927819640, 'A')
    , (27, 927819640, 'A')
    , (28, 927819640, 'A')
    , (54, 867304329, 'B-')
    , (55, 867304329, 'B-')
    , (2, 867304329, 'A+')
    , (6, 867304329, 'A+')
    , (10, 867304329, 'A+')
    , (54, 195238750, 'A+')
    , (55, 195238750, 'A+')
    , (2, 195238750, 'A-')
    , (7, 195238750, 'A-')
    , (10, 195238750, 'A-')
    , (54, 934347739, 'A+')
    , (55, 934347739, 'A+')
    , (34, 934347739, 'A+')
    , (35, 934347739, 'A+')
    , (36, 934347739, 'A+')
    , (59, 934347739, 'A+')
    , (60, 934347739, 'A+')
    , (30, 934347739, 'A+')
    , (31, 934347739, 'A+')
    , (33, 934347739, 'A+')
    , (46, 934347739, 'A+')
    , (51, 934347739, 'A+')
    , (42, 934347739, 'A+')
    , (54, 246771994, 'B')
    , (55, 246771994, 'B')
    , (34, 403876313, 'A')
    , (35, 403876313, 'A')
    , (36, 403876313, 'A')
    , (41, 683192608, 'B+')
    , (44, 683192608, 'A-')
    , (50, 635804780, 'A+')
    , (39, 177921799, 'A-')
    , (40, 177921799, 'A-')
    , (54, 965277745, 'A+')
    , (55, 965277745, 'A+')
    , (56, 965277745, 'A+')
    , (57, 965277745, 'A+')
    , (58, 965277745, 'A+')
    , (59, 965277745, 'A+')
    , (60, 965277745, 'A+')
    , (30, 965277745, 'A+')
    , (32, 965277745, 'A+')
    , (33, 965277745, 'A+')
    , (51, 406932598, 'A')
    , (52, 406932598, 'A')
    , (53, 406932598, 'B-')
    , (54, 204794691, 'B-')
    , (55, 204794691, 'B-')
    , (2, 204794691, 'A-')
    , (7, 204794691, 'A-')
    , (10, 204794691, 'A-')
    , (12, 293904265, 'A-')
    , (15, 293904265, 'A-')
    , (2, 293904265, 'B')
    , (5, 293904265, 'B')
    , (10, 293904265, 'B')
    , (54, 373307205, 'B+')
    , (55, 373307205, 'B+')
    , (56, 373307205, 'A')
    , (57, 373307205, 'A')
    , (58, 373307205, 'A')
    , (59, 373307205, 'B')
    , (60, 373307205, 'B')
    , (30, 373307205, 'B+')
    , (32, 373307205, 'B+')
    , (33, 373307205, 'B+');

INSERT INTO TAPosition VALUES (4, 'TA', 35, 882108144, 1000)
       ,(9, 'Lab Instructor', 90, 882108144, 1000)
       ,(1, 'marker', 65, 814392875, 1000)
       ,(2, 'marker', 65, 814392875, 1000)
       ,(7, 'TA', 25, 881132104, 1000)
       ,(6, 'TA', 25, 616004712, 1000)
       ,(10, 'Lab Instructor', 50, 616004712, 1000)
       ,(8, 'TA', 25, 445761402, 1000)
       ,(15, 'TA', 25, 964663021, 1200)
       ,(19, 'TA', 25, 964663021, 1200)
       ,(32, 'TA', 25, 964663021, 1200)
       ,(12, 'marker', 65, 934347739, 1000)
       ,(16, 'TA', 50, 934347739, 1000)
       ,(17, 'TA', 35, 786482339, 1000)
       ,(21, 'marker', 90, 786482339, 1300)
       ,(18, 'TA', 35, 809493224, 1000)
       ,(23, 'TA', 25, 809493224, 1000)
       ,(13, 'marker', 90, 867304329, 2000)
       ,(26, 'TA', 30, 867304329, 1000)
       ,(20, 'TA', 25, 477176451, 1000)
       ,(22, 'TA', 25, 477176451, 100)
       ,(14, 'marker', 90, 907806961, 1000)
       ,(29, 'TA', 25, 907806961, 1000)
       ,(25, 'TA', 30, 426299656, 1000)
       ,(5, 'TA', 25, 357320964, 1000)
       ,(24, 'marker', 30, 357320964, 1000)
       ,(27, 'marker', 30, '814392875', 1000)
       ,(28, 'TA', 80, 508203017, 1000)
       ,(30, 'marker', 80, 508203017, 1000)
       ,(31, 'TA', 30, 656597000, 1000)
       ,(33, 'Lab Instructor', 45, 293904265, 1000)
       ,(34, 'marker', 30, 448602365, 1000)
       ,(35, 'TA', 30, 448602365, 1000)
       ,(36, 'Lab Instructor', 30, 245007722, 1000)
       ,(38, 'TA', 25, 245007722, 1000)
       ,(58, 'Lab Instructor', 25, 245007722, 1000)
       ,(37, 'marker', 80, 403876313, 1050)
       ,(39, 'marker', 100, 406932598, 1000)
       ,(40, 'Lab Instructor', 100, 406932598, 1000)
       ,(41, 'marker', 110, 683192608, 1000)
       ,(42, 'marker', 110, 683192608, 1000)
       ,(43, 'marker', 110, 445761402, 1000)
       ,(44, 'marker', 110, 445761402, 1000)
       ,(45, 'marker', 120, 309348312, 1000)
       ,(46, 'marker', 120, 204794691, 1000)
       ,(47, 'marker', 120, 309348312, 1000)
       ,(48, 'marker', 90, 635804780, 1000)
       ,(49, 'marker', 90, 635804780, 1000)
       ,(50, 'marker', 80, 146344051, 1000)
       ,(52, 'TA', 30, 177921799, 1000)
       ,(53, 'Lab Instructor', 30, 177921799, 900)
       ,(51, 'marker', 90, 965277745, 1000)
       ,(54, 'marker', 65, 249691790, 1000)
       ,(55, 'TA', 30, 249691790, 1100)
       ,(61, 'marker', 65, 249691790, 1000)
       ,(56, 'marker', 30, 665452486, 1000)
       ,(57, 'TA', 30, 665452486, 1000)
       ,(59, 'marker', 90, 927819640, 1000)
       ,(60, 'TA', 25, 927819640, 1000)
       ,(65, 'Lab Instructor', 40, 293904265, 2000);

INSERT INTO Experience
VALUES (254156867, 'Electrical Technician', 'Concordia University', '2011-09-22', '2015-09-04'),
       (803179891, 'Teacher Assistant', 'McGill', '2017-08-01', '2017-09-30'),
       (394025466, 'Manager', 'Ford Motor', '2015-03-02', '2017-09-05'),
       (226130537, 'Engineer', 'Schindler', '1993-09-08', '1999-09-01'),
       (206289429, 'Coordinator', 'Gasprom', '1975-07-05', '2007-11-11'),
       (472665242, 'Business Owner', 'Matrinox', '1983-09-04', '2000-01-01'),
       (842440083, 'Assistant Professor', 'Oxford University', '2016-01-09', '2019-03-02'),
       (747652718, 'Developer', 'Uber', '2016-02-20', '2017-09-09'),
       (575933767, 'Seller', 'Pfizer', '2003-04-03', '2005-02-21'),
       (415879768, 'Biomedical Development', 'Aventis', '2001-09-23', '2014-04-01'),
       (330264593, 'Researcher', 'Kroger', '1999-12-29', '2001-09-01'),
       (817794537, 'Coordinator', 'Sears', '2011-10-10', '2019-05-09'),
       (477887758, 'Teacher Assistant', 'University of Washington', '2015-04-07', '2018-01-01'),
       (772846507, 'Engineer', 'Air France', '1992-11-11', '1998-08-12'),
       (332012250, 'Assistant Professor', 'University of Toronto', '2007-07-07', '2014-12-23'),
       (502405693, 'Engineer', 'Embraer', '2009-08-09', '2009-12-31'),
       (813718676, 'Manager', 'Aldo', '2017-08-23', '2017-12-02'),
       (565829795, 'Engineer', 'ElectroMac', '2008-08-09', '2018-09-08'),
       (904560284, 'Lab Assistant', 'Essess University', '2008-11-11', '2009-09-12'),
       (430977343, 'Teacher Assistant', 'ZTH', '2002-02-09', '2005-11-13'),
       (195731807, 'Military Reserve', 'Canadian Army', '2015-12-12', '2016-07-09'),
       (269828604, 'Manager', 'Toyota', '2001-09-04', '2008-09-09'),
       (195310678, 'Engineer', 'STM', '2012-01-16', '2016-09-09');


INSERT INTO Publications
VALUES (254156867, 'conference', '1991-01-03', 'Q-Bits, soon a reality!', 'Akashic'),
       (803179891, 'conference', '1991-10-02', 'New Species soon extinct', 'Dzanc'),
       (394025466, 'journal', '1992-01-29', 'VHDL, Verilog and Others', 'McSweeney'),
       (226130537, 'journal', '1993-11-25', 'Thinking and questioning, the step toward the new philosophy', 'Folio'),
       (206289429, 'conference', '1994-02-01', 'ANOVA Enhanced', 'McGraw Hill'),
       (472665242, 'journal', '1997-04-11', 'Not new, but still used extensively, 68K', 'Deitel'),
       (842440083, 'conference', '1999-07-23', 'Artificial Intelligence not for yesterday', 'Phaidon'),
       (747652718, 'journal', '1999-10-13', 'Energy Consumption, not the whole story', 'Concordia University'),
       (575933767, 'conference', '1999-11-18', 'Ignore me, Ignore yourself', 'Century'),
       (415879768, 'conference', '2001-05-24', 'Vikings, the real first', 'Freikr'),
       (330264593, 'conference', '2003-01-29', 'China, the truth behind centuries of domination', 'Twainer'),
       (817794537, 'conference', '2003-07-19', 'Moore s Law is it really the end?', 'Bakeena'),
       (477887758, 'journal', '2003-07-28', 'Women vs Men, who wins what?', 'prakvist'),
       (772846507, 'journal', '2004-02-17', 'Metallurgy, the start of the industrial revolution', 'Vlotriv'),
       (332012250, 'conference', '2004-06-18', 'A mouse, how has is been?', 'Bird'),
       (502405693, 'conference', '2005-07-12', 'Six Sigma, the real deal', 'McGraw Hill'),
       (813718676, 'conference', '2005-09-21', 'Tesla s coil, optimization theory', 'Elsevier'),
       (565829795, 'journal', '2006-03-27', 'Digital Signal Processing, from voice to ears', 'Victoria University'),
       (904560284, 'journal', '2016-06-29', 'Drones, their impact on the environment', 'Direins'),
       (430977343, 'journal', '2007-04-27', 'Oled, Definition and Complains', 'Vle'),
       (195731807, 'journal', '2007-12-13', 'Anxiety, a tool for the future', 'University of Glasgow'),
       (269828604, 'journal', '2008-03-22', 'Ignorance, Political Science for it', 'New York Times'),
       (195310678, 'journal', '2016-01-25', 'Data Structures and algorithms, what should be ignored!', 'Pearson');

INSERT INTO Awards
VALUES (772846507, '2009-02-06', 'Design Award, 1st Place')
     , (394025466, '2009-05-23', 'Pulitzer Price')
     , (226130537, '2010-09-21', 'Provost’s Distinction')
     , (206289429, '2010-10-21', 'Certificate of Commitment for Sony Ericson')
     , (472665242, '2011-10-03', 'Lambda Chi Alpha Prize')
     , (772846507, '2011-11-08', 'Best Electronic Patent of the Year')
     , (747652718, '2011-12-30', 'Faculty of Arts, Second Price for Journal Review')
     , (575933767, '2012-06-24', 'Dean’s List')
     , (415879768, '2013-07-29', 'Prix Napoleon')
     , (330264593, '2012-09-09', 'Deans List')
     , (817794537, '2012-09-28', 'City of Montreal, best Concept')
     , (477887758, '2012-12-25', 'Carl Friedrich Gauss Prize')
     , (772846507, '2013-03-15', 'Leadership Award')
     , (332012250, '2013-04-21', 'Renewable Energy Award')
     , (502405693, '2013-06-29', 'Nomination for Officer of the Order of the British Empire ')
     , (813718676, '2013-07-29', 'Deans List')
     , (565829795, '2013-12-30', 'Provost’s Distinction')
     , (904560284, '2014-06-11', 'Lambda Chi Alpha Prize')
     , (430977343, '2015-06-13', 'Best Mechanical Engineering Capstone')
     , (195731807, '2016-05-23', 'Leadership Award')
     , (269828604, '2016-11-18', 'America Achieves Fellowships for Teachers and Principals')
     , (195310678, '2017-02-21', 'IEEE Edison Medal')
     , (779332036, '2017-03-28', 'National Board Certification')
     , (904560284, '2018-02-03', 'Teaching Ambassador Fellowship')
     , (448602365, '2017-02-21', 'Fulbright Distinguished Awards for Teaching');

INSERT INTO Degree
VALUES ('Concordia University', 'Bachelor Electrical Engineering', 1)
     , ('Kannur University', 'PHD Economics', 2)
     , ('Instituto Tecnologico de Querotaro', 'PHD Software Eng', 3)
     , ('Evangelische Fachhochschule Reutlingen-Ludwigsburg', 'PHD Electrical Eng', 4)
     , ('Philosophisch-Theologische Hochschule SVD Sankt Augustin', 'PHD Software Eng', 5)
     , ('University of South Africa', 'PHD Electrical Eng', 6)
     , ('Merkur Internationale FH Karlsruhe', 'Master Degree Software Eng', 7)
     , ('University of Trnava', 'PHD Industrial Eng', 8)
     , ('Scholl College of Podiatric Medicine', 'PHD Medecine', 9)
     , ('The Juilliard School', 'PHD Psychology', 10)
     , ('International College of the Cayman Islands', 'PHD Electrical Eng', 11)
     , ('Chongqing Medical University', 'Master Degree Computer Science', 12)
     , ('SRM Institute Of Science & Technology ( Deemed University)', 'Bachelor Degree', 13)
     , ('Universidad del Tolima', 'PHD Computer Eng', 14)
     , ('Yan''an University', 'PHD Computer Eng', 15)
     , ('Paris-Sorbonne University Abu Dhabi', 'PHD Software Eng', 16)
     , ('Transport and Telecommunication Institute', 'PHD Electrical Eng', 17)
     , ('University of Toronto', 'Master Degree Computer Science', 18)
     , ('Allameh Tabatabaie University', 'PHD Finance', 19)
     , ('Chongqing Normal University', 'PHD Computer Eng', 20)
     , ('Majmaah University', 'PHD Computer Eng', 21)
     , ('Southwestern Assemblies of God University', 'PHD Psychology', 22)
     , ('Universitas Tarumanagara', 'Master Degree', 23)
     , ('Sahand University of Technology', 'PHD Electrical Eng', 24)
     , ('Collegium Civitas', 'PHD Electrical Eng', 25)
     , ('Tomsk State University of Architecture and Building', 'PHD Software Eng', 26)
     , ('Grantham University', 'Bachelor Degree Computer Science', 27)
     , ('European Business School Schloe Reichartshausen', 'PHD Software Eng', 28)
     , ('Universita de Skikda', 'Master Degree Computer Science', 29)
     , ('Karnataka State Open University', 'PHD Computer Eng', 30)
     , ('University of Pula', 'PHD Litterature', 31)
     , ('University of Texas Pan American', 'PHD Industrial Eng', 32)
     , ('Kagoshima University', 'PHD Economics', 33)
     , ('University of Occupational and Environmental Health, Japan', 'PHD Medecine', 34)
     , ('Kamakura Women''s College', 'Master Degree Chemistry', 35)
     , ('Shih Hsin University', 'PHD Electrical Eng', 36)
     , ('Al-Azhar University of Gaza', 'PHD Electrical Eng', 37)
     , ('Ross University Caribbean School of Medicine', 'PHD Electrical Eng', 38)
     , ('Wentworth Institute of Technology', 'PHD Electrical Eng', 39)
     , ('Instituto de Enseoanza Superior Oteima', 'PHD Electrical Eng', 40)
     , ('Pedagogical University of Krakow', 'Bachelor Degree Electrical Engr', 41)
     , ('Wesleyan College', 'PHD Mechanical Eng', 42)
     , ('Universitas Negeri Jakarta', 'PHD Mechanical Eng', 43)
     , ('Bila Cerkva State Agrarian University', 'PHD Civil Eng', 44)
     , ('University of Macau', 'Master Degree', 45)
     , ('Instituto Politocnico de Tomar', 'PHD Chemistry', 46)
     , ('University of the Incarnate World', 'PHD Accounting', 47)
     , ('Latvian Academy of Arts', 'PHD Litterature', 48)
     , ('Copenhagen Business School', 'PHD Finance', 49)
     , ('Hampton College', 'Bachelor Degree', 50)
     , ('Technological University (Kalay)', 'PHD Computer Eng', 51)
     , ('Friedrich-Schiller University Jena', 'PHD Mechanical Eng', 52)
     , ('York College Nebraska', 'PHD Computer Eng', 53)
     , ('Igbinedion University', 'PHD Finance', 54)
     , ('Detroit College of Law', 'PHD Industrial Eng', 55)
     , ('Schiller International University, Heidelberg', 'PHD Litterature', 56)
     , ('Universitas HKBP Nommensen', 'Master Degree Accounting', 57)
     , ('Richard Stockton College of New Jersey', 'PHD Litterature', 58)
     , ('Universidad Nacional de Ucayali', 'PHD Accounting', 59)
     , ('St. Paul University', 'Master Degree Accounting', 60)
     , ('Ecole Suprieure de Commerce de Lyon', 'PHD Software Eng', 61)
     , ('Bangladesh University of Engineering and Technology', 'PHD Electronics Eng', 62)
     , ('Instituto Tecnologico de Quertaro', 'PHD Software Eng', 63)
     , ('Hastings College', 'PHD Psychology', 64)
     , ('Grace Bible College', 'PHD Litterature', 65)
     , ('University of Agriculture and Veterinary Medicine Cluj-Napoca', 'PHD Medecine', 66)
     , ('Ashkelon Academic College', 'Master Degree Finance', 67)
     , ('Pedagogical University of Slupsk', 'PHD Software Eng', 68)
     , ('Federal University of Petroleum Resources', 'PHD Software Eng', 69)
     , ('University of Agriculture Makurdi', 'PHD Computer Eng', 70)
     , ('University for Humanistics (UH)', 'PHD Litterature', 71)
     , ('Tennessee State University', 'PHD Finance', 72)
     , ('Universidad Autonoma de Nuevo Leon', 'Master Degree Software Eng', 73);

INSERT INTO HasDegree
VALUES (779332036, '2003-08-11', 1, 4.28)
     , (445761402, '2004-03-08', 2, 3.48)
     , (448602365, '2004-03-26', 3, 4.12)
     , (453920929, '2006-08-01', 4, 3.24)
     , (223680290, '2006-09-26', 5, 3.11)
     , (245007722, '2006-10-02', 6, 4.18)
     , (146344051, '2008-07-30', 7, 3.82)
     , (891468783, '2009-01-07', 8, 4.28)
     , (616004712, '2009-06-24', 9, 3.88)
     , (309348312, '2010-08-04', 10, 3.36)
     , (882108144, '2011-10-24', 11, 4.05)
     , (809493224, '2012-01-30', 12, 3.33)
     , (814392875, '2012-03-16', 13, 4.25)
     , (426299656, '2012-07-02', 14, 3.12)
     , (357320964, '2012-12-24', 15, 3.53)
     , (881132104, '2013-11-22', 16, 2.74)
     , (508203017, '2014-07-11', 17, 3.25)
     , (907806961, '2015-05-05', 18, 4.12)
     , (656597000, '2015-07-16', 19, 4.12)
     , (477176451, '2016-03-29', 20, 3.90)
     , (964663021, '2016-10-10', 21, 2.91)
     , (249691790, '2017-10-23', 22, 2.56)
     , (665452486, '2017-12-14', 23, 3.86)
     , (481996433, '2018-06-26', 24, 3.41)
     , (786482339, '2018-07-11', 25, 3.20)
     , (927819640, '2012-06-20', 26, 2.92)
     , (867304329, '2013-04-02', 27, 4.17)
     , (195238750, '2013-09-19', 28, 3.11)
     , (934347739, '2013-09-23', 29, 3.09)
     , (246771994, '2013-10-02', 30, 4.16)
     , (403876313, '2015-01-23', 31, 3.23)
     , (683192608, '2016-12-22', 32, 3.67)
     , (635804780, '2017-06-08', 33, 3.99)
     , (177921799, '2017-07-05', 34, 3.79)
     , (965277745, '2017-11-08', 35, 3.33)
     , (406932598, '2018-04-18', 36, 2.07)
     , (204794691, '2018-08-09', 37, 2.64)
     , (293904265, '2010-07-16', 38, 4.16)
     , (803179891, '2013-09-25', 40, 2.07)
     , (394025466, '2015-04-18', 41, 2.24)
     , (226130537, '2016-11-04', 42, 2.64)
     , (206289429, '2016-11-13', 43, 3.96)
     , (472665242, '2016-06-22', 44, 3.00)
     , (842440083, '2019-02-07', 45, 4.07)
     , (747652718, '2018-02-14', 46, 2.11)
     , (575933767, '2016-09-25', 47, 3.89)
     , (415879768, '2016-02-13', 48, 3.01)
     , (330264593, '2018-03-16', 49, 2.36)
     , (817794537, '2017-04-09', 50, 3.14)
     , (477887758, '2014-10-02', 51, 3.11)
     , (772846507, '2014-01-29', 52, 3.04)
     , (332012250, '2017-05-23', 53, 4.04)
     , (502405693, '2012-11-14', 54, 3.52)
     , (813718676, '2019-04-24', 55, 2.70)
     , (565829795, '2016-09-13', 56, 2.01)
     , (904560284, '2016-11-24', 57, 4.13)
     , (430977343, '2013-12-10', 58, 2.80)
     , (195731807, '2017-05-31', 59, 3.73)
     , (269828604, '2012-09-18', 60, 3.47)
     , (195310678, '2012-10-28', 61, 2.75);

INSERT INTO Contract
VALUES (803179891, 'full-time', 85687.09, '2005-06-02', '2019-07-25')
     , (394025466, 'part-time', 121940.37, '2012-06-28', '2019-04-14')
     , (226130537, 'full-time', 92796.7, '2011-07-05', '2019-06-02')
     , (206289429, 'full-time', 143692.28, '2013-05-21', '2019-07-19')
     , (472665242, 'part-time', 85936.25, '2001-08-19', '2018-12-23')
     , (842440083, 'part-time', 116021.49, '2012-02-25', '2019-05-11')
     , (747652718, 'full-time', 130875.8, '2016-07-15', '2019-07-28')
     , (575933767, 'part-time', 82720.03, '2016-04-14', '2018-12-06')
     , (415879768, 'full-time', 81060.12, '2004-07-18', '2019-06-23')
     , (330264593, 'full-time', 77752.12, '2010-03-16', '2019-01-23')
     , (817794537, 'full-time', 160282.74, '2018-02-05', '2018-10-02')
     , (477887758, 'full-time', 72831.51, '2014-04-04', '2018-12-18')
     , (772846507, 'part-time', 83701.35, '2010-07-31', '2019-07-14')
     , (332012250, 'full-time', 124793.89, '2012-12-18', '2019-07-18')
     , (502405693, 'full-time', 81076.09, '2006-06-27', '2019-07-14')
     , (813718676, 'full-time', 129247.8, '2009-09-09', '2019-05-07')
     , (565829795, 'full-time', 91517.81, '2005-01-16', '2019-01-03')
     , (904560284, 'full-time', 138735.23, '2015-08-06', '2019-02-11')
     , (430977343, 'full-time', 169555.66, '2015-09-16', '2018-07-30')
     , (195731807, 'part-time', 122910.28, '2013-01-27', '2018-11-27')
     , (269828604, 'full-time', 93435.5, '2016-07-10', '2019-03-15')
     , (195310678, 'part-time', 91999.03, '2009-10-09', '2019-04-29');