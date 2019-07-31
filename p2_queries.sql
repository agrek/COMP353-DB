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

