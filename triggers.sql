/********************* START of CourseCompleted Triggers *********************/
DROP TRIGGER IF EXISTS courseCompletedTriggerINS;
DELIMITER //
CREATE TRIGGER courseCompletedTriggerINS
    AFTER INSERT
    ON CourseCompleted
    FOR EACH ROW
BEGIN
    # Update GPA
    CALL updateGPA(NEW.student_ssn);
END;
//

DROP TRIGGER IF EXISTS courseCompletedTriggerUPD;
CREATE TRIGGER courseCompletedTriggerUPD
    AFTER UPDATE
    ON CourseCompleted
    FOR EACH ROW
BEGIN
    # Update GPA
    CALL updateGPA(OLD.student_ssn);
    IF (OLD.student_ssn <> NEW.student_ssn) THEN
        CALL updateGPA(NEW.student_ssn);
    END IF;
END;
//

DROP TRIGGER IF EXISTS courseCompletedTriggerDEL;
CREATE TRIGGER courseCompletedTriggerDEL
    AFTER DELETE
    ON CourseCompleted
    FOR EACH ROW
BEGIN
    # Update GPA
    CALL updateGPA(OLD.student_ssn);
END;
//
/********************* END of CourseCompleted Triggers *********************/
DELIMITER ;

/********************* START of SectionEnrollment Triggers ********************/
DROP TRIGGER IF EXISTS secEnrollmentTriggerINS;
DELIMITER //
CREATE TRIGGER secEnrollmentTriggerINS
    BEFORE INSERT
    ON SectionEnrollment
    FOR EACH ROW
BEGIN
    # Multiple Sections of Same Course Check
    # &
    # Student Enrollment to room capacity Check
    CALL duplicateTypeSec_roomCapacityCheck(NEW.student_ssn, NEW.section_id);

    # Prerequisites Check
    CALL preReqCheck(NEW.student_ssn, NEW.section_id);

    # Student Time Conflict Check
    CALL Stud_TA_Prof_Rm_ConflictCheck
        (
            NEW.student_ssn, NEW.section_id, NULL, NULL,
            NULL, NULL, NULL, 'Stu',
            NULL, NULL, NULL
        );
END;
//

DROP TRIGGER IF EXISTS secEnrollmentTriggerUPD;
DELIMITER //
CREATE TRIGGER secEnrollmentTriggerUPD
    BEFORE UPDATE
    ON SectionEnrollment
    FOR EACH ROW
BEGIN
    # Multiple Sections of Same Course Check
    # &
    # Student Enrollment to room capacity Check
    CALL duplicateTypeSec_roomCapacityCheck(NEW.student_ssn, NEW.section_id);

    # Prerequisites Check
    CALL preReqCheck(NEW.student_ssn, NEW.section_id);

    # Student Time Conflict Check
    CALL Stud_TA_Prof_Rm_ConflictCheck
        (
            NEW.student_ssn, NEW.section_id, NULL, NULL,
            NULL, NULL, NULL, 'Stu',
            NULL, NULL, NULL
        );
END;
//
/******************** END of SectionEnrollment Triggers ********************/
DELIMITER ;

/******************** START of TAPosition Triggers *******************/
DROP TRIGGER IF EXISTS TaTrigINS;
DELIMITER //
CREATE TRIGGER TaTrigINS
    BEFORE INSERT
    ON TAPosition
    FOR EACH ROW
BEGIN
    # TA Total Hours Check
    CALL taHoursCheck(NEW.assignee_ssn, NEW.section_id, NEW.hours);

    # TA GPA Check
    CALL taGPACheck(NEW.assignee_ssn);

    # TA Time Conflict Check
    IF (NEW.position <> 'marker') THEN
        CALL Stud_TA_Prof_Rm_ConflictCheck
            (
                NEW.assignee_ssn, NEW.section_id, NULL, NULL,
                NULL, NULL, NULL, 'TA',
                NULL, NULL, NULL
            );
    END IF;

    # TA Number of Sections Per Term Check
    CALL taNumSecCheck(NEW.assignee_ssn, NEW.section_id);
END;
//

DROP TRIGGER IF EXISTS TaTrigUPD;
DELIMITER //
CREATE TRIGGER TaTrigUPD
    BEFORE UPDATE
    ON TAPosition
    FOR EACH ROW
BEGIN
    # TA Total Hours Check
    CALL taHoursCheck(NEW.assignee_ssn, NEW.section_id, NEW.hours);

    # TA GPA Check
    CALL taGPACheck(NEW.assignee_ssn);

    # TA Time Conflict Check
    IF (NEW.position <> 'marker') THEN
        CALL Stud_TA_Prof_Rm_ConflictCheck
            (
                NEW.assignee_ssn, NEW.section_id, NULL, NULL,
                NULL, NULL, NULL, 'TA',
                NULL, NULL, NULL
            );
    END IF;

    # TA Number of Sections Per Term Check
    CALL taNumSecCheck(NEW.assignee_ssn, NEW.section_id);
END;
//
/******************** END of TAPosition Triggers *******************/
DELIMITER ;

DELIMITER //
/******************** START of Section Triggers *******************/
DROP TRIGGER IF EXISTS secTrigINS;
CREATE TRIGGER secTrigINS
    BEFORE INSERT
    ON Section
    FOR EACH ROW
BEGIN
    # Valid Start and End Times
    IF (NEW.end_time < NEW.start_time) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERROR: The end time occurs before start time which is invalid';
    END IF;

    # Time Conflicts Check
    CALL Stud_TA_Prof_Rm_ConflictCheck
        (
            NULL, NEW.id, NEW.start_time, NEW.end_time,
            NEW.day, NEW.term, NEW.year, 'Rm',
            NEW.building_abbreviation, NEW.room_floor, NEW.room_number
        );

    # Instructor Time Conflict Check
    IF (NEW.type = 'lecture') THEN
        CALL Stud_TA_Prof_Rm_ConflictCheck
            (
                NEW.instructor_ssn, NEW.id, NEW.start_time, NEW.end_time,
                NEW.day, NEW.term, NEW.year, 'Prof',
                NULL, NULL, NULL
            );
    END IF;
END
//

DROP TRIGGER IF EXISTS secTrigUPD;
CREATE TRIGGER secTrigUPD
    BEFORE UPDATE
    ON Section
    FOR EACH ROW
BEGIN
    # Valid Start and End Times
    IF (NEW.end_time < NEW.start_time) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERROR: The end time occurs before start time which is invalid';
    END IF;

    # Time Conflicts Check
    CALL Stud_TA_Prof_Rm_ConflictCheck
        (
            NULL, NEW.id, NEW.start_time, NEW.end_time,
            NEW.day, NEW.term, NEW.year, 'Rm',
            NEW.building_abbreviation, NEW.room_floor, NEW.room_number
        );

    # Instructor Time Conflict Check
    IF (NEW.type = 'lecture') THEN
        CALL Stud_TA_Prof_Rm_ConflictCheck
            (
                NEW.instructor_ssn, NEW.id, NEW.start_time, NEW.end_time,
                NEW.day, NEW.term, NEW.year, 'Prof',
                NULL, NULL, NULL
            );
    END IF;
END
//
/******************** END of Section Triggers *******************/
DELIMITER ;

/******************** START of ResearchFundingApplications Triggers *******************/
DROP TRIGGER IF EXISTS researchTriggerINS;
DELIMITER //
CREATE TRIGGER researchTriggerINS
    BEFORE INSERT
    ON ResearchFundingApplications
    FOR EACH ROW
BEGIN
    # Check eligibility of applicant in terms of GPA
    CALL fundingGPACheck(NEW.student_ssn);

    # Check the availability of funding under the student's supervisor
    CALL fundingAvailabilityCheck(NEW.student_ssn);
END;
//

DROP TRIGGER IF EXISTS researchTriggerUPD;
CREATE TRIGGER researchTriggerUPD
    BEFORE UPDATE
    ON ResearchFundingApplications
    FOR EACH ROW
BEGIN
    IF (NEW.student_ssn <> OLD.student_ssn) THEN
        # Check eligibility of applicant in terms of GPA
        CALL fundingGPACheck(NEW.student_ssn);

        # Check the availability of funding under the student's supervisor
        CALL fundingAvailabilityCheck(NEW.student_ssn);
    END IF;
END;
//
/******************** END of ResearchFundingApplications Triggers *******************/
DELIMITER ;

/******************** Start of Room Triggers *******************/
DROP TRIGGER IF EXISTS roomTriggerINS;
DELIMITER //
CREATE TRIGGER roomTriggerINS
    AFTER INSERT
    ON Room
    FOR EACH ROW
BEGIN
    -- Call the common procedure ran if there is an INSERT, UPDATE or DELETE on `Room`
    CALL buildingConsistencyCheck(NEW.building_abbreviation);
END;
//

DROP TRIGGER IF EXISTS roomTriggerUPD;
DELIMITER //
CREATE TRIGGER roomTriggerUPD
    AFTER UPDATE
    ON Room
    FOR EACH ROW
BEGIN
    -- Call the common procedure ran if there is an INSERT, UPDATE or DELETE on `Room`
    CALL buildingConsistencyCheck(OLD.building_abbreviation);
    IF (OLD.building_abbreviation <> NEW.building_abbreviation) THEN
        CALL buildingConsistencyCheck(NEW.building_abbreviation);
    END IF;
END;
//

DROP TRIGGER IF EXISTS roomTriggerDEL;
DELIMITER //
CREATE TRIGGER roomTriggerDEL
    AFTER DELETE
    ON Room
    FOR EACH ROW
BEGIN
    -- Call the common procedure ran if there is an INSERT, UPDATE or DELETE on `Room`
    CALL buildingConsistencyCheck(OLD.building_abbreviation);
END;
//
/******************** END of Room Triggers *******************/
DELIMITER ;

-- ----------------------------   PROCEDURE DECLARATIONS ----------------------------
DROP PROCEDURE IF EXISTS buildingConsistencyCheck;
DELIMITER //
CREATE PROCEDURE buildingConsistencyCheck(IN t_row_id VARCHAR(45))
    READS SQL DATA
BEGIN
    # Update the number of floors and number of rooms
    SELECT COUNT(*)
    INTO @numOfRooms
    FROM Room
    WHERE Room.building_abbreviation = t_row_id;

    SELECT COUNT(DISTINCT room_floor)
    INTO @numOfFloors
    FROM Room
    WHERE Room.building_abbreviation = t_row_id;

    UPDATE Building
    SET num_rooms  = @numOfRooms,
        num_floors = @numOfFloors
    WHERE Building.abbreviation = t_row_id;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateGPA;
DELIMITER //
CREATE PROCEDURE updateGPA(IN ssn1 INT(9))
    READS SQL DATA
BEGIN
    DROP TEMPORARY TABLE IF EXISTS allGrades;

    CREATE TEMPORARY TABLE allGrades AS (SELECT grade, credits, gpa, credits * gpa mult
                                         FROM Course,
                                              CourseCompleted
                                                  INNER JOIN LetterToGpa ON grade = letter
                                         WHERE CourseCompleted.course_code = Course.code
                                           AND student_ssn = ssn1);

    SELECT SUM(credits), SUM(mult) INTO @sumCredits, @sumMult FROM allGrades;

    UPDATE Student SET gpa=(@sumMult / @sumCredits) WHERE ssn = ssn1;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS duplicateTypeSec_roomCapacityCheck;
DELIMITER //
CREATE PROCEDURE duplicateTypeSec_roomCapacityCheck(IN ssn1 INT(9), IN secId INT)
    READS SQL DATA
BEGIN

    DROP TEMPORARY TABLE IF EXISTS secInfo;
    CREATE TEMPORARY TABLE secInfo AS (SELECT id,
                                              course_code,
                                              type,
                                              term,
                                              year,
                                              room_number,
                                              room_floor,
                                              building_abbreviation
                                       FROM Section
                                       WHERE id = secId);

    --  Check: A student is enrolled in only one section of a particular course in a specific semester
    SELECT COUNT(*)
    INTO @multipleSecs
    FROM (SELECT Section.id
          FROM Section
                   INNER JOIN SectionEnrollment SE ON Section.id = SE.section_id
                   INNER JOIN secInfo ON Section.course_code = secInfo.course_code
          WHERE student_ssn = ssn1
            AND Section.type = secInfo.type
            AND Section.year = secInfo.year
            AND Section.term = secInfo.term) r;

    IF (@multipleSecs > 0) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                    'ERROR: A student cannot register to two different sections of same course, type, term, and year';

    END IF;

    -- Check: Student enrollment in a course does not exceed room capacity
    SELECT capacity
    INTO @roomCap
    FROM Room
             INNER JOIN secInfo ON secInfo.room_number = Room.room_number AND
                                   secInfo.room_floor = Room.room_floor AND
                                   secInfo.building_abbreviation = Room.building_abbreviation;

    SELECT COUNT(*)
    INTO @totalStudentSec
    FROM SectionEnrollment SE
             INNER JOIN secInfo ON SE.section_id = secInfo.id;

    IF (@totalStudentSec >= @roomCap) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERROR: Student enrollment for this section has reached/exceeded room capacity';
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS preReqCheck;
DELIMITER //
CREATE PROCEDURE preReqCheck(IN ssn1 INT(9), IN secId INT)
    READS SQL DATA
BEGIN
    DROP TEMPORARY TABLE IF EXISTS Course_Code, Req_Table, Common_Table;

    CREATE TEMPORARY TABLE Course_Code AS (SELECT course_code FROM Section WHERE id = secId);

    CREATE TEMPORARY TABLE Req_Table AS (
        SELECT req_code
        FROM Requisites
                 INNER JOIN Course_Code ON Requisites.course_code = Course_Code.course_code
        WHERE type = 'prerequisite');

    CREATE TEMPORARY TABLE Common_Table AS (
        SELECT course_code, grade
        FROM CourseCompleted
                 INNER JOIN Req_Table ON CourseCompleted.course_code = Req_Table.req_code
        WHERE CourseCompleted.student_ssn = ssn1);

    SELECT count(*) INTO @num_Pre FROM Req_Table;
    SELECT count(*) INTO @notTaken FROM Common_Table;
    SELECT count(*)
    INTO @numFail
    FROM (SELECT *
          FROM Common_Table
          WHERE grade = 'F'
             OR grade = 'FNS'
             OR grade = 'R'
             OR grade = 'NR') t;

    IF (@numFail > 0 OR ((@notTaken = 0) AND (@num_Pre > 0))) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERROR: The student did not meet the prerequisites requirement for the course';
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS Stud_TA_Prof_Rm_ConflictCheck;
DELIMITER //
CREATE PROCEDURE Stud_TA_Prof_Rm_ConflictCheck
(IN ssn1 INT(9), IN sec_id INT, IN start_time1 TIME, IN end_time1 TIME,
 IN day1 VARCHAR(45), IN term1 VARCHAR(45), IN year1 INT, IN who VARCHAR(5),
 IN building_abbreviation1 VARCHAR(45), IN room_floor1 INT, IN room_number1 INT)
    READS SQL DATA
BEGIN
    DROP TEMPORARY TABLE IF EXISTS numbers, newRow, separatedNew, newEntry,
        oldPerRmSec, separatedOld, oldSecs, conflictSecs;

    -- numbers table is used for how many possible days can there be
    CREATE TEMPORARY TABLE numbers
    (
        n INT PRIMARY KEY
    );
    INSERT INTO numbers VALUES (1), (2);

    -- Created because of need to operate on the NEW data in the form of a table

    CREATE TEMPORARY TABLE newRow
    (
        id         INT(8),
        start_time TIME,
        end_time   TIME,
        day        VARCHAR(45),
        term       VARCHAR(45),
        year       INT(8)
    );

    IF (who = 'Stu' OR who = 'TA') THEN
        INSERT INTO newRow
        SELECT Section.id, start_time, end_time, day, term, year
        FROM Section
        WHERE Section.id = sec_id;
    ELSEIF (who = 'Prof' OR who = 'Rm') THEN
        INSERT INTO newRow
        VALUES (sec_id, start_time1, end_time1, day1, term1, year1);
    END IF;

    SELECT year, term INTO @year, @term FROM newRow;

    -- Separating the inserted row into two if there was two days in it
    CREATE TEMPORARY TABLE separatedNew AS
        (
            SELECT newRow.id, SUBSTRING_INDEX(SUBSTRING_INDEX(newRow.day, ', ', numbers.n), ', ', -1) day
            FROM numbers
                     INNER JOIN newRow
                                ON CHAR_LENGTH(newRow.day)
                                       - CHAR_LENGTH(REPLACE(newRow.day, ', ', '')) >=
                                   numbers.n - 1
            ORDER BY id, n);

    CREATE TEMPORARY TABLE newEntry AS
        (
            SELECT newRow.id, separatedNew.day, start_time, end_time, term, year
            FROM newRow
                     INNER JOIN separatedNew ON separatedNew.id = newRow.id);

    /* Fetching all sections taken by the student in same year, and term*/

    CREATE TEMPORARY TABLE oldPerRmSec
    (
        id         INT,
        day        VARCHAR(45),
        start_time TIME,
        end_time   TIME,
        term       VARCHAR(45),
        year       INT(4)
    );

    IF (who = 'Stu') THEN
        INSERT INTO oldPerRmSec
        SELECT Section.id, day, start_time, end_time, term, year
        FROM Section
                 INNER JOIN SectionEnrollment SE ON Section.id = SE.section_id
        WHERE SE.student_ssn = ssn1
          AND year = @year
          AND term = @term;
    ELSEIF (who = 'TA') THEN
        INSERT INTO oldPerRmSec
        SELECT Section.id, day, start_time, end_time, term, year
        FROM Section
                 INNER JOIN TAPosition ON section_id = id
        WHERE ssn1 = assignee_ssn
          AND (type = 'tutorial' OR type = 'lab')
          AND year = @year
          AND term = @term;
    ELSEIF (who = 'Prof') THEN
        INSERT INTO oldPerRmSec
        SELECT Section.id, day, start_time, end_time, term, year
        FROM Section
        WHERE type = 'lecture'
          AND instructor_ssn = ssn1
          AND year = @year
          AND term = @term;
    ELSEIF (who = 'Rm') THEN
        INSERT INTO oldPerRmSec
        SELECT Section.id, day, start_time, end_time, term, year
        FROM Section
        WHERE building_abbreviation = building_abbreviation1
          AND room_floor = room_floor1
          AND room_number = room_number1
          AND year = @year
          AND term = @term;
    END IF;

    CREATE TEMPORARY TABLE separatedOld AS
        (
            SELECT oldPerRmSec.id, SUBSTRING_INDEX(SUBSTRING_INDEX(oldPerRmSec.day, ', ', numbers.n), ', ', -1) day
            FROM numbers
                     INNER JOIN oldPerRmSec
                                ON CHAR_LENGTH(oldPerRmSec.day)
                                       -
                                   CHAR_LENGTH(REPLACE(oldPerRmSec.day, ', ', '')) >=
                                   numbers.n - 1
            ORDER BY id, n
        );

    CREATE TEMPORARY TABLE oldSecs AS
        (
            SELECT Section.id,
                   separatedOld.day,
                   start_time,
                   end_time,
                   term,
                   year
            FROM Section
                     INNER JOIN separatedOld ON separatedOld.id = Section.id
        );

    CREATE TEMPORARY TABLE conflictSecs AS
        (
            SELECT oldSecs.day         d1,
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
        IF (who = 'Stu') THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT =
                        'ERROR: The section conflicts with other sections taken by the student in the same semester';
        ELSEIF (who = 'TA') THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'ERROR: The TA has a time conflict with another section he teaches';
        ELSEIF (who = 'Prof') THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'ERROR: The instructor has a time conflict with another section he teaches';
        ELSEIF (who = 'Rm') THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'ERROR: The room is already reserved for another section at this time';
        END IF;
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS taHoursCheck;
DELIMITER //
CREATE PROCEDURE taHoursCheck(IN ta_ssn INT, IN sec_id INT, IN hrs INT)
    READS SQL DATA
BEGIN
    SELECT year INTO @posYear FROM Section WHERE Section.id = sec_id;

    SELECT SUM(hours)
    INTO @totalHours
    FROM (SELECT DISTINCT (TAPosition.section_id), hours
          FROM TAPosition
                   INNER JOIN Section ON TAPosition.section_id = Section.id
          WHERE assignee_ssn = ta_ssn
            AND year = @posYear) t;

    IF ((@totalHours + hrs) > 260) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERROR: The TA exceeds the max hours permitted in a year of 260 hours';
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS taGPACheck;
DELIMITER //
CREATE PROCEDURE taGPACheck(IN ta_ssn INT)
    READS SQL DATA
BEGIN
    SELECT gpa INTO @applicantGpa FROM Student WHERE ssn = ta_ssn;

    IF @applicantGpa < 3.2 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERROR: The student does not meet the minimum GPA required for a TA which is 3.2';
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS taNumSecCheck;
DELIMITER //
CREATE PROCEDURE taNumSecCheck(IN ta_ssn INT, IN sec_id INT)
    READS SQL DATA
BEGIN
    SELECT term, year INTO @sectionTerm, @sectionYear FROM Section WHERE sec_id = Section.id;

    SELECT COUNT(*)
    INTO @currentNum
    FROM Section
             INNER JOIN TAPosition ON TAPosition.section_id = Section.id
    WHERE term = @sectionTerm
      AND year = @sectionYear
      AND assignee_ssn = ta_ssn;

    IF (@currentNum > 1) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERROR: Student already TAs 2 sections this term and cannot take on more';
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS fundingGPACheck;
DELIMITER //
CREATE PROCEDURE fundingGPACheck(IN student_ssn INT)
    READS SQL DATA
BEGIN
    SELECT gpa INTO @applicantGpa FROM Student WHERE ssn = student_ssn;

    SELECT type
    INTO @stuType
    FROM Student
             INNER JOIN GradStudents GS ON Student.ssn = GS.ssn
    WHERE Student.ssn = student_ssn;

    IF @applicantGpa < 3 AND @stuType = 'thesis' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                    'ERROR: The student does not meet the minimum GPA required for research funding which is 3';
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS fundingAvailabilityCheck;
DELIMITER //
CREATE PROCEDURE fundingAvailabilityCheck(IN student_ssn INT)
    READS SQL DATA
BEGIN
    SELECT supervisor_ssn INTO @applicantSuper FROM GradStudents WHERE ssn = student_ssn;

    SELECT funding_available INTO @fundsAvailable FROM Instructor WHERE ssn = @applicantSuper;

    IF NOT @fundsAvailable THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERROR: Funding not available under the student''s instructor';
    END IF;
END //
DELIMITER ;