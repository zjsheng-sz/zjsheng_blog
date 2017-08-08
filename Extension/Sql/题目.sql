根据scott.bonus表，scott.dept表，scott.emp表，scott.salgrade四张表完成如下查询：
1、显示部门表的编号，部门名称
select deptno, dname from dept;

2.找出每个员工的姓名,工资，显示格式如"Amy 1个月的工资为：8000”

mysql> select concat(' 部门',dname,'位于',波士顿) from dept;

3.找出每个员工的姓名,工作，显示格式如"amy的工作是CLERK"
4.找出每个部门所在的位置，显示格式如”部门sales位于波士顿"

select concat('部门',dname,'位于',loc) from dept;

5.显示员工姓名，参加工作时间，工作

mysql> select ename, hiredate,job from emp;

6.显示字段一：员工姓名：别名为Name，显示字段二：年薪,年薪=月薪乘以13，别名为year_sal

mysql> select ename as Name, sal*13 as year_sal from emp;


7.将员工表先按工作降序，再按入职时间升序排序

mysql> select * from emp order by sal desc, hiredate asc;
sqlite> select * from emp order by job desc, hiredate asc;


8.将员工表按薪水降序查询

mysql> select * from emp order by sal desc;

9.将员工表按部门升序，薪水升序查询

mysql> select * from emp order by deptno asc, sal asc;

10.将部门表按所在地升序查询

mysql> select * from dept order by loc asc;
sqlite> select * from emp order by sal;


11.查询员工表，返回工资最高的1条记录
sqlite> select * from emp where sal = (select max(sal) from emp);
sqlite> select * from emp order by sal desc limit 1;

mysql> select * from emp where sal = (select max(sal) from emp);
mysql> select * from emp  order by sal desc limit 1 ;


13.查询员工表，只返回3条记录，偏移量从2开始

sqlite> select * from emp desc limit 3 offset 2;
mysql> select * from emp  order by sal desc limit 3 offset 2;


14.查询工作为”SALESMAN"的员工记录

sqlite> select * from emp where emp.job = 'SALESMAN';
mysql> select * from emp where job = 'salesman';

15.查询工资为1600的员工记录

sqlite> select * from emp where emp.sal = 1600;
mysql> select * from emp where sal = 1600;


19.显示工资在2000到4000之间的员工姓名，工资

sqlite> select * from emp where sal > 2000 and sal < 4000;
sqlite> select * from emp where sal between 2000 and 4000;
mysql> select ename,sal from emp where sal between 2000 and 4000;

20.显示出总经理的姓名

mysql> select ename from emp where job = 'PRESIDENT';

21.显示出姓名中第三个字母为”a"的员工姓名

sqlite> select * from emp where ename like '__a%';
mysql> select ename from emp where ename like '__a%';

22.显示姓名为”SMITH"或为"KING"的员工的员工姓名，参加工作时间，工作名

sqlite> select * from emp where ename in ('SMITH','KING');
mysql> select ename,hiredate,job from emp where ename in ('SMITH','KING');


23.显示工作名称中包含”MAN"并且工资大于2000的员工姓名，工作


mysql> select ename,job from emp where job like '%man%' and sal > 2000;


24.名字中包含两个’ll’，部门号是30号，或经理号为7782的员工

mysql> select * from emp where ename like '%l%l%' and deptno = '30' or empno = '7782';

25.显示出姓名中第三个字母为'A'的员工姓名。此题不只一种解决方式

mysql> select ename from emp where ename like '__a%';


26.显示出姓名中最后一个字母为”N”的员工姓名

mysql> select ename from emp where ename like '%n';


27.显示员工应交的税金：工资1000元以下为0，大于等于1000并小于2000为工资的10%，大于等于2000并小于3000为工资的15%，大于等于3000为工资的20%

sqlite> select ename, (case
   ...> when sal < 1000 then 0
   ...> when sal between 1000 and 2000  then sal*0.15
   ...> else sal * 0.15 end
   ...> ) as tax
   ...> from emp;

SELECT  ename,  (CASE

  when sal < 1000 then 0
  WHEN sal >= 1000 AND  sal < 2000 THEN  sal*0.15
  else sal * 0.15 end

) AS  tax
  FROM emp;

28.参加工作时间在每月15日之后的员工姓名，参加工作时间

sqlite> select * from emp where strftime('%d',hiredate) > '15';
sqlite> select datetime('now','localtime');
SELECT  * FROM  emp WHERE  day(hiredate) > 15;

29.显示员工姓名，月薪，年薪（13个月的月薪+10000元奖金+comm）要求别名为annual_salary,要求所有人的年薪都显示出来

sqlite> select ename, sal, (sal*13 + 10000 + ifnull(comm,0)) as annual_salary from emp;
SELECT  ename, sal, (sal * 13 + 10000 + ifnull(comm,0)) AS annual_salary FROM emp;

30.显示所有部门在"NEW YORK"(dept表 loc字段)的员工姓名

SELECT emp.ename, dept.loc  FROM emp INNER JOIN dept WHERE emp.deptno = dept.deptno AND dept.loc = 'NEW YORK';



31.显示员工信息包括部门名称，员工的姓名，要求所有部门都显示出来，包含没有员工的部门

SELECT emp.ename, dept.dname FROM  emp LEFT JOIN dept ON  emp.deptno = dept.deptno;

32.显示员工”SMITH”的姓名，部门名称

SELECT  emp.ename, dept.dname FROM  emp LEFT JOIN  dept ON emp.deptno = dept.deptno WHERE  emp.ename = 'smith';

33.显示员工'KING'和'FORD'管理的员工姓名及其经理姓名

SELECT t1.ename staff,t2.ename self,t3.ename manager
FROM  (emp t1 LEFT JOIN emp t2 ON t1.mgr = t2.empno) LEFT JOIN emp t3 ON t2.mgr = t3.empno
WHERE t2.ename in ('king', 'ford');

34.显示员工名，参加工作时间，经理名，参加工作时间：参加工作时间比他的经理早

-- t1 员工表, t2 经理表
SELECT t1.ename AS staff_name, t1.hiredate AS staff_hiredate, t2.ename AS  manager_name, t2.hiredate AS manager_hiredate
FROM emp t1 INNER JOIN emp t2 ON t1.mgr = t2.empno
WHERE t1.hiredate < t2.hiredate;


35.显示出工作名称(job)中包含”MAN”的员工平均工资，最高工资，最低工资及工资的和

SELECT count(*), avg(sal),max(sal),min(sal),sum(sal) FROM  emp WHERE job LIKE '%man%';


36.显示出20号部门的员工人数

SELECT count(*) FROM emp INNER JOIN dept ON emp.deptno = dept.deptno WHERE dept.deptno = 20;


37.显示出平均工资大于2000的部门名称及平均工资

SELECT  dept.dname, avg(sal) FROM emp INNER JOIN dept ON emp.deptno = dept.deptno GROUP BY dept.deptno HAVING avg(sal) > 2000;


38.显示每个部门每种工作平均工资大于2500的部门及工作

SELECT emp.job,dept.dname,avg(sal)
FROM emp INNER JOIN dept ON emp.deptno = dept.deptno
GROUP BY emp.deptno,emp.job HAVING avg(sal) > 2500;
;


39.显示出工作名称中包含"MAN"，并且平均工资大于1000的工作名称及平均工资

SELECT emp.job, avg(sal)
FROM emp GROUP BY emp.job
HAVING avg(sal) > 1000 AND emp.job LIKE '%man%';

40.显示出平均工资最高的的部门平均工资
select avg(sal) from emp group by deptno order by avg(sal) desc limit 1;

41.列出最低工资大于1500的各种工作

SELECT emp.job, min(sal) AS job_minSalary FROM emp GROUP BY job HAVING min(sal) > 1500;


42.列出各部门的员工数量及平均工作年限(把月份求出来)

SELECT  count(*) AS emp_count, avg(timestampdiff(MONTH,emp.hiredate,now())) AS ave_firedate
FROM  emp GROUP BY emp.deptno;

43.显示出和员工号7369部门相同的员工姓名，工资

SELECT  t1.ename AS emp_name, t1.sal AS emp_salary
FROM emp t1
WHERE t1.deptno = (SELECT t2.deptno FROM emp t2 WHERE t2.empno = 7369);

44.显示出和姓名中包含"W"的员工相同部门的员工姓名

SELECT t1.ename, t1.deptno

FROM  emp t1

WHERE t1.deptno IN (SELECT t2.deptno FROM  emp t2 WHERE t2.ename LIKE '%w%');


45.显示出工资大于平均工资的员工姓名，工资


SELECT t1.ename, t1.sal
FROM emp t1
WHERE t1.sal >  (select avg(sal) from emp);


46.显示出工资大于本部门平均工资的员工姓名，工资

SELECT t1.ename, t1.sal, t1.deptno
FROM emp t1
WHERE t1.sal > (SELECT avg(t2.sal) FROM emp t2 GROUP BY t2.deptno HAVING t1.deptno = t2.deptno);


47.显示员工"KING"所管理的员工姓名
ELECT t1.ename AS self_name, t2.ename AS staff_name
FROM emp t1 INNER JOIN emp t2 ON t2.mgr = t1.empno
WHERE t1.ename = 'king';


48.显示比工资最高的员工参加工作时间晚的员工姓名，参加工作时间

方法一：
SELECT t1.ename, t1.hiredate

FROM emp t1

WHERE t1.hiredate > (SELECT  t2.hiredate FROM  emp t2  ORDER BY t2.sal DESC  LIMIT 1);


方法二：

SELECT t1.ename, t1.hiredate

FROM emp t1

WHERE t1.hiredate > (SELECT  t2.hiredate FROM  emp t2 WHERE t2.sal = (SELECT max(sal) FROM emp));


49.显示出平均工资最高的的部门平均工资及部门名称

SELECT t2.avg_salary, t3.dname
FROM (SELECT avg(t1.sal) AS avg_salary, t1.deptno
      FROM  emp t1 GROUP BY t1.deptno ORDER BY avg(t1.sal) DESC LIMIT 1) t2
      LEFT JOIN dept t3 ON t2.deptno = t3.deptno;

50.查询工资最高的员工姓名和工资。

SELECT t1.ename, t1.sal
FROM emp t1
WHERE t1.sal = (SELECT max(sal) FROM emp);

51.查询部门最低工资高于40号部门最低工资的部门的编号、
名称及部门最低工资。
52.查询员工工资为其部门最低工资的员工的编号和姓名
及工资。
53.显示出员工工资排在第五到第十名的员工信息
54.表copy_emp中插入数据，要求emp表中部门号为10号部门的员工信息插入
55.修改copy_emp表中数据，要求10号部门所有员工涨20%的工资
56.创建视图，要求包含字段：部门名，部门平均工资。针对以上视图执行insert,update,delete,语句能否成功，为什么？
