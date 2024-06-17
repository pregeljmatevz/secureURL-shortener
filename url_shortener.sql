-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2024 at 02:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `url_shortener`
--

-- --------------------------------------------------------

--
-- Table structure for table `ip_data`
--

CREATE TABLE `ip_data` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `city_geoname_id` int(11) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_iso_code` varchar(10) DEFAULT NULL,
  `region_geoname_id` int(11) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `country_geoname_id` int(11) DEFAULT NULL,
  `country_is_eu` tinyint(1) DEFAULT NULL,
  `continent` varchar(255) DEFAULT NULL,
  `continent_code` varchar(10) DEFAULT NULL,
  `continent_geoname_id` int(11) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `is_vpn` tinyint(1) DEFAULT NULL,
  `timezone_name` varchar(255) DEFAULT NULL,
  `timezone_abbreviation` varchar(10) DEFAULT NULL,
  `timezone_gmt_offset` int(11) DEFAULT NULL,
  `timezone_current_time` time DEFAULT NULL,
  `timezone_is_dst` tinyint(1) DEFAULT NULL,
  `flag_emoji` varchar(10) DEFAULT NULL,
  `flag_unicode` varchar(20) DEFAULT NULL,
  `flag_png` varchar(255) DEFAULT NULL,
  `flag_svg` varchar(255) DEFAULT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `currency_code` varchar(10) DEFAULT NULL,
  `connection_autonomous_system_number` int(11) DEFAULT NULL,
  `connection_autonomous_system_organization` varchar(255) DEFAULT NULL,
  `connection_type` varchar(255) DEFAULT NULL,
  `connection_isp_name` varchar(255) DEFAULT NULL,
  `connection_organization_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ip_data`
--

INSERT INTO `ip_data` (`id`, `ip_address`, `city`, `city_geoname_id`, `region`, `region_iso_code`, `region_geoname_id`, `postal_code`, `country`, `country_code`, `country_geoname_id`, `country_is_eu`, `continent`, `continent_code`, `continent_geoname_id`, `longitude`, `latitude`, `is_vpn`, `timezone_name`, `timezone_abbreviation`, `timezone_gmt_offset`, `timezone_current_time`, `timezone_is_dst`, `flag_emoji`, `flag_unicode`, `flag_png`, `flag_svg`, `currency_name`, `currency_code`, `connection_autonomous_system_number`, `connection_autonomous_system_organization`, `connection_type`, `connection_isp_name`, `connection_organization_name`) VALUES
(97, '5.224.93.81', 'Marbella', 2514169, 'Andalusia', 'AN', 2593109, '29604', 'Spain', 'ES', 2510769, 1, 'Europe', 'EU', 6255148, -4.8838, 36.5149, 0, 'Europe/Madrid', 'CEST', 2, '14:20:43', 1, '🇪🇸', 'U+1F1EA U+1F1F8', 'https://static.abstractapi.com/country-flags/ES_flag.png', 'https://static.abstractapi.com/country-flags/ES_flag.svg', 'Euros', 'EUR', 12430, 'Vodafone Spain', 'Cellular', 'Vodafone Espana S.A.U.', ''),
(98, '5.224.93.81', 'Marbella', 2514169, 'Andalusia', 'AN', 2593109, '29604', 'Spain', 'ES', 2510769, 1, 'Europe', 'EU', 6255148, -4.8838, 36.5149, 0, 'Europe/Madrid', 'CEST', 2, '14:24:22', 1, '🇪🇸', 'U+1F1EA U+1F1F8', 'https://static.abstractapi.com/country-flags/ES_flag.png', 'https://static.abstractapi.com/country-flags/ES_flag.svg', 'Euros', 'EUR', 12430, 'Vodafone Spain', 'Cellular', 'Vodafone Espana S.A.U.', ''),
(99, '5.224.93.81', 'Marbella', 2514169, 'Andalusia', 'AN', 2593109, '29604', 'Spain', 'ES', 2510769, 1, 'Europe', 'EU', 6255148, -4.8838, 36.5149, 0, 'Europe/Madrid', 'CEST', 2, '14:24:28', 1, '🇪🇸', 'U+1F1EA U+1F1F8', 'https://static.abstractapi.com/country-flags/ES_flag.png', 'https://static.abstractapi.com/country-flags/ES_flag.svg', 'Euros', 'EUR', 12430, 'Vodafone Spain', 'Cellular', 'Vodafone Espana S.A.U.', '');

-- --------------------------------------------------------

--
-- Table structure for table `shortened_urls`
--

CREATE TABLE `shortened_urls` (
  `id` int(10) NOT NULL,
  `long_url` longtext NOT NULL,
  `short_url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shortened_urls`
--

INSERT INTO `shortened_urls` (`id`, `long_url`, `short_url`) VALUES
(1, 'https://www.amazon.com/Garmin-Smartwatch-Touchscreen-Monitoring-010-02173-11/dp/B07WLN9RYD?pf_rd_p=d22f02ec-561d-470e-9f56-891084a0600d&pd_rd_wg=Qo0Ro&pf_rd_r=019J72NE9TMCM3S11YXZ&ref_=pd_gw_unk&pd_rd_w=MWw7Q&pd_rd_r=8f8fe597-657d-46db-a9db-a43f22af852a', 'yglih'),
(2, 'https://www.youtube.com/watch?v=gIPlQOVDz0Q', 'f84pq'),
(3, 'https://www.youtube.com/watch?v=gIPlQOVDz0Q', 'z9wbh'),
(4, 'https://www.youtube.com/watch?v=gIPlQOVDz0Q', 'h08ap'),
(5, 'https://www.youtube.com/watch?v=gIPlQOVDz0Q', 'mp6wl'),
(6, 'https://www.youtube.com/watch?v=gIPlQOVDz0Q', 'f488e'),
(7, 'https://www.youtube.com/watch?v=1EJsX-w2NsI', 'ufqkj'),
(8, 'https://www.youtube.com/watch?v=1EJsX-w2NsI', '4t5dn'),
(9, 'https://www.youtube.com/watch?v=2wDDEL5ilyg', 'fqkgv'),
(10, 'https://www.youtube.com/watch?v=2wDDEL5ilyg', 'kv6um'),
(11, 'https://www.youtube.com/watch?v=2wDDEL5ilyg', 'rby4b'),
(12, 'https://www.youtube.com/watch?v=2wDDEL5ilyg', 'hf5fy'),
(13, 'https://www.youtube.com/watch?v=2wDDEL5ilyg', 'tl565'),
(14, 'https://www.youtube.com/watch?v=2wDDEL5ilyg', 'mav4o'),
(15, 'https://www.you vitube.com/watch?v=2wDDEL5ilyg', 'itrf2'),
(16, 'https://www.youtube.com/watch?v=2wDDEL5ilyg', 'x3rfl'),
(17, 'https://www.youtube.com/results?search_query=how+to+make+a+url+shortneer+php', '3myfh'),
(18, 'https://www.youtube.com/results?search_query=how+to+make+a+url+shortneer+php', 'gne1f'),
(19, 'https://www.youtube.com/results?search_query=how+to+make+a+url+shortneer+php', 'orm9w'),
(20, 'https://www.youtube.com/results?search_query=how+to+make+a+url+shortneer+php', 'hmhpi'),
(21, 'https://www.youtube.com/watch?v=gIPlQOVDz0Q', 'vgv46'),
(22, 'https://ipinfo.io/', '68tu5'),
(23, 'https://ipinfo.io/', '1wqew'),
(24, 'https://ipinfo.io/', 'b4oqo'),
(25, 'https://ipinfo.io/', '6qr7h');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ip_data`
--
ALTER TABLE `ip_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shortened_urls`
--
ALTER TABLE `shortened_urls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ip_data`
--
ALTER TABLE `ip_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `shortened_urls`
--
ALTER TABLE `shortened_urls`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
