/*
 I
 Create/Delete/Edit/Display a faculty member.
 */

#  Create a faculty member
# INSERT INTO arc353_1.Instructor VALUE ('123456789', '1');

/*	IV
	Give a list of all campuses.
*/
SELECT name, abbreviation
FROM Campus;

/*	V
	Give a list of all buildings on a given campus.
*/
SELECT CONCAT(C.name, ' (', C.abbreviation, ')')                          AS Campus,
       GROUP_CONCAT(B.name, ' (', B.abbreviation, ')' SEPARATOR ', <br>') AS Buildings,
       COUNT(*)                                                           AS numOfBuildings
FROM Building B
         INNER JOIN Campus C ON B.campus = C.abbreviation
GROUP BY C.name;