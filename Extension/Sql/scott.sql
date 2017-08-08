-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.49 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 scott 的数据库结构
DROP DATABASE IF EXISTS `scott`;
CREATE DATABASE IF NOT EXISTS `scott` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `scott`;


-- 导出  表 scott.bonus 结构
DROP TABLE IF EXISTS `bonus`;
CREATE TABLE IF NOT EXISTS `bonus` (
  `ename` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sal` int(11) DEFAULT NULL,
  `comm` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  scott.bonus 的数据：~0 rows (大约)
DELETE FROM `bonus`;
/*!40000 ALTER TABLE `bonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus` ENABLE KEYS */;


-- 导出  表 scott.dept 结构
DROP TABLE IF EXISTS `dept`;
CREATE TABLE IF NOT EXISTS `dept` (
  `deptno` int(2) NOT NULL DEFAULT '0' COMMENT '部门编号',
  `dname` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门名',
  `loc` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所在地',
  PRIMARY KEY (`deptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  scott.dept 的数据：~4 rows (大约)
DELETE FROM `dept`;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` (`deptno`, `dname`, `loc`) VALUES
	(10, 'ACCOUNTING', 'NEW YORK'),
	(20, 'RESEARCH', 'DALLAS'),
	(30, 'SALES', 'CHICAGO'),
	(40, 'OPERATIONS', 'BOSTON');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;


-- 导出  表 scott.emp 结构
DROP TABLE IF EXISTS `emp`;
CREATE TABLE IF NOT EXISTS `emp` (
  `empno` int(4) NOT NULL DEFAULT '0' COMMENT '员工编号',
  `ename` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '员工姓名',
  `job` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '工作',
  `mgr` int(4) DEFAULT NULL COMMENT '上级的员工id',
  `hiredate` date DEFAULT NULL COMMENT '入职时间',
  `sal` decimal(7,2) DEFAULT NULL COMMENT '工资',
  `comm` decimal(7,2) DEFAULT NULL COMMENT '提成',
  `deptno` int(2) DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  scott.emp 的数据：~14 rows (大约)
DELETE FROM `emp`;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;


-- 导出  表 scott.salgrade 结构
DROP TABLE IF EXISTS `salgrade`;
CREATE TABLE IF NOT EXISTS `salgrade` (
  `grade` int(11) DEFAULT NULL,
  `losal` int(11) DEFAULT NULL,
  `hisal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  scott.salgrade 的数据：~5 rows (大约)
DELETE FROM `salgrade`;
/*!40000 ALTER TABLE `salgrade` DISABLE KEYS */;
INSERT INTO `salgrade` (`grade`, `losal`, `hisal`) VALUES
	(1, 700, 1200),
	(2, 1201, 1400),
	(3, 1401, 2000),
	(4, 2001, 3000),
	(5, 3001, 9999);
/*!40000 ALTER TABLE `salgrade` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
