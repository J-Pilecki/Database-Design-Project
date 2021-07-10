drop table Pet cascade constraints;
drop table Customer cascade constraints;
drop table Customer_phones cascade constraints;
drop table Customer_pets cascade constraints;
drop table Customer_classes cascade constraints;
drop table Class cascade constraints;
drop table Employee cascade constraints;
drop table Employee_phones cascade constraints;
drop table Employee_classes cascade constraints;
drop table Employee_training cascade constraints;
drop table Volunteer_training cascade constraints;
drop table Pet_walks cascade constraints;
drop table Volunteer cascade constraints;
drop table Volunteer_phones cascade constraints;
drop table Training cascade constraints;
drop table Accomodation cascade constraints;
drop table Dog cascade constraints;
drop table Cat cascade constraints;

/* Table Volunteer holds attributes of the Volunteers at the motel */

create table Volunteer
(volunteer_id int,
training_status varchar2(5),
volunteer_lname varchar2(15),
availability int,
primary key (volunteer_id));

/* Table Customer holds attributes about a customer who checks their pet into
the motel */

create table Customer
(cust_id int,
 cust_lname varchar2(15),
 primary key (cust_id));

/* Table Employee holds attributes of the employees */

create table Employee
(empl_id int,
training_status varchar2(15),
empl_lname varchar2(15),
availability int,
salary int,
primary key (empl_id));

/* Table Training holds data on the training that both employees and
volunteers receive */

create table Training
(training_id int,
training_status varchar2(5),
empl_id int,
volunteer_id int,
primary key (training_id),
foreign key (empl_id) references Employee,
foreign key (volunteer_id) references Volunteer);

/* Table Pet holds attributes about pets that are checked into the motel */

create table Pet
(pet_id integer,
cust_id integer,
room_num integer,
pet_type varchar2(3),
primary key (pet_id),
foreign key (cust_id) references Customer(cust_id));

/* Table Accomodation holds attributes of the pet accomodations at the motel */

create table Accomodation
(room_num int,
room_size int,
pet_id int,
primary key (room_num),
foreign key (pet_id) references Pet);

/* Table Customer_phones holds the possibly multiple phone numbers of
customers */

create table Customer_phones
(cust_id int,
cust_phone varchar2(10),
primary key (cust_id, cust_phone),
foreign key (cust_id) references Customer);

/* Table Customer_pets holds the possibly multiple pets of customers */

create table Customer_pets
(cust_id int,
cust_pet varchar2(3),
primary key (cust_id, cust_pet),
foreign key (cust_id) references Customer);

/* Table Customer_classes holds whether or not a customer enrolls in a class */

create table Customer_classes
(cust_id int,
cust_classes varchar2(10),
primary key (cust_id, cust_classes),
foreign key (cust_id) references Customer);

/* Table Class holds attributes of the classes that dogs and customers attend */

create table Class
(class_id int,
instructor varchar2(15),
start_time varchar2(5),
end_time varchar2(5),
roster int,
pet_id int,
cust_id int,
primary key (class_id),
foreign key (pet_id) references Pet,
foreign key (cust_id) references Customer);

/* Table Employee_phones holds the possibly multiple phones of an Employee */

create table Employee_phones
(empl_id int,
empl_phones varchar2(10),
primary key (empl_id, empl_phones),
foreign key (empl_id) references Employee);

/* Table Employee_classes holds which employees instruct classes */

create table Employee_classes
(empl_id int,
empl_classes int,
primary key (empl_id, empl_classes),
foreign key (empl_id) references Employee);

/* Table Employee_training holds data for the training that employees have */

create table Employee_training
(empl_id int,
training_id int,
primary key (empl_id, training_id),
foreign key (empl_id) references Employee);

/* Table Volunteer_training holds data for the training that volunteers have */

create table Volunteer_training
(volunteer_id int,
training_id int,
primary key (volunteer_id, training_id),
foreign key (volunteer_id) references Volunteer,
foreign key (training_id) references Training);

/* Table Pet_walks holds data on whether a dog has been walked or not */

create table Pet_walks
(pet_id int,
volunteer_id int,
primary key (pet_id, volunteer_id),
foreign key (pet_id) references Pet,
foreign key (volunteer_id) references Volunteer);

/* Table Volunteer_phones holds the possibly multiple phone number of a volunteer */

create table Volunteer_phones
(volunteer_id int,
volunteer_phones varchar2(10),
primary key (volunteer_id, volunteer_phones),
foreign key (volunteer_id) references Volunteer);

/* Table Dog is a subtype of Pet which is disjoint from table Cat */

create table Dog
(pet_id int,
walk_status varchar2(10),
planned_classes varchar2(5),
primary key (pet_id),
foreign key (pet_id) references Pet);

/* Table Cat is a subtype of Pet which is disjoint from table Dog */

create table Cat
(pet_id int,
primary key (pet_id),
foreign key (pet_id) references Pet);
