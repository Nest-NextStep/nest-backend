-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 27, 2024 at 07:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nest_capstone`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni_opinions`
--

CREATE TABLE `alumni_opinions` (
  `opinion_id` int(11) NOT NULL,
  `opinion_name` varchar(50) NOT NULL,
  `opinions_content` varchar(300) NOT NULL,
  `major_major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `major_id` int(11) NOT NULL,
  `major_name` varchar(30) NOT NULL,
  `major_description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`major_id`, `major_name`, `major_description`) VALUES
(1, 'Teknik Informatika', 'Teknik Informatika merupakan bidang ilmu yang mempelajari bagaimana menggunakan teknologi komputer secara optimal guna menangani masalah transformasi atau pengolahan data dengan proses logika. Di Jurusan Teknik Informatika kamu akan mempelajari berbagai prinsip terkait ilmu komputer mulai dari proses perancangan, pengembangan, pengujian, hingga evaluasi sistem operasi perangkat lunak. Selama kuliah kamu akan banyak mengkaji pemrograman dan komputasi, dan dibekali pula dengan keterampilan merancang perangkat lunak.'),
(2, 'Ilmu Hukum', 'Jurusan Ilmu Hukum adalah studi yang mempelajari berbagai sistem hukum yang berkaitan dengan kehidupan kemasyarakatan. Di Prodi Ilmu Hukum, mahasiswa juga belajar mengenai perundang-undangan termasuk di dalamnya hukum dasar (konstitusi, hukum perdata, hukum dagang, hukum tata negara, hukum pidana, hukum tata pidana) hingga hukum internasional dengan cakupan yang cukup luas. Pada akhir masa kuliah, biasanya mahasiswa jurusan ini dituntut untuk mengaplikasikan ilmu yang telah diperoleh selama kuliah melalui magang di berbagai firma hukum, lembaga pengadilan, dan juga kantor kejaksaan.'),
(3, 'Psikologi', 'Jurusan Psikologi adalah salah satu bidang keilmuan yang mempelajari tentang manusia. Manusia yang dimaksud di sini tak sebatas pada perilakunya saja, melainkan mempelajari jiwa yang mempengaruhi tindakan tersebut. Misalnya pada konteks sosial, seperti mempelajari bagaimana manusia berinteraksi dengan lingkungannya, atau dalam konteks industri mempelajari bagaimana seseorang berperilaku terkait dengan posisinya di sebuah perusahaan.'),
(4, 'Teknik Sipil', 'Teknik sipil adalah bidang ilmu yang mempelajari perencanaan/perancangan, manufaktur, manajemen/pengelolaan, dan konservasi dari beragam fasilitas dan sistem untuk mendukung sebuah kota, pedesaan, dan perkotaan. Artinya, seorang lulusan teknik sipil perlu menguasai ilmu terkait desain (saat melakukan perancangan), konsturksi (saat melakukan pembangunan dan menyusun sistem pengelolaan), hingga pemeliharaan lingkungan (saat melihat dampak pembangunan dari berbagai aspek).'),
(5, 'Sistem Informasi', 'Jurusan Sistem Informasi adalah bidang keilmuan yang menggabungkan ilmu komputer dengan bisnis dan manajemen. Di prodi ini kamu akan belajar gimana mengidentifikasi kebutuhan dan proses bisnis perusahaan berdasarkan data-data yang dimiliki perusahan, kemudian merancang sistem yang sesuai dengan kebutuhan perusahaan.');

-- --------------------------------------------------------

--
-- Table structure for table `potential_jobs`
--

CREATE TABLE `potential_jobs` (
  `jobs_id` int(11) NOT NULL,
  `jobs_name` varchar(50) NOT NULL,
  `jobs_salary` varchar(50) NOT NULL,
  `jobs_description` varchar(300) NOT NULL,
  `major_major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `task_id` int(11) NOT NULL,
  `task_name` varchar(50) NOT NULL,
  `task_date` date NOT NULL,
  `task_startTime` time NOT NULL,
  `task_endTime` time NOT NULL,
  `task_duration` int(11) NOT NULL,
  `task_focusTime` int(11) NOT NULL,
  `task_breakTime` int(11) NOT NULL,
  `task_priority` varchar(7) NOT NULL,
  `task_repeat` tinyint(1) NOT NULL,
  `user_user_id` int(11) NOT NULL,
  `isCompleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `task_name`, `task_date`, `task_startTime`, `task_endTime`, `task_duration`, `task_focusTime`, `task_breakTime`, `task_priority`, `task_repeat`, `user_user_id`, `isCompleted`) VALUES
(6, 'Morning Workout', '2024-06-01', '06:00:00', '07:00:00', 60, 50, 10, 'High', 0, 2, 0),
(7, 'Team Meeting', '2024-06-01', '09:00:00', '10:00:00', 60, 55, 5, 'Medium', 1, 2, 1),
(8, 'Project Development', '2024-06-01', '10:30:00', '12:30:00', 120, 110, 10, 'High', 0, 4, 0),
(9, 'Lunch Break', '2024-06-01', '12:30:00', '13:00:00', 30, 0, 30, 'Low', 0, 3, 0),
(10, 'Client Call', '2024-06-01', '14:00:00', '15:00:00', 60, 55, 5, 'High', 0, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `university_id` int(11) NOT NULL,
  `university_name` varchar(30) NOT NULL,
  `university_location` varchar(30) NOT NULL,
  `university_acreditation` char(1) NOT NULL,
  `university_link` varchar(500) NOT NULL,
  `major_major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`user_id`, `user_name`, `username`) VALUES
(2, 'John Doe', 'john'),
(3, 'Jane Smith', 'jane'),
(4, 'Alice Johnson', 'alice'),
(5, 'Bob Brown', 'bob'),
(6, 'Charlie Davis', 'charlie');

-- --------------------------------------------------------

--
-- Table structure for table `user_major`
--

CREATE TABLE `user_major` (
  `user_user_id` int(11) NOT NULL,
  `major_major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_major`
--

INSERT INTO `user_major` (`user_user_id`, `major_major_id`) VALUES
(2, 1),
(2, 4),
(3, 1),
(4, 2),
(5, 3),
(6, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni_opinions`
--
ALTER TABLE `alumni_opinions`
  ADD PRIMARY KEY (`opinion_id`),
  ADD KEY `alumni_opinions_major` (`major_major_id`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`major_id`);

--
-- Indexes for table `potential_jobs`
--
ALTER TABLE `potential_jobs`
  ADD PRIMARY KEY (`jobs_id`),
  ADD KEY `potential_jobs_major` (`major_major_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `task_user` (`user_user_id`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`university_id`),
  ADD KEY `university_major` (`major_major_id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_major`
--
ALTER TABLE `user_major`
  ADD PRIMARY KEY (`user_user_id`,`major_major_id`),
  ADD KEY `user_major_major` (`major_major_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumni_opinions`
--
ALTER TABLE `alumni_opinions`
  MODIFY `opinion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `major_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `potential_jobs`
--
ALTER TABLE `potential_jobs`
  MODIFY `jobs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni_opinions`
--
ALTER TABLE `alumni_opinions`
  ADD CONSTRAINT `alumni_opinions_major` FOREIGN KEY (`major_major_id`) REFERENCES `major` (`major_id`);

--
-- Constraints for table `potential_jobs`
--
ALTER TABLE `potential_jobs`
  ADD CONSTRAINT `potential_jobs_major` FOREIGN KEY (`major_major_id`) REFERENCES `major` (`major_id`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_user` FOREIGN KEY (`user_user_id`) REFERENCES `user_data` (`user_id`);

--
-- Constraints for table `university`
--
ALTER TABLE `university`
  ADD CONSTRAINT `university_major` FOREIGN KEY (`major_major_id`) REFERENCES `major` (`major_id`);

--
-- Constraints for table `user_major`
--
ALTER TABLE `user_major`
  ADD CONSTRAINT `user_major_major` FOREIGN KEY (`major_major_id`) REFERENCES `major` (`major_id`),
  ADD CONSTRAINT `user_major_user` FOREIGN KEY (`user_user_id`) REFERENCES `user_data` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
