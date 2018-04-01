-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 31, 2018 at 07:40 AM
-- Server version: 5.6.39-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `barcodemasters`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`cpses_k7blsXv3hb`@`localhost` FUNCTION `nextval`(`seq_name` varchar(100)) RETURNS bigint(20)
BEGIN
    DECLARE cur_val bigint;
 
    SELECT
        cur_value INTO cur_val
    FROM
        sequence
    WHERE
        name = seq_name;
 
    IF cur_val IS NOT NULL THEN
        UPDATE
            sequence
        SET
            cur_value = IF (
                (cur_value + increment) > max_value OR (cur_value + increment) < min_value,
                IF (
                    cycle = TRUE,
                    IF (
                        (cur_value + increment) > max_value,
                        min_value, 
                        max_value 
                    ),
                    NULL
                ),
                cur_value + increment
            )
        WHERE
            name = seq_name;
    END IF; 
    RETURN cur_val;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `asn_view`
--

CREATE TABLE IF NOT EXISTS `asn_view` (
  `appt_nbr` varchar(255) NOT NULL,
  `asn_nbr` varchar(255) NOT NULL,
  `container_id` varchar(255) NOT NULL,
  `dest_id` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `po_nbr` varchar(255) NOT NULL,
  `rcvd_unit_qty` int(11) NOT NULL,
  `unit_qty` int(11) NOT NULL,
  PRIMARY KEY (`appt_nbr`,`asn_nbr`,`container_id`,`dest_id`,`item_id`,`po_nbr`,`rcvd_unit_qty`,`unit_qty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE IF NOT EXISTS `barcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BARCODE_TYPE` varchar(45) NOT NULL,
  `BARCODE_NAME` varchar(45) NOT NULL,
  `BARCODE_VALUE` varchar(3000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `BARCODE_TYPE`, `BARCODE_NAME`, `BARCODE_VALUE`) VALUES
(44, 'code128', 'Picking', '^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR6,6~SD15^JUS^LRN^CI0^XZ\r\n^XA\r\n^MMT\r\n^PW609\r\n^LL0406\r\n^LS0\r\n^FO160,0^GFA,02304,02304,00036,:Z64:\r\neJztks2O0zAUha+dMDGSoV4gESHTWvACZjVejRKVB/GOrUcaiUGKWvdHHXaw5HFSKmA7Ei8QmBdIxaaLDOCfLCq1G1j3SM61nOPPJzcGOOmkk/5f6cEkCrnBwsxCDjIu5kB8Eb1n4Ebjxp8fNVS9Z1IB99X4x6iGxKG8R2nrNoedYkX2OGcAuJ9Lt4lHdJnxvTAZeE5gSgVxs1vCZM+Do8dzjItC4+oY0UOO9hxhL8hEiGYIiSWKKCMare2F4wwWj5Mm5Dmf3XB1uW3HbVnz6vrd/a/t9q7+VmfwajNKjc+jwGIi5Asxs7YlhDzjQgm9XjiOWLx8n3vOFK0QLdiVWVuoKOdP6DXXukxcnnJT3rKQB+a+P0pYa4eUkJxKIvQYO06ysB92IQ9awgiYvFwjyDjP81RyY8obx3m+QbexP7CCh1ZK8dl9K/Ec4TjlMuSBT7E/6Ct6VDNjKpQmlOYsNUwXxQ4yXG7Qx7TPg0kjhCCAseMwIkBo9wbjmUtKYp6bJTdMGo6yxOdhkpmiyCF78OU74iz0By12VCkpB/NkSUnu2gO60UM4o7u7+aDxZ3VZ006HVVed16idjiZP67ez+7Z9U486s+mydbd/Me3P/ir6BMjWcCgEV71Hhp9eHPHg/hZHTnrUk8HrUFnobArHzkqsDVUFDk6OWAB+x1Ih/yWoO+o56aR/1l//soYs:0DC6\r\n^BY2,3,101^FT23,253^B3N,N,,Y,N\r\n^FD$$CONT.^FS\r\n^FT25,113^A0N,23,24^FH\\^FDWave number: $$Wave^FS\r\n^FT324,112^A0N,23,24^FH\\^FDDistro number: $$Distro^FS\r\n^FT20,334^A0N,23,24^FH\\^FDLocation Id: $$Location^FS\r\n^FT404,333^A0N,23,24^FH\\^FDPick Type: $$PT^FS\r\n^FT19,385^A0N,23,24^FH\\^FDDest Id: $$DEST^FS\r\n^FT404,386^A0N,23,24^FH\\^FDZone: $$ZONE^FS\r\n^PQ1,0,1,Y^XZ'),
(45, 'code128', 'Generic', '^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR6,6~SD15^JUS^LRN^CI0^XZ\r\n^XA\r\n^MMT\r\n^PW609\r\n^LL0406\r\n^LS0\r\n^FO192,32^GFA,02688,02688,00028,:Z64:\r\neJztkLFOwzAQQC81ijNUzsDiIWr6CZVYbkoHJL4jLJ0vYiBDpFhCKkyw8gV8AxsplejIL3jratSlQ0VxqqRNUT8AJD/Jsn32O98ZwOFwOP433A75O9gEEjuovbdpFhGAZ9fCTqa9nnS8fHcGoyZEg05em8zv5Ez9zhkeeV51duzxjqeA6VTH7BGZsV4iEqb3HvSzlbn5/C6iHMhb+GWfGs9TEOAknd29ICIgm4aLBzx4UhbZbP4RjaT1OL9/lo3HFIzXmG7nSg5tnT0Rsrf13isJKKt4FVFdYMm5aev0KoFA14opTOv+poK9HvqLsfaYiigAOuc+w31/WmAwTPWlkigBL4ToYdD+p0kGI8q+5lVU2Idv4yvf7tsvnISaqLTvjTXky+VTP9R5cxa/89mmSEJTxsrbrhahsXs4xRCCk3GHw/FX+AFeo17t:2521\r\n^BY3,3,136^FT87,284^BCN,,Y,N\r\n^FD>:$$CONT^FS\r\n^PQ1,0,1,Y^XZ'),
(46, 'code128', 'ASN', '^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR6,6~SD15^JUS^LRN^CI0^XZ\r\n^XA\r\n^MMT\r\n^PW609\r\n^LL0406\r\n^LS0\r\n^FO224,0^GFA,01280,01280,00020,:Z64:\r\neJztkTFOAzEQRf94ImxEtISKRXLIHsEgii0QbBUuQe6RIoqGKEoJV3KqXIJiJS5gOirCJhoj0VEilF+M5Kev57EMHPLvQoJBN38wBhJQ6GmA+S0nCwTgUpnDqkBrgAowyjzZc4q071llNZsTEd6z3HtkUNTekbKCBa0YfIT2LvfGFJEaYn+VHrJvheSCsHHX9dNCmcUM04Z6/mZI2We6Tctu1rXbao+2OC19Q/Qaht/7sbArdr5wLPleWnJpd75wgXHWLYxjMa6sIOrr0YZ9997+JJyt1Vfgbekh/PJcV5+6y2j9nuaIdtO/j7NR/NWnHPIX8wUgajEC:FDC9\r\n^BY3,3,102^FT74,249^BCN,,Y,N\r\n^FD>:$$CONT^FS\r\n^FT16,98^A0N,23,24^FH\\^FDASN number: $$ASN^FS\r\n^FT376,98^A0N,23,24^FH\\^FDAPPT number: $$APPT^FS\r\n^FT16,347^A0N,23,24^FH\\^FDPO number: $$PO^FS\r\n^PQ1,0,1,Y^XZ');

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE IF NOT EXISTS `facility` (
  `facility_id` varchar(255) NOT NULL,
  `delete_enable_flag` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`facility_id`, `delete_enable_flag`, `description`) VALUES
('OM', b'0', 'Oman WH'),
('QR', b'0', 'Qatar WH');

-- --------------------------------------------------------

--
-- Table structure for table `ipaddress`
--

CREATE TABLE IF NOT EXISTS `ipaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_flag` varchar(255) DEFAULT NULL,
  `barcode_type` varchar(255) DEFAULT NULL,
  `default_ip` int(11) DEFAULT NULL,
  `ip` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `printer_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKn5ruc99tiwxr0xu7hdt8wknhe` (`id`,`ip`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `ipaddress`
--

INSERT INTO `ipaddress` (`id`, `user_flag`, `barcode_type`, `default_ip`, `ip`, `port`, `printer_name`) VALUES
(20, 'anup', 'code128', 1, '192.168.120.23', 9100, 'Home');

-- --------------------------------------------------------

--
-- Table structure for table `pick_directive`
--

CREATE TABLE IF NOT EXISTS `pick_directive` (
  `case_pack_size` int(11) NOT NULL,
  `dest_id` varchar(255) NOT NULL,
  `distro_nbr` varchar(255) NOT NULL,
  `facility_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `lot_nbr` varchar(255) NOT NULL,
  `pick_from_container_id` varchar(255) NOT NULL,
  `pick_to_container_id` varchar(255) NOT NULL,
  `process_date` datetime NOT NULL,
  `wave_nbr` varchar(255) NOT NULL,
  `break_by_distro` varchar(255) DEFAULT NULL,
  `cube` varchar(255) DEFAULT NULL,
  `distro_ts` datetime DEFAULT NULL,
  `labels_printed_flag` varchar(255) DEFAULT NULL,
  `let_down_qty` varchar(255) DEFAULT NULL,
  `logical_chute` varchar(255) DEFAULT NULL,
  `on_hold` varchar(255) DEFAULT NULL,
  `pack_wave` varchar(255) DEFAULT NULL,
  `pallet_group_id` varchar(255) DEFAULT NULL,
  `pick_container_qty` int(11) NOT NULL,
  `pick_in_progress` varchar(255) DEFAULT NULL,
  `pick_order` varchar(255) DEFAULT NULL,
  `pick_type` varchar(255) DEFAULT NULL,
  `released` varchar(255) DEFAULT NULL,
  `seq_nbr` varchar(255) DEFAULT NULL,
  `unit_qty` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `wip_code` varchar(255) DEFAULT NULL,
  `work_directive_id` varchar(255) DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`case_pack_size`,`dest_id`,`distro_nbr`,`facility_id`,`item_id`,`lot_nbr`,`pick_from_container_id`,`pick_to_container_id`,`process_date`,`wave_nbr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `barcode`, `category`, `description`, `name`, `price`, `qty`) VALUES
(58, '1000000', 'Mobiles', 'Best in Class Micromax E313', 'Micromax', 5000, 20),
(59, '1000001', 'Mobiles', 'Best in Class Nokia X6', 'Nokia', 8000, 50),
(60, '1000002', 'Mobiles', 'Best in Class MiUi Note 4', 'MI Note 4', 13000, 10);

-- --------------------------------------------------------

--
-- Table structure for table `product_temp`
--

CREATE TABLE IF NOT EXISTS `product_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `UKifyv8om78cgy2a9nroxoy517y` (`user_id`,`role`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`, `user_id`) VALUES
(1, 'ROLE_ZEBRA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sequence`
--

CREATE TABLE IF NOT EXISTS `sequence` (
  `name` varchar(100) NOT NULL,
  `increment` int(11) NOT NULL DEFAULT '1',
  `min_value` int(11) NOT NULL DEFAULT '1',
  `max_value` bigint(20) NOT NULL DEFAULT '9223372036854775807',
  `cur_value` bigint(20) DEFAULT '1',
  `cycle` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sequence`
--

INSERT INTO `sequence` (`name`, `increment`, `min_value`, `max_value`, `cur_value`, `cycle`) VALUES
('my_sequence', -2, 0, 100, 94, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UKrany37860r76xeh1bngb1g4n9` (`user_name`,`password`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `enabled`, `first_name`, `last_name`, `password`, `user_name`) VALUES
(1, 'anup@gmail.com', 1, 'anup', 'mridha', '$2a$06$K311JYLvpaYv55HAP76yMeViE/TfITE2QZu5ApqP/c5qEtSL99ywq', 'anup');

-- --------------------------------------------------------

--
-- Table structure for table `xx_generic_labels`
--

CREATE TABLE IF NOT EXISTS `xx_generic_labels` (
  `PRINT_LABEL_GROUP_NBR` int(10) NOT NULL AUTO_INCREMENT,
  `CONTAINER_ID` varchar(255) NOT NULL,
  `FACILITY_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`PRINT_LABEL_GROUP_NBR`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `xx_generic_labels`
--

INSERT INTO `xx_generic_labels` (`PRINT_LABEL_GROUP_NBR`, `CONTAINER_ID`, `FACILITY_ID`) VALUES
(1, '100000', 'QR'),
(2, '100001', 'QR'),
(3, '100002', 'QR'),
(4, '100003', 'QR'),
(5, '100004', 'QR');

-- --------------------------------------------------------

--
-- Table structure for table `xx_generic_labels_temp`
--

CREATE TABLE IF NOT EXISTS `xx_generic_labels_temp` (
  `PRINT_LABEL_GROUP_NBR` int(10) NOT NULL AUTO_INCREMENT,
  `CONTAINER_ID` decimal(19,0) DEFAULT NULL,
  `FACILITY_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`PRINT_LABEL_GROUP_NBR`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
