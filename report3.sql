/* Justin Pilecki */
/* December 12, 2019 */

spool report3-results.txt

/* The owner would like a view that shows the information of the accomodations
   and residents. Specifically, the room number, room size, the ID and type of
   the pet at each room. */

clear breaks
clear columns
clear computes

set newpage 0

ttitle 'Loving Pet Care|Housing'
btitle '2019'

col room_num heading 'Room|Number'
col room_size heading 'Room|Size'
col pet_id heading 'Pet|ID'
col pet_type heading 'Pet|Type' format a10

set pagesize 20

drop view pet_room;

create view pet_room as
select Accomodation.room_num,
       Accomodation.room_size,
       Accomodation.pet_id,
       Pet.pet_type
from Accomodation, Pet
where Accomodation.pet_id = Pet.PET_ID
order by room_num;

select *
from pet_room;

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
