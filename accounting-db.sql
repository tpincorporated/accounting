-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2018 at 12:12 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accounting-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `company_information`
--

CREATE TABLE `company_information` (
  `id` int(11) NOT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `company_address` mediumtext,
  `city` varchar(150) DEFAULT NULL,
  `state_province` varchar(150) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `primary_color` varchar(100) DEFAULT NULL,
  `secondary_color` varchar(100) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `tax_identification_number` varchar(200) DEFAULT NULL,
  `value_added_tax_percentage` double DEFAULT '0.12'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_information`
--

INSERT INTO `company_information` (`id`, `company_name`, `company_address`, `city`, `state_province`, `postal_code`, `primary_color`, `secondary_color`, `country`, `tax_identification_number`, `value_added_tax_percentage`) VALUES
(1, 'TURNINGPOINT INC', '12345', 'Manila', 'NCR', '1234', 'rgb(171,210,255)', 'rgb(255,255,255)', 'Philippines', '12345', 0.12);

-- --------------------------------------------------------

--
-- Table structure for table `email_configuration`
--

CREATE TABLE `email_configuration` (
  `id` int(11) NOT NULL,
  `host` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `port` varchar(30) DEFAULT NULL,
  `email_sent_from` varchar(45) DEFAULT NULL,
  `email_sender` varchar(45) DEFAULT NULL,
  `encryption` varchar(25) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `smtp_authentication_flag` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_configuration`
--

INSERT INTO `email_configuration` (`id`, `host`, `username`, `password`, `port`, `email_sent_from`, `email_sender`, `encryption`, `active_flag`, `smtp_authentication_flag`) VALUES
(1, 'sg2plcpnl0114.prod.sin2.secureserver.net', 'wbms@tpincorporated.com', 'yt2bf5', '587', 'wbms@tpincorporated.com', 'WBMS Administrator', 'SSL', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mode_of_transport`
--

CREATE TABLE `mode_of_transport` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mode_of_transport`
--

INSERT INTO `mode_of_transport` (`id`, `code`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`, `active_flag`) VALUES
(1, 'AIR', 'AIR', 1, '2018-06-21 21:09:03', NULL, NULL, 1),
(2, 'LAND', 'LAND', 1, '2018-06-21 21:09:10', NULL, NULL, 1),
(3, 'SEA', 'SEA', 1, '2018-06-21 21:09:17', 1, '2018-06-21 21:10:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE `system_log` (
  `id` int(11) NOT NULL,
  `module` varchar(200) DEFAULT NULL,
  `description` mediumtext,
  `query` mediumtext,
  `user_source` int(11) DEFAULT NULL,
  `date_source` datetime DEFAULT CURRENT_TIMESTAMP,
  `transaction_number` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_log`
--

INSERT INTO `system_log` (`id`, `module`, `description`, `query`, `user_source`, `date_source`, `transaction_number`) VALUES
(1, 'CONFIGURATION', 'Edited Email Configuration', 'OLD VALUES: id=1 | host=sg2plcpnl0114.prod.sin2.secureserver.net | username=wbms@tpincorporated.com | password=yt2bf5 | port=587 | email_sent_from=wbms@tpincorporated.com | email_sender=WBMS Administrator | encryption=SSL | active_flag=0 ==> NEW VALUES: host=sg2plcpnl0114.prod.sin2.secureserver.net | username=wbms@tpincorporated.com | password=yt2bf5 | port=587 | email_sent_from=wbms@tpincorporated.com | email_sender=WBMS Administrator | encryption=SSL | active_flag=1', 1, '2018-06-21 20:02:21', NULL),
(2, 'CONFIGURATION', 'Edited Email Configuration', 'OLD VALUES: id=1 | host=sg2plcpnl0114.prod.sin2.secureserver.net | username=wbms@tpincorporated.com | password=yt2bf5 | port=587 | email_sent_from=wbms@tpincorporated.com | email_sender=WBMS Administrator | encryption=SSL | active_flag=1 ==> NEW VALUES: host=sg2plcpnl0114.prod.sin2.secureserver.net | username=wbms@tpincorporated.com | password=yt2bf5 | port=587 | email_sent_from=wbms@tpincorporated.com | email_sender=WBMS Administrator | encryption=SSL | active_flag=0', 1, '2018-06-21 20:02:30', NULL),
(3, 'CONFIGURATION', 'Edited Company Information', 'OLD VALUES: id=1 | company_name=TURNINGPOINT INC | company_address=12345 | city=Manila | state_province=NCR | postal_code=1234 | primary_color= | secondary_color= | country=Philippines | tax_identification_number=12345 | value_added_tax_percentage=0.12 ==> NEW VALUES: company_name=TURNINGPOINT INC | company_address=12345 | city=Manila | state_province=NCR | country=Philippines | postal_code=1234 | primary_color=rgb(171,210,255) | secondary_color=rgb(255,255,255) | tax_identification_number=12345', 1, '2018-06-21 20:02:50', NULL),
(4, 'CONFIGURATION', 'Edited Company Information', 'OLD VALUES: id=1 | company_name=TURNINGPOINT INC | company_address=12345 | city=Manila | state_province=NCR | postal_code=1234 | primary_color=rgb(171,210,255) | secondary_color=rgb(255,255,255) | country=Philippines | tax_identification_number=12345 | value_added_tax_percentage=0.12 ==> NEW VALUES: company_name=TURNINGPOINT INC | company_address=12345 | city=Manila | state_province=NCR | country=Philippines | postal_code=1234 | primary_color=rgb(171,210,255) | secondary_color=rgb(255,255,255) | tax_identification_number=12345', 1, '2018-06-21 20:03:03', NULL),
(5, 'User Group', 'New User Group Added', 'id=1 | code=DATA MASTER | description=DATA MASTER | created_by=1 | created_date=2018-06-21 20:13:06 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 20:13:06', NULL),
(6, 'User Group', 'New User Group Added', 'id=2 | code=PICKER | description=PICKER | created_by=1 | created_date=2018-06-21 20:13:39 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 20:13:39', NULL),
(7, 'WAREHOUSE', 'New Warehouse Added', 'id=1 | code=MAIN | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:03 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 20:36:03', NULL),
(8, 'WAREHOUSE', 'New Warehouse Added', 'id=2 | code=MAIN1 | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:15 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 20:36:15', NULL),
(9, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=2 | code=MAIN1 | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:15 | updated_by= | updated_date= ==> NEW VALUES: code=MAIN1 | description=MAIN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 20:36:19', 1, '2018-06-21 20:36:19', NULL),
(10, 'WAREHOUSE', 'New Warehouse Added', 'id=3 | code=DRY | description=DRY WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:34 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 20:36:34', NULL),
(11, 'WAREHOUSE', 'New Warehouse Added', 'id=4 | code=WET | description=WET WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:52 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 20:36:52', NULL),
(12, 'USER', 'Edited User Info', 'OLD VALUES: id=1 | first_name=System | middle_name= | last_name=Administrator | username=admin | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=wms@tpincorporated.com | active_flag=1 | user_group_id= | created_date=2018-06-21 00:00:00 | created_by= | admin_flag=1 | warehouse_id= | updated_date= | updated_by= ==> NEW VALUES: first_name=System | middle_name= | last_name=Administrator | username=admin | password=NOCHANGE | email_address=wms@tpincorporated.com | active_flag=1 | location_id=1 | created_date=2018-06-21 20:37:32 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | booking_approver_flag=0 | user_group_id=1', 1, '2018-06-21 20:37:32', NULL),
(13, 'USER', 'Edited User Info', 'OLD VALUES: id=1 | first_name=System | middle_name= | last_name=Administrator | username=admin | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=wms@tpincorporated.com | active_flag=1 | user_group_id= | created_date=2018-06-21 00:00:00 | created_by= | admin_flag=1 | warehouse_id= | updated_date= | updated_by= ==> NEW VALUES: first_name=System | middle_name= | last_name=Administrator | username=admin | password=NOCHANGE | email_address=wms@tpincorporated.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:38:15 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | booking_approver_flag=0 | user_group_id=1', 1, '2018-06-21 20:38:15', NULL),
(14, 'USER', 'Edited User Info', 'OLD VALUES: id=1 | first_name=System | middle_name= | last_name=Administrator | username=admin | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=wms@tpincorporated.com | active_flag=1 | user_group_id= | created_date=2018-06-21 00:00:00 | created_by= | admin_flag=1 | warehouse_id= | updated_date= | updated_by= ==> NEW VALUES: first_name=System | middle_name= | last_name=Administrator | username=admin | password=NOCHANGE | email_address=wms@tpincorporated.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:41:02 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=0', 1, '2018-06-21 20:41:02', NULL),
(15, 'USER', 'Edited User Info', 'OLD VALUES: id=1 | first_name=System | middle_name= | last_name=Administrator | username=admin | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=wms@tpincorporated.com | active_flag=1 | user_group_id=1 | created_date=2018-06-21 20:41:02 | created_by=1 | admin_flag=0 | warehouse_id=1 | updated_date= | updated_by= ==> NEW VALUES: first_name=System | middle_name= | last_name=Administrator | username=admin | password=NOCHANGE | email_address=wms@tpincorporated.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:43:47 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=0', 1, '2018-06-21 20:43:47', NULL),
(16, 'USER', 'Edited User Info', 'OLD VALUES: id=1 | first_name=System | middle_name= | last_name=Administrator | username=admin | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=wms@tpincorporated.com | active_flag=1 | user_group_id=1 | created_date=2018-06-21 20:43:47 | created_by=1 | admin_flag=0 | warehouse_id=1 | updated_date= | updated_by= ==> NEW VALUES: first_name=System | middle_name= | last_name=Administrator | username=admin | password=NOCHANGE | email_address=wms@tpincorporated.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:43:56 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=0', 1, '2018-06-21 20:43:56', NULL),
(17, 'USER', 'Edited User Info', 'OLD VALUES: id=1 | first_name=System | middle_name= | last_name=Administrator | username=admin | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=wms@tpincorporated.com | active_flag=1 | user_group_id=1 | created_date=2018-06-21 20:43:56 | created_by=1 | admin_flag=0 | warehouse_id=1 | updated_date= | updated_by= ==> NEW VALUES: first_name=System | middle_name= | last_name=Administrator | username=admin | password=NOCHANGE | email_address=wms@tpincorporated.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:44:07 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=0', 1, '2018-06-21 20:44:07', NULL),
(18, 'USER', 'Edited User Info', 'OLD VALUES: id=1 | first_name=System | middle_name= | last_name=Administrator | username=admin | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=wms@tpincorporated.com | active_flag=1 | user_group_id=2 | created_date=2018-06-21 20:44:07 | created_by=1 | admin_flag=0 | warehouse_id=1 | updated_date= | updated_by= ==> NEW VALUES: first_name=System | middle_name= | last_name=Administrator | username=admin | password=NOCHANGE | email_address=wms@tpincorporated.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:44:16 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=0', 1, '2018-06-21 20:44:16', NULL),
(19, 'USER', 'Edited User Info', 'OLD VALUES: id=1 | first_name=System | middle_name= | last_name=Administrator | username=admin | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=wms@tpincorporated.com | active_flag=1 | user_group_id=2 | created_date=2018-06-21 20:44:16 | created_by=1 | admin_flag=0 | warehouse_id=1 | updated_date= | updated_by= ==> NEW VALUES: first_name=System | middle_name= | last_name=Administrator | username=admin | password=NOCHANGE | email_address=wms@tpincorporated.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:44:27 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=0', 1, '2018-06-21 20:44:27', NULL),
(20, 'USER', 'New User Added', 'id=0 | first_name=User1 | middle_name=User1 | last_name=User1 | username=user1 | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=User1@gmail.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:45:44 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=1', 1, '2018-06-21 20:45:44', NULL),
(21, 'USER', 'New User Added', 'id=0 | first_name=User1 | middle_name=User1 | last_name=User1 | username=user1 | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=User1@gmail.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:46:10 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=1', 1, '2018-06-21 20:46:10', NULL),
(22, 'USER', 'New User Added', 'id=2 | first_name=User1 | middle_name=User1 | last_name=User1 | username=user1 | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=User1@gmail.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:48:27 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=1', 1, '2018-06-21 20:48:27', NULL),
(23, 'USER', 'New User Added', 'id=3 | first_name=Jhghj | middle_name=Ghj | last_name=Ghjg | username=jhgjh | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=gjhg | active_flag=1 | warehouse_id=3 | created_date=2018-06-21 20:48:46 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=1', 1, '2018-06-21 20:48:46', NULL),
(24, 'USER', 'Edited User Info', 'OLD VALUES: id=2 | first_name=User1 | middle_name=User1 | last_name=User1 | username=user1 | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=User1@gmail.com | active_flag=1 | user_group_id=1 | created_date=2018-06-21 20:48:27 | created_by=1 | admin_flag=0 | warehouse_id=1 | updated_date= | updated_by= ==> NEW VALUES: first_name=User1 | middle_name=User1 | last_name=User1 | username=user1 | password=NOCHANGE | email_address=User1@gmail.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:49:02 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=1', 1, '2018-06-21 20:49:02', NULL),
(25, 'USER', 'Edited User Info', 'OLD VALUES: id=2 | first_name=User1 | middle_name=User1 | last_name=User1 | username=user1 | password=827ccb0eea8a706c4c34a16891f84e7b | email_address=User1@gmail.com | active_flag=1 | user_group_id=1 | created_date=2018-06-21 20:49:02 | created_by=1 | admin_flag=0 | warehouse_id=1 | updated_date= | updated_by= ==> NEW VALUES: first_name=User1 | middle_name=User1 | last_name=User1 | username=user1 | password=NOCHANGE | email_address=User1@gmail.com | active_flag=1 | warehouse_id=1 | created_date=2018-06-21 20:49:16 | created_by=1 | updated_date=NULL | updated_by=NULL | admin_flag=0 | user_group_id=1', 1, '2018-06-21 20:49:16', NULL),
(26, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=3 | code=DRY | description=DRY WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:34 | updated_by= | updated_date= ==> NEW VALUES: code=DRY | description=DRY WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 20:50:19', 1, '2018-06-21 20:50:19', NULL),
(27, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=1 | code=MAIN | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:03 | updated_by= | updated_date= ==> NEW VALUES: code=MAIN | description=MAIN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 20:50:30', 1, '2018-06-21 20:50:30', NULL),
(28, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=3 | code=DRY | description=DRY WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:34 | updated_by=1 | updated_date=2018-06-21 20:50:19 ==> NEW VALUES: code=DRY | description=DRY WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 20:50:33', 1, '2018-06-21 20:50:33', NULL),
(29, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=4 | code=WET | description=WET WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:52 | updated_by= | updated_date= ==> NEW VALUES: code=WET | description=WET WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 20:50:36', 1, '2018-06-21 20:50:36', NULL),
(30, 'Vehicle Type', 'New Vehicle Type Added', 'id=1 | code=PC | description=PC | created_by=1 | created_date=2018-06-21 21:04:40 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 21:04:40', NULL),
(31, 'Vehicle Type', 'Edited Vehicle Type Info', 'OLD VALUES: id=1 | code=PC | description=PC | created_date=2018-06-21 21:04:40 | created_by=1 | updated_date= | updated_by= ==> NEW VALUES: code=PCS | description=PCS | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 21:04:48', 1, '2018-06-21 21:04:48', NULL),
(32, 'Vehicle Type', 'New Vehicle Type Added', 'id=2 | code=CASE | description=CASE | created_by=1 | created_date=2018-06-21 21:05:00 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 21:05:00', NULL),
(33, 'Vehicle Type', 'Edited Vehicle Type Info', 'OLD VALUES: id=2 | code=CASE | description=CASE | created_date=2018-06-21 21:05:00 | created_by=1 | updated_date= | updated_by= ==> NEW VALUES: code=CS | description=CS | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 21:05:10', 1, '2018-06-21 21:05:10', NULL),
(34, 'Vehicle Type', 'Edited Vehicle Type Info', 'OLD VALUES: id=1 | code=PCS | description=PCS | created_date=2018-06-21 21:04:40 | created_by=1 | updated_date=2018-06-21 21:04:48 | updated_by=1 ==> NEW VALUES: code=PC | description=PC | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 21:05:17', 1, '2018-06-21 21:05:17', NULL),
(35, 'Vehicle Type', 'New Vehicle Type Added', 'id=1 | code=MOTORIZED | description=MOTORIZED | created_by=1 | created_date=2018-06-21 21:05:30 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 21:05:30', NULL),
(36, 'Vehicle Type', 'New Vehicle Type Added', 'id=2 | code=NON-MOTORIZED | description=NON-MOTORIZED | created_by=1 | created_date=2018-06-21 21:05:39 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 21:05:39', NULL),
(37, 'MODE OF TRANSPORT', 'New Mode of Transport Added', 'id=1 | code=AIR | description=AIR | created_by=1 | created_date=2018-06-21 21:09:03 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 21:09:03', NULL),
(38, 'MODE OF TRANSPORT', 'New Mode of Transport Added', 'id=2 | code=LAND | description=LAND | created_by=1 | created_date=2018-06-21 21:09:10 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 21:09:10', NULL),
(39, 'MODE OF TRANSPORT', 'New Mode of Transport Added', 'id=3 | code=SEA | description=SEA | created_by=1 | created_date=2018-06-21 21:09:17 | updated_by=NULL | updated_date=NULL', 1, '2018-06-21 21:09:17', NULL),
(40, 'MODE OF TRANSPORT', 'Edited Mode of Transport Info', 'OLD VALUES: id=3 | code=SEA | description=SEA | created_by=1 | created_date=2018-06-21 21:09:17 | updated_by= | updated_date= ==> NEW VALUES: code=SEA | description=SEA | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 21:09:28', 1, '2018-06-21 21:09:28', NULL),
(41, 'MODE OF TRANSPORT', 'Edited Mode of Transport Info', 'OLD VALUES: id=3 | code=SEA | description=SEA | created_by=1 | created_date=2018-06-21 21:09:17 | updated_by=1 | updated_date=2018-06-21 21:09:28 ==> NEW VALUES: code=LANDÑÑÑ | description=SEA | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 21:09:58', 1, '2018-06-21 21:09:58', NULL),
(42, 'MODE OF TRANSPORT', 'Edited Mode of Transport Info', 'OLD VALUES: id=3 | code=LANDÑÑÑ | description=SEA | created_by=1 | created_date=2018-06-21 21:09:17 | updated_by=1 | updated_date=2018-06-21 21:09:58 ==> NEW VALUES: code=SEA | description=SEA | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 21:10:33', 1, '2018-06-21 21:10:33', NULL),
(43, 'WAREHOUSE', 'New Warehouse Added', 'id=5 | code=PRODUCTION | description=PRODUCTION | created_by=1 | created_date=2018-06-21 22:07:09 | updated_by=NULL | updated_date=NULL | active_flag=1', 1, '2018-06-21 22:07:09', NULL),
(44, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=4 | code=WET | description=WET WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:52 | updated_by=1 | updated_date=2018-06-21 20:50:36 | active_flag=1 ==> NEW VALUES: code=WET | description=WET WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2018-06-21 22:07:19 | active_flag=0', 1, '2018-06-21 22:07:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE `transaction_type` (
  `id` int(11) NOT NULL,
  `code` varchar(35) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `prefix` varchar(20) NOT NULL,
  `next_number_series` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `unit_of_measure`
--

CREATE TABLE `unit_of_measure` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit_of_measure`
--

INSERT INTO `unit_of_measure` (`id`, `code`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(1, 'PC', 'PC', '2018-06-21 21:04:40', 1, '2018-06-21 21:05:17', 1, 1),
(2, 'CS', 'CS', '2018-06-21 21:05:00', 1, '2018-06-21 21:05:10', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email_address` varchar(200) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `user_group_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `admin_flag` tinyint(1) DEFAULT '0',
  `warehouse_id` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `middle_name`, `last_name`, `username`, `password`, `email_address`, `active_flag`, `user_group_id`, `created_date`, `created_by`, `admin_flag`, `warehouse_id`, `updated_date`, `updated_by`) VALUES
(1, 'System', '', 'Administrator', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'wms@tpincorporated.com', 1, 1, '2018-06-21 20:44:27', 1, 0, 1, NULL, NULL),
(2, 'User1', 'User1', 'User1', 'user1', '827ccb0eea8a706c4c34a16891f84e7b', 'User1@gmail.com', 1, 1, '2018-06-21 20:49:16', 1, 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`id`, `code`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(1, 'DATA MASTER', 'DATA MASTER', '2018-06-21 20:13:06', 1, NULL, NULL),
(2, 'PICKER', 'PICKER', '2018-06-21 20:13:39', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_rights`
--

CREATE TABLE `user_group_rights` (
  `user_group_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` varchar(80) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `user_rights`
--

CREATE TABLE `user_rights` (
  `user_id` int(11) NOT NULL,
  `menu_id` varchar(100) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_rights`
--

INSERT INTO `user_rights` (`user_id`, `menu_id`) VALUES
(2, '#configuration-menu'),
(2, '#system-section'),
(2, '#systemlog-menu'),
(2, '#transactiontype-menu'),
(2, '#user-menu'),
(2, '#usergroup-menu'),
(2, '.adduserbtn'),
(2, '.addusergroupbtn'),
(2, '.deleteuserbtn'),
(2, '.deleteusergroupbtn'),
(2, '.edituserbtn'),
(2, '.editusergroupbtn'),
(2, '.resetpasswordbtn'),
(2, 'viewuser'),
(2, 'viewusergroup');

-- --------------------------------------------------------

--
-- Table structure for table `user_warehouse`
--

CREATE TABLE `user_warehouse` (
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_warehouse`
--

INSERT INTO `user_warehouse` (`user_id`, `warehouse_id`) VALUES
(1, 3),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type`
--

CREATE TABLE `vehicle_type` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_type`
--

INSERT INTO `vehicle_type` (`id`, `code`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(1, 'MOTORIZED', 'MOTORIZED', '2018-06-21 21:05:30', 1, NULL, NULL, 1),
(2, 'NON-MOTORIZED', 'NON-MOTORIZED', '2018-06-21 21:05:39', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` mediumtext,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `code`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`, `active_flag`) VALUES
(1, 'MAIN', 'MAIN WAREHOUSE', 1, '2018-06-21 20:36:03', 1, '2018-06-21 20:50:30', 1),
(3, 'DRY', 'DRY WAREHOUSE', 1, '2018-06-21 20:36:34', 1, '2018-06-21 20:50:33', 1),
(4, 'WET', 'WET WAREHOUSE', 1, '2018-06-21 20:36:52', 1, '2018-06-21 22:07:19', 0),
(5, 'PRODUCTION', 'PRODUCTION', 1, '2018-06-21 22:07:09', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company_information`
--
ALTER TABLE `company_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_configuration`
--
ALTER TABLE `email_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mode_of_transport`
--
ALTER TABLE `mode_of_transport`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_source` (`user_source`);

--
-- Indexes for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `unit_of_measure`
--
ALTER TABLE `unit_of_measure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_group_id` (`user_group_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `location_id` (`warehouse_id`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `user_group_rights`
--
ALTER TABLE `user_group_rights`
  ADD PRIMARY KEY (`user_group_id`,`menu_id`);

--
-- Indexes for table `user_rights`
--
ALTER TABLE `user_rights`
  ADD PRIMARY KEY (`user_id`,`menu_id`);

--
-- Indexes for table `user_warehouse`
--
ALTER TABLE `user_warehouse`
  ADD PRIMARY KEY (`user_id`,`warehouse_id`),
  ADD KEY `location_id` (`warehouse_id`);

--
-- Indexes for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company_information`
--
ALTER TABLE `company_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `email_configuration`
--
ALTER TABLE `email_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mode_of_transport`
--
ALTER TABLE `mode_of_transport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `system_log`
--
ALTER TABLE `system_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `transaction_type`
--
ALTER TABLE `transaction_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unit_of_measure`
--
ALTER TABLE `unit_of_measure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `mode_of_transport`
--
ALTER TABLE `mode_of_transport`
  ADD CONSTRAINT `mode_of_transport_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mode_of_transport_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `system_log`
--
ALTER TABLE `system_log`
  ADD CONSTRAINT `system_log_ibfk_1` FOREIGN KEY (`user_source`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD CONSTRAINT `transaction_type_ibfk_1` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `unit_of_measure`
--
ALTER TABLE `unit_of_measure`
  ADD CONSTRAINT `unit_of_measure_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `unit_of_measure_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_group_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_group_rights`
--
ALTER TABLE `user_group_rights`
  ADD CONSTRAINT `user_group_rights_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_rights`
--
ALTER TABLE `user_rights`
  ADD CONSTRAINT `user_rights_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_warehouse`
--
ALTER TABLE `user_warehouse`
  ADD CONSTRAINT `user_warehouse_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_warehouse_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  ADD CONSTRAINT `vehicle_type_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicle_type_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
