create table yoga_member(
id varchar2(50) primary key,
password varchar2(50) not null,
name varchar2(50) not null,
phone_number NUMBER not null,
address varchar2(100) not null,
email varchar2(100) not null,
password_question varchar2(100) not null,
password_answer varchar2(100) not null,
regDate date not null,
member_status varchar2(10) not null,
class_package varchar2(10) not null --3회 or 5회
)

-- 요가 강사 테이블 생성
create table yoga_teacher(
teacherId NUMBER primary key,
teacherName varchar2(50) not null,
teacherNick varchar2(50) not null,
teacherProfile varchar2(600),
imgUrl varchar2(100)
)
-- teacherId 시퀀스 생성
drop sequence tchNo_seq
create sequence tchNo_seq;

-- 요가 프로그램 테이블 생성
create table yoga_program(
programNo NUMBER primary key,
programName varchar2(50) not null,
programDetail varchar2(50)
)
-- programNo 시퀀스 생성
drop sequence prgNo_seq
create sequence prgNo_seq;

-- 요가 강좌 테이블 생성
create table yoga_class(
classNo NUMBER primary key,
programNo NUMBER not null,
teacherId NUMBER not null,
capacity NUMBER not null,
classTime NUMBER not null,
classDay varchar2(10) not null,
constraint fk_teacherId foreign key(teacherId) references YOGA_TEACHER(teacherId),
constraint fk_programNo foreign key(programNo) references yoga_program(programNo),
constraint uk_class unique(programNo, teacherId, classTime, classDay)   
)
-- classNo 시퀀스 생성
drop sequence class_seq
create sequence class_seq;

create table registerStatus(
rsNo NUMBER PRIMARY KEY, 
classNo NUMBER not null,
id VARCHAR2(100) not null,
regDate date not null,
constraint fk_class foreign key(classNo) references yoga_class(classNo),
constraint fk_yoga_member foreign key(id) references yoga_member(id)
)

create sequence rs_seq;  

drop sequence post_seq
create sequence post_seq; //postNo 생성
create table POST(
postNo NUMBER primary key,
title varchar2(100) not null,
content clob not null,
id varchar2(50) not null,
regDate date not null,
constraint fk_post2 foreign key(id) references yoga_member(id)
)
drop table registerStatus
drop table yoga_member
drop table POST
drop table yoga_class;
drop table yoga_teacher;
drop table yoga_program;

drop sequence post_seq;
drop sequence class_seq;
drop sequence prgNo_seq;
drop sequence tch_seq;

select * from yoga_member;
select * from yoga_class;
select * from yoga_teacher;
select * from yoga_program;
select * from POST;
select * from registerStatus
--멤버추가
insert into yoga_member(
id,
password,
name,
phone_number,
address,
email,
password_question,
password_answer,
regDate,
member_status,
class_package
) values('java','1234','Song',5152,'판교','naver.com','test','test',sysdate,'true','3');

insert into yoga_member(
id,password,name,phone_number,address,email,password_question,password_answer,regDate,member_status,class_package
) values('python','1234','hwang',2345,'수원','google.com','test','test',sysdate,'true','5');

insert into yoga_member(
id,password,name,phone_number,address,email,password_question,password_answer,regDate,member_status,class_package
) values('spring','1234','byun',2345,'강남','google.com','test','test',sysdate,'true','5');

insert into yoga_member(
id,password,name,phone_number,address,email,password_question,password_answer,regDate,member_status,class_package
) values('css','1234','bbaik',2345,'수원','google.com','test','test',sysdate,'true','3');

insert into yoga_member(
id,password,name,phone_number,address,email,password_question,password_answer,regDate,member_status,class_package
) values('db','1234','yu',2345,'서현','daum.com','test','test',sysdate,'true','3');

insert into yoga_member(
id,password,name,phone_number,address,email,password_question,password_answer,regDate,member_status,class_package
) values('script','1234','zo',2345,'수원','google.com','test','test',sysdate,'true','5');

--관리자
insert into yoga_member(
id,password,name,phone_number,address,email,password_question,password_answer,regDate,member_status,class_package
) values('sys','1234','hwang',3434,'판교','naver.com','test','test',sysdate,'true','3');
--기본 게시물 추가
insert into POST(
postNo,
title,
content,
id,
regDate
) values(post_seq.nextval, 'hello','shut up','java', sysdate);

--선생님 추가
insert into yoga_teacher(
teacherId,
teacherName,
teacherNick,
teacherProfile,
imgUrl
) values(tchNo_seq.nextval,'이승훈','SH','올림픽 금메달리스트','none');

--선생님 추가
insert into yoga_teacher(
teacherId,
teacherName,
teacherNick,
teacherProfile,
imgUrl
) values(tchNo_seq.nextval,'비비안','BBIBA','외쿡인임니다','none');

insert into yoga_teacher(
teacherId,
teacherName,
teacherNick,
teacherProfile,
imgUrl
) values(tchNo_seq.nextval,'윤미','YOON MI','막내입니','none');

--프로그램 추가
insert into yoga_program(
programNo,
programName,
programDetail
) values(prgNo_seq.nextval,'PILATES','MON&WEN');

--프로그램 추가
insert into yoga_program(
programNo,
programName,
programDetail
) values(prgNo_seq.nextval,'VINYASA','승훈쌤 담당');

insert into yoga_program(
programNo,
programName,
programDetail
) values(prgNo_seq.nextval,'ASHTANGA','Everyday');

insert into yoga_program(
programNo,
programName,
programDetail
) values(prgNo_seq.nextval,'BALL THERAPHY','막내 담당');

insert into yoga_program(
programNo,
programName,
programDetail
) values(prgNo_seq.nextval,'FOREST','THU');

select *from yoga_program, yoga_teacher

--클래스 추가
insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,1,1,5,1,'mon');

--클래스 추가
insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,1,1,5,2,'wen');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,2,1,5,2,'mon');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,2,1,5,3,'mon');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,2,1,5,1,'thu');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,2,1,5,7,'fri');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,3,2,5,5,'mon');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,3,2,5,1,'TUE');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,3,2,5,5,'wen');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,3,2,5,7,'wen');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,3,2,5,2,'thu');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,3,2,5,3,'fri');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,4,3,5,6,'thu');

insert into yoga_class(
classNo,
programNo,
teacherId ,
capacity,
classTime,
classDay
) values(class_seq.nextval,5,3,5,4,'thu');

select *from yoga_class, yoga_member

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 1,'java', sysdate);
update yoga_member set class_package=class_package-1 where id='java';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 2,'java', sysdate);
update yoga_member set class_package=class_package-1 where id='java';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 4,'python', sysdate);
update yoga_member set class_package=class_package-1 where id='python';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 9,'python', sysdate);
update yoga_member set class_package=class_package-1 where id='python';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 13,'python', sysdate);
update yoga_member set class_package=class_package-1 where id='python';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 1,'spring', sysdate);
update yoga_member set class_package=class_package-1 where id='spring';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 14,'spring', sysdate);
update yoga_member set class_package=class_package-1 where id='spring';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 1,'css', sysdate);
update yoga_member set class_package=class_package-1 where id='css';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 10,'css', sysdate);
update yoga_member set class_package=class_package-1 where id='css';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 1,'db', sysdate);
update yoga_member set class_package=class_package-1 where id='db';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 7,'db', sysdate);
update yoga_member set class_package=class_package-1 where id='db';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 1,'script', sysdate);
update yoga_member set class_package=class_package-1 where id='script';

insert into registerStatus(rsNo, classNo, id, regDate)
values(rs_seq.nextVal, 4,'script', sysdate);
update yoga_member set class_package=class_package-1 where id='script';

select *from registerStatus


