# SELECT student_ssn,course_code,term,year,grade
# FROM arc353_1.Section SE,
#      arc353_1.SectionEnrollment SC
# WHERE SE.id = SC.section_id
#   AND SE.type = 'lecture';