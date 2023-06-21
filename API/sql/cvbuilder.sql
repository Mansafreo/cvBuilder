-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2023 at 09:05 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cvbuilder`
--

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE `award` (
  `award_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `award` tinytext NOT NULL,
  `link` mediumtext NOT NULL,
  `issuer` tinytext NOT NULL,
  `date` date NOT NULL,
  `description` mediumtext NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `certificate_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `link` mediumtext NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `course_title` tinytext NOT NULL,
  `link` mediumtext NOT NULL,
  `instituition` tinytext NOT NULL,
  `city` tinytext NOT NULL,
  `country` tinytext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` mediumtext NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_normal`
--

CREATE TABLE `custom_normal` (
  `custom_normal_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `title` tinytext NOT NULL,
  `link` mediumtext NOT NULL,
  `subtitle` tinytext NOT NULL,
  `city` tinytext NOT NULL,
  `country` tinytext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` mediumtext NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_skill`
--

CREATE TABLE `custom_skill` (
  `custom_skill_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `skill` tinytext NOT NULL,
  `sub_skills` tinytext NOT NULL,
  `level` tinyint(4) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `declaration`
--

CREATE TABLE `declaration` (
  `declaration_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `text` mediumtext NOT NULL,
  `image` tinytext NOT NULL,
  `full_name` tinytext NOT NULL,
  `place` tinytext NOT NULL,
  `date` date NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `education_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `school` text NOT NULL,
  `link` text NOT NULL,
  `degree` text NOT NULL,
  `city` text NOT NULL,
  `country` text NOT NULL,
  `start_date` text NOT NULL,
  `end_date` text NOT NULL,
  `description` mediumtext NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE `interest` (
  `interest_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `name` tinytext NOT NULL,
  `additional_info` mediumtext NOT NULL,
  `link` mediumtext NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invalidatedtokens`
--

CREATE TABLE `invalidatedtokens` (
  `ID` int(10) NOT NULL,
  `token` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invalidatedtokens`
--

INSERT INTO `invalidatedtokens` (`ID`, `token`) VALUES
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRvZ28yIiwiaWF0IjoxNjg3MjkyODc5fQ.sOR7Y46gZjLck4BNXB5_GHw8Pgx14oETOouGNIEOxTE'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRvZ28yIiwiaWF0IjoxNjg3MzQ3NjU2LCJleHAiOjE2ODczNTQ4NTZ9.U_3_qKkDapSu7sCaUo8KxA0nEO4I6AXQ79PhPk7oG2k');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `name` tinytext NOT NULL,
  `additional_info` mediumtext NOT NULL,
  `level` tinytext NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `link_ID` varchar(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `url` text NOT NULL,
  `type` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_volunteering`
--

CREATE TABLE `organization_volunteering` (
  `organization_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `organization` tinytext NOT NULL,
  `name` tinytext NOT NULL,
  `position` tinytext NOT NULL,
  `city` tinytext NOT NULL,
  `country` tinytext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` mediumtext NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personal_details`
--

CREATE TABLE `personal_details` (
  `userID` varchar(200) NOT NULL,
  `details_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `full_name` text NOT NULL,
  `prophile_photo` text NOT NULL,
  `job_title` text NOT NULL,
  `email` text NOT NULL,
  `phone` text NOT NULL,
  `address` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `nationality` text NOT NULL,
  `passport_id` text NOT NULL,
  `marital_status` text NOT NULL,
  `driving_license` text NOT NULL,
  `gender` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `professional_experience`
--

CREATE TABLE `professional_experience` (
  `experience_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `job_title` tinytext NOT NULL,
  `employer_name` tinytext NOT NULL,
  `employer_link` mediumtext NOT NULL,
  `city` tinytext NOT NULL,
  `country` tinytext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `icon` text NOT NULL,
  `text` text NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `title` tinytext NOT NULL,
  `link` mediumtext NOT NULL,
  `subtitle` tinytext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` mediumtext NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `publication_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `title` tinytext NOT NULL,
  `link` tinytext NOT NULL,
  `publisher` tinytext NOT NULL,
  `date` date NOT NULL,
  `description` mediumtext NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `reference_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `name` tinytext NOT NULL,
  `link` tinytext NOT NULL,
  `job_title` tinytext NOT NULL,
  `organization` tinytext NOT NULL,
  `email` tinytext NOT NULL,
  `phone` varchar(12) NOT NULL,
  `hidden` tinyint(4) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resumes`
--

CREATE TABLE `resumes` (
  `resume_ID` varchar(100) NOT NULL,
  `template_ID` varchar(100) NOT NULL,
  `userID` varchar(200) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_ID` int(100) NOT NULL,
  `resume_ID` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `icon` text NOT NULL,
  `sub_skills` text NOT NULL,
  `level` text NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `priority` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `template_ID` varchar(100) NOT NULL,
  `name` tinytext NOT NULL,
  `style` tinytext NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `ID` int(11) NOT NULL,
  `userID` varchar(200) NOT NULL,
  `refreshToken` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`ID`, `userID`, `refreshToken`) VALUES
(11, '48661870', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRvZ28xIiwiaWF0IjoxNjg3MzYyOTY1LCJleHAiOjE2ODc0NDkzNjV9.i0LUqWvyzjNC4c4OODlZ97r-pd6BG0tFgSksF_tpftk');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` varchar(200) NOT NULL,
  `username` text NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `email`, `status`) VALUES
('48661870', 'togo1', '$2b$10$ohXKKVDyDER8SG9VGTBOGe8eA5ELQyveQNv5pi.eHcMQVVkSsvW1i', 'togo1@localhost', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`award_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`certificate_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `custom_normal`
--
ALTER TABLE `custom_normal`
  ADD PRIMARY KEY (`custom_normal_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `custom_skill`
--
ALTER TABLE `custom_skill`
  ADD PRIMARY KEY (`custom_skill_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `declaration`
--
ALTER TABLE `declaration`
  ADD PRIMARY KEY (`declaration_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`education_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`interest_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `invalidatedtokens`
--
ALTER TABLE `invalidatedtokens`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`link_ID`),
  ADD KEY `links_ibfk_1` (`resume_ID`);

--
-- Indexes for table `organization_volunteering`
--
ALTER TABLE `organization_volunteering`
  ADD PRIMARY KEY (`organization_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `personal_details`
--
ALTER TABLE `personal_details`
  ADD PRIMARY KEY (`details_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `professional_experience`
--
ALTER TABLE `professional_experience`
  ADD PRIMARY KEY (`experience_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`publication_ID`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`reference_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `resumes`
--
ALTER TABLE `resumes`
  ADD PRIMARY KEY (`resume_ID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `template_ID` (`template_ID`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_ID`),
  ADD KEY `resume_ID` (`resume_ID`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`template_ID`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `award`
--
ALTER TABLE `award`
  MODIFY `award_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `certificate_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_normal`
--
ALTER TABLE `custom_normal`
  MODIFY `custom_normal_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_skill`
--
ALTER TABLE `custom_skill`
  MODIFY `custom_skill_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `declaration`
--
ALTER TABLE `declaration`
  MODIFY `declaration_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `education_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interest`
--
ALTER TABLE `interest`
  MODIFY `interest_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invalidatedtokens`
--
ALTER TABLE `invalidatedtokens`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `language_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_volunteering`
--
ALTER TABLE `organization_volunteering`
  MODIFY `organization_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_details`
--
ALTER TABLE `personal_details`
  MODIFY `details_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `professional_experience`
--
ALTER TABLE `professional_experience`
  MODIFY `experience_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publication`
--
ALTER TABLE `publication`
  MODIFY `publication_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reference`
--
ALTER TABLE `reference`
  MODIFY `reference_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `skill_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `award`
--
ALTER TABLE `award`
  ADD CONSTRAINT `award_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `custom_normal`
--
ALTER TABLE `custom_normal`
  ADD CONSTRAINT `custom_normal_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `custom_skill`
--
ALTER TABLE `custom_skill`
  ADD CONSTRAINT `custom_skill_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `declaration`
--
ALTER TABLE `declaration`
  ADD CONSTRAINT `declaration_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `interest`
--
ALTER TABLE `interest`
  ADD CONSTRAINT `interest_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `language`
--
ALTER TABLE `language`
  ADD CONSTRAINT `language_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `organization_volunteering`
--
ALTER TABLE `organization_volunteering`
  ADD CONSTRAINT `organization_volunteering_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `personal_details`
--
ALTER TABLE `personal_details`
  ADD CONSTRAINT `resume_ID` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `professional_experience`
--
ALTER TABLE `professional_experience`
  ADD CONSTRAINT `professional_experience_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `reference`
--
ALTER TABLE `reference`
  ADD CONSTRAINT `reference_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `resumes`
--
ALTER TABLE `resumes`
  ADD CONSTRAINT `resumes_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `resumes_ibfk_2` FOREIGN KEY (`template_ID`) REFERENCES `templates` (`template_ID`);

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`resume_ID`) REFERENCES `resumes` (`resume_ID`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
