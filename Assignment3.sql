
-- Query1
SELECT  prof.profName
From (prof JOIN dept ON  prof.deptname=dept.deptname)
where dept.numPhDs<45 ;


-- Query2
SELECT studentName FROM student
WHERE student.gpa= (SELECT MIN(gpa) FROM student);

-- Query3 
SELECT cno,sectno,avg(gpa) from  enroll
JOIN student ON enroll.sid=student.sid 
WHERE enroll.deptName="Computer Science"
GRoup BY cno,sectno;

-- Query4
SELECT enroll.cno,sectno,count(enroll.sid),courseName FROM enroll
JOIN course ON enroll.cno =course.cnocoursedept
GRoup BY cno,sectno
HAVING count(enroll.sid)<12;

-- Query5

SELECT studentName,student.sid FROM student
JOIN enroll ON enroll.sid=student.sid
GROUP BY student.sid
HAVING count(student.sid)=
		(SELECT MAX(class) FROM ( SELECT count(student.sid) AS class FROM student
		JOIN enroll ON enroll.sid=student.sid
		GROUP BY student.sid) AS cc
		);
        
        
 -- Query6 
 
 SELECT student.studentName,major.deptName FROM course 
JOIN enroll on enroll.cno=course.cno 
JOIN major On major.sid=enroll.sid
JOIN student On student.sid=enroll.sid
WHERE courseName LIKE 'College Geometry%'; 

-- QUEARY 7
SELECT * from dept d;

 
 
 -- QUERY 8
select student.sid,student.studentName,enroll.deptName from student
 right outer JOIN enroll 
on enroll.sid=student.sid
where  student.studentName in('computer science' 'civil Engineering');
 
 
 -- QUERY 9

		SELECT d.deptName AS 'Name of the Major',
        AVG(gpa) AS 'Average GPA' FROM dept d 
		JOIN major   m ON   m.deptName=d.deptName
        JOIN student s ON   s.sid=m.sid
		GROUP BY m.deptName
		HAVING COUNT(s.sid) >= 4;
        
        
 -- QUARY 10
 -- Some of the class number  are not include in  section where prof are divided into section.
 -- AS a result we cant find out the gpa for all the civil enginnering course.
 