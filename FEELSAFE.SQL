# MySQL-Front 3.2  (Build 14.3)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='SYSTEM' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: localhost    Database: feelsafe
# ------------------------------------------------------
# Server version 5.0.27-community-nt

#
# Table structure for table appointments
#

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments` (
  `id` int(11) NOT NULL auto_increment,
  `employeeuserid` varchar(20) default NULL,
  `patientname` varchar(20) default NULL,
  `age` int(11) default NULL,
  `sex` int(1) default NULL,
  `healthproblem` varchar(64) default NULL,
  `doctoruserid` varchar(20) default NULL,
  `appointmentdate` varchar(20) default NULL,
  `appointmenttime` varchar(20) default NULL,
  `type` int(1) default NULL COMMENT 'if 1 then schedule, if 2 then re-schedule (re-schedule can be updated if the given appointmentdate and appointmenttime are same as in the database)',
  PRIMARY KEY  (`id`),
  KEY `employeeuserid` (`employeeuserid`,`doctoruserid`),
  KEY `doctoruserid` (`doctoruserid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table appointments
#

INSERT INTO `appointments` VALUES (1487,NULL,'1',1,1,'1',NULL,'2008/03/07','1:00 am',1);

#
# Table structure for table doctorfees
#

DROP TABLE IF EXISTS `doctorfees`;
CREATE TABLE `doctorfees` (
  `id` int(11) NOT NULL auto_increment,
  `doctoruserid` varchar(20) default NULL,
  `healthproblem` varchar(64) default NULL,
  `fees` float(8,2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `doctoruserid` (`doctoruserid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table doctorfees
#


#
# Table structure for table employees
#

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(20) default NULL,
  `firstname` varchar(20) default NULL,
  `lastname` varchar(20) default NULL,
  `address` varchar(128) default NULL,
  `phone` varchar(20) default NULL,
  `sex` int(1) default NULL,
  `nationality` varchar(20) default NULL,
  `verificationcode` varchar(20) default NULL,
  `type` int(1) default NULL COMMENT 'ordinary login page type=2 admin login page type=1 (set this value according the jsp page opened). If type=3 then doctor. type=0 then patient',
  `consultinghours` varchar(20) default NULL COMMENT 'if type=0 then patient card id',
  `qualification` varchar(20) default NULL,
  `specialist` varchar(64) default NULL COMMENT 'if type=2 then give whether front-office, nurses, etc. If type=3 then doctor''s specialist for child, etc. If type=0 then patient came for consulting for what',
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=REDUNDANT;

#
# Dumping data for table employees
#

INSERT INTO `employees` VALUES ('','','first1','','','',1,'','',1,'','','');
INSERT INTO `employees` VALUES ('1','','','','','',1,'','',1,'','','');
INSERT INTO `employees` VALUES ('123','','First','Second','','',1,'','',3,'7am - 2pm','','Child');
INSERT INTO `employees` VALUES ('1234','','','','','',1,'','',2,'','','');
INSERT INTO `employees` VALUES ('12345','12345','first','last','address','12345',1,'Indian','5626',1,'12fdg 34fsd ','afds','asdf');
INSERT INTO `employees` VALUES ('123451','','first2','','','',1,'','',1,'','','');
INSERT INTO `employees` VALUES ('2','2','2','2','2','2',1,'2','7778',0,NULL,'2','2');
INSERT INTO `employees` VALUES ('admin','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL);

#
# Table structure for table health
#

DROP TABLE IF EXISTS `health`;
CREATE TABLE `health` (
  `id` int(11) NOT NULL auto_increment,
  `doctoruserid` varchar(20) default NULL,
  `symptoms` varchar(20) default NULL,
  `diseasesname` varchar(64) default NULL,
  `medication` varchar(64) default NULL,
  PRIMARY KEY  (`id`),
  KEY `doctoruserid` (`doctoruserid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table health
#


#
# Table structure for table otherfees
#

DROP TABLE IF EXISTS `otherfees`;
CREATE TABLE `otherfees` (
  `id` int(11) NOT NULL auto_increment,
  `adminuserid` varchar(20) default NULL,
  `equipmentname` varchar(20) default NULL,
  `fees` float(8,2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `adminuserid` (`adminuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table otherfees
#

INSERT INTO `otherfees` VALUES (1447,NULL,'1',1);

#
# Table structure for table patient
#

DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `patientuserid` varchar(20) NOT NULL default '',
  `password` varchar(20) default NULL,
  `employeeuserid` varchar(20) default NULL,
  `name` varchar(20) default NULL,
  `age` int(11) default NULL,
  `sex` int(1) default NULL,
  `bloodgroup` varchar(20) default NULL,
  `testundergone` int(1) default NULL COMMENT 'if 1 then test taken otherwise test need to be taken',
  `ecg` int(1) default NULL COMMENT 'if 1 test taken',
  `bloodtest` int(1) default NULL COMMENT 'if 1 test taken',
  `xray` int(1) default NULL COMMENT 'if 1 test taken',
  `scan` int(1) default NULL COMMENT 'if 1 test taken',
  `address` varchar(128) default NULL,
  `mobilenumber` varchar(20) default NULL,
  `healthproblem` varchar(64) default NULL,
  `doctorconsultedid` varchar(20) default NULL,
  `dietspecified` varchar(64) default NULL,
  `prescribedmedicines` varchar(64) default NULL,
  PRIMARY KEY  (`patientuserid`),
  KEY `employeeuserid` (`employeeuserid`),
  KEY `doctorconsultedid` (`doctorconsultedid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table patient
#


#
# Table structure for table rooms
#

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `roomid` varchar(20) NOT NULL default '',
  `patientuserid` varchar(20) default NULL,
  `roomtype` int(1) default NULL COMMENT 'if 1 then AC, otherwise general',
  `employeeuserid` varchar(20) default NULL,
  PRIMARY KEY  (`roomid`),
  KEY `employeeuserid` (`employeeuserid`,`patientuserid`),
  KEY `patientuserid` (`patientuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Dumping data for table rooms
#


#
#  Foreign keys for table appointments
#

ALTER TABLE `appointments`
  ADD FOREIGN KEY (`employeeuserid`) REFERENCES `employees` (`username`),
  ADD FOREIGN KEY (`doctoruserid`) REFERENCES `employees` (`username`);

#
#  Foreign keys for table doctorfees
#

ALTER TABLE `doctorfees`
  ADD FOREIGN KEY (`doctoruserid`) REFERENCES `employees` (`username`);

#
#  Foreign keys for table health
#

ALTER TABLE `health`
  ADD FOREIGN KEY (`doctoruserid`) REFERENCES `employees` (`username`);

#
#  Foreign keys for table otherfees
#

ALTER TABLE `otherfees`
  ADD FOREIGN KEY (`adminuserid`) REFERENCES `employees` (`username`);

#
#  Foreign keys for table patient
#

ALTER TABLE `patient`
  ADD FOREIGN KEY (`employeeuserid`) REFERENCES `employees` (`username`),
  ADD FOREIGN KEY (`doctorconsultedid`) REFERENCES `employees` (`username`);

#
#  Foreign keys for table rooms
#

ALTER TABLE `rooms`
  ADD FOREIGN KEY (`employeeuserid`) REFERENCES `employees` (`username`),
  ADD FOREIGN KEY (`patientuserid`) REFERENCES `patient` (`patientuserid`);


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
