-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 20, 2026 at 12:44 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u985819704_perpetual`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambulance_requests`
--

CREATE TABLE `ambulance_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `request_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `status` enum('pending','dispatched','en_route','arrived','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `requested_at` timestamp NOT NULL,
  `dispatched_at` timestamp NULL DEFAULT NULL,
  `arrived_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `estimated_arrival` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ambulance_requests`
--

INSERT INTO `ambulance_requests` (`id`, `user_id`, `request_id`, `name`, `phone`, `address`, `emergency`, `notes`, `latitude`, `longitude`, `status`, `requested_at`, `dispatched_at`, `arrived_at`, `completed_at`, `estimated_arrival`, `created_at`, `updated_at`) VALUES
(1, 1, 'AMB-691D552963FE9', 'ABIC Realty and Consultancy Corporation', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', 'accident', 'example', '14.64878530', '121.05093850', 'completed', '2025-11-18 21:27:04', '2025-11-18 22:02:28', '2025-11-18 22:03:10', '2025-11-18 22:03:16', '5:37 AM', '2025-11-18 21:27:05', '2025-11-18 22:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `category` enum('Update','Event','Alert','Development','Health','Notice') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `priority` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `date`, `category`, `description`, `content`, `image_url`, `is_active`, `priority`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Calapan City Launches 2025 Tourism and Cultural Fair', '2025-11-21', 'Event', 'Opening of the annual tourism and cultural celebration featuring local products, performances, and exhibits.', 'The City Government of Calapan invites all residents and visitors to join the 2025 Tourism and Cultural Fair on February 20–24, 2025, at the Calapan City Plaza. The event will showcase the best of Calapan’s local products, culinary delights, and cultural traditions.\nExpect performances from community groups, artisan displays, and booths featuring local MSMEs. This initiative aims to promote cultural appreciation and support local enterprises.\nEveryone is welcome. Admission is free.', NULL, 1, 100, '2025-11-20 17:38:14', '2025-11-24 16:33:13', '2025-11-24 16:33:13'),
(2, 'Calapan City Conducts Community Coastal Clean-Up', '2025-11-16', 'Event', 'City-wide clean-up activity in celebration of Environmental Awareness Month.\nContent:', 'In celebration of Environmental Awareness Month, the Calapan City LGU invites volunteers, youth groups, and barangay organizations to join the Community Coastal Clean-Up on November 16, 2025, starting at 6:00 AM along the coastline of Brgy. Navotas.\nParticipants are encouraged to bring reusable gloves and water containers. The LGU will provide cleaning tools and proper waste disposal coordination.\nLet’s work together to keep our city’s coastal areas clean and safe.', NULL, 1, 100, '2025-11-20 18:31:06', '2025-11-24 16:33:15', '2025-11-24 16:33:15'),
(3, 'Free Medical Mission for Calapan Residents', '2025-11-21', 'Notice', 'A city-sponsored medical outreach offering free check-ups, consultations, and basic services.\nContent:', 'The City Government of Calapan, through the City Health Office, will conduct a Free Medical Mission on April 12, 2025, from 8:00 AM to 3:00 PM at the Calapan City Gymnasium.\nAvailable services include general medical consultation, blood pressure screening, blood sugar testing, dental check-ups, and distribution of essential medicines.\nResidents are advised to bring a valid ID and their PhilHealth card (if available).\nThis program aims to ensure accessible healthcare for all Calapeños.', NULL, 1, 100, '2025-11-20 18:38:54', '2025-11-24 16:33:11', '2025-11-24 16:33:11'),
(4, 'Calapan City Farmers’ Market Grand Opening', '2025-11-21', 'Notice', 'Launch of the city’s official farmers’ market to promote local produce.\nContent:', 'The City Government of Calapan is pleased to announce the Grand Opening of the Calapan City Farmers’ Market on March 5, 2025, at the City Public Market Grounds from 7:00 AM to 5:00 PM.\nLocal farmers and producers will feature fresh vegetables, fruits, rice products, and handicrafts. The initiative aims to support local agriculture and provide residents access to fresh, affordable, and healthy products.\nCome and experience the vibrant flavors of Calapan while supporting local businesses.', NULL, 1, 100, '2025-11-20 18:43:19', '2025-11-24 16:33:08', '2025-11-24 16:33:08'),
(7, 'Pamplona Tres Holds Gender Sensitivity Seminars and Training Cum Team Building for Community Workforce', '2025-11-14', 'Event', 'A comprehensive Gender Sensitivity Seminar and Training Cum Team Building program conducted in Pamplona Tres, Las Piñas City to promote inclusivity, strengthen communication, and enhance teamwork among barangay staff and community volunteers.', 'Pamplona Tres, Las Piñas City — Barangay officials and community trainers successfully organized a Gender Sensitivity Seminar and Training Cum Team Building initiative aimed at improving awareness on gender-related issues and strengthening unity within the local workforce.\n\nThe seminar focused on educating participants about gender roles, equality, and the importance of eliminating stereotypes in public service. Through interactive discussions and real-life case scenarios, attendees learned how to provide more compassionate and inclusive support to residents—especially women, children, the elderly, and members of the LGBTQ+ community.\n\nFacilitators highlighted key topics such as gender-based discrimination, respectful communication, and creating safer community spaces. Participants were encouraged to reflect on their own biases and develop strategies for promoting fairness and respect in all barangay operations.\n\nThe Team Building component further enhanced collaboration and trust among staff members. Group challenges, problem-solving activities, and communication exercises helped reinforce the importance of teamwork in delivering effective community services.', NULL, 1, 100, '2025-11-24 16:34:09', '2025-11-24 16:34:09', NULL),
(8, 'LTIA Awarding and Training of the Lupong Tagapamayapa on the Implementation of Katarungang Pambarangay Law.', '2025-10-31', 'Event', 'A recognition and capacity-building event honoring outstanding Lupong Tagapamayapa members while strengthening their knowledge and skills in implementing the Katarungang Pambarangay Law to ensure fair, efficient, and community-based conflict resolution.', 'Pamplona Tres, Las Piñas City — Barangay officials, mediators, and community leaders gathered for the LTIA Awarding and Training of the Lupong Tagapamayapa, an event aimed at recognizing exemplary performance in barangay justice administration and further enhancing the capabilities of peacekeeping teams in implementing the Katarungang Pambarangay Law.\n\nDuring the awarding ceremony, outstanding Lupong Tagapamayapa members were honored for their dedication to maintaining peace and order, effective handling of disputes, and consistent delivery of community-based justice services. Officials noted that their performance contributes significantly to reducing court congestion and ensuring conflicts are resolved swiftly within the barangay level.\n\nFollowing the awarding program, participants underwent a comprehensive Training on the Implementation of the Katarungang Pambarangay Law, focusing on proper procedures for mediation, conciliation, and settlement documentation. Legal experts and trainers discussed the roles and responsibilities of lupon members, common challenges in barangay justice, and best practices for fair and impartial dispute resolution.', NULL, 1, 100, '2025-11-24 16:37:05', '2025-11-24 16:38:21', NULL),
(9, '7th Gawad Suhay ng Pag-Asa 2025 Awarding', '2025-10-30', 'Update', 'The 7th Gawad Suhay ng Pag-Asa 2025 Awarding celebrates individuals, groups, and community leaders who have shown exceptional dedication to public service, community development, and uplifting the lives of residents through various social welfare initiatives.', 'Pamplona Tres, Las Piñas City — Community leaders, local organizations, and outstanding public servants were honored during the 7th Gawad Suhay ng Pag-Asa 2025 Awarding, a prestigious recognition program celebrating exemplary contributions to community development, public service, and socio-civic initiatives.\n\nThe ceremony highlighted individuals and groups whose work has inspired hope and progress within their communities. Awardees were recognized for their involvement in programs such as livelihood development, health and nutrition services, youth empowerment, gender equality promotion, environmental protection, and humanitarian assistance.\n\nLocal officials emphasized that the Gawad Suhay ng Pag-Asa serves not only as recognition but also as an encouragement for others to continue advocating for collaborative and compassionate community service. “This award symbolizes the spirit of resilience and unity that drives our communities forward,” a barangay representative shared.\n\nThe event also featured presentations of successful community programs, testimonials from beneficiaries, and messages of support from partner agencies. Special citations were given to projects that demonstrated innovation, sustainability, and strong community engagement.\n\nAs the ceremony concluded, organizers announced plans to expand the award categories in the coming years to accommodate more community-driven initiatives and recognize emerging leaders dedicated to public service.', NULL, 1, 100, '2025-11-24 16:40:19', '2025-11-24 16:40:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_blotters`
--

CREATE TABLE `barangay_blotters` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `incident_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `incident_date` date NOT NULL,
  `incident_time` time NOT NULL,
  `incident_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `narrative` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `complaint_against` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `witness1_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness1_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness2_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness2_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('filed','under_investigation','resolved','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'filed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangay_blotters`
--

INSERT INTO `barangay_blotters` (`id`, `user_id`, `full_name`, `email`, `age`, `gender`, `address`, `contact_number`, `incident_type`, `incident_date`, `incident_time`, `incident_location`, `narrative`, `complaint_against`, `witness1_name`, `witness1_contact`, `witness2_name`, `witness2_contact`, `status`, `created_at`, `updated_at`, `approved_at`, `rejected_at`) VALUES
(1, 1, 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', 25, 'male', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '+639456754591', 'harassment', '2025-11-18', '13:24:00', 'asd', 'asd', 'asd', 'asd', '09456754591', 'asdasd', '09456754591', 'filed', '2025-11-23 21:24:51', '2025-11-23 21:24:51', NULL, NULL),
(3, 1, 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', 25, 'male', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '+639456754591', 'harassment', '2025-11-18', '13:24:00', 'asd', 'asd', 'asd', 'asd', '09456754591', 'asdasd', '09456754591', 'filed', '2025-11-23 21:25:09', '2025-11-23 21:25:09', NULL, NULL),
(4, 1, 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', 25, 'male', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '+639456754591', 'harassment', '2025-11-18', '13:24:00', 'asd', 'asd', 'asd', 'asd', '09456754591', 'asdasd', '09456754591', 'filed', '2025-11-23 21:28:52', '2025-11-23 21:28:52', NULL, NULL),
(5, 1, 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', 25, 'male', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '09456754591', 'accident', '2025-11-19', '16:29:00', 'asdads', 'asd', 'asd', 'asdasd', '09456754591', 'asdasd', '09456754591', 'filed', '2025-11-23 21:29:20', '2025-11-23 21:29:20', NULL, NULL),
(6, 1, 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', 25, 'female', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '+639456754591', 'property_damage', '2025-11-11', '16:30:00', 'asdasd', 'asd', 'asdasdasd', 'asdas', '09456754591', 'asdasd', '09456754591', 'filed', '2025-11-23 21:30:46', '2025-11-23 21:30:46', NULL, NULL),
(7, 1, 'Zel Mendoza', 'user.hazel@gmail.com', 21, 'female', '47 Polaris, Makati City, 1209 Metro Manila', '98798797', 'disturbance', '2024-02-12', '02:12:00', 'ads', 'dsf', '21', 'des', 'dsv', 'ds', 'ds', 'filed', '2026-01-18 21:44:37', '2026-01-18 21:44:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barangay_clearances`
--

CREATE TABLE `barangay_clearances` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `age` int NOT NULL,
  `sex` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `civil_status` enum('single','married','widowed','divorced','separated') COLLATE utf8mb4_unicode_ci NOT NULL,
  `years_of_residency` int NOT NULL,
  `barangay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_id_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected','processing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangay_clearances`
--

INSERT INTO `barangay_clearances` (`id`, `user_id`, `reference_number`, `full_name`, `email`, `phone`, `address`, `birth_date`, `age`, `sex`, `civil_status`, `years_of_residency`, `barangay`, `purpose`, `valid_id_path`, `status`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 'BC-2025-048BADE6', 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '2025-11-13', 25, 'male', 'widowed', 5, 'Campos Rueda Building', 'employement', 'barangay-clearances/valid-ids/974jGbAFL8Dp5n55ymxXiwSYua1t79ntakr01Hyw.png', 'approved', NULL, '2025-11-13 00:39:50', '2025-11-13 00:39:50'),
(2, 1, 'BC-2025-41F88E66', 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '2025-11-15', 25, 'female', 'married', 5, 'Campos Rueda Building', 'asdas', 'barangay-clearances/valid-ids/mwD0xP3uncPryPWPoaVK1s48G3h0LZs936QPFBTd.png', 'rejected', NULL, '2025-11-13 17:17:33', '2025-11-13 17:17:33'),
(3, 1, 'BC-2026-C7FD6E2E', 'Zel Mendoza', 'user.hazel@gmail.com', '98798797', '47 Polaris, Makati City, 1209 Metro Manila', '2003-02-11', 22, 'male', 'single', 2, '47 Polaris', 'sda', 'barangay-clearances/valid-ids/1eGTcLZfX0hn3KMQTCTFuSmdB3HAunjBpsnKcm7M.png', 'pending', NULL, '2026-01-18 21:47:26', '2026-01-18 21:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `building_permits`
--

CREATE TABLE `building_permits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_scope` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lot_area` decimal(10,2) DEFAULT NULL,
  `floor_area` decimal(10,2) DEFAULT NULL,
  `number_of_floors` int NOT NULL,
  `estimated_cost` decimal(15,2) NOT NULL,
  `owner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `barangay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building_plans_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `land_title_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','approved','rejected','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `rejection_reason` text COLLATE utf8mb4_unicode_ci,
  `approved_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `building_permits`
--

INSERT INTO `building_permits` (`id`, `user_id`, `reference_number`, `project_type`, `project_scope`, `project_description`, `lot_area`, `floor_area`, `number_of_floors`, `estimated_cost`, `owner_name`, `owner_email`, `owner_phone`, `owner_address`, `property_address`, `barangay`, `building_plans_path`, `land_title_path`, `status`, `rejection_reason`, `approved_at`, `completed_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'BP-691686A557CEF', 'new-construction', 'commercial', 'asdasd', '12.00', '12.00', 12, '67777.00', 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', 'Urban Avenue', 'Campos Rueda Building', 'uploads/building-permits/plans/1763083941_plans_69171795-8965-4d2a-8a8b-20657635dcfa_removalai_preview.png', 'uploads/building-permits/titles/1763083941_title_abic_consultancy_logo.png', 'approved', NULL, '2025-11-17 23:08:45', NULL, '2025-11-13 17:32:21', '2025-11-17 23:08:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_partners`
--

CREATE TABLE `business_partners` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `admin_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_partners`
--

INSERT INTO `business_partners` (`id`, `user_id`, `business_name`, `website_link`, `photo`, `description`, `category`, `status`, `admin_note`, `created_at`, `updated_at`) VALUES
(1, 1, 'Name updated', 'http://localhost:3000/dashboard/citizen/services', 'business_photos/d12xDTxEGePazOA58rXq9emPqXe3UIGpZJV85pqI.png', 'dfsfsdfdf', 'E-Commerce', 'pending', NULL, '2026-01-18 23:04:54', '2026-01-18 23:05:43'),
(2, 1, 'Name updated', 'http://localhost:3000/dashboard/citizen/services', 'business_photos/1768806668_photo_video-removebg-preview.png', 'dfsfsdfdf', 'E-Commerce', 'pending', NULL, '2026-01-18 23:11:08', '2026-01-18 23:11:08'),
(3, 1, 'Name updated', 'http://localhost:3000/dashboard/citizen/services', 'business_photos/1768807570_photo_video-removebg-preview.png', 'dfsfsdfdf', 'E-Commerce', 'pending', NULL, '2026-01-18 23:26:10', '2026-01-18 23:26:10'),
(4, 1, 'Name updated', 'http://localhost:3000/dashboard/citizen/services', 'business_photos/1768807571_photo_video-removebg-preview.png', 'dfsfsdfdf', 'E-Commerce', 'pending', NULL, '2026-01-18 23:26:11', '2026-01-18 23:26:11'),
(5, 1, 'Name updated', 'http://localhost:3000/dashboard/citizen/services', 'business_photos/1768807572_photo_video-removebg-preview.png', 'dfsfsdfdf', 'E-Commerce', 'pending', NULL, '2026-01-18 23:26:12', '2026-01-18 23:26:12'),
(6, 1, 'Name updated', 'http://localhost:3000/dashboard/citizen/services', 'business_photos/1768807573_photo_video-removebg-preview.png', 'dfsfsdfdf', 'E-Commerce', 'pending', NULL, '2026-01-18 23:26:13', '2026-01-18 23:26:13'),
(7, 1, 'Name updated', 'http://localhost:3000/dashboard/citizen/services', 'business_photos/1768807574_photo_video-removebg-preview.png', 'dfsfsdfdf', 'E-Commerce', 'pending', NULL, '2026-01-18 23:26:14', '2026-01-18 23:26:14'),
(8, 1, 'Name updated', 'http://localhost:3000/dashboard/citizen/services', 'business_photos/1768807575_photo_video-removebg-preview.png', 'dfsfsdfdf', 'E-Commerce', 'pending', NULL, '2026-01-18 23:26:15', '2026-01-18 23:26:15'),
(9, 1, 'Name updated', 'http://localhost:3000/dashboard/citizen/services', 'business_photos/1768807576_photo_video-removebg-preview.png', 'dfsfsdfdf', 'E-Commerce', 'pending', NULL, '2026-01-18 23:26:16', '2026-01-18 23:26:16'),
(10, 1, 'Name updated', 'http://localhost:3000/dashboard/citizen/services', 'business_photos/1768812074_photo_video-removebg-preview.png', 'dfsfsdfdf', 'E-Commerce', 'pending', NULL, '2026-01-19 00:41:14', '2026-01-19 00:41:14');

-- --------------------------------------------------------

--
-- Table structure for table `business_permits`
--

CREATE TABLE `business_permits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_category_other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `barangay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lot_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor_area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `rejection_reason` text COLLATE utf8mb4_unicode_ci,
  `permit_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_at` date DEFAULT NULL,
  `expires_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_permits`
--

INSERT INTO `business_permits` (`id`, `user_id`, `business_name`, `business_type`, `business_category`, `business_category_other`, `business_description`, `owner_name`, `owner_email`, `owner_phone`, `owner_address`, `business_address`, `barangay`, `lot_number`, `floor_area`, `status`, `rejection_reason`, `permit_number`, `approved_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Infinitech Advertising Corporation', 'partnership', 'real-estate', NULL, 'qweqwe', 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', 'asasd', 'silonay Calapan city oriental mindoro', '123', '123', 'pending', NULL, NULL, NULL, NULL, '2025-11-13 16:37:28', '2025-11-13 16:37:28'),
(2, 1, 'Infinitech Advertising Corporation', 'partnership', 'food', NULL, 'asdasd', 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', 'asdasd', 'silonay Calapan city oriental mindoro', '123', '123', 'pending', NULL, NULL, NULL, NULL, '2025-11-13 17:13:41', '2025-11-13 17:13:41');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cedulas`
--

CREATE TABLE `cedulas` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `civil_status` enum('single','married','widowed','separated') COLLATE utf8mb4_unicode_ci NOT NULL,
  `citizenship` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tin_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` decimal(5,2) NOT NULL,
  `height_unit` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cm',
  `weight` decimal(5,2) NOT NULL,
  `weight_unit` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kg',
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cedulas`
--

INSERT INTO `cedulas` (`id`, `user_id`, `full_name`, `email`, `phone`, `address`, `birth_date`, `civil_status`, `citizenship`, `occupation`, `tin_number`, `height`, `height_unit`, `weight`, `weight_unit`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '2004-02-13', 'married', 'Filipino', 'asdasd', '123123123123123', '170.00', 'cm', '65.00', 'kg', 'approved', '2025-11-13 17:59:48', '2025-11-17 23:29:22'),
(2, 1, 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '2002-02-14', 'married', 'Filipino', 'asdasd', '123123', '170.00', 'cm', '65.00', 'kg', 'approved', '2025-11-13 23:05:46', '2025-11-17 23:22:18');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('unread','read','replied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Justin De Castro', 'decastrojustin321@gmail.com', 'Password', 'I forgot my password', 'replied', '2025-11-18 19:09:37', '2025-11-18 22:24:48'),
(2, 'Justin', 'decastrojustin321@gmail.com', 'Excample', 'asasd', 'replied', '2025-11-18 19:14:23', '2025-11-18 22:25:38'),
(3, 'justin', 'decastrojustin321@gmail.com', 'asd', 'asd', 'unread', '2025-11-19 23:02:58', '2025-11-19 23:02:58'),
(4, 'New New', 'new@gmail.com', 'New Message', 'Message', 'unread', '2025-12-12 07:26:55', '2025-12-12 07:26:55'),
(5, 'FirstName LastName', 'name@gmail.com', 'Bob the Builder', 'Bob the Builder', 'unread', '2025-12-12 07:27:52', '2025-12-12 07:27:52');

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint UNSIGNED NOT NULL,
  `contact_id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_replies`
--

INSERT INTO `contact_replies` (`id`, `contact_id`, `admin_id`, `message`, `sent_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'hello there', '2025-11-18 22:24:48', '2025-11-18 22:24:48', '2025-11-18 22:24:48'),
(2, 2, 2, 'hi', '2025-11-18 22:25:38', '2025-11-18 22:25:38', '2025-11-18 22:25:38'),
(3, 2, 2, 'qweryt', '2025-11-18 22:26:40', '2025-11-18 22:26:40', '2025-11-18 22:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `good_moral_certificates`
--

CREATE TABLE `good_moral_certificates` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `age` int NOT NULL,
  `sex` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `civil_status` enum('single','married','widowed','divorced','separated') COLLATE utf8mb4_unicode_ci NOT NULL,
  `barangay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `years_of_residency` int NOT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_id_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proof_of_residency_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected','released') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `released_at` timestamp NULL DEFAULT NULL,
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_certificates`
--

CREATE TABLE `health_certificates` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `age` int NOT NULL,
  `sex` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_allergies` tinyint(1) NOT NULL DEFAULT '0',
  `allergies` text COLLATE utf8mb4_unicode_ci,
  `has_medications` tinyint(1) NOT NULL DEFAULT '0',
  `medications` text COLLATE utf8mb4_unicode_ci,
  `has_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `conditions` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','under_review','approved','rejected','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `health_certificates`
--

INSERT INTO `health_certificates` (`id`, `reference_number`, `user_id`, `full_name`, `email`, `phone`, `address`, `birth_date`, `age`, `sex`, `purpose`, `has_allergies`, `allergies`, `has_medications`, `medications`, `has_conditions`, `conditions`, `status`, `remarks`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'HC-2025-65BDA91E', 1, 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '1998-06-04', 27, 'male', 'employment', 1, 'sdf', 0, NULL, 0, NULL, 'completed', 'asd', '2025-11-17 20:55:46', '2025-11-18 18:32:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `indigency_certificates`
--

CREATE TABLE `indigency_certificates` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `age` int NOT NULL,
  `sex` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `civil_status` enum('single','married','widowed','divorced','separated') COLLATE utf8mb4_unicode_ci NOT NULL,
  `barangay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `years_of_residency` int NOT NULL,
  `monthly_income` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_dependents` int NOT NULL DEFAULT '0',
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason_for_indigency` text COLLATE utf8mb4_unicode_ci,
  `valid_id_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supporting_document_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected','released') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `admin_remarks` text COLLATE utf8mb4_unicode_ci,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `released_at` timestamp NULL DEFAULT NULL,
  `processed_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `indigency_certificates`
--

INSERT INTO `indigency_certificates` (`id`, `user_id`, `reference_number`, `full_name`, `email`, `phone`, `address`, `birth_date`, `age`, `sex`, `civil_status`, `barangay`, `years_of_residency`, `monthly_income`, `number_of_dependents`, `purpose`, `reason_for_indigency`, `valid_id_path`, `supporting_document_path`, `status`, `admin_remarks`, `approved_at`, `rejected_at`, `released_at`, `processed_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'IC-2025-C261B47B', 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '1998-06-04', 27, 'male', 'single', 'Campos Rueda Building', 5, '5000', 4, 'Educational Assistance', 'N/A', 'uploads/indigency-certificates/valid-ids/1763948437_6923b79568a86_validid.png', 'uploads/indigency-certificates/supporting-docs/1763948437_6923b79569193_support.png', 'approved', NULL, '2025-11-23 23:05:23', NULL, NULL, 2, '2025-11-23 17:40:37', '2025-11-23 23:05:23'),
(2, 1, 'IC-2025-78FE305C', 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '2000-04-06', 25, 'male', 'married', 'Campos Rueda Building', 5, '10000', 5, 'Educational', 'asd', 'uploads/indigency-certificates/valid-ids/1763960313_6923e5f939e2e_validid.png', 'uploads/indigency-certificates/supporting-docs/1763960313_6923e5f93a20f_support.png', 'rejected', NULL, NULL, '2025-11-23 23:24:28', NULL, 2, '2025-11-23 20:58:33', '2025-11-23 23:24:28');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `legitimacy_requests`
--

CREATE TABLE `legitimacy_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chapter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fraternity_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `signatory_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_note` text COLLATE utf8mb4_unicode_ci,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_assistances`
--

CREATE TABLE `medical_assistances` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `age` int NOT NULL,
  `sex` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnosis` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hospital_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimated_cost` decimal(12,2) NOT NULL,
  `monthly_income` decimal(12,2) NOT NULL,
  `assistance_amount_requested` decimal(12,2) NOT NULL,
  `supporting_documents` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','under_review','approved','rejected','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medical_assistances`
--

INSERT INTO `medical_assistances` (`id`, `user_id`, `reference_number`, `full_name`, `email`, `phone`, `address`, `birth_date`, `age`, `sex`, `diagnosis`, `hospital_name`, `doctor_name`, `estimated_cost`, `monthly_income`, `assistance_amount_requested`, `supporting_documents`, `status`, `remarks`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'MA-2025-4E4EC65B', 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '1998-06-04', 27, 'male', 'example', 'Maria Estrella General Hospital', 'Justin De Castro Phd', '25000.00', '10000.00', '15000.00', 'medical-assistance-documents/1763435748_French fries.jpg', 'pending', NULL, '2025-11-17 19:15:49', '2025-11-17 19:15:49', NULL),
(2, NULL, 'MA-2025-9D53511D', 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '1998-06-04', 27, 'male', 'asd', 'asd', 'asd', '50000.00', '15000.00', '25000.00', 'medical-assistance-documents/1763437013_French fries.jpg', 'pending', NULL, '2025-11-17 19:36:53', '2025-11-17 19:36:53', NULL),
(3, 1, 'MA-2025-FBE1AA9C', 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '1998-06-04', 27, 'male', 'asdasdas', 'dasd', 'asdasd', '123123123.00', '123123123.00', '123123.00', 'medical-assistance-documents/1763442622_Calapan_City_Logo-1.png', 'pending', NULL, '2025-11-17 21:10:22', '2025-11-17 21:10:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_13_055132_create_personal_access_tokens_table', 1),
(5, '2025_11_13_080241_create_barangay_clearances_table', 1),
(6, '2025_11_14_000052_create_business_permits_table', 1),
(7, '2025_11_14_012650_create_building_permits_table', 1),
(8, '2025_11_14_013716_create_cedulas_table', 1),
(9, '2025_11_14_053011_create_reports_table', 1),
(10, '2025_11_14_070353_add_height_weight_units_to_cedulas_table', 1),
(11, '2025_11_18_030714_create_medical_assistances_table', 1),
(12, '2025_11_18_035833_add_user_id_to_medical_assistance_table', 1),
(13, '2025_11_18_045524_create_health_certificates_table', 1),
(14, '2025_11_18_052334_create_news_table', 1),
(15, '2025_11_19_011209_add_rejection_reason_to_users_table', 1),
(16, '2025_11_19_012404_add_deactivated_status_to_users_table', 1),
(17, '2025_11_19_025058_create_contacts_table', 1),
(18, '2025_11_19_052220_create_ambulance_requests_table', 1),
(19, '2025_11_19_061743_create_contact_replies_table', 1),
(20, '2025_11_21_012102_create_announcements_table', 1),
(21, '2025_11_21_015656_create_subscribers_table', 1),
(22, '2025_11_24_013150_create_indigency_certificates_table', 1),
(23, '2025_11_24_020539_create_residency_certificates_table', 1),
(24, '2025_11_24_021822_create_good_moral_certificates_table', 1),
(25, '2025_11_24_050137_create_barangay_blotters_table', 1),
(26, '2025_11_24_065922_add_approved_and_rejected_timestamps_to_barangay_blotters_table', 1),
(27, '2025_11_24_065948_add_approved_and_rejected_timestamps_to_good_moral_certificates_table', 1),
(28, '2025_11_24_070028_add_approved_and_rejected_timestamps_to_residency_certificates_table', 1),
(29, '2026_01_19_025533_create_legitimacy_requests_table', 1),
(30, '2026_01_19_035354_create_business_partners_table', 1),
(33, '2026_01_17_101048_add_image_url_to_announcements_table', 2),
(34, '2026_01_20_002257_create_vlogs_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('draft','published','archived') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `published_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `category`, `image`, `status`, `published_at`, `author_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'LGU Launches New Road Rehabilitation Project', 'The Local Government Unit has officially initiated the P25M road rehabilitation project to improve accessibility and transportation efficiency across the municipality. The project is expected to be completed within six months and will benefit over 15,000 residents', 'Development', 'images/news/1763445243_RILqNAdpde.png', 'published', '2025-11-18 05:48:00', 2, '2025-11-17 21:54:03', '2025-11-24 00:30:01', '2025-11-24 00:30:01'),
(2, 'Pamplona Tres Launches Digital Community Service Platform', 'Pamplona Tres, Las Piñas City — The barangay officially launched its new digital community service platform aimed at improving public service accessibility for residents. The system provides online access to barangay documents, real-time announcements, and service requests, significantly reducing waiting times at the barangay hall.\r\n\r\nBarangay officials stated that the project is part of their goal to modernize local governance and enhance transparency. Residents welcomed the initiative, noting that the digital features will make it easier to stay updated with community programs and schedules. The barangay plans to expand the system with additional features in the coming months.', 'Development', 'images/news/1763972933_gBp75Q9504.png', 'published', '2025-11-24 08:28:00', 2, '2025-11-24 00:28:53', '2025-11-24 00:28:53', NULL),
(3, 'Small Businesses in Pamplona Tres Thrive Through New Support Program', 'Pamplona Tres, Las Piñas City — Local entrepreneurs are benefiting from a new micro-business support program launched this week by the barangay council in partnership with private sector groups. The program includes free training sessions on financial literacy, digital marketing, and business registration.\r\n\r\nDozens of small business owners, including online sellers and home-based entrepreneurs, attended the first workshop held at the barangay multipurpose hall. According to organizers, the initiative aims to help local businesses become more competitive and sustainable. Additional training sessions will be offered every month to ensure continuous growth for the community’s micro-enterprises.', 'Business', 'images/news/1763973691_dQfv9WF1lV.png', 'published', '2025-11-24 08:41:00', 2, '2025-11-24 00:41:31', '2025-11-24 00:41:31', NULL),
(4, 'Pamplona Tres Nutrition Scholar Receives 2024 Most Outstanding Regional Barangay Nutrition Scholar Award', 'Pamplona Tres, Las Piñas City — The community of Pamplona Tres celebrated a major milestone this week as its Barangay Nutrition Scholar (BNS) was recognized as the 2024 Most Outstanding Regional Barangay Nutrition Scholar, bringing honor to the barangay and highlighting its strong commitment to public health and nutrition.\r\n\r\nThe award was presented during the Regional Nutrition Awarding Ceremony, where top-performing BNS workers from various cities and municipalities were recognized for their exceptional contributions to child nutrition, community health programs, and grassroots nutrition interventions.\r\n\r\nAccording to barangay officials, the Pamplona Tres BNS stood out for her dedication to monitoring the nutrition status of children, conducting household visits, spearheading feeding programs, and providing regular counseling to parents on proper nutrition and child care. Her efforts contributed to the improvement of local nutrition indicators and the successful implementation of several community health initiatives.\r\n\r\nResidents and local leaders expressed pride in the recognition, noting that it reflects not only the hard work of the awardee but also the strong collaboration between the barangay health office, volunteers, and community partners.', 'Health', 'images/news/1764030116_TJDnwCcLN9.png', 'published', '2025-11-25 00:21:00', 2, '2025-11-24 16:21:56', '2025-11-24 16:32:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '0527f52f206c14916a9d8c72b55a83ed812562a88fed2f6fffc56f10fd61811b', '[\"*\"]', '2026-01-18 23:56:18', NULL, '2026-01-18 21:16:35', '2026-01-18 23:56:18'),
(34, 'App\\Models\\User', 2, 'auth_token', 'fee14839a18037b4612516c10d8667beda7d6efb42275bf87c699ec3f965aa05', '[\"*\"]', '2026-01-18 22:16:02', NULL, '2026-01-18 21:20:34', '2026-01-18 22:16:02'),
(35, 'App\\Models\\User', 2, 'auth_token', 'a1087fa7b3b12ff6a4d2135e3a540678afeec58d6f78e4e59be4dbafeb861fa8', '[\"*\"]', '2026-01-18 22:18:43', NULL, '2026-01-18 22:17:50', '2026-01-18 22:18:43'),
(36, 'App\\Models\\User', 2, 'auth_token', '276ea325093afead4240591395d545f66c76436dbccd9ad483239bbcfedc2871', '[\"*\"]', '2026-01-18 22:52:49', NULL, '2026-01-18 22:32:21', '2026-01-18 22:52:49'),
(37, 'App\\Models\\User', 1, 'auth_token', '778e84b62bb40fc0e5c04f52e0530ed6e8036c4010da28af2a08476b3103384a', '[\"*\"]', '2026-01-18 23:02:06', NULL, '2026-01-18 23:01:48', '2026-01-18 23:02:06'),
(38, 'App\\Models\\User', 2, 'auth_token', '35fa5319479f7e40a464f58b57e4238379b053ed57f5162233007b92d50b059b', '[\"*\"]', '2026-01-18 23:03:25', NULL, '2026-01-18 23:02:19', '2026-01-18 23:03:25'),
(39, 'App\\Models\\User', 1, 'auth_token', 'c92359ff260292f5d153b02e6f73659bd023688c96b07d38678b61e6202cccf7', '[\"*\"]', '2026-01-18 23:05:22', NULL, '2026-01-18 23:04:30', '2026-01-18 23:05:22'),
(40, 'App\\Models\\User', 2, 'auth_token', 'b06fd1835be1f93c10007e12a68fc61dc03eafffe7d41007ba9f3a992249661f', '[\"*\"]', '2026-01-18 23:10:48', NULL, '2026-01-18 23:05:31', '2026-01-18 23:10:48'),
(41, 'App\\Models\\User', 1, 'auth_token', '343ebb1d3bbbd8e7ee403431baafc42a571a502ab7d670a9e683f3e8a66393c5', '[\"*\"]', '2026-01-19 00:41:14', NULL, '2026-01-18 23:10:57', '2026-01-19 00:41:14'),
(42, 'App\\Models\\User', 2, 'auth_token', 'c1406e84a49696e967f8321a714060f1193b0c7b050f29464c2f4107bee70ebd', '[\"*\"]', '2026-01-18 23:27:42', NULL, '2026-01-18 23:27:13', '2026-01-18 23:27:42'),
(43, 'App\\Models\\User', 2, 'auth_token', 'b2e633b7a20a5157da2d4e1ed0f949d67b26609b7a266fd126d0f7d4ac4830bc', '[\"*\"]', '2026-01-19 16:02:31', NULL, '2026-01-18 23:51:00', '2026-01-19 16:02:31'),
(44, 'App\\Models\\User', 2, 'auth_token', 'be936844743f8311e4bae3b96c9530c3d43fe19f7dcbfb9815ccf561845844e2', '[\"*\"]', '2026-01-19 00:09:12', NULL, '2026-01-18 23:56:52', '2026-01-19 00:09:12'),
(45, 'App\\Models\\User', 2, 'auth_token', 'b6a1b8e4eaeaf9484f2368837b60ffcfb4650615fde56711b1b3eeb0e5adaa18', '[\"*\"]', '2026-01-19 16:26:17', NULL, '2026-01-19 16:03:04', '2026-01-19 16:26:17'),
(46, 'App\\Models\\User', 2, 'auth_token', '96f033206298aa2c62203f4f27a1d044e80c418aa539f0af6df6bcacd1c4f9b5', '[\"*\"]', '2026-01-19 16:39:08', NULL, '2026-01-19 16:37:25', '2026-01-19 16:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint UNSIGNED NOT NULL,
  `report_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category` enum('road','streetlight','garbage','drainage','traffic','vandalism','noise','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urgency` enum('low','medium','high') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `status` enum('pending','under_review','in_progress','resolved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `timestamp` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `report_id`, `user_id`, `category`, `title`, `description`, `location`, `urgency`, `status`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, 'RPT-7KURLTQLZK', 1, 'road', 'humps broken', 'nakakadisgrasya po ang humps', 'pio del pilar', 'high', 'pending', '2025-11-13 21:50:44', '2025-11-13 21:50:45', '2025-11-13 21:50:45'),
(2, 'RPT-LJFVDLE70S', 1, 'garbage', 'garbage waste', 'improper disposal of garbage', 'masipit', 'low', 'pending', '2025-11-13 21:53:38', '2025-11-13 21:53:39', '2025-11-13 21:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `report_files`
--

CREATE TABLE `report_files` (
  `id` bigint UNSIGNED NOT NULL,
  `report_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_files`
--

INSERT INTO `report_files` (`id`, `report_id`, `name`, `path`, `type`, `size`, `created_at`, `updated_at`) VALUES
(1, 1, '69171795-8965-4d2a-8a8b-20657635dcfa_removalai_preview.png', 'reports/1/5hGF3VOsPuBINN59VYGKj7NEC00MOmQLv4I8fBDw.png', 'image', 183152, '2025-11-13 21:50:45', '2025-11-13 21:50:45'),
(2, 1, 'abic_consultancy_logo.png', 'reports/1/szsgWnlVpPTqaQuwhqKZZFX6Cvb7InIqPq5OZhY0.png', 'image', 261569, '2025-11-13 21:50:45', '2025-11-13 21:50:45'),
(3, 2, '69171795-8965-4d2a-8a8b-20657635dcfa_removalai_preview.png', 'reports/2/Y9V9lPRwyZfgTP5bHaoVXvr4RO2QTXgYoQHDf335.png', 'image', 183152, '2025-11-13 21:53:39', '2025-11-13 21:53:39'),
(4, 2, 'abic_consultancy_logo.png', 'reports/2/LYHYL7ymsivcQCnd59UOpwxW3JAjEWbjgiDz9fbr.png', 'image', 261569, '2025-11-13 21:53:39', '2025-11-13 21:53:39'),
(5, 2, 'abic-logo.png', 'reports/2/GCdylPI5R8dDzi0JO0MiJqhc617extm6cC3NVyFF.png', 'image', 69847, '2025-11-13 21:53:39', '2025-11-13 21:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `residency_certificates`
--

CREATE TABLE `residency_certificates` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `age` int NOT NULL,
  `sex` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `civil_status` enum('single','married','widowed','divorced','separated') COLLATE utf8mb4_unicode_ci NOT NULL,
  `barangay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `years_of_residency` int NOT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_id_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proof_of_residency_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `rejection_reason` text COLLATE utf8mb4_unicode_ci,
  `processed_at` timestamp NULL DEFAULT NULL,
  `processed_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `residency_certificates`
--

INSERT INTO `residency_certificates` (`id`, `user_id`, `reference_number`, `full_name`, `email`, `phone`, `address`, `birth_date`, `age`, `sex`, `civil_status`, `barangay`, `years_of_residency`, `occupation`, `purpose`, `valid_id_path`, `proof_of_residency_path`, `status`, `rejection_reason`, `processed_at`, `processed_by`, `created_at`, `updated_at`, `approved_at`, `rejected_at`) VALUES
(1, 1, 'RC-20251124-PICFGR', 'ABIC Realty and Consultancy Corporation', 'infinitech.justin2024@gmail.com', '+639456754591', 'Unit 202, Campos Rueda Building, Urban Avenue, Makati City', '1998-06-04', 27, 'male', 'single', 'Campos Rueda Building', 5, 'Self Employed', 'School Requirements', 'uploads/residency_certificates/valid_ids/1763950542_6923bfce87f2c.png', 'uploads/residency_certificates/proof_of_residency/1763950542_6923bfce883e5.png', 'approved', NULL, NULL, 2, '2025-11-23 18:15:42', '2025-11-23 23:04:39', '2025-11-23 23:04:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2JUuTeZciedEVflEJJfP47K56hBAm0h0veUVwltc', NULL, '66.249.71.132', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.7499.192 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmY5cHJkT1REYXQ5UjZpZnNtb0YwR256R3lSUEFCUE1YOXRSNzBhaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3LmluZmluaXRlY2gtYXBpMTEuc2l0ZSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768462148),
('4hAO2omVzQJPDUE24RK7B8UUuo4uQTXLnXUV43fE', NULL, '143.198.141.121', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVhzMU10eTd6NGdqS2RGWENidGdNcEh1OEpobE1BVXdNRmNnRDFUTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768418106),
('5C5pRCklUpNHAforDGB1fvWnbMsH47sovAcbBvWh', NULL, '180.153.236.164', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0; 360Spider', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ21mbDBvMWpNdkNjNU5pNTNyUTBlaU1VQ3dlTHY3dHJQbUxHTEI0dCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768472354),
('A0zq9pA1DYXr4lgse371yKnDMngOL3KDvUe0vqSO', NULL, '111.37.235.168', 'User-Agent:Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXNFczZMNEp4ZHA5Y1N2dU4wcDBaR0J4QkJ2NzRtSHlCVGh2eGpvZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768415186),
('a2vT77RFZGJdabrALomug5J5HbeFypiciV6H545A', NULL, '180.153.236.179', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0; 360Spider', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUNzMkg2NnlaNW1tMnFhQkJ4eEtaVWplam9hekw3dkdKV1UxTEhSayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768369683),
('A54eo5H6MGIzenoGTYu1RJbo3cHfbHlCqnaG5WxL', NULL, '54.185.58.189', 'Mozilla/5.0 (X11; Linux i686 on x86_64; rv:50.0) Gecko/20100101 Firefox/50.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVlpekRKZ0g5Q1JQWUozUVQwdVMxMmtoeGY1d0VBZUhiTGI3S0tqayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768422150),
('b7UWqSt3deSaRKDUHGdkLP8TyhSoqyGqVoONxMEp', NULL, '3.9.134.27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36 Assetnote/1.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEZCMjBjYnRvb1BiV2xJd2hFUko0OWpjTUp6eXVRU3psT3ZaRXAweSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768433470),
('Bj0Bpum961hem5Q2PDYUDIgFf5UB8jIQWsAZq7lP', NULL, '152.32.146.219', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDJ4WTM2NkNXc0NVRVlMR1R5U2VZeW5COEU2QUplN1JQWEdzUTRaZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768378536),
('eGs9HngxVblYDa2M0HSRvvfmheOdomdr9regRYr2', NULL, '16.148.123.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVVkRHN4aTlHVUFjWkpQaHlOWVJ5SGNsNElqbGhVMU8xUVNVeXZFSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768461722),
('g07eBFhH4GDDjLrhrdAS05jpIdWI0SD7P9C8tVSz', NULL, '45.77.207.238', 'Java/1.8.0_332', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoib0VocVhINW0yVEZ2cWpVaFh3bFREaGdjMUFkbnBjNm1LTlVvRVlpRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768398618),
('gtcO4Ez4C8Tu39UsWxwuT0r2lZIjkoKzVRPiz9eG', NULL, '172.253.234.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDZ6UEJxQnhxcUM2QjFLV3UwdTd2VHZPUGhHdnBndG1Yd1M5UjFlbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768451383),
('hxWr0Cpbj8atwBaOuksgMkwlTLMjehklZJLSxcMq', NULL, '93.158.91.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzVydFFWeWN0STg1OE5wdUZDczRESmlKRXVJNG1aR2VlSDN6QXVOYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768417449),
('jRWZGtZZV67cGF6e3B90g4LJn0GdfXSEaXncJybN', NULL, '192.71.224.240', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGF0UUh1NFpRUVVwZXVWQk5JeWxOaXZIcTB5R081aDZVZUVYR1BqbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768429142),
('PEmRWmyUPQZJ4NdilhUzTZzdmn4MWy2H5ht0IgRL', NULL, '115.201.194.72', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXVKS0R6UnpxZnFKT3NDb08wYTB0OUp3WVUyZUZSbXRLTnUxR2xaYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768455631),
('PVGIL2W1qRdy8hysRcfGu0ER0ksfpDqnDKAeI0Cm', NULL, '100.26.233.1', 'Mozilla/5.0 (Linux; Android 12; SM-N986U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblFJb3JlcmU2VWxOOElnM3lFOHdHaEN6TWlsbURPdEMzWVIwaEh1ayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768468714),
('q7a0UO3PpRemzCEH4NT7NGyGeRMXmVn2qQOGCWY4', NULL, '34.122.0.54', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHc4MkxKNnBlOWtNODhDYTlGTW1PVFdDN3NjQmJlYVJYQ2RjM2JESiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3LmluZmluaXRlY2gtYXBpMTEuc2l0ZSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768414816),
('qlXymKvdNozfjFiCc8dtRIyMDy4vcYelw3AluxWG', NULL, '2a02:4780:6:c0de::8', 'Go-http-client/2.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMUk4QVhGT0lnN2wzV3NJZWFzN3hLUU5NeVFEc3FmMDljTXdwSWV1ViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768532847),
('VHQAZz89G0irbvgoGVFSawgWfVuBjnwADyrdzP3k', NULL, '2a02:4780:6:c0de::8', 'Go-http-client/2.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ1JkZUo5Nm9yTXZpQmF6Vk9jSXRudmhXNFlUeFlHZVZRYzhKajlzTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768461430),
('wIMTX7AyhyNkSbkMhNinTKKRMWC1L1prKkEftMgD', NULL, '2a06:98c0:3600::103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkhCalNXWHUyN1VFZk94M3M3clREWEpweVZzUTcyczc1cEFyTkpMVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768524362),
('xVuAM4zANPoaG7tMIWhwFLVWpCyJe7i4N4q7d8jg', NULL, '45.79.163.134', 'Mozilla/5.0 (compatible; SaaSBrowserBot/1.0; +https://saasbrowser.com/bot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEVkb2dhNlNBU1pjZHI1ZnNrVUhhUnlTalZDSDljQkZJOGRNSHlOUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vaW5maW5pdGVjaC1hcGkxMS5zaXRlIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768366144);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `verified_at` timestamp NULL DEFAULT NULL,
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `token`, `is_verified`, `is_active`, `verified_at`, `unsubscribed_at`, `created_at`, `updated_at`) VALUES
(1, 'infinitech.justin2024@gmail.com', 'o5BAN8IEBM4FOsUtzzKcnhNPgjxleq3BW0f99VTgww81fkCHIFOg7CWHv5S4bExl', 1, 1, '2025-11-20 18:16:14', NULL, '2025-11-20 18:14:50', '2025-11-20 18:16:14'),
(2, 'decastrojustin321@gmail.com', 'sU1D6Ok9RMPrLbo8c6vzotcuohiXYuLh67oVzVh1bPDTSWiIY0eM4lptsFfjKUdm', 1, 1, '2025-11-20 18:32:37', NULL, '2025-11-20 18:29:54', '2025-11-20 18:32:37'),
(4, 'infinitech.hazel@gmail.com', 'u423bkLNpSjE1dgRS9sHMIX3mm0SJjmFOL3kSDgNqFWgoqd3hBzqRMmZsQ9aBbiZ', 0, 1, NULL, NULL, '2026-01-19 00:14:18', '2026-01-19 00:14:18'),
(5, 'hazelannemendoza321@gmail.com', 'ZvroZQbYbyREalHLxeyP44bSIcIhcJsAwhVulEI3dAk3kiuWn8pmtPTyswXiYtZ3', 0, 1, NULL, NULL, '2026-01-19 00:15:49', '2026-01-19 00:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fraternity_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `rejection_reason` text COLLATE utf8mb4_unicode_ci,
  `role` enum('member','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `email`, `phone_number`, `school_registration_number`, `fraternity_number`, `email_verified_at`, `password`, `status`, `rejection_reason`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Zel Mendoza', '47 Polaris, Makati City, 1209 Metro Manila', 'user.hazel@gmail.com', '98798797', '312213312213312213312213312213', '213213', NULL, '$2y$12$DkQNRvFsYlGBH0uNZ/a0n.GmqELpjLXT3wVNHQj0zemsCMWIKx9/q', 'approved', NULL, 'member', NULL, '2026-01-18 21:16:11', '2026-01-18 21:16:11'),
(2, 'Admin Hazel', '47 Polaris, Makati City, 1209 Metro Manila', 'infinitech.hazel@gmail.com', '323213', '3213213213213213', '3213232231313', NULL, '$2y$12$jXrz3scuiY/uUYLuYq3lX.4AGWODOv5qHuqYW06kUOic68.KHIKHO', 'approved', NULL, 'admin', NULL, '2026-01-18 21:18:11', '2026-01-18 21:18:11'),
(5, 'Zel Mendoza', '47 Polaris, Makati City, 1209 Metro Manila', 'hazelannemendoza321@gmail.com', '98798797', '312213312213312213312213312213', '213213', NULL, '$2y$12$Zf4hMZ9D5IsW9/oL/Dya8eLsX/FefEySXxcjylnuoqMShzK8cCAfu', 'approved', NULL, 'member', NULL, '2026-01-19 16:02:19', '2026-01-19 16:17:05');

-- --------------------------------------------------------

--
-- Table structure for table `vlogs`
--

CREATE TABLE `vlogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambulance_requests`
--
ALTER TABLE `ambulance_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ambulance_requests_request_id_unique` (`request_id`),
  ADD KEY `ambulance_requests_user_id_index` (`user_id`),
  ADD KEY `ambulance_requests_status_index` (`status`),
  ADD KEY `ambulance_requests_requested_at_index` (`requested_at`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barangay_blotters`
--
ALTER TABLE `barangay_blotters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barangay_blotters_user_id_foreign` (`user_id`),
  ADD KEY `barangay_blotters_incident_date_index` (`incident_date`),
  ADD KEY `barangay_blotters_incident_type_index` (`incident_type`),
  ADD KEY `barangay_blotters_status_index` (`status`);

--
-- Indexes for table `barangay_clearances`
--
ALTER TABLE `barangay_clearances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barangay_clearances_reference_number_unique` (`reference_number`),
  ADD KEY `barangay_clearances_user_id_foreign` (`user_id`);

--
-- Indexes for table `building_permits`
--
ALTER TABLE `building_permits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `building_permits_reference_number_unique` (`reference_number`),
  ADD KEY `building_permits_user_id_index` (`user_id`),
  ADD KEY `building_permits_reference_number_index` (`reference_number`),
  ADD KEY `building_permits_status_index` (`status`),
  ADD KEY `building_permits_barangay_index` (`barangay`);

--
-- Indexes for table `business_partners`
--
ALTER TABLE `business_partners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_partners_user_id_foreign` (`user_id`);

--
-- Indexes for table `business_permits`
--
ALTER TABLE `business_permits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `business_permits_permit_number_unique` (`permit_number`),
  ADD KEY `business_permits_user_id_index` (`user_id`),
  ADD KEY `business_permits_status_index` (`status`),
  ADD KEY `business_permits_permit_number_index` (`permit_number`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cedulas`
--
ALTER TABLE `cedulas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cedulas_user_id_index` (`user_id`),
  ADD KEY `cedulas_status_index` (`status`),
  ADD KEY `cedulas_created_at_index` (`created_at`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_replies_contact_id_foreign` (`contact_id`),
  ADD KEY `contact_replies_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `good_moral_certificates`
--
ALTER TABLE `good_moral_certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `good_moral_certificates_reference_number_unique` (`reference_number`),
  ADD KEY `good_moral_certificates_approved_by_foreign` (`approved_by`),
  ADD KEY `good_moral_certificates_reference_number_index` (`reference_number`),
  ADD KEY `good_moral_certificates_user_id_index` (`user_id`),
  ADD KEY `good_moral_certificates_status_index` (`status`),
  ADD KEY `good_moral_certificates_barangay_index` (`barangay`);

--
-- Indexes for table `health_certificates`
--
ALTER TABLE `health_certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `health_certificates_reference_number_unique` (`reference_number`),
  ADD KEY `health_certificates_user_id_foreign` (`user_id`);

--
-- Indexes for table `indigency_certificates`
--
ALTER TABLE `indigency_certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `indigency_certificates_reference_number_unique` (`reference_number`),
  ADD KEY `indigency_certificates_processed_by_foreign` (`processed_by`),
  ADD KEY `indigency_certificates_user_id_index` (`user_id`),
  ADD KEY `indigency_certificates_reference_number_index` (`reference_number`),
  ADD KEY `indigency_certificates_status_index` (`status`),
  ADD KEY `indigency_certificates_created_at_index` (`created_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legitimacy_requests`
--
ALTER TABLE `legitimacy_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `legitimacy_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `medical_assistances`
--
ALTER TABLE `medical_assistances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `medical_assistances_reference_number_unique` (`reference_number`),
  ADD KEY `medical_assistances_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_author_id_foreign` (`author_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reports_report_id_unique` (`report_id`),
  ADD KEY `reports_user_id_index` (`user_id`),
  ADD KEY `reports_status_index` (`status`),
  ADD KEY `reports_category_index` (`category`);

--
-- Indexes for table `report_files`
--
ALTER TABLE `report_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_files_report_id_foreign` (`report_id`);

--
-- Indexes for table `residency_certificates`
--
ALTER TABLE `residency_certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `residency_certificates_reference_number_unique` (`reference_number`),
  ADD KEY `residency_certificates_processed_by_foreign` (`processed_by`),
  ADD KEY `residency_certificates_user_id_index` (`user_id`),
  ADD KEY `residency_certificates_reference_number_index` (`reference_number`),
  ADD KEY `residency_certificates_status_index` (`status`),
  ADD KEY `residency_certificates_created_at_index` (`created_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`),
  ADD UNIQUE KEY `subscribers_token_unique` (`token`),
  ADD KEY `subscribers_email_index` (`email`),
  ADD KEY `subscribers_is_active_index` (`is_active`),
  ADD KEY `subscribers_is_verified_index` (`is_verified`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vlogs`
--
ALTER TABLE `vlogs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ambulance_requests`
--
ALTER TABLE `ambulance_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `barangay_blotters`
--
ALTER TABLE `barangay_blotters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `barangay_clearances`
--
ALTER TABLE `barangay_clearances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `building_permits`
--
ALTER TABLE `building_permits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_partners`
--
ALTER TABLE `business_partners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `business_permits`
--
ALTER TABLE `business_permits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cedulas`
--
ALTER TABLE `cedulas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `good_moral_certificates`
--
ALTER TABLE `good_moral_certificates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_certificates`
--
ALTER TABLE `health_certificates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `indigency_certificates`
--
ALTER TABLE `indigency_certificates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legitimacy_requests`
--
ALTER TABLE `legitimacy_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical_assistances`
--
ALTER TABLE `medical_assistances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report_files`
--
ALTER TABLE `report_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `residency_certificates`
--
ALTER TABLE `residency_certificates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vlogs`
--
ALTER TABLE `vlogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ambulance_requests`
--
ALTER TABLE `ambulance_requests`
  ADD CONSTRAINT `ambulance_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_blotters`
--
ALTER TABLE `barangay_blotters`
  ADD CONSTRAINT `barangay_blotters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `barangay_clearances`
--
ALTER TABLE `barangay_clearances`
  ADD CONSTRAINT `barangay_clearances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `building_permits`
--
ALTER TABLE `building_permits`
  ADD CONSTRAINT `building_permits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_partners`
--
ALTER TABLE `business_partners`
  ADD CONSTRAINT `business_partners_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_permits`
--
ALTER TABLE `business_permits`
  ADD CONSTRAINT `business_permits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cedulas`
--
ALTER TABLE `cedulas`
  ADD CONSTRAINT `cedulas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD CONSTRAINT `contact_replies_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contact_replies_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `good_moral_certificates`
--
ALTER TABLE `good_moral_certificates`
  ADD CONSTRAINT `good_moral_certificates_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `good_moral_certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `health_certificates`
--
ALTER TABLE `health_certificates`
  ADD CONSTRAINT `health_certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `indigency_certificates`
--
ALTER TABLE `indigency_certificates`
  ADD CONSTRAINT `indigency_certificates_processed_by_foreign` FOREIGN KEY (`processed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `indigency_certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `legitimacy_requests`
--
ALTER TABLE `legitimacy_requests`
  ADD CONSTRAINT `legitimacy_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `medical_assistances`
--
ALTER TABLE `medical_assistances`
  ADD CONSTRAINT `medical_assistances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `report_files`
--
ALTER TABLE `report_files`
  ADD CONSTRAINT `report_files_report_id_foreign` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `residency_certificates`
--
ALTER TABLE `residency_certificates`
  ADD CONSTRAINT `residency_certificates_processed_by_foreign` FOREIGN KEY (`processed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `residency_certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
