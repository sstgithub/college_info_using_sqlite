
#Find all professors who teach computer science
select professors.name from professors 
inner join courses on professors.id = courses.professor_id 
inner join subjects on courses.subject_id = subjects.id 
where subjects.department = "Computer Science";

#Find all courses starting in January
select * from subjects
inner join courses on subjects.id = courses.subject_id
 

#Find all courses starting after March but before December
select subjects.name, courses.level from subjects
inner join courses on subjects.id = courses.subject_id
where courses.start_date > date('2015-03-31') AND courses.start_date < date('2015-12-01')
#sqlite doesnt tell you when stuff doesnt work?!?!?
#Beware of DOUBLE vs SINGLE quotation marks!!


#Find all subjects that begin with the letter "R"
select * from subjects
where subjects.name LIKE "R%";

#Find all professors who teach more than one course, and also list their department
select professors.name, subjects.department from professors 
inner join courses on professors.id = courses.professor_id 
inner join subjects on courses.subject_id = subjects.id 
group by professors.name, subjects.department
having count(courses.professor_id) > 1;