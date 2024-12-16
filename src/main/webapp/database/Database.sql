
create database afog;

use afog;

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for attacker
-- ----------------------------
DROP TABLE IF EXISTS `attacker`;
CREATE TABLE `attacker` (
  `user` text,
  `fname` text,
  `ownername` text,
  `sk` text,
  `type` text,
  `dt` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for audit
-- ----------------------------
DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit` (
  `fname` text,
  `ownername` text,
  `cname` text,
  `mac1` text,
  `mac2` text,
  `mac3` text,
  `mac4` text,
  `dt` text,
  `pstatus` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for auditlog
-- ----------------------------
DROP TABLE IF EXISTS `auditlog`;
CREATE TABLE `auditlog` (
  `fname` text,
  `owner` text,
  `dt` text,
  `status` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for auditor
-- ----------------------------
DROP TABLE IF EXISTS `auditor`;
CREATE TABLE `auditor` (
  `username` text,
  `password` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for backupcloudserver
-- ----------------------------
DROP TABLE IF EXISTS `backupcloudserver`;
CREATE TABLE `backupcloudserver` (
  `fname` text,
  `ownername` text,
  `cname` text,
  `ct1` text,
  `mac1` text,
  `ct2` text,
  `mac2` text,
  `ct3` text,
  `mac3` text,
  `ct4` text,
  `mac4` text,
  `sk` text,
  `dt` text,
  `pstatus` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cloud
-- ----------------------------
DROP TABLE IF EXISTS `cloud`;
CREATE TABLE `cloud` (
  `name` text,
  `pass` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cloudserver
-- ----------------------------
DROP TABLE IF EXISTS `cloudserver`;
CREATE TABLE `cloudserver` (
  `fname` text,
  `ownername` text,
  `cname` text,
  `ct1` text,
  `mac1` text,
  `ct2` text,
  `mac2` text,
  `ct3` text,
  `mac3` text,
  `ct4` text,
  `mac4` text,
  `sk` text,
  `dt` text,
  `pstatus` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for deduplication
-- ----------------------------
DROP TABLE IF EXISTS `deduplication`;
CREATE TABLE `deduplication` (
  `name` text,
  `ofname` text,
  `oblock` text,
  `dblock` text,
  `dfname` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for owner
-- ----------------------------
DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner` (
  `id` int(11) NOT NULL auto_increment,
  `name` text,
  `pass` text,
  `email` text,
  `mobile` text,
  `addr` text,
  `dob` text,
  `gender` text,
  `pin` text,
  `location` text,
  `imagess` longblob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for permitlog
-- ----------------------------
DROP TABLE IF EXISTS `permitlog`;
CREATE TABLE `permitlog` (
  `fname` text,
  `oname` text,
  `dt` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for proxy
-- ----------------------------
DROP TABLE IF EXISTS `proxy`;
CREATE TABLE `proxy` (
  `username` text,
  `password` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for r_server
-- ----------------------------
DROP TABLE IF EXISTS `r_server`;
CREATE TABLE `r_server` (
  `username` text,
  `password` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `fname` text,
  `tdelay` text,
  `tpt` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL auto_increment,
  `user` text,
  `fname` text,
  `cname` text,
  `sk` text,
  `task` text,
  `dt` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` text,
  `pass` text,
  `email` text,
  `mobile` text,
  `addr` text,
  `dob` text,
  `gender` text,
  `pin` text,
  `location` text,
  `imagess` longblob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for userrequest
-- ----------------------------
DROP TABLE IF EXISTS `userrequest`;
CREATE TABLE `userrequest` (
  `username` text,
  `fnamereq` varchar(30) default NULL,
  `reqdate` text,
  `resdate` text,
  `resstatus` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

