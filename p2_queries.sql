# i. Create/Delete/Edit/Display a faculty member.

# ii. Create/Delete/Edit/Display a Student.

# iii. Create/Delete/Edit/Display a Teaching Assistant.

# iv. Give a list of all campuses.
select *
from Campus;

# v. Give a list of buildings on a given campus.
select name, abbreviation
from Building
where campus in (
    select abbreviation from Campus
    where name = 'Loyola'
    );

# vi. Give details of a specific building (this include address of the building,
# number of floors, number of rooms in each floor, and details of each room
# such as room type, capacity of the room and existing facilities in the room
# if it is a classroom or a lab.

# vii. Get a list of all programs available in a specific department along with the
# number of credits required for completion in each program.

select Program.name, credits
from Program
inner join Department on Program.department_id = Department.id
where Department.name = 'Computer Science';

# viii. Get a list of all courses offered in a given term by a specific program.
select code, Course.name as course_name
from Course
inner join Section on Course.code = Section.course_code
where term  = 'summer' and year = 2018
group by code;

# ix. Get the details of all the courses offered by a specific department for a
# specific term. Details include Course name, section, room location, start
# and end time, professor teaching the course, max class capacity and
# number of enrolled students.

select code, Course.name as course_name, Section.name as section,
       start_time, end_time, day, Section.type, Section.term, credits,
       concat(first_name, ' ', last_name) as Professor,
       count(student_ssn) as num_students,
       Section.building_abbreviation, Section.room_floor, Section.room_number, capacity
from Section
inner join Room on Section.building_abbreviation = Room.building_abbreviation and
                   Section.room_floor = Room.room_floor and
                   Section.room_number = Room.room_number
inner join Instructor on Section.instructor_ssn = Instructor.ssn
inner join Employee on Instructor.ssn = Employee.ssn
inner join Person on Employee.ssn = Person.ssn
inner join Course on Section.course_code = Course.code
inner join SectionEnrollment on Section.id = SectionEnrollment.section_id
where term = 'summer' and year = 2018 and
      department_id = (
          select id from Department
          where Department.name = 'Computer Science'
          )
group by Section.id;

# x. Find ID, first name and last name of all the students who are enrolled in a
# specific program in a given term.

select concat(first_name, ' ', last_name) as name, Person.ssn
from Person
where ssn in (
    select ssn from Student
    where ssn in (
        select student_ssn from Studies
        where program_id = (
            select id from Program
            where name = 'Computer Science Undergraduate'
            )
        )
    );

# xi. Find the name of all the instructors who taught a given course on a
# specific term.

select distinct concat(first_name, ' ', last_name) as Professor
from Person
where ssn in (
    select instructor_ssn from Section
    where year = 2018 and term = 'fall'
    );

# xii. Give a list of all supervisors in a given department.

select distinct concat(first_name, ' ', last_name) as supervisior
from GradStudents
inner join Person on supervisor_ssn = Person.ssn;

# xiii. Give a list of all the advisors in a given department.

select concat(first_name, ' ', last_name) as advisior
from Advisor
inner join Person on Advisor.ssn = Person.ssn
where Advisor.ssn in (
    select advisor_ssn from Program
    where Program.id in (
        select id from Department
        where name = 'Electrical Engineering'
        )
    );

# xiv. Find the name and IDs of all the graduate students who are supervised by
# a specific Professor.

select distinct concat(first_name, ' ', last_name) as student_name, ssn
from Person
where ssn in (
    select ssn from GradStudents
    where supervisor_ssn in (
        select Instructor.ssn from Instructor
        where Instructor.ssn in (
            select ssn from Person
            where first_name = 'Michael' and last_name = 'Clarke'
            )
        )
    );

# xv. Find the ID, name and assignment mandate of all the graduate students
# who are assigned as teaching assistants to a specific course on a given
# term.

select assignee_ssn, position,
       concat(Person.first_name, ' ', Person.last_name) as TA_name
from Person
inner join TAPosition on Person.ssn = assignee_ssn
where section_id in (
    select Section.id from Section
    where term = 'summer' and year = 2018 and course_code = 'comp353'
    );

# xvi. Find the name, IDs and total amount of funds received by all the graduate
# students who received research funds in a given term.

select concat(Person.first_name, ' ', Person.last_name) as name,
       sum(amount) as funds
from Person
inner join ResearchFundingApplications on student_ssn = Person.ssn
left join ResearchFunds on ResearchFundingApplications.research_fund_id = ResearchFunds.id
group by ssn;

# xvii. For each department, find the total number of courses offered by the
# department and the name of its chairman.

select Department.name as dep_name, count(Course.code) as num_courses,
       concat(Person.first_name, ' ', Person.last_name) as Professor
from Department
left join Course on Department.id = Course.department_id
left join Instructor on Instructor.ssn = chairman_ssn
left join Person on chairman_ssn = Person.ssn
group by Department.name;

# xviii. For each program, find the total number of students enrolled into the
# program.

select Program.name, count(student_ssn) as number_of_students
from Program, Studies
where program_id = id
group by Program.name;

# xix. Give a list of courses taken by a specific student in a given term.

select count(distinct course_code) as count,
       group_concat(distinct course_code separator ', ') as courses
from Section
inner join SectionEnrollment on Section.id = section_id
where year = 2018 and term = 'fall' and
      student_ssn = 645399011;

# xx. Register a student in a specific course.

# xxi. Drop a course for a specific student.

# xxii. Give a detailed report for a specific student (This include personal data,
# academic history, courses taken and grades received for each course,
# GPA, etc.)