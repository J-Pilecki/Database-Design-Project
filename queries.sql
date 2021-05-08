/* Justin Pilecki */
/* December 12, 2019 */

spool query-results.txt

prompt Query 1 will list all customer last names whose pets are staying at the
prompt  Pet Motel and link them up with their pet types.

/* join */

select cust_lname, pet_type
from Customer, Pet
where Customer.CUST_ID = Pet.cust_id;

prompt Query 2 will list the average salary of the employees.

/* count */

select avg(salary)
from Employee
order by salary;

prompt Query 3 will list the training status of the lowest paid employee(s).

/* nested */

select empl_lname, training_status
from Employee
where salary = (select min(salary)
                from Employee);

prompt Query 4 will list the volunteer IDs, and last names of people NOT yet
prompt trained, for training ID's greater than or equal to 2.

/* compound where */

select Volunteer.volunteer_id, Training.training_status, Volunteer.volunteer_ln$
from Training, Volunteer
where Training.volunteer_id = Volunteer.VOLUNTEER_ID
and Training.training_status = 'No'
and training_id >= 2;

prompt Query 5 will list the average number of days per week an Employee is
prompt available to work.

/* group by */

select Employee.empl_lname, avg(availability)
from Employee
group by empl_lname;

prompt Query 6 will update the class start time of the first class to nine
prompt o'clock.

update Class
set start_time = '9:00'
where class_id = 1;

select *
from Class
where class_id = 1;

prompt Query 7 will create and display a view containing accomodation room
prompt numbers, room size, and pet ID's.

drop view accomo;

create view accomo as
select room_num, room_size, pet_id
from Accomodation;

select *
from accomo;

prompt Query 8 will perform a union of all employee last names and volunteer
prompt last names.

(select empl_lname "All Last Names"
 from Employee)
union
(select volunteer_lname
 from Volunteer);

spool off
