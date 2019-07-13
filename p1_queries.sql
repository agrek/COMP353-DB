#I
select first_name, last_name, id
from Student
where id in
    (select student_id
    from SectionEnrollment
    where (grade = 'a+' or grade = 'a')
    and section_id in
        (select id
        from Section
        where course_id = 'comp353')
    );

#X
select Program.name, count(program_id)
from Program, Studies
where program_id = id
group by Program.name;

#IX
select Department.name, count(Course.department_id)
from Department, Course
where Course.department_id = Department.id
group by Department.name;

#IX ALTERNATIVE
select Department.name, count(*) as count
from Course
inner join Department on Course.department_id = Department.id
group by department_id;