drop table IF EXISTS student;

create table student(
id                int 	       not null AUTO_INCREMENT,
naam       	      varchar(50)  not null,
klas              varchar(10)  not null,
primary key (id)
);


insert into student(naam,klas)
values ('Jan Verbeek', '1NB');
insert into student(naam,klas)
values ('Koen Verdonk', '2NB');
insert into student(naam,klas)
values ('Jorn de Houwer', '3NB');
insert into student(naam,klas)
values ('Anna Verlinden', '1PR');
insert into student(naam,klas)
values ('Kim Mangelschots', '1PR');
insert into student(naam,klas)
values ('Dylan van Herk', '2PR');
insert into student(naam,klas)
values ('Els Wouters', '3PR');

