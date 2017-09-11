CREATE TABLE IF NOT EXISTS `bonus` (
  `ename` varchar(10)  DEFAULT NULL,
  `job` varchar(9)   DEFAULT NULL,
  `sal` int(11) DEFAULT NULL,
  `comm` int(11) DEFAULT NULL
)   ;

DELETE FROM `bonus`;


DROP TABLE IF EXISTS `dept`;
CREATE TABLE IF NOT EXISTS `dept` (
  `deptno` int(2) NOT NULL DEFAULT '0' ,
  `dname` varchar(14)   DEFAULT NULL ,
  `loc` varchar(13)    DEFAULT NULL ,
  PRIMARY KEY (`deptno`)
) ;

DELETE FROM `dept`;
INSERT INTO `dept` (`deptno`, `dname`, `loc`) VALUES
	(10, 'ACCOUNTING', 'NEW YORK'),
	(20, 'RESEARCH', 'DALLAS'),
	(30, 'SALES', 'CHICAGO'),
	(40, 'OPERATIONS', 'BOSTON');


DROP TABLE IF EXISTS `emp`;
CREATE TABLE IF NOT EXISTS `emp` (
  `empno` int(4) NOT NULL DEFAULT '0' ,
  `ename` varchar(10)     DEFAULT NULL ,
  `job` varchar(9)     DEFAULT NULL ,
  `mgr` int(4) DEFAULT NULL ,
  `hiredate` date DEFAULT NULL ,
  `sal` decimal(7,2) DEFAULT NULL ,
  `comm` decimal(7,2) DEFAULT NULL ,
  `deptno` int(2) DEFAULT NULL ,
  PRIMARY KEY (`empno`)
)   ;

DELETE FROM `emp`;
INSERT INTO `emp` (`empno`, `ename`, `job`, `mgr`, `hiredate`, `sal`, `comm`, `deptno`) VALUES
	(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20),
	(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
	(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
	(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
	(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
	(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
	(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
	(7788, 'SCOTT', 'ANALYST', 7566, '1987-01-13', 3000.00, NULL, 20),
	(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10),
	(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.00, 0.00, 30),
	(7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100.00, NULL, 20),
	(7900, 'JAMES', 'CLERK', 7698, '1981-03-12', 950.00, NULL, 30),
	(7902, 'FORD', 'ANALYST', 7566, '1981-03-12', 3000.00, NULL, 20),
	(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);


DROP TABLE IF EXISTS `salgrade`;
CREATE TABLE IF NOT EXISTS `salgrade` (
  `grade` int(11) DEFAULT NULL,
  `losal` int(11) DEFAULT NULL,
  `hisal` int(11) DEFAULT NULL
)   ;

DELETE FROM `salgrade`;
INSERT INTO `salgrade` (`grade`, `losal`, `hisal`) VALUES
	(1, 700, 1200),
	(2, 1201, 1400),
	(3, 1401, 2000),
	(4, 2001, 3000),
	(5, 3001, 9999);
