drop table Tab_Course_Feedback;
drop table Tab_Student;
drop table Tab_Course;
drop table Tab_Teacher;
drop table Tab_Feedback;



create table Tab_Feedback(
	feedback_id number(2) PRIMARY KEY,
	field1 number(1),
	field2 number(1),
	field3 number(1),
	comment1 varchar2(30),
	comment2 varchar2(30),
	CONSTRAINT CHK_feedback_rating CHECK (field1 >= 0 AND field1 <= 5 AND field2 >= 0 AND field2 <= 5 AND field3 >= 0 AND field3 <= 5)
);

insert into Tab_Feedback values(1,2,2,2,'IIT2017000','1');
insert into Tab_Feedback values(2,2,2,2,'IIT2017001','2');
insert into Tab_Feedback values(3,2,2,2,'IIT2017002','3');
insert into Tab_Feedback values(4,2,2,2,'IIT2017003','4');
insert into Tab_Feedback values(5,2,2,2,'IIT2017004','5');	


create table Tab_Teacher(
	fac_code varchar2(4) NOT NULL PRIMARY KEY,
	first_name varchar2(15),
	last_name varchar2(15),
	designation varchar2(15) CHECK (Designation in ('Prof.' , 'Dr', 'Assc. Prof.', 'Asst. Prof.')),
	dept varchar2(15) CHECK (Dept in ('IT', 'ECE', 'MBA'))
);

insert into Tab_Teacher values ('SMA', 'S', 'MAITY', 'Asst. Prof.', 'IT');
insert into Tab_Teacher values ('RK', 'R', 'KALA', 'Asst. Prof.', 'IT');
insert into Tab_Teacher values ('SY', 'S', 'YADAV', 'Asst. Prof.', 'ECE');
insert into Tab_Teacher values ('RV', 'R', 'VYAS', 'Asst. Prof.', 'IT');
insert into Tab_Teacher values ('OPV', 'OP', 'VYAS', 'Prof.', 'IT');
insert into Tab_Teacher values ('JS', 'J', 'S', 'Prof.', 'IT');
insert into Tab_Teacher values ('MJ', 'M', 'J', 'Prof.', 'IT');
insert into Tab_Teacher values ('AKT', 'A', 'T', 'Prof.', 'IT');

create table Tab_Student(
	enroll_id varchar2(10) NOT NULL PRIMARY KEY,
	first_name varchar2(15),
	last_name varchar2(15),
	degree varchar2(15) CHECK (Degree in ('B.Tech', 'M.Tech', 'B.Tech + M.Tech', 'M.B.A')),
	join_year number(4)
);

insert into Tab_Student values ('IIT2017000', 'A', 'Verma', 'B.Tech', 2017);
insert into Tab_Student values ('IIT2017001', 'B', 'Sharma', 'B.Tech', 2017);
insert into Tab_Student values ('IIT2017002', 'G', 'Agarwal', 'B.Tech', 2017);
insert into Tab_Student values ('IIT2017003', 'D', 'Singh', 'B.Tech', 2017);
insert into Tab_Student values ('IIT2017004', 'E', 'Arora', 'B.Tech', 2017);

create table Tab_Course(
	course_code varchar2(10) NOT NULL PRIMARY KEY,
	course_name varchar2(50),
	sessions varchar2(15),
	l_t_p varchar2(10)
);

insert into Tab_Course values ('DBMS', 'Database_Management_Systems', 'JAN_JULY_2019', '3-0-1');
insert into Tab_Course values ('IDAA', 'Design_And_Analysis_Of_Algorithms', 'JAN_JULY_2019', '3-0-1');
insert into Tab_Course values ('IPPL', 'Principles_Of_Programming_Languages', 'JAN_JULY_2019', '3-0-0');
insert into Tab_Course values ('SMAT', 'Convex_Optimisation', 'JAN_JULY_2019', '3-0-0');
insert into Tab_Course values ('IOOM', 'Object Oriented', 'JAN_JULY_2019', '3-0-0');

create table Tab_Course_Feedback(
	teacher_id varchar2(4),
	course_id varchar2(10),
	student_id varchar2(10),
	feedback_id number(10),
	CONSTRAINT PK_course_feedback PRIMARY KEY (teacher_id, course_id, student_id),
	CONSTRAINT FK_teacherfeedback FOREIGN KEY(teacher_id) REFERENCES tab_teacher(fac_code) ON DELETE CASCADE,
	CONSTRAINT FK_coursefeedback FOREIGN KEY(course_id) REFERENCES tab_course(course_code) ON DELETE CASCADE,
	CONSTRAINT FK_studentfeedback FOREIGN KEY(student_id) REFERENCES tab_student(enroll_id) ON DELETE CASCADE,
	CONSTRAINT FK_feedback_id FOREIGN key(feedback_id) REFERENCES tab_feedback(feedback_id) ON DELETE CASCADE
);

insert into Tab_Course_Feedback values('SMA','DBMS','IIT2017000',1);
insert into Tab_Course_Feedback values('RK','IOOM','IIT2017001',2);
insert into Tab_Course_Feedback values('JS','IPPL','IIT2017002',3);
insert into Tab_Course_Feedback values('MJ','IDAA','IIT2017003',4);
insert into Tab_Course_Feedback values('AKT','SMAT','IIT2017004',5);	
