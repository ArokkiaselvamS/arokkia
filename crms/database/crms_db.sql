-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2023 at 03:37 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `crms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `complainants`
--

CREATE TABLE IF NOT EXISTS `complainants` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unverified,1=verified',
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `aadhar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `complainants`
--

INSERT INTO `complainants` (`id`, `name`, `address`, `contact`, `status`, `email`, `password`, `aadhar`) VALUES
(1, 'kannan', '991/1A3, MG raj trade park\r\nSouth byepassroad', '9629507006', 1, 'kutty807@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '45612'),
(4, 'Pandi', 'Nellai', '9789638617', 0, 'pandi@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE IF NOT EXISTS `complaints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complainant_id` int(30) NOT NULL,
  `message` text NOT NULL,
  `address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Pending,2=Received,3=Action Made',
  `image` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `complainant_id`, `message`, `address`, `date_created`, `status`, `image`) VALUES
(1, 1, 'kmkl;;l', 'lk;lkm;lkm', '2023-02-25 11:44:21', 2, 'gce_ug_cable_fault.BMP'),
(2, 1, 'message', 'message', '2023-02-25 11:44:54', 3, 'aky_ecg.BMP'),
(3, 1, 'pandi', 'message', '2023-02-25 11:47:53', 3, 'aky_ecg.BMP'),
(4, 4, 'Theft', 'Perumalpuram', '2023-03-29 06:29:58', 3, 'STC.BMP');

-- --------------------------------------------------------

--
-- Table structure for table `complaints_action`
--

CREATE TABLE IF NOT EXISTS `complaints_action` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `complaint_id` int(30) NOT NULL,
  `responder_id` int(30) NOT NULL,
  `dispatched_by` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=pending,1= confirmed',
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `complaints_action`
--

INSERT INTO `complaints_action` (`id`, `complaint_id`, `responder_id`, `dispatched_by`, `status`, `remarks`, `date_created`, `image`) VALUES
(1, 1, 1, 1, 2, 'Problem Solved', '2023-02-19 09:14:19', 'STC.BMP'),
(4, 2, 1, 1, 2, 'Not solved', '2023-03-29 06:45:49', 'fx_voice_home_automation.BMP'),
(5, 4, 2, 1, 2, 'FInd out', '2023-03-29 06:31:33', 'fx_voice_home_automation_1.BMP');

-- --------------------------------------------------------

--
-- Table structure for table `responders_team`
--

CREATE TABLE IF NOT EXISTS `responders_team` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `station_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `availability` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `responders_team`
--

INSERT INTO `responders_team` (`id`, `station_id`, `name`, `availability`) VALUES
(1, 1, 'Team 1', 1),
(2, 1, 'Raj', 1),
(3, 1, 'karuthapandi', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE IF NOT EXISTS `stations` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `name`, `address`, `date_created`) VALUES
(1, 'C2 Station', 'Perumalpuram', '2023-02-19 09:13:32'),
(2, 'C3 ', 'palaiyankottai', '2023-03-29 06:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Complaint Cell Management System', 'info@sample.com', '9629507006', '1604029380_police cars.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size: 30px; font-family: Tahoma, Geneva, sans-serif;&quot;&gt;&lt;strong&gt;Sample Content&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&amp;nbsp;When Website is open it Asked for registration you can register to Website. After that We create Username and password. When we enter email id and our information, we registered to website After that username and password is created. By submitting username and password we login to that website. There are Three Modules are in website like User Module, Admin module, Registration Module. Registration Module is related with registration process. User Module is related with user. User module Contain FIR Section, Complaint Section, Permission Section, Women Helpline Section, Cyber Cell Section, Emergency Helpline Section YouTube crime Video Section, Missing Person Section. Admin Module contain Dashboard, Add Women Police Section, Add NGO, View FIR Section, View Cyber Fraud, View Complaint Section, View Permission Request Section and Missing Person Section.&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;img src=&quot;http://localhost/crms/admin/assets/uploads/1604029260_p1.jpg&quot; style=&quot;width: 558px;&quot; class=&quot;fr-fic fr-dib&quot;&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;Advantages:&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;Proper control of the higher authority&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;ï‚· Minimize manual data entry&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;ï‚· Minimum time required&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;ï‚· Minimum time needed for the various processing&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;ï‚· Ensure data accuracy&lt;/p&gt;&lt;div class=&quot;fr-img-space-wrap&quot; style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://localhost/crms/admin/assets/uploads/1604029320_police cars.jpg&quot; style=&quot;width: 567px;&quot; class=&quot;fr-fic fr-rounded fr-dib&quot;&gt;&lt;p class=&quot;fr-img-space-wrap2&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;/div&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; CONCLUSION&lt;/p&gt;&lt;p&gt;In current world, the use of computer technologies, mobile phones are becoming rampant. Nowadays, the growth of country and world is also increasing day by day crimes ratio is also increases. so, this crime reporting manager is the solution to all the problems related to the crime reports, criminal details is very much helpful for normal people. All components are in simple, convenient, cost-effective and in efficient manner. This website not only helpful for men, women, students but also for policemen to work with the crimes and criminals easily &lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '3' COMMENT '1=Admin,2=Staff',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
