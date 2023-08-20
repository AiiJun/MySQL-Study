SELECT * FROM `employee`;

SELECT * FROM employee WHERE age in(20,21,22,23) and sex = '女';

SELECT * FROM employee WHERE sex = '男' and (age BETWEEN 20 and 40) and name like '___';

SELECT sex,COUNT(*) '统计' FROM employee WHERE age < 60 GROUP BY sex;

SELECT name,age FROM employee WHERE age < 35 ORDER BY age ASC,entrydate DESC;
SELECT name,age FROM employee WHERE age < 35 ORDER BY age ASC;

SELECT * FROM employee WHERE sex = '男' && age BETWEEN 20 and 40 ORDER BY age,entrydate asc LIMIT 5;

//由于业务需求变更，企业员工的工号，统一为5位数，目前不足5位数的全部在前面补0。比如：1号员工的工号应该为000001。
UPDATE employee SET workno = LPAD(workno,6,'0');

//通过数据库的函数，生成一个六位数的随机验证码。
SELECT rand();
SELECT RAND()*1000000;
SELECT ROUND(RAND()*1000000,0);
SELECT LPAD(ROUND(rand()*1000000,0),6,'0');

//查询所有员工的入职天数，并根据入职天数倒序排序。
SELECT name,DATEDIFF(CURDATE(),entrydate)'入职天数' FROM employee ORDER BY DATEDIFF('2023-07-20',entrydate) DESC;

//统计班级各个成员的成绩，展示的规则如下：>=85,展示优秀,>=60,展示及格,否则，展示不及格
CREATE TABLE score(
	id int COMMENT 'ID',
	name VARCHAR(20) COMMENT '姓名',
	math int COMMENT '数学',
	english int COMMENT '英语',
	chinese int COMMENT '语文'
)comment '学员成绩表';
INSERT into score(id,name,math,english,chinese) VALUES(1,'小明',90,60,66),(2,'小红',77,92,82),(3,'小刚',76,97,56);

SELECT * FROM score;

SELECT name,
(case WHEN age >= 40 then '壮年' WHEN age >= 20 THEN '青壮年' ELSE '青少年' END)'年龄段'
FROM employee;

SELECT
	id,
	name,
	(case WHEN math >= 85 THEN '优秀' when math >= 60 then '及格' ELSE '不及格' END)'数学',
	(case WHEN math >= 85 THEN '优秀' when math >= 60 then '及格' ELSE '不及格' END)'英语',
	(case WHEN math >= 85 THEN '优秀' when math >= 60 then '及格' ELSE '不及格' END)'语文'
from score;


create table salgrade(
	grade int,
	losal int,
	hisal int
)COMMENT '薪资等级表';
INSERT into salgrade VALUES(1,0,3000),(2,3001,5000),(2,5001,8000),(2,8001,10000),(2,10001,15000),(2,15001,20000),(2,20001,25000),(2,25001,30000);

SELECT e.name,e.age,e.job,d.name FROM emp e,dept d WHERE e.dept_id = d.id;
SELECT e.name,e.age,e.job,d.name FROM emp e INNER JOIN dept d on e.dept_id = d.id;
SELECT e.name,e.age,e.job,d.name FROM emp e INNER JOIN dept d on e.dept_id = d.id WHERE e.age < 30;
SELECT d.id,d.`name` FROM emp e INNER JOIN dept d on e.dept_id = d.id;
SELECT DISTINCT d.id,d.`name` FROM emp e,dept d WHERE e.dept_id = d.id;
SELECT e.name,d.name FROM emp e left JOIN dept d ON e.dept_id = d.id WHERE e.age > 40;
SELECT e.`name`,s.grade,s.losal,s.hisal FROM emp e,salgrade s WHERE e.salary >= s.losal and e.salary <= s.hisal;
SELECT e.`name`,s.grade,d.`name` FROM emp e,salgrade s,dept d WHERE e.salary BETWEEN s.losal and s.hisal and e.dept_id = d.id and d.`name` = '研发部';
SELECT AVG(e.salary)'平均工资' FROM emp e,dept d WHERE e.dept_id = d.id;
SELECT salary FROM emp WHERE name = '那英';
SELECT * FROM emp WHERE salary > 12500;
SELECT * FROM emp WHERE salary > (SELECT salary FROM emp WHERE name = '张三丰');
SELECT ROUND(AVG(salary),0) FROM emp;
SELECT * FROM emp WHERE salary > 12500;
SELECT * FROM emp WHERE salary > (SELECT ROUND(AVG(salary),0) FROM emp);
SELECT id,name,id'人数' FROM dept;
SELECT d.id,d.name,(SELECT COUNT(*) FROM emp e WHERE e.dept_id = d.id)'人数' FROM dept d;
SELECT COUNT(*) FROM emp e WHERE e.dept_id = 1;
SELECT s.name,s.no,c.name FROM student s,course c,student_course sc WHERE s.id = sc.studentid and sc.courseid = c.id;