-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2019 at 09:22 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wms-version-3`
--

-- --------------------------------------------------------

--
-- Table structure for table `bin_location`
--

CREATE TABLE `bin_location` (
  `id` int(11) NOT NULL,
  `code` varchar(80) NOT NULL,
  `description` varchar(200) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `weight_capacity` double NOT NULL DEFAULT '0',
  `cbm_capacity` double NOT NULL DEFAULT '0',
  `capacity` double NOT NULL DEFAULT '0',
  `on_hold_flag` tinyint(1) NOT NULL DEFAULT '0',
  `disposition` varchar(200) DEFAULT NULL,
  `suggestion_flag` tinyint(1) NOT NULL DEFAULT '0',
  `location_index` double DEFAULT NULL,
  `all_items_flag` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bin_location`
--

INSERT INTO `bin_location` (`id`, `code`, `description`, `warehouse_id`, `zone_id`, `weight_capacity`, `cbm_capacity`, `capacity`, `on_hold_flag`, `disposition`, `suggestion_flag`, `location_index`, `all_items_flag`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(14, 'LOC4', 'LOC4', 1, NULL, 0, 0, 0, 1, 'GOOD STOCKS', 0, NULL, 1, '2018-12-17 01:41:42', 1, '2019-03-04 17:21:50', 1, 1),
(16, 'DFLTLOC-TEST', 'DFLTLOC-TEST', 2, NULL, 0, 0, 0, 0, 'GOOD STOCKS', 1, NULL, 1, '2019-01-03 14:06:13', 1, NULL, NULL, 1),
(17, 'DFLTLOC-WHSE1', 'DFLTLOC-WHSE1', 3, NULL, 0, 0, 0, 0, 'GOOD STOCKS', 1, NULL, 1, '2019-01-09 16:09:38', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bin_location_item`
--

CREATE TABLE `bin_location_item` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `code`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(1, 'CTGY2', 'Category 2', '2018-06-22 04:12:06', 1, '2018-06-22 04:12:43', 1, 1),
(2, 'CTGY1', 'Category 1', '2018-06-22 04:12:12', 1, '2019-01-09 16:19:10', 1, 1),
(3, 'CTGY3', 'Category 3', '2018-06-22 04:12:59', 1, '2018-06-22 04:13:03', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `client_group_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `fax` varchar(80) DEFAULT NULL,
  `telephone` varchar(80) DEFAULT NULL,
  `mobile` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `code`, `description`, `client_group_id`, `term_id`, `fax`, `telephone`, `mobile`, `email`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(3, 'CLIENTA', 'CUSTOMER A', 1, 1, '', '', '', '', '2018-07-06 18:19:05', 1, '2018-07-09 11:04:14', 1, 1),
(4, 'CLIENTB', 'CUSTOMER B', NULL, NULL, '', '', '', '', '2018-07-06 18:22:11', 1, NULL, NULL, 1),
(5, 'JH', 'JG', NULL, NULL, '', '', '', '', '2018-07-06 18:22:19', 1, '2019-01-07 17:27:55', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_address`
--

CREATE TABLE `client_address` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `default_flag` tinyint(1) DEFAULT '1',
  `street` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `district` varchar(200) DEFAULT NULL,
  `region` varchar(200) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_address`
--

INSERT INTO `client_address` (`id`, `client_id`, `active_flag`, `default_flag`, `street`, `city`, `district`, `region`, `zip_code`, `country`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(10, 3, 1, 1, 'Street', NULL, 'District', NULL, NULL, 'Philippines', '2018-07-09 12:41:58', 1, '2018-12-01 02:20:22', 1),
(11, 3, 1, 0, 'kjh', 'hkjh', 'kjhk', 'kjhjkh', 'jkhjk', 'Philippines', '2018-07-09 12:42:53', 1, '2018-11-20 12:32:09', 1),
(15, 3, 1, 0, 'Street1', 'City1', 'District1', 'Region1', 'Zip Code1', 'Philippines', '2018-09-05 14:05:39', 1, NULL, NULL),
(16, 3, 1, 0, 'fdf', 'fdgdf', 'fdg', 'fdg', 'fdg', 'Philippines', '2018-09-05 14:05:50', 1, NULL, NULL),
(18, 4, 1, 1, 'sdf', 'sdfsd', 'sdf', 'sdfsf', 'sdfds', 'Philippines', '2019-01-07 17:21:45', 1, NULL, NULL),
(19, 5, 1, 1, 'street', 'city', 'district', 'region', 'zipcode', 'Philippines', '2019-01-07 17:22:52', 1, '2019-01-07 17:23:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_contact`
--

CREATE TABLE `client_contact` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `default_flag` tinyint(1) DEFAULT '1',
  `name` varchar(80) DEFAULT NULL,
  `designation` varchar(80) DEFAULT NULL,
  `telephone` varchar(80) DEFAULT NULL,
  `mobile` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `street` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `district` varchar(200) DEFAULT NULL,
  `region` varchar(200) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_contact`
--

INSERT INTO `client_contact` (`id`, `client_id`, `active_flag`, `default_flag`, `name`, `designation`, `telephone`, `mobile`, `email`, `street`, `city`, `district`, `region`, `zip_code`, `country`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(5, 3, 0, 0, 'jhgjhgjh', 'gjh', NULL, 'gjh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-07 13:33:16', 1, '2018-09-07 13:33:22', 1),
(6, 3, 1, 1, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-07 13:33:27', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_group`
--

CREATE TABLE `client_group` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_group`
--

INSERT INTO `client_group` (`id`, `code`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(1, 'CLNTGRP1', 'Client Group 1', '2018-06-22 03:56:26', 1, '2019-01-09 16:18:20', 1, 0),
(2, 'CLNTGRP2', 'Client Group 2', '2018-06-22 03:57:33', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `value_added_tax_percentage` double DEFAULT '0.12',
  `system_generated_po_number_only_flag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_information`
--

INSERT INTO `company_information` (`id`, `company_name`, `company_address`, `city`, `state_province`, `postal_code`, `primary_color`, `secondary_color`, `country`, `tax_identification_number`, `value_added_tax_percentage`, `system_generated_po_number_only_flag`) VALUES
(1, 'TURNINGPOINT INC', '12345', 'Manila', 'NCR', '1234', 'rgb(207,223,255)', 'rgb(255,255,255)', 'Philippines', '12345', 0.12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country_code` varchar(45) DEFAULT NULL,
  `country_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CK', 'Cook Islands'),
(51, 'CR', 'Costa Rica'),
(52, 'HR', 'Croatia (Hrvatska)'),
(53, 'CU', 'Cuba'),
(54, 'CY', 'Cyprus'),
(55, 'CZ', 'Czech Republic'),
(56, 'DK', 'Denmark'),
(57, 'DJ', 'Djibouti'),
(58, 'DM', 'Dominica'),
(59, 'DO', 'Dominican Republic'),
(60, 'TP', 'East Timor'),
(61, 'EC', 'Ecuador'),
(62, 'EG', 'Egypt'),
(63, 'SV', 'El Salvador'),
(64, 'GQ', 'Equatorial Guinea'),
(65, 'ER', 'Eritrea'),
(66, 'EE', 'Estonia'),
(67, 'ET', 'Ethiopia'),
(68, 'FK', 'Falkland Islands (Malvinas)'),
(69, 'FO', 'Faroe Islands'),
(70, 'FJ', 'Fiji'),
(71, 'FI', 'Finland'),
(72, 'FR', 'France'),
(73, 'FX', 'France, Metropolitan'),
(74, 'GF', 'French Guiana'),
(75, 'PF', 'French Polynesia'),
(76, 'TF', 'French Southern Territories'),
(77, 'GA', 'Gabon'),
(78, 'GM', 'Gambia'),
(79, 'GE', 'Georgia'),
(80, 'DE', 'Germany'),
(81, 'GH', 'Ghana'),
(82, 'GI', 'Gibraltar'),
(83, 'GK', 'Guernsey'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'IM', 'Isle of Man'),
(101, 'ID', 'Indonesia'),
(102, 'IR', 'Iran (Islamic Republic of)'),
(103, 'IQ', 'Iraq'),
(104, 'IE', 'Ireland'),
(105, 'IL', 'Israel'),
(106, 'IT', 'Italy'),
(107, 'CI', 'Ivory Coast'),
(108, 'JE', 'Jersey'),
(109, 'JM', 'Jamaica'),
(110, 'JP', 'Japan'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea, Democratic People\'s Republic of'),
(116, 'KR', 'Korea, Republic of'),
(117, 'XK', 'Kosovo'),
(118, 'KW', 'Kuwait'),
(119, 'KG', 'Kyrgyzstan'),
(120, 'LA', 'Lao People\'s Democratic Republic'),
(121, 'LV', 'Latvia'),
(122, 'LB', 'Lebanon'),
(123, 'LS', 'Lesotho'),
(124, 'LR', 'Liberia'),
(125, 'LY', 'Libyan Arab Jamahiriya'),
(126, 'LI', 'Liechtenstein'),
(127, 'LT', 'Lithuania'),
(128, 'LU', 'Luxembourg'),
(129, 'MO', 'Macau'),
(130, 'MK', 'Macedonia'),
(131, 'MG', 'Madagascar'),
(132, 'MW', 'Malawi'),
(133, 'MY', 'Malaysia'),
(134, 'MV', 'Maldives'),
(135, 'ML', 'Mali'),
(136, 'MT', 'Malta'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'TY', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia, Federated States of'),
(144, 'MD', 'Moldova, Republic of'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'ME', 'Montenegro'),
(148, 'MS', 'Montserrat'),
(149, 'MA', 'Morocco'),
(150, 'MZ', 'Mozambique'),
(151, 'MM', 'Myanmar'),
(152, 'NA', 'Namibia'),
(153, 'NR', 'Nauru'),
(154, 'NP', 'Nepal'),
(155, 'NL', 'Netherlands'),
(156, 'AN', 'Netherlands Antilles'),
(157, 'NC', 'New Caledonia'),
(158, 'NZ', 'New Zealand'),
(159, 'NI', 'Nicaragua'),
(160, 'NE', 'Niger'),
(161, 'NG', 'Nigeria'),
(162, 'NU', 'Niue'),
(163, 'NF', 'Norfolk Island'),
(164, 'MP', 'Northern Mariana Islands'),
(165, 'NO', 'Norway'),
(166, 'OM', 'Oman'),
(167, 'PK', 'Pakistan'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestine'),
(170, 'PA', 'Panama'),
(171, 'PG', 'Papua New Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Peru'),
(174, 'PH', 'Philippines'),
(175, 'PN', 'Pitcairn'),
(176, 'PL', 'Poland'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'RE', 'Reunion'),
(181, 'RO', 'Romania'),
(182, 'RU', 'Russian Federation'),
(183, 'RW', 'Rwanda'),
(184, 'KN', 'Saint Kitts and Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'VC', 'Saint Vincent and the Grenadines'),
(187, 'WS', 'Samoa'),
(188, 'SM', 'San Marino'),
(189, 'ST', 'Sao Tome and Principe'),
(190, 'SA', 'Saudi Arabia'),
(191, 'SN', 'Senegal'),
(192, 'RS', 'Serbia'),
(193, 'SC', 'Seychelles'),
(194, 'SL', 'Sierra Leone'),
(195, 'SG', 'Singapore'),
(196, 'SK', 'Slovakia'),
(197, 'SI', 'Slovenia'),
(198, 'SB', 'Solomon Islands'),
(199, 'SO', 'Somalia'),
(200, 'ZA', 'South Africa'),
(201, 'GS', 'South Georgia South Sandwich Islands'),
(202, 'ES', 'Spain'),
(203, 'LK', 'Sri Lanka'),
(204, 'SH', 'St. Helena'),
(205, 'PM', 'St. Pierre and Miquelon'),
(206, 'SD', 'Sudan'),
(207, 'SR', 'Suriname'),
(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
(209, 'SZ', 'Swaziland'),
(210, 'SE', 'Sweden'),
(211, 'CH', 'Switzerland'),
(212, 'SY', 'Syrian Arab Republic'),
(213, 'TW', 'Taiwan'),
(214, 'TJ', 'Tajikistan'),
(215, 'TZ', 'Tanzania, United Republic of'),
(216, 'TH', 'Thailand'),
(217, 'TG', 'Togo'),
(218, 'TK', 'Tokelau'),
(219, 'TO', 'Tonga'),
(220, 'TT', 'Trinidad and Tobago'),
(221, 'TN', 'Tunisia'),
(222, 'TR', 'Turkey'),
(223, 'TM', 'Turkmenistan'),
(224, 'TC', 'Turks and Caicos Islands'),
(225, 'TV', 'Tuvalu'),
(226, 'UG', 'Uganda'),
(227, 'UA', 'Ukraine'),
(228, 'AE', 'United Arab Emirates'),
(229, 'GB', 'United Kingdom'),
(230, 'US', 'United States'),
(231, 'UM', 'United States minor outlying islands'),
(232, 'UY', 'Uruguay'),
(233, 'UZ', 'Uzbekistan'),
(234, 'VU', 'Vanuatu'),
(235, 'VA', 'Vatican City State'),
(236, 'VE', 'Venezuela'),
(237, 'VN', 'Vietnam'),
(238, 'VG', 'Virgin Islands (British)'),
(239, 'VI', 'Virgin Islands (U.S.)'),
(240, 'WF', 'Wallis and Futuna Islands'),
(241, 'EH', 'Western Sahara'),
(242, 'YE', 'Yemen'),
(243, 'ZR', 'Zaire'),
(244, 'ZM', 'Zambia'),
(245, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `disposition`
--

CREATE TABLE `disposition` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `default_flag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disposition`
--

INSERT INTO `disposition` (`id`, `code`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`, `default_flag`) VALUES
(8, 'GOOD STOCKS', 'GOOD STOCKS', '2018-12-22 05:21:54', 1, '2019-01-03 14:07:50', 1, 1, 1),
(9, 'BAD STOCKS', 'BAD STOCKS', '2018-12-22 05:22:03', 1, '2019-01-03 14:07:45', 1, 1, 0),
(10, 'RETAINED SAMPLES', 'RETAINED SAMPLES', '2018-12-22 05:22:16', 1, NULL, NULL, 1, 0);

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
(1, 'sg2plcpnl0114.prod.sin2.secureserver.net', NULL, NULL, '587', 'wbms@tpincorporated.com', 'WMS Administrator', 'SSL', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `code` varchar(80) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `item_type_id` int(11) DEFAULT '2',
  `category_id` int(11) DEFAULT NULL,
  `expiry_flag` tinyint(1) DEFAULT '1',
  `reorder_quantity` double DEFAULT '0',
  `quantity_per_pallet` double DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `label` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `active_flag`, `code`, `name`, `description`, `item_type_id`, `category_id`, `expiry_flag`, `reorder_quantity`, `quantity_per_pallet`, `created_date`, `created_by`, `updated_date`, `updated_by`, `label`) VALUES
(29, 1, 'PM000430', 'PLASTIC LINING FOR 200L DRUM', 'PLASTIC LINING FOR 200L DRUM', 1, 2, 1, 0, 0, '2018-11-25 00:06:51', 1, '2019-03-04 11:26:21', 1, 'label'),
(30, 1, 'FGT00285', 'PIONEER BARRICADE WHITE 200L', 'PIONEER BARRICADE WHITE 200L', 2, 2, 1, 0, 0, '2018-11-25 00:12:16', 1, '2019-03-04 11:26:45', 1, NULL),
(31, 0, 'ITMVOID', 'Invalid Item', 'Invalid Item Description', 2, 2, 1, 0, 0, '2018-11-25 00:13:05', 1, '2019-01-12 00:03:03', 1, NULL),
(32, 1, 'PM000413', 'P.LABEL QDE SKY BLUE 1L', 'P.LABEL QDE SKY BLUE 1L', 2, NULL, 0, 0, 0, '2018-12-01 02:09:24', 1, '2019-03-04 11:27:05', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_assembly`
--

CREATE TABLE `item_assembly` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `component_quantity` double DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_plu`
--

CREATE TABLE `item_plu` (
  `id` int(11) NOT NULL,
  `inventory_unit_flag` tinyint(1) NOT NULL,
  `active_flag` tinyint(1) NOT NULL DEFAULT '1',
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `cost` double NOT NULL DEFAULT '0',
  `length` double NOT NULL DEFAULT '0',
  `width` double NOT NULL DEFAULT '0',
  `height` double NOT NULL DEFAULT '0',
  `cbm` double NOT NULL DEFAULT '0',
  `weight` double NOT NULL DEFAULT '0',
  `sales_order_flag` tinyint(1) DEFAULT '0',
  `purchase_order_flag` tinyint(1) DEFAULT '0',
  `description` varchar(80) DEFAULT NULL,
  `minimum_order_quantity` double DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_plu`
--

INSERT INTO `item_plu` (`id`, `inventory_unit_flag`, `active_flag`, `item_id`, `uom_id`, `quantity`, `barcode`, `price`, `cost`, `length`, `width`, `height`, `cbm`, `weight`, `sales_order_flag`, `purchase_order_flag`, `description`, `minimum_order_quantity`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(45, 0, 1, 32, 1, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '2019-01-12 18:39:22', 1, '2019-04-11 02:37:36', 1),
(46, 1, 1, 32, 3, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', 0, '2019-01-12 18:39:37', 1, '2019-04-11 02:37:56', 1),
(47, 1, 1, 30, 1, 1, NULL, 0, 0, 45, 78, 12, 0.0421, 0, 0, 0, '', 0, '2019-01-12 18:40:00', 1, '2019-03-06 12:30:20', 1),
(48, 1, 1, 29, 1, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '2019-01-12 18:41:00', 1, NULL, NULL),
(49, 0, 1, 29, 2, 100, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '2019-01-12 18:41:10', 1, NULL, NULL),
(50, 0, 1, 32, 2, 10, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '2019-04-11 02:38:59', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE `item_type` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`id`, `description`) VALUES
(1, 'ASSEMBLY'),
(2, 'PART'),
(3, 'SERVICE');

-- --------------------------------------------------------

--
-- Table structure for table `item_warehouse_reorder_quantity`
--

CREATE TABLE `item_warehouse_reorder_quantity` (
  `id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(4, 'AIR', 'AIR', 1, '2018-12-22 05:16:06', NULL, NULL, 1),
(5, 'SEA', 'SEA', 1, '2018-12-22 05:16:13', NULL, NULL, 1),
(6, 'LAND', 'LAND', 1, '2018-12-22 05:16:22', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `physical_inventory`
--

CREATE TABLE `physical_inventory` (
  `id` bigint(20) NOT NULL,
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(200) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `base_quantity` double NOT NULL,
  `on_hold_flag` tinyint(1) NOT NULL DEFAULT '0',
  `cycle_count_flag` tinyint(1) NOT NULL DEFAULT '0',
  `disposition` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `physical_inventory`
--

INSERT INTO `physical_inventory` (`id`, `location_id`, `item_id`, `lot_number`, `expiry_date`, `base_quantity`, `on_hold_flag`, `cycle_count_flag`, `disposition`, `created_date`) VALUES
(65, 16, 29, '20190215', '2019-02-28', 1000, 0, 0, 'GOOD STOCKS', '2019-02-19 12:24:56'),
(66, 14, 29, '20190215', '2019-02-28', 1000, 1, 0, 'GOOD STOCKS', '2019-02-19 12:25:29'),
(67, 14, 32, '20190213', NULL, 120, 1, 0, 'GOOD STOCKS', '2019-02-19 13:01:40'),
(68, 14, 32, '20190214', NULL, 80, 1, 0, 'GOOD STOCKS', '2019-02-19 13:01:40'),
(69, 14, 29, '20190214', '2019-02-28', 1007, 1, 0, 'GOOD STOCKS', '2019-02-19 13:01:40'),
(70, 14, 29, '20190214', '2019-03-31', 3, 1, 0, 'GOOD STOCKS', '2019-02-19 13:01:40'),
(71, 14, 32, '12345', NULL, 5, 1, 0, 'GOOD STOCKS', '2019-02-19 13:08:36'),
(72, 14, 29, '12345', '2019-02-28', 0, 1, 0, 'GOOD STOCKS', '2019-02-19 13:08:36'),
(73, 16, 32, '20190222', NULL, 100, 0, 0, 'GOOD STOCKS', '2019-02-22 17:57:13'),
(74, 17, 32, '20190222', NULL, 35000, 0, 0, 'GOOD STOCKS', '2019-02-22 19:15:35'),
(75, 17, 29, '20190222', '2020-02-22', 0, 0, 0, 'GOOD STOCKS', '2019-02-22 19:15:35'),
(76, 14, 32, '432423', NULL, 150, 1, 0, 'GOOD STOCKS', '2019-03-01 00:52:32'),
(77, 14, 29, 'ERWER', '2019-03-31', 1500, 1, 0, 'GOOD STOCKS', '2019-03-01 02:32:14'),
(78, 17, 30, '20190301', '2020-03-01', 250, 0, 0, 'GOOD STOCKS', '2019-03-01 02:36:22'),
(79, 17, 30, '20190302', '2020-03-02', 200, 0, 0, 'GOOD STOCKS', '2019-03-01 02:36:22'),
(80, 17, 29, '20190228', '2020-02-28', 0, 0, 0, 'GOOD STOCKS', '2019-03-01 02:36:22'),
(81, 16, 29, '20190222', '2020-02-22', 0, 0, 0, 'GOOD STOCKS', '2019-03-01 02:38:18'),
(82, 16, 29, '20190221', '2020-02-21', 12500, 0, 0, 'GOOD STOCKS', '2019-03-04 17:32:01'),
(86, 16, 29, 'SDFDS', '2019-03-05', 0, 0, 0, 'GOOD STOCKS', '2019-03-04 17:51:20');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_details`
--

CREATE TABLE `purchase_order_details` (
  `id` int(11) NOT NULL,
  `purchase_order_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `unit_price` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_order_details`
--

INSERT INTO `purchase_order_details` (`id`, `purchase_order_header_id`, `item_id`, `uom_id`, `quantity`, `base_quantity`, `unit_price`, `amount`, `remarks`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(50, 30, 32, 3, 15.0001, 150.001, 0, 0, NULL, '2019-01-14 20:28:27', 1, '2019-01-15 14:54:05', 1, 1),
(74, 30, 29, 2, 23, 2300, 0, 0, NULL, '2019-01-15 14:54:09', 1, '2019-01-15 14:54:09', 1, 1),
(75, 30, 29, 2, 15, 1500, 0, 0, NULL, '2019-01-15 14:54:57', 1, '2019-01-15 14:54:57', 1, 1),
(76, 30, 30, 1, 250, 250, 0, 0, NULL, '2019-01-15 14:55:03', 1, '2019-01-15 14:55:03', 1, 1),
(77, 30, 32, 3, 350, 3500, 0, 0, NULL, '2019-01-15 14:55:11', 1, '2019-01-15 14:55:11', 1, 1),
(107, 34, 29, 2, 35, 3500, 12.75, 446.25, NULL, '2019-01-15 19:33:34', 1, '2019-01-15 19:41:10', 1, 1),
(109, 31, 32, 3, 5, 50, 0, 0, NULL, '2019-01-16 19:45:45', 1, '2019-01-16 19:45:45', 1, 1),
(110, 35, 29, 2, 305, 30500, 0, 0, NULL, '2019-01-16 19:46:21', 1, '2019-01-31 11:16:48', 1, 1),
(111, 28, 29, 2, 15, 1500, 0, 0, NULL, '2019-01-31 08:12:34', 1, '2019-01-31 08:12:34', 1, 1),
(112, 35, 29, 2, 10, 1000, 5, 50, NULL, '2019-01-31 10:26:34', 1, '2019-01-31 10:26:34', 1, 1),
(113, 35, 30, 1, 45, 45, 0, 0, NULL, '2019-01-31 11:16:53', 1, '2019-01-31 11:16:53', 1, 1),
(117, 34, 32, 3, 9, 90, 0, 0, NULL, '2019-01-31 22:47:36', 1, '2019-02-04 01:37:45', 1, 1),
(118, 37, 32, 3, 12, 120, 0, 0, NULL, '2019-02-14 16:39:39', 1, '2019-02-14 16:39:39', 1, 1),
(119, 37, 29, 2, 14, 1400, 0, 0, NULL, '2019-02-14 16:43:08', 1, '2019-02-14 16:43:08', 1, 1),
(120, 37, 30, 1, 1500, 1500, 0, 0, NULL, '2019-02-14 16:43:21', 1, '2019-02-14 16:43:21', 1, 1),
(121, 38, 29, 2, 215, 21500, 0, 0, NULL, '2019-02-14 16:50:31', 1, '2019-03-26 12:02:35', 1, 1),
(125, 40, 32, 3, 5, 50, 0, 0, NULL, '2019-03-01 00:38:17', 1, '2019-03-01 00:38:17', 1, 1),
(126, 40, 29, 2, 35, 3500, 0, 0, NULL, '2019-03-01 00:38:24', 1, '2019-03-01 00:38:24', 1, 1),
(128, 41, 29, 2, 15, 1500, 0, 0, NULL, '2019-03-01 01:10:44', 1, '2019-03-01 01:10:44', 1, 1),
(129, 43, 32, 3, 4, 40, 0, 0, NULL, '2019-04-08 03:01:07', 1, '2019-04-08 03:01:07', 1, 1),
(130, 43, 30, 1, 57, 57, 0, 0, NULL, '2019-04-08 03:01:15', 1, '2019-04-08 03:01:20', 1, 1),
(131, 43, 30, 1, 34, 34, 0, 0, NULL, '2019-04-08 03:01:27', 1, '2019-04-08 03:01:27', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_header`
--

CREATE TABLE `purchase_order_header` (
  `id` int(11) NOT NULL,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(80) NOT NULL,
  `reference` varchar(80) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier_street_address` varchar(200) DEFAULT NULL,
  `supplier_district_address` varchar(200) DEFAULT NULL,
  `supplier_city_address` varchar(200) DEFAULT NULL,
  `supplier_region_address` varchar(200) DEFAULT NULL,
  `supplier_zip_code_address` varchar(45) DEFAULT NULL,
  `supplier_country_address` varchar(200) DEFAULT NULL,
  `supplier_contact_person` varchar(200) DEFAULT NULL,
  `supplier_contact_number` varchar(200) DEFAULT NULL,
  `ship_to` varchar(80) DEFAULT 'WAREHOUSE',
  `warehouse_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `ship_to_street_address` varchar(200) DEFAULT NULL,
  `ship_to_district_address` varchar(200) DEFAULT NULL,
  `ship_to_city_address` varchar(200) DEFAULT NULL,
  `ship_to_region_address` varchar(200) DEFAULT NULL,
  `ship_to_zip_code_address` varchar(200) DEFAULT NULL,
  `ship_to_country_address` varchar(200) DEFAULT NULL,
  `ship_to_contact_person` varchar(200) DEFAULT NULL,
  `ship_to_contact_number` varchar(200) DEFAULT NULL,
  `terms_id` int(11) DEFAULT NULL,
  `remarks` text,
  `document_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `last_status_update_remarks` text,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_order_header`
--

INSERT INTO `purchase_order_header` (`id`, `transaction_number`, `status`, `reference`, `supplier_id`, `supplier_street_address`, `supplier_district_address`, `supplier_city_address`, `supplier_region_address`, `supplier_zip_code_address`, `supplier_country_address`, `supplier_contact_person`, `supplier_contact_number`, `ship_to`, `warehouse_id`, `client_id`, `ship_to_street_address`, `ship_to_district_address`, `ship_to_city_address`, `ship_to_region_address`, `ship_to_zip_code_address`, `ship_to_country_address`, `ship_to_contact_person`, `ship_to_contact_number`, `terms_id`, `remarks`, `document_date`, `delivery_date`, `created_date`, `created_by`, `updated_date`, `updated_by`, `posted_date`, `posted_by`, `closed_date`, `closed_by`, `last_status_update_remarks`, `cancelled_date`, `cancelled_by`) VALUES
(28, 'PO00000001', 'CLOSED', 'REF01 ', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'John Doe', '12345', 'WAREHOUSE', 1, NULL, 'street', 'district', 'city', 'region', 'zip', 'philippines', 'Jane Doe', '1234', NULL, 'ÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑÑ', '2019-01-10', '2019-01-31', '2019-01-10 18:33:18', 1, '2019-01-15 01:14:41', 1, '2019-01-31 08:12:52', 1, '2019-02-04 04:35:23', 1, NULL, NULL, NULL),
(29, 'PO00000002', 'VOID', 'REF02', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-10', NULL, '2019-01-10 19:56:49', 1, '2019-01-10 19:58:09', 1, NULL, NULL, NULL, NULL, 'LOGGED=>VOID \nRemarks: vvsdf', '2019-02-01 00:08:42', 1),
(30, 'PO00000003', 'VOID', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 1, NULL, 'street', 'district', 'city', 'region', 'zip', 'philippines', NULL, NULL, NULL, NULL, '2019-01-10', NULL, '2019-01-10 20:01:30', 1, '2019-01-14 15:34:57', 1, '2019-01-25 17:10:58', 1, NULL, NULL, 'POSTED=>VOID \nRemarks: bjhv', '2019-02-01 17:19:14', 1),
(31, 'PO00000004', 'CLOSED', 'REF04', 5, 'street supplier', 'supplier district', 'manila', 'Metro Manila', '1234', 'Philippines', 'supplier contact', 'contact', 'WAREHOUSE', 1, NULL, 'street', 'district', 'city', 'region', 'zip', 'philippines', NULL, NULL, 1, NULL, '2019-01-10', NULL, '2019-01-10 20:02:51', 1, '2019-01-15 14:59:12', 1, '2019-01-16 19:45:48', 1, '2019-02-14 16:31:17', NULL, 'All Items Received (RCV00000028)', NULL, NULL),
(32, 'PO00000005', 'LOGGED', 'REF05', 8, 'supplier street', 'supplier district', 'supplier city', 'supplier region', 'supplier zip code', 'Philippines', 'supplier contact person', 'supplier contact number', 'WAREHOUSE', 3, NULL, 'ship to street address', 'ship to district', 'ship to city', 'ship to region', 'ship to zip code', 'Philippines', 'ship to contact person', 'ship to contact number', 1, 'remarks for po5', '2019-01-10', NULL, '2019-01-10 21:30:57', 1, '2019-01-10 21:33:21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'PO00000006', 'VOID', NULL, 6, 'P.O. Box 1201, Manila Central Post Office', 'Malate', 'Manila', 'NCR', '1050', 'Philippines', NULL, NULL, 'WAREHOUSE', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-11', NULL, '2019-01-11 20:56:12', 1, '2019-01-11 20:56:34', 1, NULL, NULL, NULL, NULL, 'LOGGED=>VOID \nRemarks: hghjgjhgh', '2019-02-03 22:49:24', 1),
(34, 'PO00000007', 'CLOSED', 'REF07', 6, 'P.O. Box 1201, Manila Central Post Office', 'Malate', 'Manila', 'NCR', '1050', 'Philippines', 'Supplier Contact Person', 'Supplier Contact Number', 'WAREHOUSE', 1, NULL, 'street', 'district', 'city', 'region', 'zip', 'philippines', NULL, NULL, 1, NULL, '2019-01-15', NULL, '2019-01-15 15:12:27', 1, '2019-02-03 23:25:14', 1, '2019-02-04 01:37:59', 1, '2019-02-28 22:38:47', NULL, 'All Items Received (RCV00000026)', NULL, NULL),
(35, 'PO00000008', 'VOID', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 1, NULL, 'street', 'district', 'city', 'region', 'zip', 'philippines', NULL, NULL, NULL, NULL, '2019-01-16', NULL, '2019-01-16 00:50:09', 1, '2019-01-31 10:42:48', 1, NULL, NULL, NULL, NULL, 'LOGGED=>VOID \nRemarks: asdasd', '2019-01-31 23:55:24', 1),
(36, 'PO00000009', 'VOID', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-16', NULL, '2019-01-16 00:50:43', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'LOGGED=>POSTED \nRemarks: dfgdf', '2019-01-31 23:54:43', 1),
(37, 'PO00000010', 'LOGGED', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 1, NULL, 'street', 'district', 'city', 'region', 'zip', 'philippines', NULL, NULL, NULL, NULL, '2019-02-14', NULL, '2019-02-14 16:39:04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'PO00000011', 'LOGGED', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-14', NULL, '2019-02-14 16:49:51', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'POSTED=>LOGGED \nRemarks: dsfd', NULL, NULL),
(39, 'PO00000012', 'LOGGED', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 1, NULL, 'street', 'district', 'city', 'region', 'zip', 'philippines', NULL, NULL, NULL, NULL, '2019-03-01', NULL, '2019-03-01 00:18:39', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'PO00000013', 'VOID', NULL, 6, 'P.O. Box 1201, Manila Central Post Office', 'Malate', 'Manila', 'NCR', '1050', 'Philippines', NULL, NULL, 'WAREHOUSE', 1, NULL, 'street', 'district', 'city', 'region', 'zip', 'philippines', NULL, NULL, NULL, NULL, '2019-03-01', NULL, '2019-03-01 00:19:35', 1, '2019-03-01 00:41:11', 1, '2019-03-01 00:41:17', 1, NULL, NULL, 'POSTED=>VOID \nRemarks: sdfds', '2019-03-01 00:41:49', 1),
(41, 'PO00000014', 'CLOSED', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 1, NULL, 'street', 'district', 'city', 'region', 'zip', 'philippines', NULL, NULL, NULL, NULL, '2019-03-01', NULL, '2019-03-01 01:10:33', 1, NULL, NULL, '2019-03-01 01:11:19', 1, '2019-03-01 02:35:34', NULL, 'All Items Received (RCV00000044)', NULL, NULL),
(42, 'PO00000015', 'LOGGED', 'SAMPLE REFERENCE NUMBER', 6, 'P.O. Box 1201, Manila Central Post Office', 'Malate', 'Manila', 'NCR', '1050', 'Philippines', 'dfsd', 'fsdfsdfsd', 'WAREHOUSE', 1, NULL, 'street', 'district', 'city', 'region', 'zip', 'philippines', NULL, NULL, NULL, NULL, '2019-03-01', NULL, '2019-03-01 02:55:24', 1, '2019-03-01 02:56:40', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'PO00000016', 'POSTED', 'SADADAS', 6, 'P.O. Box 1201, Manila Central Post Office', 'Malate', 'Manila', 'NCR', '1050', 'Philippines', NULL, NULL, 'WAREHOUSE', 1, NULL, 'street', 'district', 'city', 'region', 'zip', 'philippines', NULL, NULL, NULL, NULL, '2019-04-08', NULL, '2019-04-08 03:00:59', 1, NULL, NULL, '2019-04-08 03:01:48', 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `putaway_details`
--

CREATE TABLE `putaway_details` (
  `id` int(11) NOT NULL,
  `stock_receipt_header_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(200) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `pdt_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `putaway_details`
--

INSERT INTO `putaway_details` (`id`, `stock_receipt_header_id`, `location_id`, `item_id`, `lot_number`, `expiry_date`, `uom_id`, `quantity`, `base_quantity`, `created_date`, `created_by`, `remarks`, `pdt_flag`) VALUES
(101, 36, 16, 29, '20190215', '2019-02-28', 1, 1000, 1000, '2019-02-19 12:54:31', 1, 'AUTO-GENERATED PUTAWAY (RCV00000034)', 0),
(102, 31, 14, 32, '20190213', NULL, 1, 120, 120, '2019-02-19 13:01:40', 1, 'AUTO-GENERATED PUTAWAY (RCV00000029)', 0),
(106, 31, 14, 32, '20190214', NULL, 1, 80, 80, '2019-02-19 13:06:47', 1, 'AUTO-GENERATED PUTAWAY (RCV00000029)', 0),
(107, 31, 14, 29, '20190214', '2019-02-28', 1, 1007, 1007, '2019-02-19 13:06:47', 1, 'AUTO-GENERATED PUTAWAY (RCV00000029)', 0),
(108, 31, 14, 29, '20190214', '2019-03-31', 1, 3, 3, '2019-02-19 13:06:47', 1, 'AUTO-GENERATED PUTAWAY (RCV00000029)', 0),
(109, 28, 14, 32, '12345', NULL, 1, 90, 90, '2019-02-19 13:08:36', 1, 'AUTO-GENERATED PUTAWAY (RCV00000026)', 0),
(110, 35, 14, 29, '20190215', '2019-02-28', 1, 1000, 1000, '2019-02-21 13:56:32', 1, 'AUTO-GENERATED PUTAWAY (RCV00000033)', 0),
(111, 38, 16, 32, '20190222', NULL, 1, 100, 100, '2019-02-22 17:57:13', 1, 'AUTO-GENERATED PUTAWAY (RCV00000036)', 0),
(112, 40, 17, 32, '20190222', NULL, 1, 35000, 35000, '2019-02-28 22:41:11', 1, 'AUTO-GENERATED PUTAWAY (RCV00000038)', 0),
(113, 32, 14, 32, '432423', NULL, 1, 150, 150, '2019-03-01 00:52:32', 1, 'AUTO-GENERATED PUTAWAY (RCV00000030)', 0),
(114, 46, 14, 29, 'ERWER', '2019-03-31', 1, 1500, 1500, '2019-03-01 02:32:14', 1, 'AUTO-GENERATED PUTAWAY (RCV00000044)', 0),
(115, 40, 17, 30, '20190301', '2020-03-01', 1, 250, 250, '2019-03-01 02:36:22', 1, 'AUTO-GENERATED PUTAWAY (RCV00000038)', 0),
(116, 40, 17, 30, '20190302', '2020-03-02', 1, 200, 200, '2019-03-01 02:36:22', 1, 'AUTO-GENERATED PUTAWAY (RCV00000038)', 0),
(127, 37, 16, 29, '20190221', '2020-02-21', 1, 12500, 12500, '2019-03-05 10:35:57', 1, 'AUTO PWY (RCV00000035)', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock_card`
--

CREATE TABLE `stock_card` (
  `id` int(11) NOT NULL,
  `inventory_movement` varchar(80) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `lot_number` varchar(80) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `uom_id` int(11) DEFAULT NULL,
  `base_quantity` double DEFAULT NULL,
  `warehouse_batch` double DEFAULT '0',
  `warehouse_balance` double DEFAULT '0',
  `batch_balance` double DEFAULT '0',
  `total_balance` double DEFAULT '0',
  `inventory_flag` tinyint(1) DEFAULT '0',
  `module` varchar(80) DEFAULT NULL,
  `transaction_number` varchar(80) DEFAULT NULL,
  `remarks` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `pdt_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_card`
--

INSERT INTO `stock_card` (`id`, `inventory_movement`, `item_id`, `location_id`, `lot_number`, `expiry_date`, `quantity`, `uom_id`, `base_quantity`, `warehouse_batch`, `warehouse_balance`, `batch_balance`, `total_balance`, `inventory_flag`, `module`, `transaction_number`, `remarks`, `created_date`, `created_by`, `pdt_flag`) VALUES
(28, 'INCREASE', 29, 16, '20190215', '2019-02-28', 1000, 1, 1000, 1000, 1000, 1000, 1000, 1, 'STOCK RECEIPT', 'RCV00000034', 'AUTO GENERATED PUTAWAY', '2019-02-19 12:24:56', 1, 0),
(29, 'INCREASE', 29, 14, '20190215', '2019-02-28', 1000, 1, 1000, 1000, 1000, 2000, 2000, 1, 'STOCK RECEIPT', 'RCV00000033', 'AUTO GENERATED PUTAWAY', '2019-02-19 12:25:29', 1, 0),
(30, 'DECREASE', 29, 14, '20190215', '2019-02-28', 1000, 1, 1000, 0, 0, 1000, 1000, 1, 'PUTAWAY', 'RCV00000033', 'PUTAWAY REVERSAL', '2019-02-19 12:38:10', 1, 0),
(31, 'INCREASE', 29, 14, '20190215', '2019-02-28', 1000, 1, 1000, 1000, 1000, 2000, 2000, 1, 'STOCK RECEIPT', 'RCV00000033', 'AUTO GENERATED PUTAWAY', '2019-02-19 12:38:32', 1, 0),
(32, 'DECREASE', 29, 14, '20190215', '2019-02-28', 1000, 1, 1000, 0, 0, 1000, 1000, 1, 'PUTAWAY', 'RCV00000033', 'PUTAWAY REVERSAL', '2019-02-19 12:44:21', 1, 0),
(33, 'DECREASE', 29, 16, '20190215', '2019-02-28', 1000, 1, 1000, 0, 0, 0, 0, 1, 'PUTAWAY', 'RCV00000034', 'PUTAWAY REVERSAL', '2019-02-19 12:44:52', 1, 0),
(34, 'INCREASE', 29, 16, '20190215', '2019-02-28', 1000, 1, 1000, 1000, 1000, 1000, 1000, 1, 'STOCK RECEIPT', 'RCV00000034', 'AUTO GENERATED PUTAWAY', '2019-02-19 12:46:24', 1, 0),
(35, 'DECREASE', 29, 16, '20190215', '2019-02-28', 1000, 1, 1000, 0, 0, 0, 0, 1, 'PUTAWAY', 'RCV00000034', 'PUTAWAY REVERSAL', '2019-02-19 12:46:36', 1, 0),
(36, 'INCREASE', 29, 14, '20190215', '2019-02-28', 1000, 1, 1000, 1000, 1000, 1000, 1000, 1, 'STOCK RECEIPT', 'RCV00000033', 'AUTO GENERATED PUTAWAY', '2019-02-19 12:48:52', 1, 0),
(37, 'DECREASE', 29, 14, '20190215', '2019-02-28', 1000, 1, 1000, 0, 0, 0, 0, 1, 'PUTAWAY', 'RCV00000033', 'PUTAWAY REVERSAL: Reason->Sample reason for putaway deletion', '2019-02-19 12:49:20', 1, 0),
(38, 'INCREASE', 29, 16, '20190215', '2019-02-28', 1000, 1, 1000, 1000, 1000, 1000, 1000, 1, 'STOCK RECEIPT', 'RCV00000034', 'AUTO GENERATED PUTAWAY', '2019-02-19 12:54:31', 1, 0),
(39, 'INCREASE', 32, 14, '20190213', NULL, 120, 1, 120, 120, 120, 120, 120, 1, 'STOCK RECEIPT', 'RCV00000029', 'AUTO GENERATED PUTAWAY', '2019-02-19 13:01:40', 1, 0),
(40, 'INCREASE', 32, 14, '20190214', NULL, 80, 1, 80, 80, 200, 80, 200, 1, 'STOCK RECEIPT', 'RCV00000029', 'AUTO GENERATED PUTAWAY', '2019-02-19 13:01:40', 1, 0),
(41, 'INCREASE', 29, 14, '20190214', '2019-02-28', 1007, 1, 1007, 1007, 1007, 1007, 2007, 1, 'STOCK RECEIPT', 'RCV00000029', 'AUTO GENERATED PUTAWAY', '2019-02-19 13:01:40', 1, 0),
(42, 'INCREASE', 29, 14, '20190214', '2019-03-31', 3, 1, 3, 1010, 1010, 1010, 2010, 1, 'STOCK RECEIPT', 'RCV00000029', 'AUTO GENERATED PUTAWAY', '2019-02-19 13:01:40', 1, 0),
(43, 'DECREASE', 29, 14, '20190214', '2019-03-31', 3, 1, 3, 1007, 1007, 1007, 2007, 1, 'PUTAWAY', 'RCV00000029', 'PUTAWAY REVERSAL: Reason->reaosn 1', '2019-02-19 13:01:52', 1, 0),
(44, 'DECREASE', 29, 14, '20190214', '2019-02-28', 1007, 1, 1007, 0, 0, 0, 1000, 1, 'PUTAWAY', 'RCV00000029', 'PUTAWAY REVERSAL: Reason->reaosn 2', '2019-02-19 13:02:24', 1, 0),
(45, 'DECREASE', 32, 14, '20190214', NULL, 80, 1, 80, 0, 120, 0, 120, 1, 'PUTAWAY', 'RCV00000029', 'PUTAWAY REVERSAL: Reason->asdasdas', '2019-02-19 13:05:52', 1, 0),
(46, 'INCREASE', 32, 14, '20190214', NULL, 80, 1, 80, 80, 200, 80, 200, 1, 'STOCK RECEIPT', 'RCV00000029', 'AUTO GENERATED PUTAWAY', '2019-02-19 13:06:47', 1, 0),
(47, 'INCREASE', 29, 14, '20190214', '2019-02-28', 1007, 1, 1007, 1007, 1007, 1007, 2007, 1, 'STOCK RECEIPT', 'RCV00000029', 'AUTO GENERATED PUTAWAY', '2019-02-19 13:06:47', 1, 0),
(48, 'INCREASE', 29, 14, '20190214', '2019-03-31', 3, 1, 3, 1010, 1010, 1010, 2010, 1, 'STOCK RECEIPT', 'RCV00000029', 'AUTO GENERATED PUTAWAY', '2019-02-19 13:06:47', 1, 0),
(49, 'INCREASE', 32, 14, '12345', NULL, 90, 1, 90, 90, 290, 90, 290, 1, 'STOCK RECEIPT', 'RCV00000026', 'AUTO GENERATED PUTAWAY', '2019-02-19 13:08:36', 1, 0),
(50, 'INCREASE', 29, 14, '12345', '2019-02-28', 3500, 1, 3500, 3500, 4510, 3500, 5510, 1, 'STOCK RECEIPT', 'RCV00000026', 'AUTO GENERATED PUTAWAY', '2019-02-19 13:08:36', 1, 0),
(51, 'DECREASE', 29, 14, '12345', '2019-02-28', 3500, 1, 3500, 0, 1010, 0, 2010, 1, 'PUTAWAY', 'RCV00000026', 'PUTAWAY REVERSAL: Reason->gfd', '2019-02-19 13:11:43', 1, 0),
(52, 'INCREASE', 29, 14, '20190215', '2019-02-28', 1000, 1, 1000, 1000, 2010, 2000, 3010, 1, 'STOCK RECEIPT', 'RCV00000033', 'AUTO GENERATED PUTAWAY', '2019-02-21 13:56:32', 1, 0),
(53, 'INCREASE', 32, 16, '20190222', NULL, 100, 1, 100, 100, 100, 100, 305, 1, 'STOCK RECEIPT', 'RCV00000036', 'AUTO GENERATED PUTAWAY', '2019-02-22 17:57:13', 1, 0),
(54, 'INCREASE', 32, 17, '20190222', NULL, 35000, 1, 35000, 35000, 35000, 35100, 35305, 1, 'STOCK RECEIPT', 'RCV00000038', 'AUTO GENERATED PUTAWAY', '2019-02-22 19:15:35', 1, 0),
(55, 'INCREASE', 29, 17, '20190222', '2020-02-22', 210000, 1, 210000, 210000, 210000, 210000, 213010, 1, 'STOCK RECEIPT', 'RCV00000038', 'AUTO GENERATED PUTAWAY', '2019-02-22 19:15:35', 1, 0),
(56, 'DECREASE', 29, 17, '20190222', '2020-02-22', 210000, 1, 210000, 0, 0, 0, 3010, 1, 'PUTAWAY', 'RCV00000038', 'PUTAWAY REVERSAL: Reason->jhgh', '2019-02-22 19:16:22', 1, 0),
(57, 'INCREASE', 29, 17, '20190222', '2020-02-22', 210005, 1, 210005, 210005, 210005, 210005, 213015, 1, 'STOCK RECEIPT', 'RCV00000038', 'AUTO GENERATED PUTAWAY', '2019-02-22 19:18:01', 1, 0),
(58, 'DECREASE', 29, 17, '20190222', '2020-02-22', 210005, 1, 210005, 0, 0, 0, 3010, 1, 'PUTAWAY', 'RCV00000038', 'PUTAWAY REVERSAL: Reason->kwjehfkjs', '2019-02-22 19:18:21', 1, 0),
(59, 'DECREASE', 32, 17, '20190222', NULL, 35000, 1, 35000, 0, 0, 100, 305, 1, 'PUTAWAY', 'RCV00000038', 'PUTAWAY REVERSAL: Reason->dsfsdf', '2019-02-23 00:12:59', 1, 0),
(60, 'INCREASE', 32, 17, '20190222', NULL, 35000, 1, 35000, 35000, 35000, 35100, 35305, 1, 'STOCK RECEIPT', 'RCV00000038', 'AUTO GENERATED PUTAWAY', '2019-02-28 22:41:11', 1, 0),
(61, 'INCREASE', 32, 14, '432423', NULL, 150, 1, 150, 150, 355, 150, 35455, 1, 'STOCK RECEIPT', 'RCV00000030', 'AUTO GENERATED PUTAWAY', '2019-03-01 00:52:32', 1, 0),
(62, 'INCREASE', 29, 14, 'ERWER', '2019-03-31', 1500, 1, 1500, 1500, 3510, 1500, 4510, 1, 'STOCK RECEIPT', 'RCV00000044', 'AUTO GENERATED PUTAWAY', '2019-03-01 02:32:14', 1, 0),
(63, 'INCREASE', 30, 17, '20190301', '2020-03-01', 250, 1, 250, 250, 250, 250, 250, 1, 'STOCK RECEIPT', 'RCV00000038', 'AUTO GENERATED PUTAWAY', '2019-03-01 02:36:22', 1, 0),
(64, 'INCREASE', 30, 17, '20190302', '2020-03-02', 200, 1, 200, 200, 450, 200, 450, 1, 'STOCK RECEIPT', 'RCV00000038', 'AUTO GENERATED PUTAWAY', '2019-03-01 02:36:22', 1, 0),
(65, 'INCREASE', 29, 17, '20190228', '2020-02-28', 503, 1, 503, 503, 503, 503, 5013, 1, 'STOCK RECEIPT', 'RCV00000038', 'AUTO GENERATED PUTAWAY', '2019-03-01 02:36:22', 1, 0),
(66, 'INCREASE', 32, 16, '20190222', NULL, 153, 1, 153, 253, 253, 35253, 35608, 1, 'STOCK RECEIPT', 'RCV00000037', 'AUTO GENERATED PUTAWAY', '2019-03-01 02:38:18', 1, 0),
(67, 'INCREASE', 29, 16, '20190222', '2020-02-22', 1200, 1, 1200, 1200, 2200, 1200, 6213, 1, 'STOCK RECEIPT', 'RCV00000037', 'AUTO GENERATED PUTAWAY', '2019-03-01 02:38:18', 1, 0),
(68, 'DECREASE', 29, 16, '20190222', '2020-02-22', 1200, 1, 1200, 0, 1000, 0, 5013, 1, 'PUTAWAY', 'RCV00000037', 'PUTAWAY REVERSAL: Reason->uytuytuy', '2019-03-01 03:05:11', 1, 0),
(69, 'DECREASE', 32, 16, '20190222', NULL, 153, 1, 153, 100, 100, 35100, 35455, 1, 'PUTAWAY', 'RCV00000037', 'PUTAWAY REVERSAL: Reason->gfrghfh', '2019-03-01 03:05:18', 1, 0),
(70, 'DECREASE', 29, 17, '20190228', '2020-02-28', 503, 1, 503, 0, 0, 0, 4510, 1, 'PUTAWAY', 'RCV00000038', 'PUTAWAY REVERSAL: Reason->jhjfhfghfjh', '2019-03-01 03:05:29', 1, 0),
(71, 'INCREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 12500, 13500, 12500, 17010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-04 17:32:01', 1, 0),
(72, 'INCREASE', 29, 16, 'SDFDS', '2019-03-05', 5000, 1, 5000, 5000, 18500, 5000, 22010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-04 17:32:01', 1, 0),
(73, 'DECREASE', 29, 16, 'SDFDS', '2019-03-05', 5000, 1, 5000, 0, 13500, 0, 17010, 1, 'PUTAWAY', 'RCV00000035', 'PUTAWAY REVERSAL: Reason->dsfsd', '2019-03-04 17:33:45', 1, 0),
(74, 'DECREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 0, 1000, 0, 4510, 1, 'PUTAWAY', 'RCV00000035', 'PUTAWAY REVERSAL: Reason->sdfsd', '2019-03-04 17:33:50', 1, 0),
(75, 'INCREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 12500, 13500, 12500, 17010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-04 17:34:32', 1, 0),
(76, 'INCREASE', 29, 16, 'SDFDS', '2019-03-05', 5000, 1, 5000, 5000, 18500, 5000, 22010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-04 17:34:32', 1, 0),
(77, 'DECREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 0, 6000, 0, 9510, 1, 'PUTAWAY', 'RCV00000035', 'PUTAWAY REVERSAL: Reason->werewr', '2019-03-04 17:37:20', 1, 0),
(78, 'DECREASE', 29, 16, 'SDFDS', '2019-03-05', 5000, 1, 5000, 0, 1000, 0, 4510, 1, 'PUTAWAY', 'RCV00000035', 'PUTAWAY REVERSAL: Reason->sdfsd', '2019-03-04 17:45:27', 1, 0),
(79, 'INCREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 12500, 13500, 12500, 17010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-04 17:45:59', 1, 0),
(80, 'INCREASE', 29, 16, 'SDFDS', '2019-03-05', 5000, 1, 5000, 5000, 18500, 5000, 22010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-04 17:45:59', 1, 0),
(81, 'DECREASE', 29, 16, 'SDFDS', '2019-03-05', 5000, 1, 5000, 0, 13500, 0, 17010, 1, 'PUTAWAY', 'RCV00000035', 'PUTAWAY REVERSAL: Reason->sdfsdf', '2019-03-04 17:46:54', 1, 0),
(82, 'DECREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 0, 1000, 0, 4510, 1, 'PUTAWAY', 'RCV00000035', 'PUTAWAY REVERSAL: Reason->sdfsd', '2019-03-04 17:47:13', 1, 0),
(83, 'INCREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 12500, 13500, 12500, 17010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-04 17:51:20', 1, 0),
(84, 'INCREASE', 29, 16, 'SDFDS', '2019-03-05', 5000, 1, 5000, 5000, 18500, 5000, 22010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-04 17:51:20', 1, 0),
(85, 'DECREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 0, 6000, 0, 9510, 1, 'PUTAWAY', 'RCV00000035', 'PUTAWAY REVERSAL: Reason->dsf', '2019-03-04 17:53:22', 1, 0),
(86, 'DECREASE', 29, 16, 'SDFDS', '2019-03-05', 5000, 1, 5000, 0, 1000, 0, 4510, 1, 'PUTAWAY', 'RCV00000035', 'PUTAWAY REVERSAL: Reason->asdas', '2019-03-04 17:55:34', 1, 0),
(87, 'INCREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 12500, 13500, 12500, 17010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-04 17:55:54', 1, 0),
(88, 'DECREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 0, 1000, 0, 4510, 1, 'PUTAWAY', 'RCV00000035', 'PUTAWAY REVERSAL: Reason->sdfsdf', '2019-03-05 10:33:01', 1, 0),
(89, 'INCREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 12500, 13500, 12500, 17010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-05 10:33:24', 1, 0),
(90, 'DECREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 0, 1000, 0, 4510, 1, 'PUTAWAY', 'RCV00000035', 'PUTAWAY REVERSAL: Reason->frsdfsd', '2019-03-05 10:33:51', 1, 0),
(91, 'INCREASE', 29, 16, '20190221', '2020-02-21', 12500, 1, 12500, 12500, 13500, 12500, 17010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-05 10:35:57', 1, 0),
(92, 'INCREASE', 29, 16, 'SDFDS', '2019-03-05', 5000, 1, 5000, 5000, 18500, 5000, 22010, 1, 'STOCK RECEIPT', 'RCV00000035', 'AUTO GENERATED PUTAWAY', '2019-03-05 10:35:57', 1, 0),
(93, 'DECREASE', 29, 16, 'SDFDS', '2019-03-05', 5000, 1, 5000, 0, 13500, 0, 17010, 1, 'PUTAWAY', 'RCV00000035', 'PUTAWAY REVERSAL: Reason->hgjhgh', '2019-03-26 11:57:21', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock_receipt_details`
--

CREATE TABLE `stock_receipt_details` (
  `id` int(11) NOT NULL,
  `stock_receipt_header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lot_number` varchar(200) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `uom_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `base_quantity` double NOT NULL,
  `remarks` text,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `pdt_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_receipt_details`
--

INSERT INTO `stock_receipt_details` (`id`, `stock_receipt_header_id`, `item_id`, `lot_number`, `expiry_date`, `uom_id`, `quantity`, `base_quantity`, `remarks`, `created_date`, `created_by`, `updated_date`, `updated_by`, `pdt_flag`) VALUES
(52, 25, 32, 'EWRWR', NULL, 3, 9, 90, NULL, '2019-02-13 11:11:22', 1, '2019-02-13 11:11:22', 1, 0),
(53, 26, 29, 'EWRWR', '2019-02-13', 2, 35, 3500, NULL, '2019-02-13 11:12:56', 1, '2019-02-13 11:12:56', 1, 0),
(54, 28, 32, '12345', NULL, 3, 9, 90, NULL, '2019-02-13 21:14:36', 1, '2019-02-14 13:56:38', 1, 0),
(55, 28, 29, '12345', '2019-02-28', 2, 35, 3500, NULL, '2019-02-13 21:15:05', 1, '2019-02-13 21:15:05', 1, 0),
(56, 30, 32, '20190214', NULL, 3, 5, 50, NULL, '2019-02-14 16:07:21', 1, '2019-02-14 16:07:21', 1, 0),
(57, 31, 32, '20190214', NULL, 3, 5, 50, NULL, '2019-02-14 16:32:36', 1, '2019-02-14 16:32:36', 1, 0),
(58, 31, 32, '20190214', NULL, 3, 3, 30, NULL, '2019-02-14 16:32:42', 1, '2019-02-14 16:32:42', 1, 0),
(59, 31, 32, '20190213', NULL, 3, 12, 120, NULL, '2019-02-14 16:32:50', 1, '2019-02-14 16:32:50', 1, 0),
(60, 31, 29, '20190214', '2019-02-28', 2, 10, 1000, NULL, '2019-02-14 16:33:03', 1, '2019-02-14 16:33:03', 1, 0),
(61, 31, 29, '20190214', '2019-02-28', 1, 5, 5, NULL, '2019-02-14 16:33:17', 1, '2019-02-14 16:33:17', 1, 0),
(62, 31, 29, '20190214', '2019-03-31', 1, 3, 3, NULL, '2019-02-14 16:36:38', 1, '2019-02-14 16:36:38', 1, 0),
(63, 31, 29, '20190214', '2019-02-28', 1, 2, 2, NULL, '2019-02-14 16:37:09', 1, '2019-02-14 16:37:09', 1, 0),
(64, 33, 29, '20190414', '2020-02-14', 2, 25, 2500, NULL, '2019-02-14 16:51:46', 1, '2019-02-14 16:51:46', 1, 0),
(65, 34, 29, '20190215', '2019-02-28', 1, 5, 5, NULL, '2019-02-14 18:05:49', 1, '2019-02-14 18:05:49', 1, 0),
(66, 35, 29, '20190215', '2019-02-28', 2, 10, 1000, NULL, '2019-02-14 18:21:45', 1, '2019-02-14 18:21:45', 1, 0),
(67, 36, 29, '20190215', '2019-02-28', 2, 10, 1000, NULL, '2019-02-14 18:23:56', 1, '2019-02-14 18:23:56', 1, 0),
(68, 37, 29, '20190221', '2020-02-21', 2, 125, 12500, NULL, '2019-02-21 14:00:18', 1, '2019-02-21 14:00:18', 1, 0),
(69, 38, 32, '20190222', NULL, 3, 10, 100, NULL, '2019-02-22 17:56:58', 1, '2019-02-22 17:56:58', 1, 0),
(70, 39, 32, '20190222', NULL, 3, 15, 150, NULL, '2019-02-22 17:58:23', 1, '2019-02-22 17:58:23', 1, 0),
(71, 39, 29, '20190222', '2020-02-22', 2, 12, 1200, NULL, '2019-02-22 17:58:35', 1, '2019-02-22 17:58:35', 1, 0),
(72, 39, 32, '20190222', NULL, 1, 3, 3, NULL, '2019-02-22 18:16:24', 1, '2019-02-22 18:16:24', 1, 0),
(73, 40, 32, '20190222', NULL, 3, 3500, 35000, NULL, '2019-02-22 19:15:16', 1, '2019-02-22 19:15:16', 1, 0),
(77, 40, 29, '20190228', '2020-02-28', 2, 5, 500, NULL, '2019-02-28 22:41:52', 1, '2019-02-28 22:41:52', 1, 0),
(78, 40, 29, '20190228', '2020-02-28', 1, 3, 3, NULL, '2019-02-28 22:42:14', 1, '2019-02-28 22:42:14', 1, 0),
(79, 40, 30, '20190301', '2020-03-01', 1, 250, 250, NULL, '2019-02-28 22:42:42', 1, '2019-02-28 22:42:42', 1, 0),
(80, 40, 30, '20190302', '2020-03-02', 1, 200, 200, NULL, '2019-02-28 22:43:15', 1, '2019-02-28 22:43:15', 1, 0),
(83, 32, 32, '432423', NULL, 3, 20, 200, NULL, '2019-03-01 00:52:08', 1, '2019-03-01 00:54:00', 1, 0),
(84, 32, 29, 'SDFSDFSD', '2019-03-31', 2, 15, 1500, NULL, '2019-03-01 00:53:15', 1, '2019-03-01 00:53:15', 1, 0),
(87, 42, 29, 'FGFWERW', '2019-03-31', 2, 10, 1000, NULL, '2019-03-01 01:12:36', 1, '2019-03-01 01:12:36', 1, 0),
(88, 43, 29, 'FGFWERW', '2019-03-31', 2, 5, 500, NULL, '2019-03-01 01:15:25', 1, '2019-03-01 01:15:25', 1, 0),
(89, 44, 29, 'FGFWERW', '2019-03-31', 2, 10, 1000, NULL, '2019-03-01 01:24:14', 1, '2019-03-01 01:24:14', 1, 0),
(90, 45, 29, 'FGFWERW', '2019-03-31', 2, 15, 1500, NULL, '2019-03-01 01:26:09', 1, '2019-03-01 01:26:09', 1, 0),
(91, 46, 29, 'ERWER', '2019-03-31', 2, 15, 1500, NULL, '2019-03-01 01:39:13', 1, '2019-03-01 01:39:13', 1, 0),
(92, 47, 32, '20190304', NULL, 3, 5, 50, NULL, '2019-03-04 11:27:26', 1, '2019-03-04 11:27:26', 1, 0),
(93, 47, 30, '20190304', '2020-03-04', 1, 100, 100, NULL, '2019-03-04 11:27:42', 1, '2019-03-04 11:27:42', 1, 0),
(94, 47, 30, '20190304', '2020-03-05', 1, 100, 100, NULL, '2019-03-04 11:28:10', 1, '2019-03-04 11:28:10', 1, 0),
(95, 47, 30, '20190305', '2020-03-05', 1, 50, 50, NULL, '2019-03-04 11:28:30', 1, '2019-03-04 11:28:30', 1, 0),
(96, 47, 29, '20190304', '2020-03-04', 2, 25, 2500, NULL, '2019-03-04 11:28:48', 1, '2019-03-04 11:28:48', 1, 0),
(97, 37, 29, 'SDFDS', '2019-03-05', 2, 25, 2500, NULL, '2019-03-04 17:28:14', 1, '2019-03-04 17:28:14', 1, 0),
(98, 37, 29, 'SDFDS', '2019-03-05', 2, 25, 2500, NULL, '2019-03-04 17:31:40', 1, '2019-03-04 17:31:40', 1, 0),
(99, 49, 30, '12', '2019-04-08', 1, 32, 32, NULL, '2019-04-08 03:03:01', 1, '2019-04-08 03:03:01', 1, 0),
(100, 49, 30, '12', '2019-04-16', 1, 23, 23, NULL, '2019-04-08 03:03:30', 1, '2019-04-08 03:03:30', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock_receipt_header`
--

CREATE TABLE `stock_receipt_header` (
  `id` int(11) NOT NULL,
  `transaction_number` varchar(80) NOT NULL,
  `status` varchar(80) NOT NULL,
  `document_date` date NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `source_type` varchar(30) NOT NULL,
  `purchase_order_header_id` int(11) DEFAULT NULL,
  `stock_issuance_header_id` int(11) DEFAULT NULL,
  `source_rt_type` varchar(30) DEFAULT NULL,
  `source_ud_type` varchar(30) DEFAULT NULL,
  `source_client_id` int(11) DEFAULT NULL,
  `source_supplier_id` int(11) DEFAULT NULL,
  `source_warehouse_id` int(11) DEFAULT NULL,
  `reference_1` varchar(80) DEFAULT NULL,
  `reference_2` varchar(80) DEFAULT NULL,
  `reference_3` varchar(80) DEFAULT NULL,
  `remarks` text,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `cancelled_by` int(11) DEFAULT NULL,
  `last_status_update_remarks` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_receipt_header`
--

INSERT INTO `stock_receipt_header` (`id`, `transaction_number`, `status`, `document_date`, `warehouse_id`, `source_type`, `purchase_order_header_id`, `stock_issuance_header_id`, `source_rt_type`, `source_ud_type`, `source_client_id`, `source_supplier_id`, `source_warehouse_id`, `reference_1`, `reference_2`, `reference_3`, `remarks`, `created_date`, `created_by`, `updated_date`, `updated_by`, `posted_date`, `posted_by`, `closed_date`, `closed_by`, `cancelled_date`, `cancelled_by`, `last_status_update_remarks`) VALUES
(25, 'RCV00000023', 'VOID', '2019-02-13', 1, 'PO', 34, NULL, NULL, NULL, NULL, NULL, NULL, 'TEST01', NULL, NULL, NULL, '2019-02-13 11:10:45', 1, NULL, NULL, '2019-02-13 11:14:14', 1, NULL, NULL, '2019-02-13 21:13:41', 1, 'POSTED=>VOID \nRemarks: sdfsdf'),
(26, 'RCV00000024', 'VOID', '2019-02-13', 1, 'PO', 34, NULL, NULL, NULL, NULL, NULL, NULL, 'TEST02', NULL, NULL, NULL, '2019-02-13 11:11:36', 1, NULL, NULL, '2019-02-13 11:13:10', 1, NULL, NULL, '2019-02-13 21:11:09', 1, 'POSTED=>VOID \nRemarks: sample cancellation remarks'),
(27, 'RCV00000025', 'VOID', '2019-02-13', 1, 'PO', 34, NULL, NULL, NULL, NULL, NULL, NULL, 'TEST03', NULL, NULL, NULL, '2019-02-13 11:12:43', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-13 11:13:10', NULL, 'Unused Transaction (Triggered by: RCV00000024)'),
(28, 'RCV00000026', 'POSTED', '2019-02-13', 1, 'PO', 34, NULL, NULL, NULL, NULL, NULL, NULL, 'SDFSD', NULL, NULL, NULL, '2019-02-13 21:14:14', 1, NULL, NULL, '2019-02-28 22:38:47', 1, NULL, NULL, NULL, NULL, NULL),
(29, 'RCV00000027', 'VOID', '2019-02-13', 1, 'PO', 34, NULL, NULL, NULL, NULL, NULL, NULL, 'SFS', NULL, NULL, NULL, '2019-02-13 21:14:21', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-13 21:15:18', NULL, 'Unused Transaction (Triggered by: RCV00000026)'),
(30, 'RCV00000028', 'POSTED', '2019-02-14', 1, 'PO', 31, NULL, NULL, NULL, NULL, NULL, NULL, 'SDFSDF', NULL, NULL, NULL, '2019-02-14 16:03:12', 1, NULL, NULL, '2019-02-14 16:31:17', 1, NULL, NULL, NULL, NULL, NULL),
(31, 'RCV00000029', 'CLOSED', '2019-02-14', 1, 'UD', NULL, NULL, NULL, 'SUPPLIER', NULL, 6, NULL, 'TEST', NULL, NULL, NULL, '2019-02-14 16:31:53', 1, NULL, NULL, '2019-02-19 13:06:47', 1, '2019-03-06 12:00:56', 1, NULL, NULL, 'POSTED=>CLOSED \nRemarks: '),
(32, 'RCV00000030', 'POSTED', '2019-02-14', 1, 'UD', NULL, NULL, NULL, 'SUPPLIER', NULL, 3, NULL, 'SDFDS', NULL, NULL, NULL, '2019-02-14 16:49:24', 1, NULL, NULL, '2019-03-01 00:55:17', 1, NULL, NULL, NULL, NULL, 'CLOSED=>POSTED \nRemarks: sdf'),
(33, 'RCV00000031', 'CLOSED', '2019-02-14', 2, 'PO', 38, NULL, NULL, NULL, NULL, NULL, NULL, 'SDFSDF', NULL, NULL, NULL, '2019-02-14 16:50:46', 1, NULL, NULL, '2019-02-14 18:36:55', 1, '2019-02-14 18:36:55', 1, NULL, NULL, 'Closed automatically upon posting. Generated putaway for all remaining items received [RCV00000031].'),
(34, 'RCV00000032', 'CLOSED', '2019-02-14', 1, 'UD', NULL, NULL, NULL, 'SUPPLIER', NULL, 6, NULL, 'ERFES', NULL, NULL, NULL, '2019-02-14 18:05:36', 1, NULL, NULL, '2019-02-14 18:36:08', 1, '2019-02-14 18:36:08', 1, NULL, NULL, 'Closed automatically upon posting. Generated putaway for all remaining items received [RCV00000032].'),
(35, 'RCV00000033', 'CLOSED', '2019-02-14', 1, 'UD', NULL, NULL, NULL, 'SUPPLIER', NULL, 4, NULL, 'SDFSD', NULL, NULL, NULL, '2019-02-14 18:21:34', 1, NULL, NULL, '2019-02-21 13:56:32', 1, '2019-02-21 13:56:32', 1, NULL, NULL, 'Closed automatically upon posting. Generated putaway for all remaining items received [RCV00000033].'),
(36, 'RCV00000034', 'CLOSED', '2019-02-14', 2, 'UD', NULL, NULL, NULL, 'WAREHOUSE', NULL, NULL, 1, 'SDFSD', NULL, NULL, NULL, '2019-02-14 18:23:02', 1, NULL, NULL, '2019-02-22 15:33:36', 1, '2019-02-22 15:33:36', 1, NULL, NULL, 'Closed automatically upon posting. Generated putaway for all remaining items received [RCV00000034].'),
(37, 'RCV00000035', 'POSTED', '2019-02-21', 2, 'PO', 38, NULL, NULL, NULL, NULL, NULL, NULL, 'TEST', NULL, NULL, NULL, '2019-02-21 13:58:58', 1, NULL, NULL, '2019-03-05 10:35:57', 1, NULL, NULL, NULL, NULL, 'CLOSED=>POSTED \nRemarks: hjghjgjh'),
(38, 'RCV00000036', 'CLOSED', '2019-02-22', 2, 'UD', NULL, NULL, NULL, 'SUPPLIER', NULL, 6, NULL, 'TESTREFERENCE', NULL, NULL, NULL, '2019-02-22 17:56:46', 1, NULL, NULL, '2019-02-22 17:57:13', 1, '2019-02-22 17:57:13', 1, NULL, NULL, 'Closed automatically upon posting. Generated putaway for all remaining items received [RCV00000036].'),
(39, 'RCV00000037', 'POSTED', '2019-02-22', 2, 'UD', NULL, NULL, NULL, 'SUPPLIER', NULL, 5, NULL, 'TESTREFERENCE2', NULL, NULL, NULL, '2019-02-22 17:58:13', 1, NULL, NULL, '2019-03-01 02:38:18', 1, '2019-03-01 02:38:18', 1, NULL, NULL, 'Closed automatically upon posting. Generated putaway for all remaining items received [RCV00000037].'),
(40, 'RCV00000038', 'CLOSED', '2019-02-22', 3, 'UD', NULL, NULL, NULL, 'SUPPLIER', NULL, 4, NULL, 'SDFSDF', NULL, NULL, NULL, '2019-02-22 19:15:01', 1, NULL, NULL, '2019-03-01 02:36:22', 1, '2019-03-06 12:01:28', 1, NULL, NULL, 'POSTED=>CLOSED \nRemarks: '),
(41, 'RCV00000039', 'VOID', '2019-03-01', 1, 'PO', 40, NULL, NULL, NULL, NULL, NULL, NULL, 'SDF', NULL, NULL, NULL, '2019-03-01 00:38:44', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-01 00:41:38', 1, 'LOGGED=>VOID \nRemarks: sdfds'),
(42, 'RCV00000040', 'VOID', '2019-03-01', 1, 'PO', 41, NULL, NULL, NULL, NULL, NULL, NULL, 'REDFGDF', NULL, NULL, NULL, '2019-03-01 01:11:28', 1, NULL, NULL, '2019-03-01 01:15:52', 1, NULL, NULL, '2019-03-01 01:16:12', 1, 'POSTED=>VOID \nRemarks: gdfgdf'),
(43, 'RCV00000041', 'VOID', '2019-03-01', 1, 'PO', 41, NULL, NULL, NULL, NULL, NULL, NULL, 'FDGDF', NULL, NULL, NULL, '2019-03-01 01:15:18', 1, NULL, NULL, '2019-03-01 01:15:28', 1, NULL, NULL, '2019-03-01 01:25:36', 1, 'POSTED=>VOID \nRemarks: sdfsdf'),
(44, 'RCV00000042', 'VOID', '2019-03-01', 1, 'PO', 41, NULL, NULL, NULL, NULL, NULL, NULL, 'SDFSDF', NULL, NULL, NULL, '2019-03-01 01:24:03', 1, NULL, NULL, '2019-03-01 01:24:16', 1, NULL, NULL, '2019-03-01 01:24:46', 1, 'POSTED=>VOID \nRemarks: sdfsdfsd'),
(45, 'RCV00000043', 'VOID', '2019-03-01', 1, 'PO', 41, NULL, NULL, NULL, NULL, NULL, NULL, 'SDFS', NULL, NULL, NULL, '2019-03-01 01:26:01', 1, NULL, NULL, '2019-03-01 01:27:09', 1, NULL, NULL, '2019-03-01 01:28:02', 1, 'POSTED=>VOID \nRemarks: sdfs'),
(46, 'RCV00000044', 'CLOSED', '2019-03-01', 1, 'PO', 41, NULL, NULL, NULL, NULL, NULL, NULL, 'SDFSDF', NULL, NULL, NULL, '2019-03-01 01:38:51', 1, NULL, NULL, '2019-03-01 02:35:34', 1, '2019-03-01 02:35:34', 1, NULL, NULL, 'Closed automatically upon posting. Generated putaway for all remaining items received [RCV00000044].'),
(47, 'RCV00000045', 'POSTED', '2019-03-04', 1, 'UD', NULL, NULL, NULL, 'SUPPLIER', NULL, 6, NULL, 'SR01', NULL, NULL, NULL, '2019-03-04 11:23:21', 1, NULL, NULL, '2019-03-04 11:29:58', 1, NULL, NULL, NULL, NULL, 'CLOSED=>POSTED \nRemarks: asda'),
(48, 'RCV00000046', 'LOGGED', '2019-04-08', 1, 'RT', NULL, NULL, 'CLIENT', NULL, 3, NULL, NULL, '12312', NULL, NULL, NULL, '2019-04-08 03:00:15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'RCV00000047', 'POSTED', '2019-04-08', 1, 'PO', 43, NULL, NULL, NULL, NULL, NULL, NULL, '23423', NULL, NULL, NULL, '2019-04-08 03:01:59', 1, NULL, NULL, '2019-04-08 03:03:59', 1, NULL, NULL, NULL, NULL, NULL),
(50, 'RCV00000048', 'LOGGED', '2019-04-11', 1, 'PO', 43, NULL, NULL, NULL, NULL, NULL, NULL, 'DSFSDFDSF', NULL, NULL, NULL, '2019-04-11 02:11:17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `supplier_group_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `fax` varchar(80) DEFAULT NULL,
  `telephone` varchar(80) DEFAULT NULL,
  `mobile` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `code`, `description`, `supplier_group_id`, `term_id`, `fax`, `telephone`, `mobile`, `email`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(3, 'STLSRS', 'STEELSERIES', NULL, NULL, '', '', '', '', '2018-07-06 12:57:48', 1, NULL, NULL, 1),
(4, 'RZR', 'RAZER', NULL, NULL, '', '', '', '', '2018-07-06 12:58:20', 1, NULL, NULL, 1),
(5, 'LGT', 'LOGITECH', NULL, NULL, '', '', '', '', '2018-07-06 12:58:30', 1, NULL, NULL, 1),
(6, 'CRS', 'CORSAIR', 2, NULL, '', '', '', '', '2018-07-06 12:58:45', 1, '2019-01-07 20:18:36', 1, 1),
(7, 'SDFKJHJKH', 'FSKDJHFSDKJF', NULL, NULL, '', '', '', '', '2018-07-06 12:59:23', 1, '2018-08-30 14:42:07', 1, 0),
(8, 'HGFHGF', 'HGFHG', NULL, NULL, '', '', '', '', '2019-01-07 15:46:56', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_address`
--

CREATE TABLE `supplier_address` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `default_flag` tinyint(1) DEFAULT '1',
  `street` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `district` varchar(200) DEFAULT NULL,
  `region` varchar(200) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_address`
--

INSERT INTO `supplier_address` (`id`, `supplier_id`, `active_flag`, `default_flag`, `street`, `city`, `district`, `region`, `zip_code`, `country`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(15, 7, 1, 1, 'jhgjhghj', NULL, NULL, NULL, NULL, NULL, '2018-08-30 14:42:51', 1, '2018-08-30 14:43:16', 1),
(19, 6, 1, 1, 'P.O. Box 1201, Manila Central Post Office', 'Manila', 'Malate', 'NCR', '1050', 'Philippines', '2018-09-05 14:04:54', 1, '2018-12-01 22:35:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_contact`
--

CREATE TABLE `supplier_contact` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `active_flag` tinyint(1) DEFAULT '1',
  `default_flag` tinyint(1) DEFAULT '1',
  `name` varchar(80) DEFAULT NULL,
  `designation` varchar(80) DEFAULT NULL,
  `telephone` varchar(80) DEFAULT NULL,
  `mobile` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `street` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `district` varchar(200) DEFAULT NULL,
  `region` varchar(200) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_contact`
--

INSERT INTO `supplier_contact` (`id`, `supplier_id`, `active_flag`, `default_flag`, `name`, `designation`, `telephone`, `mobile`, `email`, `street`, `city`, `district`, `region`, `zip_code`, `country`, `created_date`, `created_by`, `updated_date`, `updated_by`) VALUES
(5, 6, 1, 1, 'Test', 'Manager', 'jhkjhkjh', 'erw324234', 'email', NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-07 12:59:55', 1, '2018-12-19 15:38:57', 1),
(6, 6, 1, 0, 'sdfsdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-25 00:30:53', 1, '2018-11-25 00:31:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_group`
--

CREATE TABLE `supplier_group` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_group`
--

INSERT INTO `supplier_group` (`id`, `code`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(2, 'SUPPGRP2', 'Supplier Group 2', '2018-06-22 03:45:30', 1, '2018-06-22 03:46:13', 1, 1),
(12, 'SUPPGRP 3', 'Supplier Group 3', '2019-02-20 11:10:35', 1, NULL, NULL, 1),
(13, 'SUPPGRP 4', 'Supplier Group 4', '2019-02-20 11:10:45', 1, NULL, NULL, 1),
(14, 'SUPPGRP 5', 'Supplier Group 5', '2019-02-20 11:10:55', 1, NULL, NULL, 1);

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
  `transaction_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_log`
--

INSERT INTO `system_log` (`id`, `module`, `description`, `query`, `user_source`, `date_source`, `transaction_id`) VALUES
(2589, 'PURCHASE ORDER', 'Added Row Detail: New Line', 'id=124 | purchase_order_header_id=40 | item_id=32 | uom_id=3 | quantity=12 | base_quantity=120 | unit_price=0 | amount=0 | remarks=NULL | created_date=2019-03-01 00:36:41 | created_by=1 | updated_date=2019-03-01 00:36:41 | updated_by=1 | active_flag=1', 1, '2019-03-01 00:36:41', '40'),
(2590, 'PURCHASE ORDER', 'Deleted Row Detail', 'id=124 | transaction_id=40 | transaction_number= PO00000013 | item_id=32 | item_name=hgfhgfhg jsdf kj sdfj sk sdkjfh l sjalksdj alskd asdlk aksdjalksd kasd jaklsdj | uom_id=3 | uom_description=BOX | quantity=12 | base_quantity=120 | unit_price=0 | amount=0 | remarks= | created_date=2019-03-01 00:36:41 | created_by=System Administrator | updated_date=2019-03-01 00:36:41 | updated_by=System Administrator', 1, '2019-03-01 00:36:53', '40'),
(2591, 'PURCHASE ORDER', 'Added Row Detail: New Line', 'id=125 | purchase_order_header_id=40 | item_id=32 | uom_id=3 | quantity=5 | base_quantity=50 | unit_price=0 | amount=0 | remarks=NULL | created_date=2019-03-01 00:38:17 | created_by=1 | updated_date=2019-03-01 00:38:17 | updated_by=1 | active_flag=1', 1, '2019-03-01 00:38:17', '40'),
(2592, 'PURCHASE ORDER', 'Added Row Detail: New Line', 'id=126 | purchase_order_header_id=40 | item_id=29 | uom_id=2 | quantity=35 | base_quantity=3500 | unit_price=0 | amount=0 | remarks=NULL | created_date=2019-03-01 00:38:24 | created_by=1 | updated_date=2019-03-01 00:38:24 | updated_by=1 | active_flag=1', 1, '2019-03-01 00:38:24', '40'),
(2593, 'PURCHASE ORDER', 'Posted Transaction', 'Transaction No.: PO00000013', 1, '2019-03-01 00:38:29', '40'),
(2594, 'STOCK RECEIPT', 'Created Stock Receipt Header', 'id=41 | transaction_number=RCV00000039 | status=LOGGED | document_date=2019-03-01 | warehouse_id=1 | source_type=PO | purchase_order_header_id=40 | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=SDF | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2019-03-01 00:38:44 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-03-01 00:38:44', '41'),
(2595, 'PURCHASE ORDER', 'Unposted Transaction', 'Transaction No.: PO00000013 | Remarks: sdfsdf', 1, '2019-03-01 00:39:15', '40'),
(2596, 'PURCHASE ORDER', 'Added Row Detail: New Line', 'id=127 | purchase_order_header_id=40 | item_id=29 | uom_id=1 | quantity=5 | base_quantity=5 | unit_price=0 | amount=0 | remarks=NULL | created_date=2019-03-01 00:39:31 | created_by=1 | updated_date=2019-03-01 00:39:31 | updated_by=1 | active_flag=1', 1, '2019-03-01 00:39:31', '40'),
(2597, 'PURCHASE ORDER', 'Deleted Row Detail', 'id=127 | purchase_order_header_id=40 | transaction_number= PO00000013 | item_id=29 | item_name=Item 1 | uom_id=1 | uom_description=PC | quantity=5 | base_quantity=5 | unit_price=0 | amount=0 | remarks= | created_date=2019-03-01 00:39:31 | created_by=System Administrator | updated_date=2019-03-01 00:39:31 | updated_by=System Administrator', 1, '2019-03-01 00:40:01', '40'),
(2598, 'PURCHASE ORDER', 'Posted Transaction', 'Transaction No.: PO00000013', 1, '2019-03-01 00:40:34', '40'),
(2599, 'PURCHASE ORDER', 'Closed Transaction', 'Transaction No.: PO00000013', 1, '2019-03-01 00:40:42', '40'),
(2600, 'PURCHASE ORDER', 'Reopened Transaction', 'Transaction No.: PO00000013 | Remarks: sdfsd', 1, '2019-03-01 00:40:53', '40'),
(2601, 'PURCHASE ORDER', 'Unposted Transaction', 'Transaction No.: PO00000013 | Remarks: sdfsd', 1, '2019-03-01 00:41:03', '40'),
(2602, 'PURCHASE ORDER', 'Edited Purchase Order Header', 'OLD VALUES: id=40 | transaction_number=PO00000013 | status=LOGGED | reference= | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person= | supplier_contact_number= | ship_to=WAREHOUSE | warehouse_id=1 | client_id= | ship_to_street_address=street | ship_to_district_address=district | ship_to_city_address=city | ship_to_region_address=region | ship_to_zip_code_address=zip | ship_to_country_address=philippines | ship_to_contact_person= | ship_to_contact_number= | terms_id= | remarks= | document_date=2019-03-01 | delivery_date= | created_date=2019-03-01 00:19:35 | created_by=1 | updated_date= | updated_by= | posted_date= | posted_by= | closed_date= | closed_by= | last_status_update_remarks=POSTED=>LOGGED \nRemarks: sdfsd | cancelled_date= | cancelled_by= <br>NEW VALUES: transaction_number=PO00000013 | status=LOGGED | reference=NULL | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person=NULL | supplier_contact_number=NULL | ship_to=WAREHOUSE | warehouse_id=1 | client_id=NULL | ship_to_street_address=street | ship_to_district_address=district | ship_to_city_address=city | ship_to_region_address=region | ship_to_zip_code_address=zip | ship_to_country_address=philippines | ship_to_contact_person=NULL | ship_to_contact_number=NULL | terms_id=NULL | remarks=NULL | document_date=2019-03-01 | delivery_date=NULL | created_date=2019-03-01 00:19:35 | created_by=1 | updated_date=2019-03-01 00:41:11 | updated_by=1', 1, '2019-03-01 00:41:11', '40'),
(2603, 'PURCHASE ORDER', 'Posted Transaction', 'Transaction No.: PO00000013', 1, '2019-03-01 00:41:17', '40'),
(2604, 'STOCK RECEIPT', 'Void Transaction', 'Transaction No.: RCV00000039 | Remarks: sdfds', 1, '2019-03-01 00:41:38', '41'),
(2605, 'PURCHASE ORDER', 'Void Transaction', 'Transaction No.: PO00000013 | Remarks: sdfds', 1, '2019-03-01 00:41:49', '40'),
(2606, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000030 | Remarks: sdfsd', 1, '2019-03-01 00:50:05', '32'),
(2607, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=81 | stock_receipt_header_id=32 | item_id=32 | lot_number=432423 | expiry_date=NULL | uom_id=1 | quantity=324 | base_quantity=324 | remarks=NULL | created_date=2019-03-01 00:50:13 | created_by=1 | updated_date=2019-03-01 00:50:13 | updated_by=1', 1, '2019-03-01 00:50:13', '32'),
(2608, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=82 | stock_receipt_header_id=32 | item_id=29 | lot_number=432423 | expiry_date=2019-03-24 | uom_id=2 | quantity=34 | base_quantity=3400 | remarks=NULL | created_date=2019-03-01 00:50:18 | created_by=1 | updated_date=2019-03-01 00:50:18 | updated_by=1', 1, '2019-03-01 00:50:18', '32'),
(2609, 'STOCK RECEIPT', 'Deleted Row Detail', 'id=82 | stock_receipt_header_id=32 | transaction_number=RCV00000030 | item_id=29 | item_name=Item 1 | uom_id=2 | uom_description=CS | quantity=34 | base_quantity=3400 | lot_number=432423 | expiry_date=2019-03-24 | remarks= | created_date=2019-03-01 00:50:18 | created_by=System Administrator | updated_date=2019-03-01 00:50:18 | updated_by=System Administrator', 1, '2019-03-01 00:50:42', '32'),
(2610, 'STOCK RECEIPT', 'Deleted Row Detail', 'id=81 | stock_receipt_header_id=32 | transaction_number=RCV00000030 | item_id=32 | item_name=hgfhgfhg jsdf kj sdfj sk sdkjfh l sjalksdj alskd asdlk aksdjalksd kasd jaklsdj | uom_id=1 | uom_description=PC | quantity=324 | base_quantity=324 | lot_number=432423 | expiry_date= | remarks= | created_date=2019-03-01 00:50:13 | created_by=System Administrator | updated_date=2019-03-01 00:50:13 | updated_by=System Administrator', 1, '2019-03-01 00:50:58', '32'),
(2611, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=83 | stock_receipt_header_id=32 | item_id=32 | lot_number=432423 | expiry_date=NULL | uom_id=3 | quantity=15 | base_quantity=150 | remarks=NULL | created_date=2019-03-01 00:52:08 | created_by=1 | updated_date=2019-03-01 00:52:08 | updated_by=1', 1, '2019-03-01 00:52:08', '32'),
(2612, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=1 | code=MAIN | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:03 | updated_by=1 | updated_date=2019-02-28 22:38:35 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=14 | street=street | city=city | district=district | region=region | zip_code=zip | country=philippines <br>NEW VALUES: code=MAIN | description=MAIN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-01 00:52:29 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=14', 1, '2019-03-01 00:52:29', '1'),
(2613, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000030', 1, '2019-03-01 00:52:32', '32'),
(2614, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000030 | receipt_id=32 | default_location_id=14 | item_id=32 | lot_number=432423 | expiry_date=NULL | uom_id=1 | quantity=150.0000', 1, '2019-03-01 00:52:32', '32'),
(2615, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000030 | No remaining items to be putaway', 1, '2019-03-01 00:52:32', '32'),
(2616, 'STOCK RECEIPT', 'Reopened Transaction', 'Transaction No.: RCV00000030 | Remarks: sdfsd', 1, '2019-03-01 00:52:35', '32'),
(2617, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000030 | Remarks: sdfsd', 1, '2019-03-01 00:52:37', '32'),
(2618, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=84 | stock_receipt_header_id=32 | item_id=29 | lot_number=SDFSDFSD | expiry_date=2019-03-31 | uom_id=2 | quantity=15 | base_quantity=1500 | remarks=NULL | created_date=2019-03-01 00:53:15 | created_by=1 | updated_date=2019-03-01 00:53:15 | updated_by=1', 1, '2019-03-01 00:53:15', '32'),
(2619, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=1 | code=MAIN | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:03 | updated_by=1 | updated_date=2019-03-01 00:52:29 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=14 | street=street | city=city | district=district | region=region | zip_code=zip | country=philippines <br>NEW VALUES: code=MAIN | description=MAIN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-01 00:53:25 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=14', 1, '2019-03-01 00:53:25', '1'),
(2620, 'STOCK RECEIPT', 'Added Row Detail: Line Exists', 'id=83 | stock_receipt_header_id=32 | transaction_number=RCV00000030 | item_id=32 | item_code=ITM00000001 | item_name=hgfhgfhg jsdf kj sdfj sk sdkjfh l sjalksdj alskd asdlk aksdjalksd kasd jaklsdj | lot_number=\'432423\' | expiry_date=\'NULL\' | uom_id=3 | uom_description=BOX | uom_multiplier=10 | quantity=5 | prev_quantity=15 | remarks=NULL', 1, '2019-03-01 00:54:00', '32'),
(2621, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=85 | stock_receipt_header_id=32 | item_id=32 | lot_number=432423 | expiry_date=NULL | uom_id=3 | quantity=5 | base_quantity=50 | remarks=NULL | created_date=2019-03-01 00:54:15 | created_by=1 | updated_date=2019-03-01 00:54:15 | updated_by=1', 1, '2019-03-01 00:54:15', '32'),
(2622, 'STOCK RECEIPT', 'Deleted Row Detail', 'id=85 | stock_receipt_header_id=32 | transaction_number=RCV00000030 | item_id=32 | item_name=hgfhgfhg jsdf kj sdfj sk sdkjfh l sjalksdj alskd asdlk aksdjalksd kasd jaklsdj | uom_id=3 | uom_description=BOX | quantity=5 | base_quantity=50 | lot_number=432423 | expiry_date= | remarks= | created_date=2019-03-01 00:54:15 | created_by=System Administrator | updated_date=2019-03-01 00:54:15 | updated_by=System Administrator', 1, '2019-03-01 00:54:46', '32'),
(2623, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000030', 1, '2019-03-01 00:55:02', '32'),
(2624, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000030 | Remarks: sdfsd', 1, '2019-03-01 00:55:11', '32'),
(2625, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000030', 1, '2019-03-01 00:55:17', '32'),
(2626, 'STOCK RECEIPT', 'Closed Transaction', 'Transaction No.: RCV00000030 | Remarks: ', 1, '2019-03-01 00:55:24', '32'),
(2627, 'STOCK RECEIPT', 'Reopened Transaction', 'Transaction No.: RCV00000030 | Remarks: sdf', 1, '2019-03-01 00:55:30', '32'),
(2628, 'PURCHASE ORDER', 'Created Purchase Order Header', 'id=41 | transaction_number=PO00000014 | status=LOGGED | reference=NULL | supplier_id=5 | supplier_street_address=NULL | supplier_district_address=NULL | supplier_city_address=NULL | supplier_region_address=NULL | supplier_zip_code_address=NULL | supplier_country_address=NULL | supplier_contact_person=NULL | supplier_contact_number=NULL | ship_to=WAREHOUSE | warehouse_id=1 | client_id=NULL | ship_to_street_address=street | ship_to_district_address=district | ship_to_city_address=city | ship_to_region_address=region | ship_to_zip_code_address=zip | ship_to_country_address=philippines | ship_to_contact_person=NULL | ship_to_contact_number=NULL | terms_id=NULL | remarks=NULL | document_date=2019-03-01 | delivery_date=NULL | created_date=2019-03-01 01:10:33 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-03-01 01:10:33', '41'),
(2629, 'PURCHASE ORDER', 'Added Row Detail: New Line', 'id=128 | purchase_order_header_id=41 | item_id=29 | uom_id=2 | quantity=15 | base_quantity=1500 | unit_price=0 | amount=0 | remarks=NULL | created_date=2019-03-01 01:10:44 | created_by=1 | updated_date=2019-03-01 01:10:44 | updated_by=1 | active_flag=1', 1, '2019-03-01 01:10:44', '41'),
(2630, 'PURCHASE ORDER', 'Added Row Detail: New Line', 'id=129 | purchase_order_header_id=41 | item_id=29 | uom_id=2 | quantity=2 | base_quantity=200 | unit_price=0 | amount=0 | remarks=NULL | created_date=2019-03-01 01:10:53 | created_by=1 | updated_date=2019-03-01 01:10:53 | updated_by=1 | active_flag=1', 1, '2019-03-01 01:10:53', '41'),
(2631, 'PURCHASE ORDER', 'Deleted Row Detail', 'id=129 | purchase_order_header_id=41 | transaction_number= PO00000014 | item_id=29 | item_name=Item 1 | uom_id=2 | uom_description=CS | quantity=2 | base_quantity=200 | unit_price=0 | amount=0 | remarks= | created_date=2019-03-01 01:10:53 | created_by=System Administrator | updated_date=2019-03-01 01:10:53 | updated_by=System Administrator', 1, '2019-03-01 01:11:04', '41'),
(2632, 'PURCHASE ORDER', 'Posted Transaction', 'Transaction No.: PO00000014', 1, '2019-03-01 01:11:19', '41'),
(2633, 'STOCK RECEIPT', 'Created Stock Receipt Header', 'id=42 | transaction_number=RCV00000040 | status=LOGGED | document_date=2019-03-01 | warehouse_id=1 | source_type=PO | purchase_order_header_id=41 | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=REDFGDF | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2019-03-01 01:11:28 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-03-01 01:11:28', '42'),
(2634, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=86 | stock_receipt_header_id=42 | item_id=29 | lot_number=SDFSDF | expiry_date=2019-03-31 | uom_id=2 | quantity=5 | base_quantity=500 | remarks=NULL | created_date=2019-03-01 01:12:01 | created_by=1 | updated_date=2019-03-01 01:12:01 | updated_by=1', 1, '2019-03-01 01:12:01', '42'),
(2635, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=87 | stock_receipt_header_id=42 | item_id=29 | lot_number=FGFWERW | expiry_date=2019-03-31 | uom_id=2 | quantity=10 | base_quantity=1000 | remarks=NULL | created_date=2019-03-01 01:12:36 | created_by=1 | updated_date=2019-03-01 01:12:36 | updated_by=1', 1, '2019-03-01 01:12:36', '42'),
(2636, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000040', 1, '2019-03-01 01:13:05', '42'),
(2637, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'PO No.: PO00000014; Triggered by: RCV00000040', 1, '2019-03-01 01:13:05', '41'),
(2638, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000040 | Remarks: fdgdf', 1, '2019-03-01 01:13:51', '42'),
(2639, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000014 | Unposted RCV Transaction->RCV00000040: fdgdf', 1, '2019-03-01 01:13:51', '41'),
(2640, 'STOCK RECEIPT', 'Deleted Row Detail', 'id=86 | stock_receipt_header_id=42 | transaction_number=RCV00000040 | item_id=29 | item_name=Item 1 | uom_id=2 | uom_description=CS | quantity=5 | base_quantity=500 | lot_number=SDFSDF | expiry_date=2019-03-31 | remarks= | created_date=2019-03-01 01:12:01 | created_by=System Administrator | updated_date=2019-03-01 01:12:01 | updated_by=System Administrator', 1, '2019-03-01 01:15:10', '42'),
(2641, 'STOCK RECEIPT', 'Created Stock Receipt Header', 'id=43 | transaction_number=RCV00000041 | status=LOGGED | document_date=2019-03-01 | warehouse_id=1 | source_type=PO | purchase_order_header_id=41 | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=FDGDF | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2019-03-01 01:15:18 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-03-01 01:15:18', '43'),
(2642, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=88 | stock_receipt_header_id=43 | item_id=29 | lot_number=FGFWERW | expiry_date=2019-03-31 | uom_id=2 | quantity=5 | base_quantity=500 | remarks=NULL | created_date=2019-03-01 01:15:25 | created_by=1 | updated_date=2019-03-01 01:15:25 | updated_by=1', 1, '2019-03-01 01:15:25', '43'),
(2643, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000041', 1, '2019-03-01 01:15:28', '43'),
(2644, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000040', 1, '2019-03-01 01:15:52', '42'),
(2645, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000014; Triggered by: RCV00000040', 1, '2019-03-01 01:15:52', '41'),
(2646, 'STOCK RECEIPT', 'Void Transaction', 'Transaction No.: RCV00000040 | Remarks: gdfgdf', 1, '2019-03-01 01:16:12', '42'),
(2647, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000014 | Unposted RCV Transaction->RCV00000040: gdfgdf', 1, '2019-03-01 01:16:12', '41'),
(2648, 'STOCK RECEIPT', 'Created Stock Receipt Header', 'id=44 | transaction_number=RCV00000042 | status=LOGGED | document_date=2019-03-01 | warehouse_id=1 | source_type=PO | purchase_order_header_id=41 | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=SDFSDF | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2019-03-01 01:24:03 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-03-01 01:24:03', '44'),
(2649, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=89 | stock_receipt_header_id=44 | item_id=29 | lot_number=FGFWERW | expiry_date=2019-03-31 | uom_id=2 | quantity=10 | base_quantity=1000 | remarks=NULL | created_date=2019-03-01 01:24:14 | created_by=1 | updated_date=2019-03-01 01:24:14 | updated_by=1', 1, '2019-03-01 01:24:14', '44'),
(2650, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000042', 1, '2019-03-01 01:24:16', '44'),
(2651, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000014; Triggered by: RCV00000042', 1, '2019-03-01 01:24:16', '41'),
(2652, 'STOCK RECEIPT', 'Void Transaction', 'Transaction No.: RCV00000042 | Remarks: sdfsdfsd', 1, '2019-03-01 01:24:46', '44'),
(2653, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Cancelled', 'Transaction No.: PO00000014 | Unposted RCV Transaction->RCV00000042: sdfsdfsd', 1, '2019-03-01 01:24:46', '41'),
(2654, 'STOCK RECEIPT', 'Void Transaction', 'Transaction No.: RCV00000041 | Remarks: sdfsdf', 1, '2019-03-01 01:25:36', '43'),
(2655, 'STOCK RECEIPT', 'Created Stock Receipt Header', 'id=45 | transaction_number=RCV00000043 | status=LOGGED | document_date=2019-03-01 | warehouse_id=1 | source_type=PO | purchase_order_header_id=41 | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=SDFS | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2019-03-01 01:26:01 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-03-01 01:26:01', '45'),
(2656, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=90 | stock_receipt_header_id=45 | item_id=29 | lot_number=FGFWERW | expiry_date=2019-03-31 | uom_id=2 | quantity=15 | base_quantity=1500 | remarks=NULL | created_date=2019-03-01 01:26:09 | created_by=1 | updated_date=2019-03-01 01:26:09 | updated_by=1', 1, '2019-03-01 01:26:09', '45'),
(2657, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000043', 1, '2019-03-01 01:26:12', '45'),
(2658, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000014; Triggered by: RCV00000043', 1, '2019-03-01 01:26:12', '41'),
(2659, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000043 | Remarks: sdfsd', 1, '2019-03-01 01:26:42', '45'),
(2660, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000014 | Unposted RCV Transaction->RCV00000043: sdfsd', 1, '2019-03-01 01:26:42', '41'),
(2661, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000043', 1, '2019-03-01 01:27:09', '45'),
(2662, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000014; Triggered by: RCV00000043', 1, '2019-03-01 01:27:10', '41'),
(2663, 'STOCK RECEIPT', 'Void Transaction', 'Transaction No.: RCV00000043 | Remarks: sdfs', 1, '2019-03-01 01:28:02', '45'),
(2664, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Cancelled', 'Transaction No.: PO00000014 | Cancelled RCV Transaction->RCV00000043: sdfs', 1, '2019-03-01 01:28:02', '41'),
(2665, 'STOCK RECEIPT', 'Created Stock Receipt Header', 'id=46 | transaction_number=RCV00000044 | status=LOGGED | document_date=2019-03-01 | warehouse_id=1 | source_type=PO | purchase_order_header_id=41 | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=SDFSDF | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2019-03-01 01:38:51 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-03-01 01:38:51', '46'),
(2666, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=91 | stock_receipt_header_id=46 | item_id=29 | lot_number=ERWER | expiry_date=2019-03-31 | uom_id=2 | quantity=15 | base_quantity=1500 | remarks=NULL | created_date=2019-03-01 01:39:13 | created_by=1 | updated_date=2019-03-01 01:39:13 | updated_by=1', 1, '2019-03-01 01:39:13', '46'),
(2667, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000044', 1, '2019-03-01 01:39:15', '46'),
(2668, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000014; Triggered by: RCV00000044', 1, '2019-03-01 01:39:15', '41'),
(2669, 'PURCHASE ORDER', 'Reopened Transaction', 'Transaction No.: PO00000014 | Remarks: dfgdf', 1, '2019-03-01 01:43:06', '41'),
(2670, 'PURCHASE ORDER', 'Closed Transaction', 'Transaction No.: PO00000014', 1, '2019-03-01 01:54:24', '41'),
(2671, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=1 | code=MAIN | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:03 | updated_by=1 | updated_date=2019-03-01 00:53:25 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=14 | street=street | city=city | district=district | region=region | zip_code=zip | country=philippines <br>NEW VALUES: code=MAIN | description=MAIN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-01 02:32:04 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=14', 1, '2019-03-01 02:32:04', '1'),
(2672, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000044 | Remarks: dsfs', 1, '2019-03-01 02:32:11', '46'),
(2673, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000014 | Unposted RCV Transaction->RCV00000044: dsfs', 1, '2019-03-01 02:32:11', '41'),
(2674, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000044', 1, '2019-03-01 02:32:14', '46'),
(2675, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000014; Triggered by: RCV00000044', 1, '2019-03-01 02:32:14', '41'),
(2676, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000044 | receipt_id=46 | default_location_id=14 | item_id=29 | lot_number=ERWER | expiry_date=2019-03-31 | uom_id=1 | quantity=1500.0000', 1, '2019-03-01 02:32:14', '46'),
(2677, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000044 | No remaining items to be putaway', 1, '2019-03-01 02:32:14', '46'),
(2678, 'STOCK RECEIPT', 'Reopened Transaction', 'Transaction No.: RCV00000044 | Remarks: sdfsd', 1, '2019-03-01 02:32:31', '46'),
(2679, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000044 | Remarks: sdfsd', 1, '2019-03-01 02:32:34', '46'),
(2680, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000014 | Unposted RCV Transaction->RCV00000044: sdfsd', 1, '2019-03-01 02:32:34', '41'),
(2681, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000044', 1, '2019-03-01 02:32:36', '46'),
(2682, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000014; Triggered by: RCV00000044', 1, '2019-03-01 02:32:36', '41'),
(2683, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000044 | No remaining items to be putaway', 1, '2019-03-01 02:32:36', '46'),
(2684, 'STOCK RECEIPT', 'Reopened Transaction', 'Transaction No.: RCV00000044 | Remarks: sdfds', 1, '2019-03-01 02:34:17', '46'),
(2685, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000044 | Remarks: sdfsd', 1, '2019-03-01 02:34:19', '46'),
(2686, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000014 | Unposted RCV Transaction->RCV00000044: sdfsd', 1, '2019-03-01 02:34:20', '41'),
(2687, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000044', 1, '2019-03-01 02:34:22', '46'),
(2688, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000014; Triggered by: RCV00000044', 1, '2019-03-01 02:34:22', '41'),
(2689, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000044 | Putaway Completed', 1, '2019-03-01 02:34:22', '46'),
(2690, 'STOCK RECEIPT', 'Reopened Transaction', 'Transaction No.: RCV00000044 | Remarks: dsfsd', 1, '2019-03-01 02:34:40', '46'),
(2691, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=1 | code=MAIN | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:03 | updated_by=1 | updated_date=2019-03-01 02:32:04 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=14 | street=street | city=city | district=district | region=region | zip_code=zip | country=philippines <br>NEW VALUES: code=MAIN | description=MAIN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-01 02:34:46 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=14', 1, '2019-03-01 02:34:46', '1'),
(2692, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000044 | Remarks: sdfds', 1, '2019-03-01 02:34:51', '46'),
(2693, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000014 | Unposted RCV Transaction->RCV00000044: sdfds', 1, '2019-03-01 02:34:51', '41'),
(2694, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000044', 1, '2019-03-01 02:34:53', '46'),
(2695, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000014; Triggered by: RCV00000044', 1, '2019-03-01 02:34:54', '41'),
(2696, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=1 | code=MAIN | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:03 | updated_by=1 | updated_date=2019-03-01 02:34:46 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=14 | street=street | city=city | district=district | region=region | zip_code=zip | country=philippines <br>NEW VALUES: code=MAIN | description=MAIN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-01 02:35:00 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=14', 1, '2019-03-01 02:35:00', '1'),
(2697, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000044 | Remarks: sf', 1, '2019-03-01 02:35:06', '46'),
(2698, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000014 | Unposted RCV Transaction->RCV00000044: sf', 1, '2019-03-01 02:35:06', '41'),
(2699, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000044', 1, '2019-03-01 02:35:34', '46'),
(2700, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000014; Triggered by: RCV00000044', 1, '2019-03-01 02:35:34', '41'),
(2701, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000044 | Putaway Completed', 1, '2019-03-01 02:35:34', '46'),
(2702, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000038 | Remarks: sdfsd', 1, '2019-03-01 02:36:00', '40'),
(2703, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000038', 1, '2019-03-01 02:36:05', '40'),
(2704, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000038 | Remarks: sdfsd', 1, '2019-03-01 02:36:12', '40'),
(2705, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=3 | code=WHSE1 | description=Warehouse 1 | created_by=1 | created_date=2019-01-09 16:09:38 | updated_by=1 | updated_date=2019-02-28 22:41:21 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=17 | street= | city= | district= | region= | zip_code= | country= <br>NEW VALUES: code=WHSE1 | description=Warehouse 1 | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-01 02:36:19 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=17', 1, '2019-03-01 02:36:19', '3'),
(2706, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000038', 1, '2019-03-01 02:36:22', '40'),
(2707, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000038 | receipt_id=40 | default_location_id=17 | item_id=30 | lot_number=20190301 | expiry_date=2020-03-01 | uom_id=1 | quantity=250.0000', 1, '2019-03-01 02:36:22', '40'),
(2708, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000038 | receipt_id=40 | default_location_id=17 | item_id=30 | lot_number=20190302 | expiry_date=2020-03-02 | uom_id=1 | quantity=200.0000', 1, '2019-03-01 02:36:22', '40'),
(2709, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000038 | receipt_id=40 | default_location_id=17 | item_id=29 | lot_number=20190228 | expiry_date=2020-02-28 | uom_id=1 | quantity=503.0000', 1, '2019-03-01 02:36:22', '40'),
(2710, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000038 | Putaway Completed', 1, '2019-03-01 02:36:22', '40'),
(2711, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000037 | Remarks: sadas', 1, '2019-03-01 02:37:54', '39'),
(2712, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000037', 1, '2019-03-01 02:37:57', '39'),
(2713, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=2 | code=TEST | description=test | created_by=1 | created_date=2019-01-03 14:06:13 | updated_by=1 | updated_date=2019-02-22 17:57:49 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=16 | street= | city= | district= | region= | zip_code= | country= <br>NEW VALUES: code=TEST | description=test | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-01 02:38:12 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=16', 1, '2019-03-01 02:38:12', '2'),
(2714, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000037 | Remarks: asdsa', 1, '2019-03-01 02:38:16', '39'),
(2715, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000037', 1, '2019-03-01 02:38:18', '39'),
(2716, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000037 | receipt_id=39 | default_location_id=16 | item_id=32 | lot_number=20190222 | expiry_date=NULL | uom_id=1 | quantity=153.0000', 1, '2019-03-01 02:38:18', '39'),
(2717, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000037 | receipt_id=39 | default_location_id=16 | item_id=29 | lot_number=20190222 | expiry_date=2020-02-22 | uom_id=1 | quantity=1200.0000', 1, '2019-03-01 02:38:18', '39'),
(2718, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000037 | Putaway Completed', 1, '2019-03-01 02:38:18', '39'),
(2719, 'PURCHASE ORDER', 'Created Purchase Order Header', 'id=42 | transaction_number=PO00000015 | status=LOGGED | reference=NULL | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person=NULL | supplier_contact_number=NULL | ship_to=WAREHOUSE | warehouse_id=1 | client_id=NULL | ship_to_street_address=street | ship_to_district_address=district | ship_to_city_address=city | ship_to_region_address=region | ship_to_zip_code_address=zip | ship_to_country_address=philippines | ship_to_contact_person=NULL | ship_to_contact_number=NULL | terms_id=NULL | remarks=NULL | document_date=2019-03-01 | delivery_date=NULL | created_date=2019-03-01 02:55:24 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-03-01 02:55:24', '42'),
(2720, 'PURCHASE ORDER', 'Edited Purchase Order Header', 'OLD VALUES: id=42 | transaction_number=PO00000015 | status=LOGGED | reference= | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person= | supplier_contact_number= | ship_to=WAREHOUSE | warehouse_id=1 | client_id= | ship_to_street_address=street | ship_to_district_address=district | ship_to_city_address=city | ship_to_region_address=region | ship_to_zip_code_address=zip | ship_to_country_address=philippines | ship_to_contact_person= | ship_to_contact_number= | terms_id= | remarks= | document_date=2019-03-01 | delivery_date= | created_date=2019-03-01 02:55:24 | created_by=1 | updated_date= | updated_by= | posted_date= | posted_by= | closed_date= | closed_by= | last_status_update_remarks= | cancelled_date= | cancelled_by= <br>NEW VALUES: transaction_number=PO00000015 | status=LOGGED | reference=NULL | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person=NULL | supplier_contact_number=NULL | ship_to=WAREHOUSE | warehouse_id=2 | client_id=NULL | ship_to_street_address=NULL | ship_to_district_address=NULL | ship_to_city_address=NULL | ship_to_region_address=NULL | ship_to_zip_code_address=NULL | ship_to_country_address=NULL | ship_to_contact_person=NULL | ship_to_contact_number=NULL | terms_id=NULL | remarks=NULL | document_date=2019-03-01 | delivery_date=NULL | created_date=2019-03-01 02:55:24 | created_by=1 | updated_date=2019-03-01 02:55:40 | updated_by=1', 1, '2019-03-01 02:55:40', '42'),
(2721, 'PURCHASE ORDER', 'Edited Purchase Order Header', 'OLD VALUES: id=42 | transaction_number=PO00000015 | status=LOGGED | reference= | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person= | supplier_contact_number= | ship_to=WAREHOUSE | warehouse_id=2 | client_id= | ship_to_street_address= | ship_to_district_address= | ship_to_city_address= | ship_to_region_address= | ship_to_zip_code_address= | ship_to_country_address= | ship_to_contact_person= | ship_to_contact_number= | terms_id= | remarks= | document_date=2019-03-01 | delivery_date= | created_date=2019-03-01 02:55:24 | created_by=1 | updated_date=2019-03-01 02:55:40 | updated_by=1 | posted_date= | posted_by= | closed_date= | closed_by= | last_status_update_remarks= | cancelled_date= | cancelled_by= <br>NEW VALUES: transaction_number=PO00000015 | status=LOGGED | reference=NULL | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person=NULL | supplier_contact_number=NULL | ship_to=WAREHOUSE | warehouse_id=1 | client_id=NULL | ship_to_street_address=street | ship_to_district_address=district | ship_to_city_address=city | ship_to_region_address=region | ship_to_zip_code_address=zip | ship_to_country_address=philippines | ship_to_contact_person=NULL | ship_to_contact_number=NULL | terms_id=NULL | remarks=NULL | document_date=2019-03-01 | delivery_date=NULL | created_date=2019-03-01 02:55:24 | created_by=1 | updated_date=2019-03-01 02:56:11 | updated_by=1', 1, '2019-03-01 02:56:11', '42'),
(2722, 'PURCHASE ORDER', 'Edited Purchase Order Header', 'OLD VALUES: id=42 | transaction_number=PO00000015 | status=LOGGED | reference= | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person= | supplier_contact_number= | ship_to=WAREHOUSE | warehouse_id=1 | client_id= | ship_to_street_address=street | ship_to_district_address=district | ship_to_city_address=city | ship_to_region_address=region | ship_to_zip_code_address=zip | ship_to_country_address=philippines | ship_to_contact_person= | ship_to_contact_number= | terms_id= | remarks= | document_date=2019-03-01 | delivery_date= | created_date=2019-03-01 02:55:24 | created_by=1 | updated_date=2019-03-01 02:56:11 | updated_by=1 | posted_date= | posted_by= | closed_date= | closed_by= | last_status_update_remarks= | cancelled_date= | cancelled_by= <br>NEW VALUES: transaction_number=PO00000015 | status=LOGGED | reference=SAMPLE REFERENCE NUMBER | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person=NULL | supplier_contact_number=NULL | ship_to=WAREHOUSE | warehouse_id=1 | client_id=NULL | ship_to_street_address=street | ship_to_district_address=district | ship_to_city_address=city | ship_to_region_address=region | ship_to_zip_code_address=zip | ship_to_country_address=philippines | ship_to_contact_person=NULL | ship_to_contact_number=NULL | terms_id=NULL | remarks=NULL | document_date=2019-03-01 | delivery_date=NULL | created_date=2019-03-01 02:55:24 | created_by=1 | updated_date=2019-03-01 02:56:32 | updated_by=1', 1, '2019-03-01 02:56:32', '42'),
(2723, 'PURCHASE ORDER', 'Edited Purchase Order Header', 'OLD VALUES: id=42 | transaction_number=PO00000015 | status=LOGGED | reference=SAMPLE REFERENCE NUMBER | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person= | supplier_contact_number= | ship_to=WAREHOUSE | warehouse_id=1 | client_id= | ship_to_street_address=street | ship_to_district_address=district | ship_to_city_address=city | ship_to_region_address=region | ship_to_zip_code_address=zip | ship_to_country_address=philippines | ship_to_contact_person= | ship_to_contact_number= | terms_id= | remarks= | document_date=2019-03-01 | delivery_date= | created_date=2019-03-01 02:55:24 | created_by=1 | updated_date=2019-03-01 02:56:32 | updated_by=1 | posted_date= | posted_by= | closed_date= | closed_by= | last_status_update_remarks= | cancelled_date= | cancelled_by= <br>NEW VALUES: transaction_number=PO00000015 | status=LOGGED | reference=SAMPLE REFERENCE NUMBER | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person=dfsd | supplier_contact_number=fsdfsdfsd | ship_to=WAREHOUSE | warehouse_id=1 | client_id=NULL | ship_to_street_address=street | ship_to_district_address=district | ship_to_city_address=city | ship_to_region_address=region | ship_to_zip_code_address=zip | ship_to_country_address=philippines | ship_to_contact_person=NULL | ship_to_contact_number=NULL | terms_id=NULL | remarks=NULL | document_date=2019-03-01 | delivery_date=NULL | created_date=2019-03-01 02:55:24 | created_by=1 | updated_date=2019-03-01 02:56:40 | updated_by=1', 1, '2019-03-01 02:56:40', '42'),
(2724, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000037 | receipt_id=39 | location_id=16 | item_id=29 | lot_number=20190222 | expiry_date=2020-02-22 | uom_id=1 | quanity=1200 | base_quantity=1200 | Reason=uytuytuy', 1, '2019-03-01 03:05:11', '39'),
(2725, 'PUTAWAY', 'Reopened Stock Receipt Transaction', 'Stock Receipt No.: RCV00000037 | Deleted Corresponding Putaway Detail->Reason: uytuytuy', 1, '2019-03-01 03:05:11', '39'),
(2726, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000037 | receipt_id=39 | location_id=16 | item_id=32 | lot_number=20190222 | expiry_date=NULL | uom_id=1 | quanity=153 | base_quantity=153 | Reason=gfrghfh', 1, '2019-03-01 03:05:18', '39'),
(2727, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000038 | receipt_id=40 | location_id=17 | item_id=29 | lot_number=20190228 | expiry_date=2020-02-28 | uom_id=1 | quanity=503 | base_quantity=503 | Reason=jhjfhfghfjh', 1, '2019-03-01 03:05:29', '40'),
(2728, 'PUTAWAY', 'Reopened Stock Receipt Transaction', 'Stock Receipt No.: RCV00000038 | Deleted Corresponding Putaway Detail->Reason: jhjfhfghfjh', 1, '2019-03-01 03:05:29', '40'),
(2729, 'STOCK RECEIPT', 'Created Stock Receipt Header', 'id=47 | transaction_number=RCV00000045 | status=LOGGED | document_date=2019-03-04 | warehouse_id=1 | source_type=UD | purchase_order_header_id=NULL | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=SUPPLIER | source_client_id=NULL | source_supplier_id=6 | source_warehouse_id=NULL | reference_1=SR01 | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2019-03-04 11:23:21 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-03-04 11:23:21', '47'),
(2730, 'ITEM', 'Edited Item Info', 'OLD VALUES: id=29 | active_flag=1 | code=ITM01 | name=Item 1 | description=Item 1 Description | item_type_id=1 | category_id=2 | expiry_flag=1 | reorder_quantity=0 | quantity_per_pallet=0 | created_date=2018-11-25 00:06:51 | created_by=1 | updated_date=2018-12-19 16:47:41 | updated_by=1 | label=label <br>NEW VALUES: active_flag=1 | code=PM000430 | name=PLASTIC LINING FOR 200L DRUM | description=PLASTIC LINING FOR 200L DRUM | item_type_id=1 | category_id=2 | expiry_flag=1 | reorder_quantity=0 | quantity_per_pallet=0 | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-04 11:26:21 | label=label', 1, '2019-03-04 11:26:21', '29'),
(2731, 'ITEM', 'Edited Item Info', 'OLD VALUES: id=30 | active_flag=1 | code=ITM02 | name=Item 2 | description=Item 2 Description | item_type_id=2 | category_id=2 | expiry_flag=1 | reorder_quantity=0 | quantity_per_pallet=0 | created_date=2018-11-25 00:12:16 | created_by=1 | updated_date=2018-12-17 03:39:17 | updated_by=1 | label= <br>NEW VALUES: active_flag=1 | code=FGT00285 | name=PIONEER BARRICADE WHITE 200L | description=PIONEER BARRICADE WHITE 200L | item_type_id=2 | category_id=2 | expiry_flag=1 | reorder_quantity=0 | quantity_per_pallet=0 | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-04 11:26:45 | label=NULL', 1, '2019-03-04 11:26:45', '30'),
(2732, 'ITEM', 'Edited Item Info', 'OLD VALUES: id=32 | active_flag=1 | code=ITM00000001 | name=hgfhgfhg jsdf kj sdfj sk sdkjfh l sjalksdj alskd asdlk aksdjalksd kasd jaklsdj | description=hgfhgf | item_type_id=2 | category_id= | expiry_flag=0 | reorder_quantity=0 | quantity_per_pallet=0 | created_date=2018-12-01 02:09:24 | created_by=1 | updated_date=2019-01-11 22:29:04 | updated_by=1 | label= <br>NEW VALUES: active_flag=1 | code=PM000413 | name=P.LABEL QDE SKY BLUE 1L | description=P.LABEL QDE SKY BLUE 1L | item_type_id=2 | category_id=NULL | expiry_flag=0 | reorder_quantity=0 | quantity_per_pallet=0 | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-04 11:27:05 | label=NULL', 1, '2019-03-04 11:27:05', '32'),
(2733, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=92 | stock_receipt_header_id=47 | item_id=32 | lot_number=20190304 | expiry_date=NULL | uom_id=3 | quantity=5 | base_quantity=50 | remarks=NULL | created_date=2019-03-04 11:27:26 | created_by=1 | updated_date=2019-03-04 11:27:26 | updated_by=1', 1, '2019-03-04 11:27:26', '47'),
(2734, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=93 | stock_receipt_header_id=47 | item_id=30 | lot_number=20190304 | expiry_date=2020-03-04 | uom_id=1 | quantity=100 | base_quantity=100 | remarks=NULL | created_date=2019-03-04 11:27:42 | created_by=1 | updated_date=2019-03-04 11:27:42 | updated_by=1', 1, '2019-03-04 11:27:42', '47'),
(2735, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=94 | stock_receipt_header_id=47 | item_id=30 | lot_number=20190304 | expiry_date=2020-03-05 | uom_id=1 | quantity=100 | base_quantity=100 | remarks=NULL | created_date=2019-03-04 11:28:10 | created_by=1 | updated_date=2019-03-04 11:28:10 | updated_by=1', 1, '2019-03-04 11:28:10', '47'),
(2736, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=95 | stock_receipt_header_id=47 | item_id=30 | lot_number=20190305 | expiry_date=2020-03-05 | uom_id=1 | quantity=50 | base_quantity=50 | remarks=NULL | created_date=2019-03-04 11:28:30 | created_by=1 | updated_date=2019-03-04 11:28:30 | updated_by=1', 1, '2019-03-04 11:28:30', '47'),
(2737, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=96 | stock_receipt_header_id=47 | item_id=29 | lot_number=20190304 | expiry_date=2020-03-04 | uom_id=2 | quantity=25 | base_quantity=2500 | remarks=NULL | created_date=2019-03-04 11:28:48 | created_by=1 | updated_date=2019-03-04 11:28:48 | updated_by=1', 1, '2019-03-04 11:28:48', '47'),
(2738, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=1 | code=MAIN | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:03 | updated_by=1 | updated_date=2019-03-01 02:35:00 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=1 | default_location_id=14 | street=street | city=city | district=district | region=region | zip_code=zip | country=philippines <br>NEW VALUES: code=MAIN | description=MAIN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-04 11:29:17 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=14', 1, '2019-03-04 11:29:17', '1'),
(2739, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000045', 1, '2019-03-04 11:29:58', '47'),
(2740, 'BIN LOCATION', 'Edited Bin Location Info', 'OLD VALUES: id=14 | code=LOC4 | description=LOC4 | warehouse_id=1 | zone_id= | weight_capacity=0 | cbm_capacity=0 | capacity=0 | on_hold_flag=1 | disposition=GOOD STOCKS | suggestion_flag=0 | location_index= | all_items_flag=1 | created_date=2018-12-17 01:41:42 | created_by=1 | updated_date=2019-02-14 15:40:26 | updated_by=1 | active_flag=1 <br>NEW VALUES: code=LOC4 | description=LOC4 | warehouse_id=1 | zone_id=NULL | weight_capacity=0 | cbm_capacity=0 | capacity=0 | on_hold_flag=1 | disposition=GOOD STOCKS | suggestion_flag=0 | location_index=NULL | all_items_flag=0 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-03-04 17:04:48 | updated_by=1 | active_flag=1', 1, '2019-03-04 17:04:48', '14'),
(2741, 'WAREHOUSE', 'Default Bin Location Reset', 'Default bin location for [MAIN] MAIN WAREHOUSE has been reset; Auto Putaway Flag=0. Triggered by bin: [LOC4] LOC4 -> all_items_flag=0', 1, '2019-03-04 17:04:48', '1'),
(2742, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=1 | code=MAIN | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:03 | updated_by=1 | updated_date=2019-03-04 11:29:17 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id= | street=street | city=city | district=district | region=region | zip_code=zip | country=philippines <br>NEW VALUES: code=MAIN | description=MAIN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-04 17:04:56 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=NULL', 1, '2019-03-04 17:04:56', '1');
INSERT INTO `system_log` (`id`, `module`, `description`, `query`, `user_source`, `date_source`, `transaction_id`) VALUES
(2743, 'BIN LOCATION', 'Edited Bin Location Info', 'OLD VALUES: id=14 | code=LOC4 | description=LOC4 | warehouse_id=1 | zone_id= | weight_capacity=0 | cbm_capacity=0 | capacity=0 | on_hold_flag=1 | disposition=GOOD STOCKS | suggestion_flag=0 | location_index= | all_items_flag=0 | created_date=2018-12-17 01:41:42 | created_by=1 | updated_date=2019-03-04 17:04:48 | updated_by=1 | active_flag=1 <br>NEW VALUES: code=LOC4 | description=LOC4 | warehouse_id=1 | zone_id=NULL | weight_capacity=0 | cbm_capacity=0 | capacity=0 | on_hold_flag=1 | disposition=GOOD STOCKS | suggestion_flag=0 | location_index=NULL | all_items_flag=1 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-03-04 17:21:50 | updated_by=1 | active_flag=1', 1, '2019-03-04 17:21:50', '14'),
(2744, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=1 | code=MAIN | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:03 | updated_by=1 | updated_date=2019-03-04 17:04:56 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id= | street=street | city=city | district=district | region=region | zip_code=zip | country=philippines <br>NEW VALUES: code=MAIN | description=MAIN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-03-04 17:22:02 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=14', 1, '2019-03-04 17:22:02', '1'),
(2745, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=97 | stock_receipt_header_id=37 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=2 | quantity=25 | base_quantity=2500 | remarks=NULL | created_date=2019-03-04 17:28:14 | created_by=1 | updated_date=2019-03-04 17:28:14 | updated_by=1', 1, '2019-03-04 17:28:14', '37'),
(2746, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=98 | stock_receipt_header_id=37 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=2 | quantity=25 | base_quantity=2500 | remarks=NULL | created_date=2019-03-04 17:31:40 | created_by=1 | updated_date=2019-03-04 17:31:40 | updated_by=1', 1, '2019-03-04 17:31:40', '37'),
(2747, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000035', 1, '2019-03-04 17:32:01', '37'),
(2748, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000011; Triggered by: RCV00000035', 1, '2019-03-04 17:32:01', '38'),
(2749, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quantity=12500.0000', 1, '2019-03-04 17:32:01', '37'),
(2750, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=1 | quantity=5000.0000', 1, '2019-03-04 17:32:01', '37'),
(2751, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000035 | Putaway Completed', 1, '2019-03-04 17:32:01', '37'),
(2752, 'STOCK RECEIPT', 'Reopened Transaction', 'Transaction No.: RCV00000035 | Remarks: dfg', 1, '2019-03-04 17:32:31', '37'),
(2753, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000035 | Remarks: dfgdf', 1, '2019-03-04 17:32:34', '37'),
(2754, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000011 | Unposted RCV Transaction->RCV00000035: dfgdf', 1, '2019-03-04 17:32:34', '38'),
(2755, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000035', 1, '2019-03-04 17:32:37', '37'),
(2756, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000011; Triggered by: RCV00000035', 1, '2019-03-04 17:32:37', '38'),
(2757, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000035 | Putaway Completed', 1, '2019-03-04 17:32:37', '37'),
(2758, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000035 | receipt_id=37 | location_id=16 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=1 | quanity=5000 | base_quantity=5000 | Reason=dsfsd', 1, '2019-03-04 17:33:45', '37'),
(2759, 'PUTAWAY', 'Reopened Stock Receipt Transaction', 'Stock Receipt No.: RCV00000035 | Deleted Corresponding Putaway Detail->Reason: dsfsd', 1, '2019-03-04 17:33:45', '37'),
(2760, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000035 | receipt_id=37 | location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quanity=12500 | base_quantity=12500 | Reason=sdfsd', 1, '2019-03-04 17:33:50', '37'),
(2761, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000035 | Remarks: sdfds', 1, '2019-03-04 17:34:10', '37'),
(2762, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000011 | Unposted RCV Transaction->RCV00000035: sdfds', 1, '2019-03-04 17:34:10', '38'),
(2763, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000035', 1, '2019-03-04 17:34:32', '37'),
(2764, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000011; Triggered by: RCV00000035', 1, '2019-03-04 17:34:32', '38'),
(2765, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quantity=12500.0000', 1, '2019-03-04 17:34:32', '37'),
(2766, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=1 | quantity=5000.0000', 1, '2019-03-04 17:34:32', '37'),
(2767, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000035 | Putaway Completed', 1, '2019-03-04 17:34:32', '37'),
(2768, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000035 | receipt_id=37 | location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quanity=12500 | base_quantity=12500 | Reason=werewr', 1, '2019-03-04 17:37:20', '37'),
(2769, 'PUTAWAY', 'Reopened Stock Receipt Transaction', 'Stock Receipt No.: RCV00000035 | Deleted Corresponding Putaway Detail->Reason: werewr', 1, '2019-03-04 17:37:20', '37'),
(2770, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000035 | receipt_id=37 | location_id=16 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=1 | quanity=5000 | base_quantity=5000 | Reason=sdfsd', 1, '2019-03-04 17:45:27', '37'),
(2771, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000035 | Remarks: sdfsdf', 1, '2019-03-04 17:45:35', '37'),
(2772, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000011 | Unposted RCV Transaction->RCV00000035: sdfsdf', 1, '2019-03-04 17:45:35', '38'),
(2773, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000035', 1, '2019-03-04 17:45:59', '37'),
(2774, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000011; Triggered by: RCV00000035', 1, '2019-03-04 17:45:59', '38'),
(2775, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quantity=12500.0000', 1, '2019-03-04 17:45:59', '37'),
(2776, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=1 | quantity=5000.0000', 1, '2019-03-04 17:45:59', '37'),
(2777, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000035 | Putaway Completed', 1, '2019-03-04 17:45:59', '37'),
(2778, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000035 | receipt_id=37 | location_id=16 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=1 | quanity=5000 | base_quantity=5000 | Reason=sdfsdf', 1, '2019-03-04 17:46:54', '37'),
(2779, 'PUTAWAY', 'Reopened Stock Receipt Transaction', 'Stock Receipt No.: RCV00000035 | Deleted Corresponding Putaway Detail->Reason: sdfsdf', 1, '2019-03-04 17:46:54', '37'),
(2780, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000035 | receipt_id=37 | location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quanity=12500 | base_quantity=12500 | Reason=sdfsd', 1, '2019-03-04 17:47:13', '37'),
(2781, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000035 | Remarks: sfsdf', 1, '2019-03-04 17:48:51', '37'),
(2782, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000011 | Unposted RCV Transaction->RCV00000035: sfsdf', 1, '2019-03-04 17:48:51', '38'),
(2783, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000035', 1, '2019-03-04 17:49:41', '37'),
(2784, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000011; Triggered by: RCV00000035', 1, '2019-03-04 17:49:41', '38'),
(2785, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000035 | Remarks: sdfdsfs', 1, '2019-03-04 17:50:36', '37'),
(2786, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000011 | Unposted RCV Transaction->RCV00000035: sdfdsfs', 1, '2019-03-04 17:50:36', '38'),
(2787, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000035', 1, '2019-03-04 17:50:55', '37'),
(2788, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000011; Triggered by: RCV00000035', 1, '2019-03-04 17:50:55', '38'),
(2789, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000035 | Remarks: sdfsd', 1, '2019-03-04 17:51:14', '37'),
(2790, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000011 | Unposted RCV Transaction->RCV00000035: sdfsd', 1, '2019-03-04 17:51:14', '38'),
(2791, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000035', 1, '2019-03-04 17:51:20', '37'),
(2792, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000011; Triggered by: RCV00000035', 1, '2019-03-04 17:51:20', '38'),
(2793, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quantity=12500.0000', 1, '2019-03-04 17:51:20', '37'),
(2794, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=1 | quantity=5000.0000', 1, '2019-03-04 17:51:20', '37'),
(2795, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000035 | Putaway Completed', 1, '2019-03-04 17:51:20', '37'),
(2796, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000035 | receipt_id=37 | location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quanity=12500 | base_quantity=12500 | Reason=dsf', 1, '2019-03-04 17:53:22', '37'),
(2797, 'PUTAWAY', 'Reopened Stock Receipt Transaction', 'Stock Receipt No.: RCV00000035 | Deleted Corresponding Putaway Detail->Reason: dsf', 1, '2019-03-04 17:53:22', '37'),
(2798, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000035 | receipt_id=37 | location_id=16 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=1 | quanity=5000 | base_quantity=5000 | Reason=asdas', 1, '2019-03-04 17:55:34', '37'),
(2799, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000035 | Remarks: sdfds', 1, '2019-03-04 17:55:48', '37'),
(2800, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000011 | Unposted RCV Transaction->RCV00000035: sdfds', 1, '2019-03-04 17:55:48', '38'),
(2801, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000035', 1, '2019-03-04 17:55:54', '37'),
(2802, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000011; Triggered by: RCV00000035', 1, '2019-03-04 17:55:54', '38'),
(2803, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quantity=12500.0000', 1, '2019-03-04 17:55:54', '37'),
(2804, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000035 | Putaway Completed', 1, '2019-03-04 17:55:54', '37'),
(2805, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000035 | receipt_id=37 | location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quanity=12500 | base_quantity=12500 | Reason=sdfsdf', 1, '2019-03-05 10:33:01', '37'),
(2806, 'PUTAWAY', 'Reopened Stock Receipt Transaction', 'Stock Receipt No.: RCV00000035 | Deleted Corresponding Putaway Detail->Reason: sdfsdf', 1, '2019-03-05 10:33:01', '37'),
(2807, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000035 | Remarks: sdfsd', 1, '2019-03-05 10:33:13', '37'),
(2808, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000011 | Unposted RCV Transaction->RCV00000035: sdfsd', 1, '2019-03-05 10:33:13', '38'),
(2809, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000035', 1, '2019-03-05 10:33:24', '37'),
(2810, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000011; Triggered by: RCV00000035', 1, '2019-03-05 10:33:24', '38'),
(2811, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quantity=12500.0000', 1, '2019-03-05 10:33:24', '37'),
(2812, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000035 | Putaway Completed', 1, '2019-03-05 10:33:24', '37'),
(2813, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000035 | receipt_id=37 | location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quanity=12500 | base_quantity=12500 | Reason=frsdfsd', 1, '2019-03-05 10:33:51', '37'),
(2814, 'PUTAWAY', 'Reopened Stock Receipt Transaction', 'Stock Receipt No.: RCV00000035 | Deleted Corresponding Putaway Detail->Reason: frsdfsd', 1, '2019-03-05 10:33:51', '37'),
(2815, 'STOCK RECEIPT', 'Unposted Transaction', 'Transaction No.: RCV00000035 | Remarks: sdfsdf', 1, '2019-03-05 10:34:34', '37'),
(2816, 'PURCHASE ORDER', 'Reopened Transaction - Corresponding RCV Unposted', 'Transaction No.: PO00000011 | Unposted RCV Transaction->RCV00000035: sdfsdf', 1, '2019-03-05 10:34:34', '38'),
(2817, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000035', 1, '2019-03-05 10:35:57', '37'),
(2818, 'PURCHASE ORDER', 'Closed Transaction - RCV Completed', 'Transaction No.: PO00000011; Triggered by: RCV00000035', 1, '2019-03-05 10:35:57', '38'),
(2819, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=20190221 | expiry_date=2020-02-21 | uom_id=1 | quantity=12500.0000', 1, '2019-03-05 10:35:57', '37'),
(2820, 'STOCK RECEIPT', 'Auto Generated Putaway', 'receipt_number=RCV00000035 | receipt_id=37 | default_location_id=16 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=1 | quantity=5000.0000', 1, '2019-03-05 10:35:57', '37'),
(2821, 'STOCK RECEIPT', 'Auto-closed Transaction', 'Transaction No.: RCV00000035 | Putaway Completed', 1, '2019-03-05 10:35:57', '37'),
(2822, 'BIN LOCATION', 'Edited Bin Location Info', 'OLD VALUES: id=12 | code=LOC2 | description=LOC2 | warehouse_id=1 | zone_id= | weight_capacity=0 | cbm_capacity=0 | capacity=0 | on_hold_flag=0 | disposition=GOOD STOCKS | suggestion_flag=1 | location_index= | all_items_flag=0 | created_date=2018-12-17 01:40:30 | created_by=1 | updated_date=2019-02-28 23:11:40 | updated_by=1 | active_flag=1 <br>NEW VALUES: code=LOC2 | description=LOC2 | warehouse_id=1 | zone_id=NULL | weight_capacity=0 | cbm_capacity=0 | capacity=1.123456 | on_hold_flag=0 | disposition=GOOD STOCKS | suggestion_flag=1 | location_index=NULL | all_items_flag=0 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-03-05 16:58:26 | updated_by=1 | active_flag=1', 1, '2019-03-05 16:58:26', '12'),
(2823, 'BIN LOCATION', 'Edited Bin Location Info', 'OLD VALUES: id=12 | code=LOC2 | description=LOC2 | warehouse_id=1 | zone_id= | weight_capacity=0 | cbm_capacity=0 | capacity=1.123456 | on_hold_flag=0 | disposition=GOOD STOCKS | suggestion_flag=1 | location_index= | all_items_flag=0 | created_date=2018-12-17 01:40:30 | created_by=1 | updated_date=2019-03-05 16:58:26 | updated_by=1 | active_flag=1 <br>NEW VALUES: code=LOC2 | description=LOC2 | warehouse_id=1 | zone_id=NULL | weight_capacity=0 | cbm_capacity=0 | capacity=1.1235 | on_hold_flag=0 | disposition=GOOD STOCKS | suggestion_flag=1 | location_index=NULL | all_items_flag=0 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-03-05 16:59:54 | updated_by=1 | active_flag=1', 1, '2019-03-05 16:59:54', '12'),
(2824, 'STOCK RECEIPT', 'Reopened Transaction', 'Transaction No.: RCV00000029 | Remarks: asdasd', 1, '2019-03-06 12:00:54', '31'),
(2825, 'STOCK RECEIPT', 'Closed Transaction', 'Transaction No.: RCV00000029 | Remarks: ', 1, '2019-03-06 12:00:56', '31'),
(2826, 'STOCK RECEIPT', 'Closed Transaction', 'Transaction No.: RCV00000045 | Remarks: ', 1, '2019-03-06 12:01:02', '47'),
(2827, 'STOCK RECEIPT', 'Reopened Transaction', 'Transaction No.: RCV00000045 | Remarks: adasd', 1, '2019-03-06 12:01:05', '47'),
(2828, 'STOCK RECEIPT', 'Closed Transaction', 'Transaction No.: RCV00000045 | Remarks: ', 1, '2019-03-06 12:01:08', '47'),
(2829, 'STOCK RECEIPT', 'Reopened Transaction', 'Transaction No.: RCV00000045 | Remarks: asdas', 1, '2019-03-06 12:01:11', '47'),
(2830, 'STOCK RECEIPT', 'Closed Transaction', 'Transaction No.: RCV00000045 | Remarks: ', 1, '2019-03-06 12:01:13', '47'),
(2831, 'STOCK RECEIPT', 'Closed Transaction', 'Transaction No.: RCV00000038 | Remarks: ', 1, '2019-03-06 12:01:28', '40'),
(2832, 'STOCK RECEIPT', 'Reopened Transaction', 'Transaction No.: RCV00000045 | Remarks: asda', 1, '2019-03-06 12:01:45', '47'),
(2833, 'ITEM', 'Edited Item Plu', 'OLD VALUES: id=47 | inventory_unit_flag=0 | active_flag=1 | item_id=30 | uom_id=1 | quantity=1 | barcode= | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=2019-01-12 18:40:00 | created_by=1 | updated_date= | updated_by= <br>NEW VALUES: inventory_unit_flag=1 | active_flag=1 | item_id=30 | uom_id=1 | quantity=1 | barcode=NULL | price=0 | cost=0 | length=45 | width=78 | height=12 | cbm=0.0421 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-03-06 12:29:57 | updated_by=1', 1, '2019-03-06 12:29:57', '30'),
(2834, 'ITEM', 'Edited Item Plu', 'OLD VALUES: id=47 | inventory_unit_flag=0 | active_flag=1 | item_id=30 | uom_id=1 | quantity=1 | barcode= | price=0 | cost=0 | length=45 | width=78 | height=12 | cbm=0.0421 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=2019-01-12 18:40:00 | created_by=1 | updated_date=2019-03-06 12:29:57 | updated_by=1 <br>NEW VALUES: inventory_unit_flag=1 | active_flag=1 | item_id=30 | uom_id=1 | quantity=1 | barcode=NULL | price=0 | cost=0 | length=45 | width=78 | height=12 | cbm=0.0421 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-03-06 12:30:20 | updated_by=1', 1, '2019-03-06 12:30:20', '30'),
(2835, 'STOCK RECEIPT', 'Reopened Transaction', 'Transaction No.: RCV00000035 | Remarks: hjghjgjh', 1, '2019-03-26 11:37:08', '37'),
(2836, 'PUTAWAY', 'Deleted Row Detail', 'receipt_number=RCV00000035 | receipt_id=37 | location_id=16 | item_id=29 | lot_number=SDFDS | expiry_date=2019-03-05 | uom_id=1 | quanity=5000 | base_quantity=5000 | Reason=hgjhgh', 1, '2019-03-26 11:57:21', '37'),
(2837, 'PURCHASE ORDER', 'Reopened Transaction', 'Transaction No.: PO00000011 | Remarks: sdsdf', 1, '2019-03-26 12:00:46', '38'),
(2838, 'PURCHASE ORDER', 'Unposted Transaction', 'Transaction No.: PO00000011 | Remarks: dsfd', 1, '2019-03-26 12:00:51', '38'),
(2839, 'PURCHASE ORDER', 'Edited Purchase Order Detail', 'OLD VALUES: id=121 | purchase_order_header_id=38 | item_id=29 | uom_id=2 | quantity=200 | base_quantity=20000 | unit_price=0 | amount=0 | remarks= | created_date=2019-02-14 16:50:31 | created_by=1 | updated_date=2019-02-14 16:50:31 | updated_by=1 | active_flag=1 <br>NEW VALUES: purchase_order_header_id=38 | item_id=29 | uom_id=2 | quantity=200 | base_quantity=20000 | unit_price=0 | amount=0 | remarks=NULL | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-03-26 12:02:25 | updated_by=1 | active_flag=1', 1, '2019-03-26 12:02:25', '38'),
(2840, 'PURCHASE ORDER', 'Edited Purchase Order Detail', 'OLD VALUES: id=121 | purchase_order_header_id=38 | item_id=29 | uom_id=2 | quantity=200 | base_quantity=20000 | unit_price=0 | amount=0 | remarks= | created_date=2019-02-14 16:50:31 | created_by=1 | updated_date=2019-03-26 12:02:25 | updated_by=1 | active_flag=1 <br>NEW VALUES: purchase_order_header_id=38 | item_id=29 | uom_id=2 | quantity=215 | base_quantity=21500 | unit_price=0 | amount=0 | remarks=NULL | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-03-26 12:02:35 | updated_by=1 | active_flag=1', 1, '2019-03-26 12:02:35', '38'),
(2841, 'WAREHOUSE', 'Edited Warehouse Info', 'OLD VALUES: id=1 | code=MAIN | description=MAIN WAREHOUSE | created_by=1 | created_date=2018-06-21 20:36:03 | updated_by=1 | updated_date=2019-03-04 17:22:02 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=14 | street=street | city=city | district=district | region=region | zip_code=zip | country=philippines <br>NEW VALUES: code=MAIN | description=MAIN WAREHOUSE | created_by=NOCHANGE | created_date=NOCHANGE | updated_by=1 | updated_date=2019-04-08 02:56:38 | active_flag=1 | warehouse_type_id=1 | auto_putaway_flag=0 | default_location_id=14', 1, '2019-04-08 02:56:38', '1'),
(2842, 'BIN LOCATION', 'Deleted Bin Location', 'id=12 | active_flag=1 | code=LOC2 | description=LOC2 | warehouse=MAIN WAREHOUSE | zone= | disposition=GOOD STOCKS | on_hold_flag=0 | suggestion_flag=1 | index= | all_items_flag=0 | weight_capacity=0 | cbm_capacity=0 | capacity=1.1235 | created_date=2018-12-17 01:40:30 | created_by=System Administrator | updated_date=2019-03-05 16:59:54 | updated_by=System Administrator', 1, '2019-04-08 02:58:27', '12'),
(2843, 'BIN LOCATION', 'Deleted Bin Location', 'id=13 | active_flag=1 | code=LOC3 | description=LOC3 | warehouse=MAIN WAREHOUSE | zone= | disposition=GOOD STOCKS | on_hold_flag=0 | suggestion_flag=1 | index= | all_items_flag=1 | weight_capacity=0 | cbm_capacity=0 | capacity=0 | created_date=2018-12-17 01:40:48 | created_by=System Administrator | updated_date=2019-02-14 20:27:47 | updated_by=System Administrator', 1, '2019-04-08 02:58:27', '13'),
(2844, 'BIN LOCATION', 'Deleted Bin Location', 'id=15 | active_flag=0 | code=LOC5 | description=LOC5 | warehouse=MAIN WAREHOUSE | zone= | disposition=BAD STOCKS | on_hold_flag=1 | suggestion_flag=0 | index= | all_items_flag=0 | weight_capacity=0 | cbm_capacity=0 | capacity=0 | created_date=2018-12-17 01:41:55 | created_by=System Administrator | updated_date=2018-12-19 16:45:57 | updated_by=System Administrator', 1, '2019-04-08 02:58:27', '15'),
(2845, 'BIN LOCATION', 'Deleted Bin Location', 'id=18 | active_flag=1 | code=DFLTLOC-WHSE2 | description=DFLTLOC-WHSE2 | warehouse=Warehouse 2 | zone= | disposition=GOOD STOCKS | on_hold_flag=0 | suggestion_flag=1 | index= | all_items_flag=1 | weight_capacity=0 | cbm_capacity=0 | capacity=0 | created_date=2019-02-28 23:44:12 | created_by=System Administrator | updated_date= | updated_by=', 1, '2019-04-08 02:58:27', '18'),
(2846, 'STOCK RECEIPT', 'Created Stock Receipt Header', 'id=48 | transaction_number=RCV00000046 | status=LOGGED | document_date=2019-04-08 | warehouse_id=1 | source_type=RT | purchase_order_header_id=NULL | stock_issuance_header_id=NULL | source_rt_type=CLIENT | source_ud_type=NULL | source_client_id=3 | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=12312 | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2019-04-08 03:00:15 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-04-08 03:00:15', '48'),
(2847, 'PURCHASE ORDER', 'Created Purchase Order Header', 'id=43 | transaction_number=PO00000016 | status=LOGGED | reference=SADADAS | supplier_id=6 | supplier_street_address=P.O. Box 1201, Manila Central Post Office | supplier_district_address=Malate | supplier_city_address=Manila | supplier_region_address=NCR | supplier_zip_code_address=1050 | supplier_country_address=Philippines | supplier_contact_person=NULL | supplier_contact_number=NULL | ship_to=WAREHOUSE | warehouse_id=1 | client_id=NULL | ship_to_street_address=street | ship_to_district_address=district | ship_to_city_address=city | ship_to_region_address=region | ship_to_zip_code_address=zip | ship_to_country_address=philippines | ship_to_contact_person=NULL | ship_to_contact_number=NULL | terms_id=NULL | remarks=NULL | document_date=2019-04-08 | delivery_date=NULL | created_date=2019-04-08 03:00:59 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-04-08 03:00:59', '43'),
(2848, 'PURCHASE ORDER', 'Added Row Detail: New Line', 'id=129 | purchase_order_header_id=43 | item_id=32 | uom_id=3 | quantity=4 | base_quantity=40 | unit_price=0 | amount=0 | remarks=NULL | created_date=2019-04-08 03:01:07 | created_by=1 | updated_date=2019-04-08 03:01:07 | updated_by=1 | active_flag=1', 1, '2019-04-08 03:01:07', '43'),
(2849, 'PURCHASE ORDER', 'Added Row Detail: New Line', 'id=130 | purchase_order_header_id=43 | item_id=30 | uom_id=1 | quantity=34 | base_quantity=34 | unit_price=0 | amount=0 | remarks=NULL | created_date=2019-04-08 03:01:15 | created_by=1 | updated_date=2019-04-08 03:01:15 | updated_by=1 | active_flag=1', 1, '2019-04-08 03:01:15', '43'),
(2850, 'PURCHASE ORDER', 'Added Row Detail: Line Exists', 'id=130 | purchase_order_header_id=43 | transaction_number=PO00000016 | item_id=30 | item_code=FGT00285 | item_name=PIONEER BARRICADE WHITE 200L | uom_id=1 | uom_description=PC | uom_multiplier=1 | quantity=23 | prev_quantity=34 | unit_price=0 | amount=0 | remarks=NULL', 1, '2019-04-08 03:01:20', '43'),
(2851, 'PURCHASE ORDER', 'Added Row Detail: New Line', 'id=131 | purchase_order_header_id=43 | item_id=30 | uom_id=1 | quantity=34 | base_quantity=34 | unit_price=0 | amount=0 | remarks=NULL | created_date=2019-04-08 03:01:27 | created_by=1 | updated_date=2019-04-08 03:01:27 | updated_by=1 | active_flag=1', 1, '2019-04-08 03:01:27', '43'),
(2852, 'PURCHASE ORDER', 'Posted Transaction', 'Transaction No.: PO00000016', 1, '2019-04-08 03:01:48', '43'),
(2853, 'STOCK RECEIPT', 'Created Stock Receipt Header', 'id=49 | transaction_number=RCV00000047 | status=LOGGED | document_date=2019-04-08 | warehouse_id=1 | source_type=PO | purchase_order_header_id=43 | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=23423 | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2019-04-08 03:01:59 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-04-08 03:01:59', '49'),
(2854, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=99 | stock_receipt_header_id=49 | item_id=30 | lot_number=12 | expiry_date=2019-04-08 | uom_id=1 | quantity=32 | base_quantity=32 | remarks=NULL | created_date=2019-04-08 03:03:01 | created_by=1 | updated_date=2019-04-08 03:03:01 | updated_by=1', 1, '2019-04-08 03:03:01', '49'),
(2855, 'STOCK RECEIPT', 'Added Row Detail: New Line', 'id=100 | stock_receipt_header_id=49 | item_id=30 | lot_number=12 | expiry_date=2019-04-16 | uom_id=1 | quantity=23 | base_quantity=23 | remarks=NULL | created_date=2019-04-08 03:03:30 | created_by=1 | updated_date=2019-04-08 03:03:30 | updated_by=1', 1, '2019-04-08 03:03:30', '49'),
(2856, 'STOCK RECEIPT', 'Posted Transaction', 'Transaction No.: RCV00000047', 1, '2019-04-08 03:03:59', '49'),
(2857, 'STOCK RECEIPT', 'Created Stock Receipt Header', 'id=50 | transaction_number=RCV00000048 | status=LOGGED | document_date=2019-04-11 | warehouse_id=1 | source_type=PO | purchase_order_header_id=43 | stock_issuance_header_id=NULL | source_rt_type=NULL | source_ud_type=NULL | source_client_id=NULL | source_supplier_id=NULL | source_warehouse_id=NULL | reference_1=DSFSDFDSF | reference_2=NULL | reference_3=NULL | remarks=NULL | created_date=2019-04-11 02:11:17 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-04-11 02:11:17', '50'),
(2858, 'WAREHOUSE', 'Deleted Warehouse', 'id=4 | code=WHSE2 | description=Warehouse 2', 1, '2019-04-11 02:34:25', '4'),
(2859, 'ITEM', 'Edited Item Plu', 'OLD VALUES: id=45 | inventory_unit_flag=0 | active_flag=1 | item_id=32 | uom_id=1 | quantity=1 | barcode= | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=2019-01-12 18:39:22 | created_by=1 | updated_date= | updated_by= <br>NEW VALUES: inventory_unit_flag=1 | active_flag=1 | item_id=32 | uom_id=1 | quantity=1 | barcode=NULL | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=1 | description= | minimum_order_quantity=0 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-04-11 02:36:22 | updated_by=1', 1, '2019-04-11 02:36:22', '32'),
(2860, 'ITEM', 'Edited Item Plu', 'OLD VALUES: id=46 | inventory_unit_flag=0 | active_flag=1 | item_id=32 | uom_id=3 | quantity=10 | barcode= | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=2019-01-12 18:39:37 | created_by=1 | updated_date= | updated_by= <br>NEW VALUES: inventory_unit_flag=0 | active_flag=1 | item_id=32 | uom_id=3 | quantity=10 | barcode=NULL | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=1 | description= | minimum_order_quantity=0 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-04-11 02:36:31 | updated_by=1', 1, '2019-04-11 02:36:31', '32'),
(2861, 'ITEM', 'Edited Item Plu', 'OLD VALUES: id=46 | inventory_unit_flag=0 | active_flag=1 | item_id=32 | uom_id=3 | quantity=10 | barcode= | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=2019-01-12 18:39:37 | created_by=1 | updated_date=2019-04-11 02:36:31 | updated_by=1 <br>NEW VALUES: inventory_unit_flag=1 | active_flag=1 | item_id=32 | uom_id=3 | quantity=1 | barcode=NULL | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=1 | description= | minimum_order_quantity=0 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-04-11 02:37:30 | updated_by=1', 1, '2019-04-11 02:37:30', '32'),
(2862, 'ITEM', 'Edited Item Plu', 'OLD VALUES: id=45 | inventory_unit_flag=0 | active_flag=1 | item_id=32 | uom_id=1 | quantity=1 | barcode= | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=2019-01-12 18:39:22 | created_by=1 | updated_date=2019-04-11 02:36:22 | updated_by=1 <br>NEW VALUES: inventory_unit_flag=1 | active_flag=1 | item_id=32 | uom_id=1 | quantity=1 | barcode=NULL | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-04-11 02:37:36 | updated_by=1', 1, '2019-04-11 02:37:36', '32'),
(2863, 'ITEM', 'Edited Item Plu', 'OLD VALUES: id=46 | inventory_unit_flag=0 | active_flag=1 | item_id=32 | uom_id=3 | quantity=1 | barcode= | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=2019-01-12 18:39:37 | created_by=1 | updated_date=2019-04-11 02:37:30 | updated_by=1 <br>NEW VALUES: inventory_unit_flag=0 | active_flag=1 | item_id=32 | uom_id=3 | quantity=5 | barcode=NULL | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=1 | description= | minimum_order_quantity=0 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-04-11 02:37:49 | updated_by=1', 1, '2019-04-11 02:37:49', '32'),
(2864, 'ITEM', 'Edited Item Plu', 'OLD VALUES: id=46 | inventory_unit_flag=0 | active_flag=1 | item_id=32 | uom_id=3 | quantity=5 | barcode= | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=2019-01-12 18:39:37 | created_by=1 | updated_date=2019-04-11 02:37:49 | updated_by=1 <br>NEW VALUES: inventory_unit_flag=1 | active_flag=1 | item_id=32 | uom_id=3 | quantity=1 | barcode=NULL | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=1 | description= | minimum_order_quantity=0 | created_date=NOCHANGE | created_by=NOCHANGE | updated_date=2019-04-11 02:37:56 | updated_by=1', 1, '2019-04-11 02:37:56', '32'),
(2865, 'ITEM', 'New Item Plu Added', 'id=50 | inventory_unit_flag=0 | active_flag=1 | item_id=32 | uom_id=2 | quantity=10 | barcode=NULL | price=0 | cost=0 | length=0 | width=0 | height=0 | cbm=0 | weight=0 | sales_order_flag=0 | purchase_order_flag=0 | description= | minimum_order_quantity=0 | created_date=2019-04-11 02:38:59 | created_by=1 | updated_date=NULL | updated_by=NULL', 1, '2019-04-11 02:38:59', '32');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `days` double DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `code`, `description`, `days`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(1, 'TERM1', 'TERM1', NULL, '2018-06-22 05:14:02', 1, '2019-01-07 20:16:32', 1, 1),
(2, 'TERM2', 'TERM2', 30, '2018-06-22 05:15:23', 1, '2018-06-22 05:15:53', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_numbers_used`
--

CREATE TABLE `transaction_numbers_used` (
  `id` int(11) NOT NULL,
  `transaction_number` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_numbers_used`
--

INSERT INTO `transaction_numbers_used` (`id`, `transaction_number`) VALUES
(76, 'PO00000001'),
(77, 'PO00000002'),
(78, 'PO00000003'),
(79, 'PO00000004'),
(80, 'PO00000005'),
(81, 'PO00000006'),
(82, 'PO00000007'),
(83, 'PO00000008'),
(84, 'PO00000009'),
(138, 'PO00000010'),
(140, 'PO00000011'),
(149, 'PO00000012'),
(150, 'PO00000013'),
(152, 'PO00000014'),
(158, 'PO00000015'),
(161, 'PO00000016'),
(85, 'RCV00000001'),
(86, 'RCV00000002'),
(87, 'RCV00000003'),
(88, 'RCV00000004'),
(89, 'RCV00000005'),
(90, 'RCV00000006'),
(91, 'RCV00000007'),
(92, 'RCV00000008'),
(93, 'RCV00000009'),
(94, 'RCV00000010'),
(95, 'RCV00000011'),
(96, 'RCV00000012'),
(97, 'RCV00000013'),
(98, 'RCV00000014'),
(99, 'RCV00000015'),
(100, 'RCV00000016'),
(101, 'RCV00000017'),
(102, 'RCV00000018'),
(103, 'RCV00000019'),
(104, 'RCV00000020'),
(105, 'RCV00000021'),
(106, 'RCV00000022'),
(131, 'RCV00000023'),
(132, 'RCV00000024'),
(133, 'RCV00000025'),
(134, 'RCV00000026'),
(135, 'RCV00000027'),
(136, 'RCV00000028'),
(137, 'RCV00000029'),
(139, 'RCV00000030'),
(141, 'RCV00000031'),
(142, 'RCV00000032'),
(143, 'RCV00000033'),
(144, 'RCV00000034'),
(145, 'RCV00000035'),
(146, 'RCV00000036'),
(147, 'RCV00000037'),
(148, 'RCV00000038'),
(151, 'RCV00000039'),
(153, 'RCV00000040'),
(154, 'RCV00000041'),
(155, 'RCV00000042'),
(156, 'RCV00000043'),
(157, 'RCV00000044'),
(159, 'RCV00000045'),
(160, 'RCV00000046'),
(162, 'RCV00000047'),
(163, 'RCV00000048');

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

--
-- Dumping data for table `transaction_type`
--

INSERT INTO `transaction_type` (`id`, `code`, `description`, `prefix`, `next_number_series`, `updated_by`, `updated_date`) VALUES
(1, 'ITEM', 'ITEM', 'ITM', 2, 1, '2018-12-01 02:11:41'),
(2, 'PO', 'PURCHASE ORDER', 'PO', 17, 1, '2019-01-10 18:31:28'),
(3, 'RCV', 'STOCK RECEIPT', 'RCV', 49, 1, '2019-02-13 11:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `trucking`
--

CREATE TABLE `trucking` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trucking`
--

INSERT INTO `trucking` (`id`, `code`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(1, 'TRCK1', 'TRUCKING 1', '2018-06-22 04:27:02', 1, '2018-06-22 04:27:31', 1, 1);

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
(2, 'CS', 'CS', '2018-06-21 21:05:00', 1, '2018-06-22 00:26:50', 1, 1),
(3, 'BOX', 'BOX', '2018-11-25 00:18:20', 1, NULL, NULL, 1),
(4, 'GALLON', 'GALLON', '2018-11-25 00:18:38', 1, '2018-11-25 00:22:36', 1, 1);

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
(1, 'System', '', 'Administrator', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'wms@tpincorporated.com', 1, 1, '2019-02-21 13:30:21', 1, 0, 1, NULL, NULL),
(2, 'Kaye', '', 'Bonite', 'user1', '827ccb0eea8a706c4c34a16891f84e7b', 'skdjfhsdkjh@yahoo.com', 1, 1, '2019-01-10 18:11:02', 1, 0, 1, NULL, NULL);

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
(1, 'DATA MASTER', 'DATA MASTER', '2018-06-21 20:13:06', 1, '2018-06-22 00:35:18', 1),
(2, 'PICKER', 'PICKER', '2018-06-21 20:13:39', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_rights`
--

CREATE TABLE `user_group_rights` (
  `user_group_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` varchar(80) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_group_rights`
--

INSERT INTO `user_group_rights` (`user_group_id`, `menu_id`) VALUES
(1, '#configuration-menu'),
(1, '#system-section'),
(1, '#systemlog-menu'),
(1, '#transactiontype-menu'),
(1, '#user-menu'),
(1, '#usergroup-menu'),
(1, '.adduserbtn'),
(1, '.addusergroupbtn'),
(1, '.deleteuserbtn'),
(1, '.deleteusergroupbtn'),
(1, '.edituserbtn'),
(1, '.editusergroupbtn'),
(1, '.resetpasswordbtn'),
(1, 'viewuser'),
(1, 'viewusergroup');

-- --------------------------------------------------------

--
-- Table structure for table `user_rights`
--

CREATE TABLE `user_rights` (
  `user_id` int(11) NOT NULL,
  `menu_id` varchar(100) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 2),
(1, 3);

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
(4, 'MOTORIZED', 'MOTORIZED', '2018-12-22 05:44:11', 1, NULL, NULL, 1),
(5, 'NON-MOTORIZED', 'NON-MOTORIZED', '2018-12-22 05:44:28', 1, NULL, NULL, 1);

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
  `active_flag` tinyint(1) DEFAULT '1',
  `warehouse_type_id` int(11) DEFAULT NULL,
  `auto_putaway_flag` tinyint(1) NOT NULL DEFAULT '0',
  `default_location_id` int(11) DEFAULT NULL,
  `street` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `district` varchar(200) DEFAULT NULL,
  `region` varchar(200) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `code`, `description`, `created_by`, `created_date`, `updated_by`, `updated_date`, `active_flag`, `warehouse_type_id`, `auto_putaway_flag`, `default_location_id`, `street`, `city`, `district`, `region`, `zip_code`, `country`) VALUES
(1, 'MAIN', 'MAIN WAREHOUSE', 1, '2018-06-21 20:36:03', 1, '2019-04-08 02:56:38', 1, 1, 0, 14, 'street', 'city', 'district', 'region', 'zip', 'philippines'),
(2, 'TEST', 'test', 1, '2019-01-03 14:06:13', 1, '2019-03-01 02:38:12', 1, 1, 1, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'WHSE1', 'Warehouse 1', 1, '2019-01-09 16:09:38', 1, '2019-03-01 02:36:19', 1, 1, 1, 17, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_type`
--

CREATE TABLE `warehouse_type` (
  `id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `default_flag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warehouse_type`
--

INSERT INTO `warehouse_type` (`id`, `description`, `created_date`, `default_flag`) VALUES
(1, 'WAREHOUSE', '2018-07-17 16:34:20', 1),
(2, 'PRODUCTION', '2018-07-17 16:34:20', 0),
(3, 'STORE', '2018-08-17 06:51:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`id`, `code`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `active_flag`) VALUES
(1, 'ZONE2', 'Zone 2', '2018-06-22 04:40:00', 1, '2018-06-22 04:40:31', 1, 0),
(2, 'ZONE1', 'Zone 1', '2018-06-22 04:40:04', 1, '2018-06-22 04:40:16', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bin_location`
--
ALTER TABLE `bin_location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `bin_location_ibfk_2` (`zone_id`),
  ADD KEY `bin_location_ibfk_3` (`created_by`),
  ADD KEY `bin_location_ibfk_4` (`updated_by`);

--
-- Indexes for table `bin_location_item`
--
ALTER TABLE `bin_location_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `client_ibfk_1` (`client_group_id`),
  ADD KEY `client_ibfk_2` (`term_id`);

--
-- Indexes for table `client_address`
--
ALTER TABLE `client_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `client_contact`
--
ALTER TABLE `client_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `client_group`
--
ALTER TABLE `client_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_information`
--
ALTER TABLE `company_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `country_code` (`country_code`),
  ADD UNIQUE KEY `country_name` (`country_name`);

--
-- Indexes for table `disposition`
--
ALTER TABLE `disposition`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `email_configuration`
--
ALTER TABLE `email_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `item_type_id` (`item_type_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `item_assembly`
--
ALTER TABLE `item_assembly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uom_id` (`uom_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `component_id` (`component_id`);

--
-- Indexes for table `item_plu`
--
ALTER TABLE `item_plu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uom_id` (`uom_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `item_plu_ibfk_1` (`item_id`);

--
-- Indexes for table `item_type`
--
ALTER TABLE `item_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_warehouse_reorder_quantity`
--
ALTER TABLE `item_warehouse_reorder_quantity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `mode_of_transport`
--
ALTER TABLE `mode_of_transport`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `physical_inventory`
--
ALTER TABLE `physical_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_header_id` (`purchase_order_header_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `unit_of_measure_id` (`uom_id`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `purchase_order_header`
--
ALTER TABLE `purchase_order_header`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_number` (`transaction_number`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `terms_id` (`terms_id`),
  ADD KEY `purchase_order_header_ibfk_4` (`created_by`),
  ADD KEY `purchase_order_header_ibfk_5` (`updated_by`),
  ADD KEY `posted_by` (`posted_by`),
  ADD KEY `closed_by` (`closed_by`),
  ADD KEY `cancelled_by` (`cancelled_by`);

--
-- Indexes for table `putaway_details`
--
ALTER TABLE `putaway_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `uom_id` (`uom_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `stock_receipt_header_id` (`stock_receipt_header_id`);

--
-- Indexes for table `stock_card`
--
ALTER TABLE `stock_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `stock_receipt_details`
--
ALTER TABLE `stock_receipt_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `unit_of_measure_id` (`uom_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `stock_receipt_header_id` (`stock_receipt_header_id`);

--
-- Indexes for table `stock_receipt_header`
--
ALTER TABLE `stock_receipt_header`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `receipt_number` (`transaction_number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `posted_by` (`posted_by`),
  ADD KEY `closed_by` (`closed_by`),
  ADD KEY `purchase_order_header_id` (`purchase_order_header_id`),
  ADD KEY `source_client_id` (`source_client_id`),
  ADD KEY `source_supplier_id` (`source_supplier_id`),
  ADD KEY `source_warehouse_id` (`source_warehouse_id`),
  ADD KEY `cancelled_by` (`cancelled_by`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `supplier_ibfk_1` (`supplier_group_id`),
  ADD KEY `supplier_ibfk_2` (`term_id`);

--
-- Indexes for table `supplier_address`
--
ALTER TABLE `supplier_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `supplier_contact`
--
ALTER TABLE `supplier_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `supplier_group`
--
ALTER TABLE `supplier_group`
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
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `transaction_numbers_used`
--
ALTER TABLE `transaction_numbers_used`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_number` (`transaction_number`);

--
-- Indexes for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `trucking`
--
ALTER TABLE `trucking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
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
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `warehouse_type_id` (`warehouse_type_id`),
  ADD KEY `default_location_id` (`default_location_id`);

--
-- Indexes for table `warehouse_type`
--
ALTER TABLE `warehouse_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bin_location`
--
ALTER TABLE `bin_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `bin_location_item`
--
ALTER TABLE `bin_location_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `client_address`
--
ALTER TABLE `client_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `client_contact`
--
ALTER TABLE `client_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `client_group`
--
ALTER TABLE `client_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company_information`
--
ALTER TABLE `company_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;
--
-- AUTO_INCREMENT for table `disposition`
--
ALTER TABLE `disposition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `email_configuration`
--
ALTER TABLE `email_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `item_assembly`
--
ALTER TABLE `item_assembly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_plu`
--
ALTER TABLE `item_plu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `item_type`
--
ALTER TABLE `item_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `item_warehouse_reorder_quantity`
--
ALTER TABLE `item_warehouse_reorder_quantity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mode_of_transport`
--
ALTER TABLE `mode_of_transport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `physical_inventory`
--
ALTER TABLE `physical_inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `purchase_order_header`
--
ALTER TABLE `purchase_order_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `putaway_details`
--
ALTER TABLE `putaway_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT for table `stock_card`
--
ALTER TABLE `stock_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `stock_receipt_details`
--
ALTER TABLE `stock_receipt_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `stock_receipt_header`
--
ALTER TABLE `stock_receipt_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `supplier_address`
--
ALTER TABLE `supplier_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `supplier_contact`
--
ALTER TABLE `supplier_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `supplier_group`
--
ALTER TABLE `supplier_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `system_log`
--
ALTER TABLE `system_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2866;
--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transaction_numbers_used`
--
ALTER TABLE `transaction_numbers_used`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT for table `transaction_type`
--
ALTER TABLE `transaction_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `trucking`
--
ALTER TABLE `trucking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `unit_of_measure`
--
ALTER TABLE `unit_of_measure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `warehouse_type`
--
ALTER TABLE `warehouse_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bin_location`
--
ALTER TABLE `bin_location`
  ADD CONSTRAINT `bin_location_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bin_location_ibfk_2` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bin_location_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bin_location_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `bin_location_item`
--
ALTER TABLE `bin_location_item`
  ADD CONSTRAINT `bin_location_item_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bin_location_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bin_location_item_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `category_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`client_group_id`) REFERENCES `client_group` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `client_address`
--
ALTER TABLE `client_address`
  ADD CONSTRAINT `client_address_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_address_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_address_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `client_contact`
--
ALTER TABLE `client_contact`
  ADD CONSTRAINT `client_contact_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_contact_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_contact_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `client_group`
--
ALTER TABLE `client_group`
  ADD CONSTRAINT `client_group_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_group_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `disposition`
--
ALTER TABLE `disposition`
  ADD CONSTRAINT `disposition_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `disposition_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `item_assembly`
--
ALTER TABLE `item_assembly`
  ADD CONSTRAINT `item_assembly_ibfk_1` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_assembly_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_assembly_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_assembly_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_assembly_ibfk_5` FOREIGN KEY (`component_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_plu`
--
ALTER TABLE `item_plu`
  ADD CONSTRAINT `item_plu_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_plu_ibfk_2` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_plu_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_plu_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `item_warehouse_reorder_quantity`
--
ALTER TABLE `item_warehouse_reorder_quantity`
  ADD CONSTRAINT `item_warehouse_reorder_quantity_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_warehouse_reorder_quantity_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `item_warehouse_reorder_quantity_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mode_of_transport`
--
ALTER TABLE `mode_of_transport`
  ADD CONSTRAINT `mode_of_transport_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mode_of_transport_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `physical_inventory`
--
ALTER TABLE `physical_inventory`
  ADD CONSTRAINT `physical_inventory_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `physical_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD CONSTRAINT `purchase_order_details_ibfk_1` FOREIGN KEY (`purchase_order_header_id`) REFERENCES `purchase_order_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_details_ibfk_3` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_details_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_details_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_order_header`
--
ALTER TABLE `purchase_order_header`
  ADD CONSTRAINT `purchase_order_header_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_header_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_header_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_header_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_header_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_header_ibfk_6` FOREIGN KEY (`terms_id`) REFERENCES `terms` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_header_ibfk_7` FOREIGN KEY (`posted_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_header_ibfk_8` FOREIGN KEY (`closed_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_header_ibfk_9` FOREIGN KEY (`cancelled_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `putaway_details`
--
ALTER TABLE `putaway_details`
  ADD CONSTRAINT `putaway_details_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `putaway_details_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `putaway_details_ibfk_4` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `putaway_details_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `putaway_details_ibfk_6` FOREIGN KEY (`stock_receipt_header_id`) REFERENCES `stock_receipt_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_card`
--
ALTER TABLE `stock_card`
  ADD CONSTRAINT `stock_card_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_card_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_card_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `bin_location` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `stock_receipt_details`
--
ALTER TABLE `stock_receipt_details`
  ADD CONSTRAINT `stock_receipt_details_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_details_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_details_ibfk_5` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measure` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_details_ibfk_6` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_details_ibfk_7` FOREIGN KEY (`stock_receipt_header_id`) REFERENCES `stock_receipt_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_receipt_header`
--
ALTER TABLE `stock_receipt_header`
  ADD CONSTRAINT `stock_receipt_header_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_header_ibfk_10` FOREIGN KEY (`cancelled_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_header_ibfk_11` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_header_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_header_ibfk_3` FOREIGN KEY (`posted_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_header_ibfk_4` FOREIGN KEY (`closed_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_header_ibfk_5` FOREIGN KEY (`purchase_order_header_id`) REFERENCES `purchase_order_header` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_header_ibfk_7` FOREIGN KEY (`source_client_id`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_header_ibfk_8` FOREIGN KEY (`source_supplier_id`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_receipt_header_ibfk_9` FOREIGN KEY (`source_warehouse_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`supplier_group_id`) REFERENCES `supplier_group` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_ibfk_2` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `supplier_address`
--
ALTER TABLE `supplier_address`
  ADD CONSTRAINT `supplier_address_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_address_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_address_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `supplier_contact`
--
ALTER TABLE `supplier_contact`
  ADD CONSTRAINT `supplier_contact_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_contact_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_contact_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `supplier_group`
--
ALTER TABLE `supplier_group`
  ADD CONSTRAINT `supplier_group_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_group_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `system_log`
--
ALTER TABLE `system_log`
  ADD CONSTRAINT `system_log_ibfk_1` FOREIGN KEY (`user_source`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `terms`
--
ALTER TABLE `terms`
  ADD CONSTRAINT `terms_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `terms_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD CONSTRAINT `transaction_type_ibfk_1` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `trucking`
--
ALTER TABLE `trucking`
  ADD CONSTRAINT `trucking_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `trucking_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

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
  ADD CONSTRAINT `warehouse_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_ibfk_3` FOREIGN KEY (`warehouse_type_id`) REFERENCES `warehouse_type` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_ibfk_4` FOREIGN KEY (`default_location_id`) REFERENCES `bin_location` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `zone`
--
ALTER TABLE `zone`
  ADD CONSTRAINT `zone_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `zone_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
