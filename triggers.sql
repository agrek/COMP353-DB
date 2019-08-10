
/********************* Start of CourseCompleted Triggers *********************/
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
DELIMITER ;
/********************* End of CourseCompleted Triggers *********************/

/********************* Start of SectionEnrollment Triggers ********************/
DROP TRIGGER IF EXISTS secEnrollmentTriggerINS;
DELIMITER //
CREATE TRIGGER secEnrollmentTriggerINS
    BEFORE INSERT
    ON SectionEnrollment
    FOR EACH ROW
BEGIN
    # Multiple Sections of Same Course Check
    CALL duplicateTypeSecCheck(NEW.student_ssn, NEW.section_id);

    # Student Enrollment to room capacity Check
    CALL roomCapacityCheck(NEW.section_id);

    # Prerequisites Check
    CALL preReqCheck(NEW.student_ssn, NEW.section_id);

    # Student Time Conflict Check
    CALL studentConflictCheck(NEW.student_ssn, NEW.section_id);
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
    CALL duplicateTypeSecCheck(NEW.student_ssn, NEW.section_id);

    # Student Enrollment to room capacity Check
    CALL roomCapacityCheck(NEW.section_id);

    # Prerequisites Check
    CALL preReqCheck(NEW.student_ssn, NEW.section_id);

    # Student Time Conflict Check
    CALL studentConflictCheck(NEW.student_ssn, NEW.section_id);
END;
//
/******************** End of SectionEnrollment Triggers ********************/
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
    CALL taConflictCheck(NEW.assignee_ssn, NEW.section_id, NEW.position);

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
    CALL taConflictCheck(NEW.assignee_ssn, NEW.section_id, NEW.position);

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
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The end time occurs before start time which is invalid';
    END IF;

    # Time Conflicts Check
    CALL roomConflictCheck(NEW.id, NEW.start_time, NEW.end_time, NEW.day, NEW.term, NEW.year, NEW.building_abbreviation,
                           NEW.room_floor, NEW.room_number);

    /******************* Instructor Time Conflict Check *******************/
    CALL instructorConflictCheck(NEW.id, NEW.start_time, NEW.end_time, NEW.day, NEW.term, NEW.year, NEW.instructor_ssn, NEW.type);
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
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The end time occurs before start time which is invalid';
    END IF;

    # Time Conflicts Check
    CALL roomConflictCheck(NEW.id, NEW.start_time, NEW.end_time, NEW.day, NEW.term, NEW.year, NEW.building_abbreviation,
                           NEW.room_floor, NEW.room_number);

    /******************* Instructor Time Conflict Check *******************/
    CALL instructorConflictCheck(NEW.id, NEW.start_time, NEW.end_time, NEW.day, NEW.term, NEW.year, NEW.instructor_ssn, NEW.type);
END
//
DELIMITER ;
/******************** END of Section Triggers *******************/


DROP TRIGGER IF EXISTS researchTriggerINS;
DELIMITER //
CREATE TRIGGER researchTriggerINS
    BEFORE INSERT
    ON ResearchFundingApplications
    FOR EACH ROW
BEGIN
    # Check eligibility of applicant in terms of GPA
    CALL fundingGPACheck (NEW.student_ssn);

    # Check the availability of funding under the student's supervisor
    CALL fundingAvailabilityCheck (NEW.student_ssn);
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
        CALL fundingGPACheck (NEW.student_ssn);

        # Check the availability of funding under the student's supervisor
        CALL fundingAvailabilityCheck (NEW.student_ssn);
    END IF;
END;
//
DELIMITER ;

/**** BEGINNING OF BUILDING TABLE CONSISTENCY CHECK ****/
DROP TRIGGER IF EXISTS ins_buildingConsistencyTrigger;
DELIMITER //
CREATE TRIGGER ins_buildingConsistencyTrigger

    AFTER INSERT
    ON Room
    FOR EACH ROW

BEGIN
    -- Call the common procedure ran if there is an INSERT, UPDATE or DELETE on `table`
    CALL common_portion_for_ins_upd_del_buildingConsistency(NEW.building_abbreviation);
END;
//
DELIMITER ;
-- -------------------------------------------------------------------------
DROP TRIGGER IF EXISTS upd_buildingConsistencyTrigger;
DELIMITER //
CREATE TRIGGER upd_buildingConsistencyTrigger

    AFTER UPDATE
    ON Room
    FOR EACH ROW

BEGIN
    -- Call the common procedure ran if there is an INSERT, UPDATE or DELETE on `table`
    CALL common_portion_for_ins_upd_del_buildingConsistency(OLD.building_abbreviation);
    CALL common_portion_for_ins_upd_del_buildingConsistency(NEW.building_abbreviation);
END;
//
DELIMITER ;
-- -------------------------------------------------------------------------
DROP TRIGGER IF EXISTS del_buildingConsistencyTrigger;
DELIMITER //
CREATE TRIGGER del_buildingConsistencyTrigger

    AFTER DELETE
    ON Room
    FOR EACH ROW

BEGIN
    -- Call the common procedure ran if there is an INSERT, UPDATE or DELETE on `table`
    CALL common_portion_for_ins_upd_del_buildingConsistency(OLD.building_abbreviation);
END;
//
DELIMITER ;
-- -------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS common_portion_for_ins_upd_del_buildingConsistency;
DELIMITER //
CREATE PROCEDURE common_portion_for_ins_upd_del_buildingConsistency(IN t_row_id VARCHAR(45))

    READS SQL DATA

BEGIN
    /******************* Update the number of floors and number of rooms *******************/
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
END;
//
DELIMITER ;
/**** END OF BUILDING TABLE CONSISTENCY CHECK ****/


DROP PROCEDURE IF EXISTS updateGPA;
DELIMITER //
CREATE PROCEDURE updateGPA(IN ssn1 INT(9))
BEGIN

    DROP TEMPORARY TABLE IF EXISTS tempResult;
    DROP TEMPORARY TABLE IF EXISTS allGrades;

    CREATE TEMPORARY TABLE allGrades AS (SELECT grade, credits, gpa, credits * gpa mult
                                         FROM Course,
                                              CourseCompleted
                                                  INNER JOIN LetterToGpa ON grade = letter
                                         WHERE CourseCompleted.course_code = Course.code
                                           AND student_ssn = ssn1);

    SELECT SUM(credits) INTO @sumCredits FROM allGrades;
    SELECT SUM(mult) INTO @sumMult FROM allGrades;

    UPDATE Student SET gpa=(@sumMult / @sumCredits) WHERE ssn = ssn1;

END //
DELIMITER ;

DROP PROCEDURE IF EXISTS duplicateTypeSecCheck;
DELIMITER //
CREATE PROCEDURE duplicateTypeSecCheck(IN ssn1 INT(9), IN secId INT)
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
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'A student cannot register to two different sections of same course, type, term, and year';

    END IF;

END //
DELIMITER ;

DROP PROCEDURE IF EXISTS roomCapacityCheck;
DELIMITER //
CREATE PROCEDURE roomCapacityCheck(IN secId INT)
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

    SELECT capacity
    INTO @roomcap
    FROM Room
             INNER JOIN secInfo ON secInfo.room_number = Room.room_number AND
                                   secInfo.room_floor = Room.room_floor AND
                                   secInfo.building_abbreviation = Room.building_abbreviation;

    SELECT COUNT(*)
    INTO @totalStudentSec
    FROM SectionEnrollment SE
             INNER JOIN secInfo ON SE.section_id = secInfo.id;

    IF (@totalStudentSec >= @roomcap) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'ERROR: Student enrollment for this section has reached/exceeded room capacity';
    END IF;

END //
DELIMITER ;

DROP PROCEDURE IF EXISTS preReqCheck;
DELIMITER //
CREATE PROCEDURE preReqCheck(IN ssn1 INT(9), IN secId INT)
BEGIN

    DROP TEMPORARY TABLE IF EXISTS Course_Code;
    DROP TEMPORARY TABLE IF EXISTS req_table;
    DROP TEMPORARY TABLE IF EXISTS req_secs;
    DROP TEMPORARY TABLE IF EXISTS req_secs2;
    DROP TEMPORARY TABLE IF EXISTS fail_grade;

    CREATE TEMPORARY TABLE Course_Code AS (SELECT course_code FROM Section WHERE id = secId);
    CREATE TEMPORARY TABLE req_table AS (SELECT req_code
                                         FROM Requisites
                                                  INNER JOIN Course_Code ON Requisites.course_code = Course_Code.course_code
                                         WHERE type = 'prerequisite');

    CREATE TEMPORARY TABLE fail_grade AS (
        SELECT course_code, grade
        FROM CourseCompleted
                 INNER JOIN req_table ON CourseCompleted.course_code = req_table.req_code
        WHERE CourseCompleted.student_ssn = ssn1
          AND (grade = 'F' OR grade = 'FNS' OR grade = 'R' OR grade = 'NR')
    );

    SELECT count(*) INTO @numFail FROM fail_grade;
    SELECT count(*) INTO @num_Pre FROM req_table;

    SELECT count(*)
    INTO @notTaken
    FROM (SELECT course_code, grade
          FROM CourseCompleted
                   INNER JOIN req_table ON CourseCompleted.course_code = req_table.req_code
          WHERE CourseCompleted.student_ssn = ssn1) t;
    IF (@numFail > 0 OR ((@notTaken = 0) AND (@num_Pre > 0))) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'The student did not meet the prerequisites requirement for the course';
    END IF;

END //
DELIMITER ;

DROP PROCEDURE IF EXISTS studentConflictCheck;
DELIMITER //
CREATE PROCEDURE studentConflictCheck(IN ssn1 INT(9), IN sec_id INT)
BEGIN

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
                                      WHERE Section.id = sec_id);

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
                                         WHERE SE.student_ssn = ssn1
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


END //
DELIMITER ;

DROP PROCEDURE IF EXISTS taHoursCheck;
DELIMITER //
CREATE PROCEDURE taHoursCheck(IN ta_ssn INT, IN sec_id INT, IN hrs INT)
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
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The TA exceeds the max hours permitted in a year of 260 hours';
    END IF;

END //
DELIMITER ;

DROP PROCEDURE IF EXISTS taGPACheck;
DELIMITER //
CREATE PROCEDURE taGPACheck(IN ta_ssn INT)
BEGIN
    SELECT gpa INTO @applicantGpa FROM Student WHERE ssn = ta_ssn;
    IF @applicantGpa < 3.2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'The student does not meet the minimum GPA required for a TA which is 3.2';
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS taConflictCheck;
DELIMITER //
CREATE PROCEDURE taConflictCheck(IN ta_ssn INT, IN sec_id INT, IN position VARCHAR(45))
BEGIN
    IF (position <> 'marker') THEN

        DROP TEMPORARY TABLE IF EXISTS oldTASec;
        DROP TEMPORARY TABLE IF EXISTS separatedOld;
        DROP TEMPORARY TABLE IF EXISTS oldSecs;
        DROP TEMPORARY TABLE IF EXISTS conflictSecs;
        DROP TEMPORARY TABLE IF EXISTS numbers;
        DROP TEMPORARY TABLE IF EXISTS newEntry;
        DROP TEMPORARY TABLE IF EXISTS newRow;
        DROP TEMPORARY TABLE IF EXISTS separatedNew;

        -- numbers table is used for how many possible days can there be
        CREATE TEMPORARY TABLE numbers
        (
            n INT PRIMARY KEY
        );
        INSERT INTO numbers VALUES (1), (2);
        /*******section info from section_id*********/
        CREATE TEMPORARY TABLE newRow AS (SELECT day, id, start_time, end_time FROM Section WHERE id = sec_id);
        -- Separating the inserted row into two if there was two days in it
        CREATE TEMPORARY TABLE separatedNew AS (SELECT newRow.id,
                                                       SUBSTRING_INDEX(SUBSTRING_INDEX(newRow.day, ', ', numbers.n),
                                                                       ', ',
                                                                       -1) day
                                                FROM numbers
                                                         INNER JOIN newRow
                                                                    ON CHAR_LENGTH(newRow.day)
                                                                           -
                                                                       CHAR_LENGTH(REPLACE(newRow.day, ', ', '')) >=
                                                                       numbers.n - 1
                                                ORDER BY id, n);

        CREATE TEMPORARY TABLE newEntry AS (SELECT newRow.id,
                                                   separatedNew.day,
                                                   start_time,
                                                   end_time
                                            FROM newRow
                                                     INNER JOIN separatedNew ON separatedNew.id = newRow.id);

        /* Fetching all tutorial and lab sections taught by the TA in same year, and term*/
        SELECT year INTO @taPosYear FROM Section WHERE Section.id = sec_id;
        SELECT term INTO @taPosTerm FROM Section WHERE Section.id = sec_id;
        CREATE TEMPORARY TABLE oldTASec AS (SELECT Section.id, day, start_time, end_time, term, year
                                            FROM Section
                                                     INNER JOIN TAPosition ON section_id = Section.id
                                            WHERE ta_ssn = assignee_ssn
                                              AND (type = 'tutorial' OR type = 'lab')
                                              AND year = @taPosYear
                                              AND term = @taPosTerm);

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

        IF (@confCount > 0) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The TA has a time conflict with another section he teaches';
        END IF;
    END IF;

END //
DELIMITER ;

DROP PROCEDURE IF EXISTS taNumSecCheck;
DELIMITER //
CREATE PROCEDURE taNumSecCheck(IN ta_ssn INT, IN sec_id INT)
BEGIN
    SELECT term INTO @sectionTerm FROM Section WHERE sec_id = Section.id;
    SELECT year INTO @sectionYear FROM Section WHERE sec_id = Section.id;

    SELECT COUNT(*)
    INTO @currentNum
    FROM Section
             INNER JOIN TAPosition ON TAPosition.section_id = Section.id
    WHERE term = @sectionTerm
      AND year = @sectionYear
      AND assignee_ssn = ta_ssn;

    IF (@currentNum > 1) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Student already TAs 2 sections this term and cannot take on more';
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS roomConflictCheck;
DELIMITER //
CREATE PROCEDURE roomConflictCheck(IN sec_id INT, IN start_time1 TIME, IN end_time1 TIME, IN day1 VARCHAR(45)
                                  , IN term1 VARCHAR(45), IN year1 INT
                                  , IN building_abbreviation1 VARCHAR(45), IN room_floor1 INT, IN room_number1 INT)
BEGIN
    DROP TEMPORARY TABLE IF EXISTS numbers;
    DROP TEMPORARY TABLE IF EXISTS newRow;
    DROP TEMPORARY TABLE IF EXISTS separatedNew;
    DROP TEMPORARY TABLE IF EXISTS newEntry;
    DROP TEMPORARY TABLE IF EXISTS separatedOld;
    DROP TEMPORARY TABLE IF EXISTS oldSecs;
    DROP TEMPORARY TABLE IF EXISTS conflictSecs;
    DROP TEMPORARY TABLE IF EXISTS oldRoomSec;

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
    INSERT INTO newRow
    VALUES (sec_id, start_time1, end_time1, day1, term1, year1);

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

    /******************* Room Time Conflict Check *******************/
    /* Fetching all sections taught in same building, room_number, year, and term*/
    CREATE TEMPORARY TABLE oldRoomSec AS (SELECT Section.id, day, start_time, end_time, term, year
                                          FROM Section
                                          WHERE building_abbreviation = building_abbreviation1
                                            AND room_floor = room_floor1
                                            AND room_number = room_number1
                                            AND year = year1
                                            AND term = term1);

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

    IF (@confCount > 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'The room is already reserved for another section at this time';
    END IF;

END //
DELIMITER ;

DROP PROCEDURE IF EXISTS instructorConflictCheck;
DELIMITER //
CREATE PROCEDURE instructorConflictCheck(IN sec_id INT, IN start_time1 TIME, IN end_time1 TIME, IN day1 VARCHAR(45),
                                         IN term1 VARCHAR(45), IN year1 INT, IN instructor_ssn1 INT, IN sec_type VARCHAR(45))
BEGIN
    DROP TEMPORARY TABLE IF EXISTS numbers;
    DROP TEMPORARY TABLE IF EXISTS newRow;
    DROP TEMPORARY TABLE IF EXISTS separatedNew;
    DROP TEMPORARY TABLE IF EXISTS newEntry;
    DROP TEMPORARY TABLE IF EXISTS oldInstSec;
    DROP TEMPORARY TABLE IF EXISTS separatedOld;
    DROP TEMPORARY TABLE IF EXISTS oldSecs;
    DROP TEMPORARY TABLE IF EXISTS conflictSecs;


    IF sec_type = 'lecture' THEN

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
            id         INT(8),
            start_time TIME,
            end_time   TIME,
            day        VARCHAR(45),
            term       VARCHAR(45),
            year       INT(8)
        );
        INSERT INTO newRow
        VALUES (sec_id, start_time1, end_time1, day1, term1, year1);

        -- Separating the inserted row into two if there was two days in it
        CREATE TEMPORARY TABLE separatedNew AS (SELECT newRow.id,
                                                       SUBSTRING_INDEX(SUBSTRING_INDEX(newRow.day, ', ', numbers.n),
                                                                       ', ',
                                                                       -1) day
                                                FROM numbers
                                                         INNER JOIN newRow
                                                                    ON CHAR_LENGTH(newRow.day)
                                                                           -
                                                                       CHAR_LENGTH(REPLACE(newRow.day, ', ', '')) >=
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

        /* Fetching all sections taught by the instructor in same year, and term*/
        CREATE TEMPORARY TABLE oldInstSec AS (SELECT Section.id, day, start_time, end_time, term, year, instructor_ssn
                                              FROM Section
                                              WHERE type = 'lecture'
                                                AND instructor_ssn = instructor_ssn1
                                                AND year = year1
                                                AND term = term1);

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

        IF (@confCount > 0) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                    'The instructor has a time conflict with another section he teaches';
        END IF;
    END IF;

END //
DELIMITER ;

DROP PROCEDURE IF EXISTS fundingGPACheck;
DELIMITER //
CREATE PROCEDURE fundingGPACheck(IN student_ssn INT)
BEGIN
    SELECT gpa INTO @applicantGpa FROM Student WHERE ssn = student_ssn;
    SELECT type
    INTO @stuType
    FROM Student
             INNER JOIN GradStudents GS ON Student.ssn = GS.ssn
    WHERE Student.ssn = student_ssn;

    IF @applicantGpa < 3 AND @stuType = 'thesis' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'The student does not meet the minimum GPA required for research funding which is 3';
    END IF;

END //
DELIMITER ;

DROP PROCEDURE IF EXISTS fundingAvailabilityCheck;
DELIMITER //
CREATE PROCEDURE fundingAvailabilityCheck(IN student_ssn INT)
BEGIN

    SELECT supervisor_ssn INTO @applicantSuper FROM GradStudents WHERE ssn = student_ssn;
    SELECT funding_available INTO @fundsAvailable FROM Instructor WHERE ssn = @applicantSuper;

    IF NOT @fundsAvailable THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'Funding not available under the student''s instructor';
    END IF;

END //
DELIMITER ;