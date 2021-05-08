/* Justin Pilecki */
/* December 12, 2019 */

spool report1-results.txt

/* The owner of the Pet Motel wants to plan a training session for volunteers,
   but needs to know which volunteers past Volunteer ID of 2 still need to be
   trained. The owner knows that the first volunteer (ID: 1) will be out of
   town for the summer, and that the second volunteer (ID: 2) has recently been
   trained, so they do not need to be included. The following report is a join
   of the Volunteer table and the Training table, singling out Volunteers who
   need to be trained past ID: 2. */

clear breaks
clear columns
clear computes

set newpage 0

ttitle 'Loving Pet Care|Volunteer Training Status'
btitle '2019'

col training_status heading Training|Status format a10
col volunteer_lname heading 'Volunteer|Last Name' format a10
col volunteer_id heading Volunteer|ID

select Volunteer.volunteer_lname,
       Training.training_status,
       Volunteer.volunteer_id
from Volunteer, Training
where Training.volunteer_id = Volunteer.VOLUNTEER_ID
and Training.training_status = 'No'
and Volunteer.VOLUNTEER_ID > 3
order by volunteer_id;

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
