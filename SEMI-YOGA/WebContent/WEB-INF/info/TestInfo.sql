/*	table list
 * 		yoga_member
 * 		yoga_teacher
 * 		yoga_subject > yoga_program
 * 		yoga_class
 * 		registerStatus
 * sequence list
 * 		tchNo_seq
 * 		subNo_seq
 * 		class_seq
 */
select *from YOGA_class
select *from registerStatus

select prg.programName, tch.teacherNick, count(reg.classNo), cls.classNo, cls.classTime, cls.classDay, cls.capacity
from yoga_program prg, yoga_teacher tch, registerStatus reg, yoga_class cls, yoga_member mem
where cls.classNo=reg.classNo and mem.id=reg.id and cls.teacherId=tch.teacherId and prg.programNo=cls.programNo
group by prg.programName,tch.teacherNick,cls.classNo,cls.classTime, cls.classDay,cls.capacity
commit

select prg.programName, tch.teacherNick, cls.classNo, cls.classTime, cls.classDay, cls.capacity
from yoga_program prg, yoga_teacher tch, yoga_class cls
where cls.programNo=prg.programNo and cls.teacherId=tch.teacherId
order by cls.classNo asc

select cls.classNo, count(reg.classNo)
from registerStatus reg, YOGA_CLASS cls, YOGA_MEMBER mem
where reg.classNo=cls.classNo and reg.id=mem.id
group by cls.classNo
order by cls.classNo asc


select prg.programName, tch.teacherNick, cls.classDay, cls.classTime, reg.regDate
from YOGA_PROGRAM prg, YOGA_TEACHER tch, YOGA_CLASS cls, REGISTERSTATUS reg
where reg.id='db' and reg.classNo=cls.classNo and prg.programNo=cls.programNo and tch.teacherId=cls.teacherId 

select prg.programName, tch.teacherNick, cls.classTime, cls.classDay, reg.regDate 
from YOGA_PROGRAM prg, YOGA_TEACHER tch, YOGA_CLASS cls, REGISTERSTATUS reg 
where reg.id='db' and reg.classNo=cls.classNo and prg.programNo=cls.programNo and tch.teacherId=cls.teacherId

select prg.programName, tch.teacherNick, cls.classTime, cls.classDay, to_char(reg.regDate,'YY/MM/DD'), reg.classNo 
from YOGA_PROGRAM prg, YOGA_TEACHER tch, YOGA_CLASS cls, REGISTERSTATUS reg 
where reg.id='db' and reg.classNo=cls.classNo and prg.programNo=cls.programNo and tch.teacherId=cls.teacherId 

select *from yoga_member
select *from registerStatus
select *from yoga_teacher
select *from yoga_program
select *from yoga_class
