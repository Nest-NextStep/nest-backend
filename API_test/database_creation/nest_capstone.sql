-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 04, 2024 at 03:55 PM
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

--
-- Dumping data for table `alumni_opinions`
--

INSERT INTO `alumni_opinions` (`opinion_id`, `opinion_name`, `opinions_content`, `major_major_id`) VALUES
(1, 'Alice Johnson', 'AI will significantly change the landscape of technology in the next decade.', 1),
(2, 'Bob Smith', 'As technology advances, cybersecurity threats will become more complex.', 1),
(3, 'Carol Williams', 'Ensuring data privacy is critical in the age of big data.', 1),
(4, 'David Brown', 'Legal reforms are necessary to adapt to the changing social landscape.', 2),
(5, 'Eva Taylor', 'Protecting human rights should be at the forefront of legal discussions.', 2),
(6, 'Frank Moore', 'Corporate law needs to address modern business challenges.', 2),
(7, 'Grace Anderson', 'Raising awareness about mental health is essential for societal well-being.', 3),
(8, 'Henry Thomas', 'Social media has a profound impact on mental health.', 3),
(9, 'Ivy Jackson', 'New therapeutic techniques can improve patient outcomes.', 3),
(10, 'Jack White', 'Sustainable construction practices are vital for environmental conservation.', 4),
(11, 'Karen Harris', 'Effective urban planning can solve many modern city problems.', 4),
(12, 'Liam Martin', 'Infrastructure development is key to economic growth.', 4),
(13, 'Mia Lee', 'Innovations in IT can lead to more efficient business processes.', 5),
(14, 'Noah Young', 'Effective data management is crucial for business success.', 5),
(15, 'Olivia King', 'Integrating different IT systems can improve overall efficiency.', 5);

-- --------------------------------------------------------

--
-- Table structure for table `assessment_category`
--

CREATE TABLE `assessment_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_option`
--

CREATE TABLE `assessment_option` (
  `option_id` int(11) NOT NULL,
  `option_code` int(11) NOT NULL,
  `option_text` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_question`
--

CREATE TABLE `assessment_question` (
  `question_id` int(11) NOT NULL,
  `question_text` varchar(255) NOT NULL,
  `assessment_category_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_question_assessment_option`
--

CREATE TABLE `assessment_question_assessment_option` (
  `assessment_question_question_id` int(11) NOT NULL,
  `assessment_option_option_id` int(11) NOT NULL
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

--
-- Dumping data for table `potential_jobs`
--

INSERT INTO `potential_jobs` (`jobs_id`, `jobs_name`, `jobs_salary`, `jobs_description`, `major_major_id`) VALUES
(1, 'Software Developer', '70000', 'Develops and maintains software applications.', 1),
(2, 'Network Administrator', '65000', 'Manages and supports computer networks.', 1),
(3, 'Data Analyst', '72000', 'Analyzes and interprets complex data sets.', 1),
(4, 'Legal Advisor', '60000', 'Provides legal advice and support.', 2),
(5, 'Corporate Lawyer', '90000', 'Handles corporate legal matters.', 2),
(6, 'Paralegal', '45000', 'Assists lawyers in legal research and documentation.', 2),
(7, 'Clinical Psychologist', '65000', 'Provides psychological therapy and assessments.', 3),
(8, 'School Counselor', '55000', 'Offers counseling and support to students.', 3),
(9, 'Research Psychologist', '70000', 'Conducts psychological research studies.', 3),
(10, 'Civil Engineer', '75000', 'Designs and oversees construction projects.', 4),
(11, 'Project Manager', '80000', 'Manages construction project timelines and budgets.', 4),
(12, 'Structural Engineer', '77000', 'Ensures the structural integrity of buildings and bridges.', 4),
(13, 'IT Consultant', '68000', 'Advises on IT systems and solutions.', 5),
(14, 'System Analyst', '70000', 'Analyzes and designs information systems.', 5),
(15, 'Database Administrator', '69000', 'Manages and maintains database systems.', 5);

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
  `isCompleted` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `task_name`, `task_date`, `task_startTime`, `task_endTime`, `task_duration`, `task_focusTime`, `task_breakTime`, `task_priority`, `task_repeat`, `user_user_id`, `isCompleted`, `createdAt`) VALUES
(6, 'Study Advanced Algebra', '2024-06-02', '07:00:00', '08:00:00', 60, 20, 10, 'medium', 1, 2, 1, '2024-05-31 14:48:24'),
(9, 'Lunch Break', '2024-06-01', '12:30:00', '13:00:00', 30, 0, 30, 'Low', 0, 3, 1, '2024-06-01 07:58:32'),
(10, 'Client Call', '2024-06-01', '14:00:00', '15:00:00', 60, 55, 5, 'High', 0, 2, 1, '2024-06-01 08:01:26'),
(11, 'Study Algebra', '2024-06-01', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 1, '2024-05-31 15:17:15'),
(13, 'Study Science', '2024-06-01', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 0, '2024-05-31 22:16:35'),
(14, 'Study Geo', '2024-06-01', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 1, '2024-06-01 07:53:41'),
(15, 'Study Physics', '2024-06-01', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 1, '2024-05-31 15:17:19'),
(16, 'Study Advanced history', '2024-06-02', '07:00:00', '08:00:00', 60, 20, 10, 'medium', 1, 2, 1, '2024-05-31 07:48:24'),
(17, 'History Assigment', '2024-06-13', '12:30:00', '13:00:00', 30, 0, 30, 'Low', 0, 2, 0, '2024-05-31 07:48:24'),
(18, 'Student Council Meeting', '2024-06-20', '14:00:00', '15:00:00', 60, 55, 5, 'High', 0, 2, 0, '2024-05-31 07:48:24'),
(19, 'Java Language Exam', '2024-07-06', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 1, '2024-05-31 08:17:15'),
(20, 'Study Java Advanced', '2024-07-11', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 0, '2024-05-31 15:16:35'),
(21, 'Study German Language', '2024-08-01', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 0, '2024-05-31 15:16:50'),
(22, 'Study Math Logaritmic', '2024-08-09', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 1, '2024-05-31 08:17:19');

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `university_id` int(11) NOT NULL,
  `university_name` varchar(100) NOT NULL,
  `university_location` varchar(30) NOT NULL,
  `university_acreditation` char(1) NOT NULL,
  `university_link` varchar(500) NOT NULL,
  `major_major_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`university_id`, `university_name`, `university_location`, `university_acreditation`, `university_link`, `major_major_id`) VALUES
(1, 'Institut Teknologi Sepuluh Nopember', 'Surabaya, Jawa Timur', 'A', 'https://www.its.ac.id/informatika/id/akademik/program-studi/', 1),
(2, 'Universitas Indonesia', 'Depok, Jawa Barat', 'A', 'https://www.ui.ac.id/program-studi/sarjana-ilmu-komputer/', 1),
(3, 'Universitas Telkom Surabaya', 'Surabaya, Jawa Timur', 'A', 'https://bif-sby.telkomuniversity.ac.id/', 1),
(4, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'A', 'https://fh.unair.ac.id/en/home/', 2),
(5, 'Universitas Indonesia', 'Depok, Jawa Barat', 'A', 'https://law.ui.ac.id/', 2),
(6, 'Universitas Gadjah Mada', 'Yogyakarta, Yogyakarta', 'A', 'https://law.ugm.ac.id/', 2),
(7, 'Universitas Indonesia', 'Depok, Jawa Barat', 'A', 'https://psikologi.ui.ac.id/', 3),
(8, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'A', 'https://psikologi.unair.ac.id/en_US/', 3),
(9, 'Universitas Gadjah Mada', 'Yogyakarta, Yogyakarta', 'A', 'https://ugm.ac.id/id/fakultas/fakultas-psikologi/', 3),
(10, 'Universitas Sebelas Maret', 'Surakarta, Jawa Tengah', 'A', 'https://sipil.ft.uns.ac.id/', 4),
(11, 'Universitas Udayana', 'Denpasar, Bali', 'A', 'https://sipil.unud.ac.id/', 4),
(12, 'Universitas Gadjah Mada', 'Yogyakarta, Yogyakarta', 'A', 'https://tsipil.ugm.ac.id/en/home-eng/', 4),
(13, 'Institut Teknologi Sepuluh Nopember', 'Surabaya, Jawa Timur', 'A', 'https://www.its.ac.id/si/en/home/', 5),
(14, 'Universitas Indonesia', 'Depok, Jawa Barat', 'A', 'https://www.ui.ac.id/program-studi/sarjana-sistem-informasi/', 5),
(15, 'Universitas Telkom Surabaya', 'Surabaya, Jawa Timur', 'A', 'https://bis-sby.telkomuniversity.ac.id/', 5);

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
-- Indexes for table `assessment_category`
--
ALTER TABLE `assessment_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `assessment_option`
--
ALTER TABLE `assessment_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `assessment_question`
--
ALTER TABLE `assessment_question`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `assessment_question_assessment_category` (`assessment_category_category_id`);

--
-- Indexes for table `assessment_question_assessment_option`
--
ALTER TABLE `assessment_question_assessment_option`
  ADD PRIMARY KEY (`assessment_question_question_id`,`assessment_option_option_id`),
  ADD KEY `assessment_question_assessment_option_assessment_option` (`assessment_option_option_id`);

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
  MODIFY `opinion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `major_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `potential_jobs`
--
ALTER TABLE `potential_jobs`
  MODIFY `jobs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
-- Constraints for table `assessment_question`
--
ALTER TABLE `assessment_question`
  ADD CONSTRAINT `assessment_question_assessment_category` FOREIGN KEY (`assessment_category_category_id`) REFERENCES `assessment_category` (`category_id`);

--
-- Constraints for table `assessment_question_assessment_option`
--
ALTER TABLE `assessment_question_assessment_option`
  ADD CONSTRAINT `assessment_question_assessment_option_assessment_option` FOREIGN KEY (`assessment_option_option_id`) REFERENCES `assessment_option` (`option_id`),
  ADD CONSTRAINT `assessment_question_assessment_option_assessment_question` FOREIGN KEY (`assessment_question_question_id`) REFERENCES `assessment_question` (`question_id`);

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
