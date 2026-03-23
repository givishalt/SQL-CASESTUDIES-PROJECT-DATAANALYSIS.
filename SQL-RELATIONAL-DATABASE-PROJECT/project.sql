create database relationaldata;
use relationaldata

create table role
(id int primary key ,
role_name varchar(100))


create table user_has_role
(id int primary key,
role_start_time datetime, 
role_end_time datetime,
user_account_id int ,
role_id int ,

foreign key (user_account_id )references user_account(id),
foreign key (role_id) references role(id) );

create table user_account
( id int primary key,
user_name varchar(100),
email varchar(100) unique ,
password varchar(200) ,
password_salt varchar(50),
password_hash_algorithm varchar(50)

);

create table  status
(id int primary key,
status_name varchar(100),
is_user_working bit );

create table user_has_status 
( id int primary key ,
status_start_time datetime,
status_end_tiem datetime,
user_account_id int ,
status_id int,

foreign key (user_account_id) references user_has_role(id),
foreign key ( status_id) references status(id));


insert into role 
values(1,'Admin'),
(2,'User');

INSERT INTO user_account VALUES
(1,'Vishal','vishal@gmail.com','pass123','salt1','SHA256'),
(2,'Rahul','rahul@gmail.com','pass456','salt2','SHA256');

INSERT INTO status VALUES
(1,'Active',1),
(2,'Inactive',0);

INSERT INTO user_has_role VALUES
(1,'2025-01-01',NULL,1,1),
(2,'2025-01-02',NULL,2,2);


INSERT INTO user_has_status VALUES
(1,'2025-01-01',NULL,1,1),
(2,'2025-01-03',NULL,2,2);


















