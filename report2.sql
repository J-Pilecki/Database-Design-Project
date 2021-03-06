/* J. Pilecki */
/* December 12, 2019 */

spool report-results2.txt

/* The owner would like to see the salaries of all the employees, along with a
   computed salary average on availability. The training status and
   availability will also be displayed, as a review of progress of each
   employee. */

clear breaks
clear columns
clear computes

set newpage 0

ttitle 'Loving Pet Care|Employee Salaries|Availability and Training'
btitle '2019'

col empl_lname heading 'Employee|Last Name' format a10
col training_status heading 'Employee|Trained' format a10
col salary heading 'Employee|Salary/Hour' format $99
col availability heading 'Number of|Days per Week|Available'

set pagesize 40

break on availability skip 1
compute avg label 'Average' of salary on availability

select empl_lname, salary, availability, training_status
from Employee
order by availability desc;

clear breaks
clear columns
clear computes

set space 1
set feedback 6
set pagesize 14
set linesize 80
set newpage 1
set heading on

ttitle off
btitle off

spool off
