create table emp(
    id int comment '编号',
    workno varchar(10) comment '工号',
    name varchar(10) comment '姓名',
    sex char(1) comment '性别',
    age tinyint unsigned comment '年龄',
    idcard char(18) comment '身份证号',
		workaddress VARCHAR(50) COMMENT '工作地址',
    entrydate date comment '入职时间'
) comment '员工表';

alter table emp rename to employee;-- 修改表名

drop TABLE employee;

insert into employee(id,workno,name,sex,age,idcard,entrydate) VALUES(1,'1','linux','男',10,'522127200004077011','2000-01-01');

insert into employee(id,workno,name,sex,age,idcard,entrydate) VALUES(2,'2','linux','男',-1,'522127200004077011','2000-01-01');

SELECT * from employee;

show create table employee;

INSERT INTO employee VALUES(3,'3','易中天','男',234,'123456789123456789','2003-02-23');-- 数据必须完全与表中字段名一致

INSERT INTO employee VALUES(3,'3','易中天','男',234,'123456789123456789','2003-02-23'),(4,'4','韦一笑','男',76,'123456789123456789','2023-02-23');-- 数据必须完全与表中字段名一致

ALTER TABLE employee DROP nickname;

UPDATE employee SET name = '修改Linux' WHERE id = 1;

UPDATE employee set name = '小昭',sex = '女' WHERE id = 1;

UPDATE employee set entrydate = '2008-01-01';

DELETE FROM employee WHERE sex = '女';

DELETE FROM employee;

ALTER TABLE employee ADD workaddress VARCHAR(50) COMMENT '工作地址';

insert into employee (id,workno,name,sex,age,idcard,workaddress,entrydate)
values (1,1,'柳岩','女',20,'123456789012345678','北京','2000-01-01'), 
       (2,2,'张无忌','男',18,'123456789012345670','北京','2005-09-01'),
       (3,3,'韦一笑','男',38,'123456789712345670','上海','2005-08-01'),
       (4,4,'赵敏','女',18,'123456757123845670','北京','2009-12-01'),
       (5,5,'小昭','女',16,'123456769012345678','上海','2007-07-01'),
       (6,6,'杨道','男',28,'12345678931234567X','北京','2006-01-01'),
       (7,7,'范骚','男',40,'123456789212345670','北京','2005-05-01'),
       (8,8,'黛绮丝','女',38,'123456157123645670','天津','2015-05-01'),
       (9,9,'范凉凉','女',45,'123156789012345678','北京','2010-04-01'),
       (10,10,'陈友凉','男',53,'123456789012345670','上海','2011-01-01'),
       (11,11,'张士诚','男',55,'123567897123465670','江苏','2015-05-01'),
       (12,12,'常遇春','男',32,'123446757152345670','北京','2004-02-01'),
       (13,13,'张三丰','男',88,'123656789012345678','江苏','2020-11-01'),
       (14,14,'灭绝','女',65,'123456719012345670','西安','2019-05-01'),
       (15,15,'胡青牛','男',70,'12345674971234567X','西安','2018-04-01'),
       (16,16,'周芷若','女',18,null,'北京','2012-06-01');

SELECT name,workno,age FROM employee;

SELECT * FROM employee;

SELECT `workaddress` as '工作地址' FROM employee;-- as可省略
SELECT DISTINCT `workaddress` as '工作地址' FROM employee;-- DISTINCT去除重复记录

SELECT age '年龄' FROM employee WHERE age > 20;

SELECT * FROM employee WHERE idcard is NULL;
SELECT * FROM employee WHERE idcard is NOT NULL;

SELECT * FROM employee WHERE age = 88;
SELECT * FROM employee WHERE age != 88;
SELECT * FROM employee WHERE age <> 88;

SELECT * FROM employee WHERE age >= 15 and age <=20;
SELECT * FROM employee WHERE age >= 15 && age <=20;
SELECT * FROM employee WHERE age BETWEEN 15 and 20;

SELECT * FROM employee WHERE sex = '女' and age < 25;

SELECT * FROM employee WHERE age = 18 or age =20 or age = 40;
SELECT * FROM employee WHERE age in(18,20,40);

SELECT * FROM employee WHERE name LIKE '___';

SELECT * FROM employee WHERE idcard LIKE '1%';
SELECT * FROM employee WHERE idcard LIKE '%X';
SELECT * FROM employee WHERE idcard LIKE '_________________X';

SELECT COUNT(*) FROM employee;
SELECT COUNT(idcard) FROM employee;

SELECT AVG(age) FROM employee;
SELECT MAX(age) FROM employee;
SELECT MIN(age) FROM employee;

SELECT * FROM employee WHERE workaddress = '西安';
SELECT MAX(age) FROM employee WHERE workaddress = '西安';
-- 分组查询
SELECT sex,COUNT(*) FROM employee GROUP BY sex;
SELECT sex,avg(age) FROM employee GROUP BY sex;
SELECT workaddress,count(*) FROM employee WHERE age < 45 GROUP BY workaddress;
SELECT workaddress,count(*) '工作地址统计' FROM employee WHERE age < 45 GROUP BY workaddress HAVING COUNT(*) >= 1;
-- 排序查询
SELECT * FROM employee ORDER BY age DESC;
SELECT * FROM employee ORDER BY age ASC;
SELECT * FROM employee ORDER BY entrydate ASC;
SELECT * FROM employee ORDER BY age asc,entrydate DESC;
SELECT * FROM employee ORDER BY age asc,entrydate DESC LIMIT 5;

SELECT * FROM employee LIMIT 5;
SELECT * FROM employee LIMIT 0,10;
SELECT * FROM employee LIMIT 2,8;
SELECT * FROM employee LIMIT 10,10;

-- 字符串操作函数
-- CONCAT(str1,str2,...)字符串拼接
SELECT CONCAT('Hello','Mysql','!');
-- LOWER(str)全部转小写
SELECT LOWER('Hello World!');
-- UPPER(str)全部转大写
SELECT UPPER('Hello World!');
-- LPAD(str,len,padstr)左填充
SELECT LPAD('01',5,'-');
-- RPAD(str,len,padstr)右填充
SELECT RPAD('01',5,'-');
-- TRIM([remstr FROM] str)去除头部和尾部的空格
SELECT TRIM('  Hello World!  ');
-- SUBSTRING(str,start,len)返回从字符串str从start位置起的len个长度的字符串
SELECT SUBSTRING('Hello Musql',1,5);

-- 数值函数
-- CEIL(X)向上取整
SELECT CEIL(1.1);
-- FLOOR(X)向下取整
SELECT FLOOR(1.1);
-- MOD(N,M)返回x/y的模
SELECT MOD(7,4);
-- RAND()返回0~1内的随机数 
SELECT RAND();
-- ROUND(X)求参数x的四舍五入的值，保留y位小数
SELECT ROUND(2.345,1);

-- 日期函数
-- CURDATE()返回当前日期
SELECT CURDATE();
-- CURTIME()返回当前时间
SELECT CURTIME();
-- NOW()返回当前的日期和时间
SELECT NOW();
-- YEAR(date)获取指定date的年
SELECT YEAR(NOW());
-- MONTH(date)获取指定date的月
SELECT MONTH(NOW());
-- DAY(date)获取指定date的日
SELECT day(NOW());
-- DATE_ADD(date,INTERVAL expr unit)返回一个日期/时间值加上一个时间间隔expr后的新时间值
SELECT DATE_ADD(NOW(),INTERVAL 70 DAY);
-- DATEDIFF(expr1,expr2)返回起始时间date1和结束时间date2之间的天数
SELECT DATEDIFF('2023-12-10','2023-12-01');

-- 流程控制函数
-- IF(expr1,expr2,expr3)如果value为true,则返回t，否则返回f
SELECT IF(true,'ok','error');
-- IFNULL(expr1,expr2)如果value1不为空null,返回value1，否则返回value2
SELECT IFNULL('ok','DEFAULT');
SELECT IFNULL('','DEFAULT');
SELECT IFNULL(null,'DEFAULT');
-- CASE WHEN then else end
-- 需求：查询employee表的员工姓名和工作地址（北京/上海-- -- >一线城市，其他-- -- ->二线城市）
SELECT 
	name,
(case workaddress when '北京' then '一线城市' WHEN '上海' then '一线城市' else '二线城市' END)'工作地址' 
FROM employee;

-- 约束
CREATE TABLE user(
	id INT PRIMARY KEY auto_increment COMMENT '主键',
	name VARCHAR(10) not NULL UNIQUE COMMENT '姓名',
	age int CHECK(age>0 and age <=100) COMMENT '年龄',
	status char(1) DEFAULT'1' COMMENT '状态',
	gender char(1) COMMENT '性别'
)COMMENT '用户表';
DROP TABLE user;
DELETE FROM emp;
SELECT * from user;
INSERT into user(name,age,status,gender) VALUES('Tom',18,'1','男');
INSERT into user(name,age,status,gender) VALUES('Tom1',18,'0','男');
INSERT into user(name,age,gender) VALUES('Jenny',18,'女');


-- 外键约束
CREATE table dept(
	id int auto_increment COMMENT 'ID' PRIMARY KEY,
	name VARCHAR(50) not null COMMENT '部门名称'
)COMMENT '部门表';
INSERT INTO dept(name) VALUES('研发部'),('市场部'),('财务部'),('销售部'),('总经办');

CREATE TABLE emp(
	id int auto_increment COMMENT 'ID' PRIMARY KEY,
	name VARCHAR(50) not NULL COMMENT '姓名',
	age int CHECK(age>0 and age<=120) COMMENT '年龄',
	job VARCHAR(20) COMMENT '职位',
	salary int CHECK(salary>0) COMMENT '薪资',
	entrydate date COMMENT '入职时间',
	managerid int COMMENT '直属领导ID',
	dept_id int COMMENT '部门ID'
)COMMENT'员工表';
INSERT into emp(name,age,job,salary,entrydate,managerid,dept_id) VALUES
('金庸',66,'总裁',20000,'2000-01-01',null,5),('张无忌',20,'项目经理',12500,'2005-01-01',1,1),
('黄蓉',33,'开发',8400,'2000-11-01',2,1),('周芷若',48,'秘书',11000,'2002-02-04',2,1),
('金毛狮王',43,'开发',10500,'2000-11-01',3,1),('张三丰',19,'程序员鼓励师',6600,'2001-02-11',2,1);
-- 添加外键
ALTER TABLE emp add CONSTRAINT fk_emp_dept_id FOREIGN KEY (dept_id) REFERENCES dept(id);
-- 删除外键
ALTER TABLE emp drop FOREIGN KEY fk_emp_dept_id;
-- 外键的删除和更新行为
ALTER TABLE emp add CONSTRAINT fk_emp_dept_id FOREIGN KEY (dept_id) REFERENCES dept(id) on UPDATE CASCADE on DELETE CASCADE;

ALTER TABLE emp add CONSTRAINT fk_emp_dept_id FOREIGN KEY (dept_id) REFERENCES dept(id) on UPDATE CASCADE on DELETE set null;


-- 多表关系
CREATE TABLE student(
	id INT auto_increment PRIMARY KEY COMMENT '主键',
	name VARCHAR(10) COMMENT '姓名',
	no VARCHAR(10) COMMENT '学号'
)COMMENT '学生表';
insert INTO student(name,no) VALUES('黛绮丝','2000100101'),('谢逊','2000100102'),('殷天正','2000100103'),('韦一笑','2000100104');

CREATE TABLE course(
	id INT auto_increment PRIMARY KEY COMMENT '主键',
	name VARCHAR(10) COMMENT '课程名称'
)COMMENT '课程表';
INSERT INTO course VALUES(null,'Java'),(null,'PHP'),(null,'MySQL'),(null,'Hadoop');

CREATE TABLE student_course(
		id INT auto_increment PRIMARY KEY COMMENT '主键',
		studentid int not null COMMENT '学生ID',
		courseid int not null COMMENT '课程ID',
		CONSTRAINT fk_courseid FOREIGN KEY (courseid) REFERENCES course(id),
		CONSTRAINT fk_studentid FOREIGN KEY (studentid) REFERENCES student(id)
)COMMENT '学生课程中间表';
INSERT INTO student_course VALUES(null,1,1),(null,1,2),(null,1,3),(null,2,2),(null,2,3),(null,3,4);

-- 隐式内连接-- 查询表之间交集的部分
SELECT emp.name , dept.name FROM emp,dept WHERE emp.dept_id = dept.id;
SELECT e.name,d.name FROM emp e,dept d WHERE e.dept_id = d.id;
-- 显式内连接-- 查询表之间交集的部分
SELECT e.`name`,d.name FROM emp e INNER JOIN dept d on e.dept_id = d.id;
SELECT e.name,d.name FROM emp e JOIN dept d on e.dept_id = d.id;
-- 左外连接-- 查询左边所有数据和交集部分
SELECT e.name,d.name FROM emp e LEFT OUTER JOIN dept d ON e.dept_id = d.id;
SELECT e.*,d.name FROM emp e LEFT JOIN dept d ON e.dept_id = d.id;
-- 右外连接-- 查询右边所有数据和交集部分
SELECT d.*,e.* FROM emp e RIGHT JOIN dept d ON e.dept_id = d.id;
-- 自连接-- 可以是内连接查询，也可以是外连接查询-- 必须起别名
SELECT a.name'员工',b.name'直属领导' FROM emp a,emp b WHERE a.managerid = b.id;
SELECT a.name'员工',b.name'直属领导' FROM emp a left join emp b on a.managerid = b.id;

-- 联合查询union all合并union去重后再合并-- 吧多次查询的结果合并起来，形成一个新的查询结果
SELECT * FROM emp WHERE salary < 10000
UNION all
SELECT * FROM emp WHERE age < 50;

-- 子查询-- 嵌套查询-- 子查询外部的语句可以是insert/UPDATE/DELETE/SELECT的任何一个.
-- 查询“研发部“的所有员工信息-- 标量子查询
-- a.查询“研发部”部门ID-- 标量子查询
SELECT id FROM dept WHERE name = '研发部';
-- b.根据研发部部门ID，查询员工信息-- 标量子查询
SELECT * FROM emp WHERE dept_id = (SELECT id FROM dept WHERE name = '研发部');
-- 标量子查询
SELECT entrydate FROM emp WHERE name = '金庸';
SELECT * FROM emp WHERE entrydate > '2000-02-12';
SELECT * FROM emp WHERE entrydate > (SELECT entrydate FROM emp WHERE name = '金庸');

-- 查询‘研发部’和’总经办‘的所有员工信息-- 列子查询-- in
-- a.查询‘研发部’和‘总经办’的部门ID-- 列子查询
SELECT id FROM dept WHERE name = '研发部' or name = '总经办';
-- b.根据部门ID，查询员工信息-- 列子查询
SELECT * FROM emp WHERE dept_id in (SELECT id FROM dept WHERE name = '研发部' or name = '总经办');

-- 查询比总经办所有人工资都高的员工信息-- all
-- a.查询所有总经办的人员工资-- 列子查询
SELECT id FROM dept WHERE name = '总经办';
SELECT salary FROM emp WHERE dept_id = (SELECT id FROM dept WHERE name = '总经办');
-- b.比财务部所有人工资都高的员工信息-- 列子查询
SELECT * from emp WHERE salary > all(SELECT salary FROM emp WHERE dept_id = (SELECT id FROM dept WHERE name = '总经办'));
-- any-- 列子查询
SELECT * from emp WHERE salary > any(SELECT salary FROM emp WHERE dept_id = (SELECT id FROM dept WHERE name = '总经办'));

-- 查询‘张无忌’的薪资及直属领导相同的员工信息-- 行子查询
-- a.查询‘张无忌’的薪资及直属领导-- 行子查询
SELECT salary,managerid FROM emp WHERE name = '张无忌';
-- b.查询与‘张无忌’的薪资及直属领导相同的员工信息-- 行子查询
SELECT * FROM emp WHERE salary = 12500 and managerid = 1;
SELECT * FROM emp WHERE (salary,managerid) = (12500,1);
SELECT * FROM emp WHERE (salary,managerid) = (SELECT salary,managerid FROM emp WHERE name = '张无忌');

#查询与‘鹿杖客’，‘宋远桥’的职位和薪资相同的员工信息-- 表子查询
-- a. 查询‘鹿杖客’，‘宋远桥’的职位和薪资-- 表子查询
SELECT job,salary FROM emp WHERE name = '鹿杖客' or name = '宋远桥';
-- b.查询与‘鹿杖客’，‘宋远桥’的职位和薪资相同的员工信息-- 表子查询
SELECT * FROM emp WHERE (job,salary) in (SELECT job,salary FROM emp WHERE name = '鹿杖客' or name = '宋远桥') ;
#查询入职日期是‘2006-01-01’之后的员工信息,及其部门信息-- 表子查询
-- a.入职日期是‘2006-01-01’之后的员工信息-- 表子查询
SELECT * FROM emp WHERE entrydate > '2006-01-01';
-- b.入职日期是‘2006-01-01’之后的员工的部门信息-- 表子查询
SELECT e.*,d.* FROM (SELECT * FROM emp WHERE entrydate > '2006-01-01') e LEFT JOIN dept d on e.dept_id = d.id;


-- 事务操作
CREATE TABLE account(
	id int auto_increment PRIMARY KEY COMMENT '主键ID',
	name VARCHAR(10) COMMENT '姓名',
	money int COMMENT '余额'
)COMMENT '账户表';
INSERT into account(name,money) VALUES('张三',2000),('李四',2000);
SELECT name,money FROM account;
update account set money = 2000 WHERE name = '张三' or name = '李四';#恢复数据

SELECT @@autocommit;-- 查看@@autocommit的值(默认为'1')，'0'为手动提交，'1'为自动提交
SET @@autocommit = 0;-- 设置手动提交
SET @@autocommit = 1;-- 设置自动提交
-- 转账操作(张三给李四转账1000)#1.查询张三账户余额   #2.将张三账户余额-1000    #3.将李四账户余额+1000
#1.查询张三账户余额
SELECT money FROM account WHERE name = '张三';
#2.将张三账户余额-1000
update account set money = money - 1000 WHERE name = '张三';
#3.将李四账户余额+1000
update account set money = money + 1000 WHERE name = '李四';

-- 提交事务
COMMIT;

-- 回滚事务
ROLLBACK;


-- 转账操作(方式二)
-- 转账操作(张三给李四转账1000)#1.查询张三账户余额   #2.将张三账户余额-1000    #3.将李四账户余额+1000
START TRANSACTION;# BEGIN
#1.查询张三账户余额
SELECT money FROM account WHERE name = '张三';
#2.将张三账户余额-1000
update account set money = money - 1000 WHERE name = '张三';
SELECT money FROM account WHERE name = '张三';
#3.将李四账户余额+1000
update account set money = money + 1000 WHERE name = '李四';
SELECT money FROM account WHERE name = '张三';
-- 提交事务
COMMIT;
-- 回滚事务
ROLLBACK;

-- 查看事务隔离级别
SELECT @@TRANSACTION_ISOLATION;

-- 设置事务隔离级别
SET [SESSION|GLOBAL] TRANSACTION ISOLATION LEVEL {READ UNCOMMITTED|READ COMMITTED|REPEATABLE READ|SERIALIZABLE}
SET SESSION TRANSACTION ISOLATION LEVEL read UNCOMMITTED;
SET SESSION TRANSACTION ISOLATION LEVEL read REPEATABLE READ;
SET SESSION TRANSACTION ISOLATION LEVEL read READ COMMITTED;
SET SESSION TRANSACTION ISOLATION LEVEL read SERIALIZABLE;


-- 查询建表语句  --- 默认存储引擎：INNODB
show create TABLE account;
show create TABLE my_memory;
-- 查询当前数据库支持的存储引擎
show ENGINES;

-- 创建表my_mysim,并指定MyISAM存储引擎
CREATE TABLE my_mysiam(
	id int,
	name VARCHAR(10)
)ENGINE = MyISAM;

-- 创建表my_memory,并指定Memory存储引擎
CREATE TABLE my_memory(
	id int,
	name VARCHAR(10)
)ENGINE = Memory;


-- INNODB引擎中一张表对应一个ibd表空间文件
show VARIABLES like 'innodb_file_per_table';#值为ON，说明一张表对应一个ibd表空间文件


--              索引语法 
-- 创建索引
CREATE [UNIQUE|FULLTEXT] INDEX index_name ON TABLE_name(index_col_name,...);
-- 查看索引
SHOW INDEX FROM table_name;
-- 删除索引
DROP INDEX index_name ON table_name;

CREATE TABLE tb_user (--              索引
    id INT PRIMARY KEY,
    name VARCHAR(50),
    telephone VARCHAR(20),
    sex VARCHAR(10),
    job VARCHAR(50)
);--              索引
SELECT * FROM tb_user;--              索引
DELETE FROM tb_user;--              索引
INSERT INTO tb_user (id, name, telephone, sex, job) VALUES
(1, '刘备', '1234567890', '男', '皇帝'),
(2, '曹操', '9876543210', '男', '大将'),
(3, '孙权', '5555555555', '男', '丞相'),
(4, '张飞', '1111111111', '男', '武将'),
(5, '关羽', '9999999999', '男', '武将'),
(6, '诸葛亮', '8888888888', '男', '谋士'),
(7, '貂蝉', '7777777777', '女', '美人'),
(8, '周瑜', '6666666666', '男', '谋士'),
(9, '吕布', '4444444444', '男', '武将'),
(10, '马超', '3333333333', '男', '武将'),
(11, '夏侯惇', '2222222222', '男', '武将'),
(12, '孙尚香', '1212121212', '女', '公主'),
(13, '吕蒙', '3434343434', '男', '武将'),
(14, '张辽', '5656565656', '男', '武将'),
(15, '黄月英', '7878787878', '女', '谋士'),
(16, '陆逊', '9090909090', '男', '谋士'),
(17, '袁绍', '2323232323', '男', '大将'),
(18, '许褚', '4545454545', '男', '武将'),
(19, '甘宁', '6767676767', '男', '武将'),
(20, '孟获', '8989898989', '男', '武将');
SHOW index FROM tb_user;#查看索引
CREATE INDEX idx_user_name on tb_user(name);#创建索引
CREATE UNIQUE INDEX idx_user_phone on tb_user(telephone);#创建唯一索引
CREATE INDEX idx_user_union on tb_user(sex,job);#创建联合索引
DROP INDEX idx_user_name on tb_user;#删除索引

-- SQL执行频率 show[SESSION|GLOBAL] status
SHOW GLOBAL STATUS LIKE 'Com_______';

-- 视图
-- 视图的作用
-- 简单   视图不仅可以简化用户对数据的理解，也可以简化他们的操作。那些被经常使用的查询可以被定义为视图，从而使得用户不必为以后的操作每次指定全部的条件
-- 安全   数据库可以授权，但不能授权到数据库特定行和特定的列上。通过试图用户只能查询和修改他们所能见到的数据
-- 数据屏蔽   视图可以帮助用户屏蔽真实表结构变化带来的影响


-- 创建视图
CREATE or replace view stu_v_1 as SELECT id,name from student where id<= 10;

-- 查询视图
SHOW create view stu_v_1;
SELECT * from stu_v_1;

-- 修改视图
CREATE or replace view stu_v_1 as SELECT id,name,no from student where id <= 10;

ALTER view stu_v_1 as SELECT id,name from student where id <= 10;

-- 删除视图
drop view if EXISTS stu_v_1;

-- -----------------------------------------------------------------------------------------------------
create or replace view stu_v_1 as SELECT id,name from student where id <= 20 with cascaded check option;
create or replace view stu_v_1 as SELECT id,name from student where id <= 20 with local check option;

SELECT * from stu_v_1;

insert into stu_v_1 values(6,'壹账通');

insert into stu_v_1 values(30,'壹账通');

-- cascaded 级联 判断上级条件 给上级视图增加约束，local不会
create or replace view stu_v_1 as SELECT id,name from student where id <= 20;

insert into stu_v_1 value(5,'Tom'); 

insert into stu_v_1 value(25,'Tom'); 

create or replace view stu_v_2 as SELECT id,name from stu_v_1 where id >= 10 with cascaded check option;

insert into stu_v_2 value(7,'Tom'); 

insert into stu_v_2 value(13,'Tom'); 

create or replace view stu_v_3 as SELECT id,name from stu_v_2 where id <= 15;

insert into stu_v_3 value(11,'Tom'); 

insert into stu_v_3 value(17,'Tom'); 

insert into stu_v_3 value(28,'Tom'); 

-- local  只判断当前条件  local不会给上级视图添加约束
create view stu_v_4 as SELECT id,name from student where id <= 20;

insert into stu_v_4 value(5,'Tom'); 

insert into stu_v_4 value(25,'Tom'); 

create view stu_v_5 as SELECT id,name from stu_v_4 where id >= 10 with local check option;

insert into stu_v_5 value(7,'Tom'); 

insert into stu_v_5 value(13,'Tom'); 

create view stu_v_6 as SELECT id,name from stu_v_5 where id <= 15;

insert into stu_v_6 value(11,'Tom'); 

insert into stu_v_6 value(17,'Tom'); 

insert into stu_v_6 value(28,'Tom'); 

-- 要使视图可更新，视图中的行与基础表中的行之间必须存在一对一的关系，如果视图包含一下任何一项，则该视图不可更新：
-- 1.聚合函数或窗口函数(sum()、min()、max()、count())
-- 2.DISTINCT
-- 3.GROUP BY
-- 4.HAVING
-- UNION或者UNION ALL
-- 创建视图，使用聚合函数

create view stu_v_count as select count(*) from student;

SELECT * from stu_v_count;

INSERT into stu_v_count values(10);
















