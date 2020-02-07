drop database if exists students_hostel;
create database students_hostel char set utf8;

use students_hostel;

create table parents (
      id int not null primary key auto_increment,
      parent_name varchar(45) not null,
      work_place varchar(60) not null,
      tel_number varchar(12) not null,
      student_id int not null
);

create table student (
      id int not null primary key auto_increment,
      student_name varchar(45) not null,
      home_adress varchar(120) not null,
      birth_date date not null,
      group_id int not null,
      room_id int not null
);

create table faculty (
      id int not null primary key auto_increment,
      faculty varchar(130) not null,
      speciality varchar(130) not null unique
);

create table group_t (
      id int not null primary key auto_increment,
      id_group varchar(6) not null unique,
      course tinyint not null,
      speciality_id int not null
);

create table rooms (
      id int not null primary key auto_increment,
	  room_number smallint not null unique,
      note text
);

create table furniture (
      id int not null primary key auto_increment,
      invent_number int not null unique,
      furniture_name varchar (30) not null,
      room_id int not null
);

create table incidents (
      id int not null primary key auto_increment,
      incident varchar(30) not null,
      room_id int not null
);

alter table parents add foreign key (student_id) references student(id);
alter table group_t add foreign key (speciality_id) references faculty(id);
alter table student add foreign key (group_id) references group_t(id);
alter table student add foreign key (room_id) references rooms(id);
alter table furniture add foreign key (room_id) references rooms(id);
alter table incidents add foreign key (room_id) references rooms(id);

insert into faculty (faculty, speciality)
      values
            ('Факультет компьютерных и информационных технологий','Системы информации'),
            ('Факультет компьютерных и информационных технологий','Вычислительная техника и программирование'),
            ('Факультет компьютерных наук','Стратегическое управление');
            
insert into group_t (id_group, course, speciality_id)
      values            
            ('СИ-101',1,1),
            ('СИ-201',2,1),
            ('СИ-301',3,1),
            ('СИ-401',4,1),
            ('СИ-501',5,1),
            ('ВТ-101',1,2),
            ('ВТ-201',2,2),
            ('ВТ-301',3,2),
            ('ВТ-401',4,2),
            ('ВТ-501',5,2),
            ('СУ-101',1,3),
            ('СУ-201',2,3),
            ('СУ-301',3,3),
            ('СУ-401',4,3),
            ('СУ-501',5,3);
            
insert into rooms (room_number)
      values
            (179),
            (204),
            (350),
            (414),
            (549);
            
insert into furniture (invent_number, furniture_name, room_id)
      values
            (125, 'шкаф', 1),
            (126, 'стол', 1), 
            (127, 'стул', 1), 
            (128, 'кровать', 1),
            (129, 'вешалка', 1), 
            (130, 'матрац', 1),
            (225, 'шкаф', 2),
            (226, 'стол', 2), 
            (227, 'стул', 2), 
		    (228, 'кровать', 2),
            (229, 'матрац', 2),
            (230, 'вешалка', 2), 
            (325, 'шкаф', 3),
            (326, 'стол', 3), 
            (327, 'стул', 3), 
            (328, 'кровать', 3),
            (329, 'вешалка', 3), 
            (330, 'матрац', 3),
            (350, 'минибар', 3), 
            (425, 'шкаф', 4),
            (426, 'стол', 4), 
            (427, 'стул', 4), 
            (428, 'кровать', 4),
            (429, 'матрац', 4),
            (430, 'вешалка', 4), 
            (525, 'шкаф', 5),
            (526, 'стол', 5), 
            (527, 'стул', 5), 
            (528, 'кровать', 5),
            (529, 'матрац', 5),
			(530, 'вешалка', 5);
            
insert into incidents (incident, room_id)
      values
            ('пьянство',3),
            ('посторонние',3),
            ('пожар',3),
            ('вынос тела',3);
            
 insert into student (student_name, home_adress, birth_date, group_id, room_id)
       values
             ('Иванов Иван Иванович','Киев','1990-01-05',9,1),
             ('Петров Петр Петрович','Полтава','1992-09-12',2,5),
             ('Сидоров Сидор Сидорович','Тернополь','1993-02-09',2,4),
             ('Семенов Семен Семенович','Тель-Авив','1991-03-07',13,3);
             
select
    student_name, home_adress, birth_date, room_number, incident
from student
    join rooms on student.room_id = rooms.id
    join incidents on incidents.room_id = rooms.id;
    
select
    student_name, home_adress, birth_date, room_number, invent_number, furniture_name
from student
    join rooms on student.room_id = rooms.id
    join furniture on furniture.room_id = rooms.id
where room_number = 350;

select
    parent_name, work_place, tel_number, student_name, home_adress, id_group, room_number
from parents
    join student on parents.student_id = student.id
    join group_t on student.group_id = group_t.id
    join rooms on student.room_id = rooms.id
order by student_name desc;             