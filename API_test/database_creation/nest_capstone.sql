-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 07, 2024 at 01:18 PM
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

--
-- Dumping data for table `assessment_category`
--

INSERT INTO `assessment_category` (`category_id`, `category_name`) VALUES
(1, 'R'),
(2, 'I'),
(3, 'A'),
(4, 'S'),
(5, 'E'),
(6, 'C'),
(7, 'TIPI'),
(8, 'VCL');

-- --------------------------------------------------------

--
-- Table structure for table `assessment_option`
--

CREATE TABLE `assessment_option` (
  `option_id` int(11) NOT NULL,
  `option_code` int(11) NOT NULL,
  `option_text` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessment_option`
--

INSERT INTO `assessment_option` (`option_id`, `option_code`, `option_text`) VALUES
(1, 1, 'Tidak Suka'),
(2, 2, 'Cukup Tidak Suka'),
(3, 3, 'Netral'),
(4, 4, 'Cukup Suka'),
(5, 5, 'Suka'),
(6, 1, 'Sangat tidak setuju'),
(7, 2, 'Cukup tidak setuju'),
(8, 3, 'Sedikit tidak setuju'),
(9, 4, 'Tidak setuju dan tidak setuju'),
(10, 5, 'Setuju sedikit'),
(11, 6, 'Cukup Setuju'),
(12, 7, 'Sangat Setuju');

-- --------------------------------------------------------

--
-- Table structure for table `assessment_question`
--

CREATE TABLE `assessment_question` (
  `question_id` varchar(10) NOT NULL,
  `question_text` varchar(255) NOT NULL,
  `assessment_category_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessment_question`
--

INSERT INTO `assessment_question` (`question_id`, `question_text`, `assessment_category_category_id`) VALUES
('A2', 'Mengarahkan sebuah pertunjukan', 3),
('A3', 'Merancang karya seni untuk majalah', 3),
('A4', 'Menulis lagu', 3),
('A5', 'Menulis buku atau drama', 3),
('A6', 'Bermain alat musik', 3),
('A8', 'Merancang set untuk drama', 3),
('C1', 'Menghasilkan cek gaji bulanan untuk sebuah kantor', 6),
('C2', 'Menghitung persediaan menggunakan komputer genggam', 6),
('C3', 'Menggunakan program komputer untuk menghasilkan \ntagihan pelanggan', 6),
('C5', 'Menghitung dan mencatat data statistik dan \nnumerik lainnya', 6),
('C7', 'Menangani transaksi bank pelanggan', 6),
('C8', 'Menjaga catatan pengiriman dan penerimaan', 6),
('E1', 'Menjual waralaba restoran kepada individu', 5),
('E3', 'Mengelola operasi hotel', 5),
('E4', 'Mengoperasikan salon kecantikan atau pangkas rambut', 5),
('E5', 'Mengelola departemen dalam perusahaan besar', 5),
('E7', 'Menjual rumah', 5),
('E8', 'Mengelola toko mainan', 5),
('I1', 'Mempelajari struktur tubuh manusia', 2),
('I2', 'Mempelajari perilaku hewan', 2),
('I4', 'Mengembangkan pengobatan atau prosedur medis baru', 2),
('I5', 'Melakukan penelitian biologi', 2),
('I7', 'Bekerja di laboratorium biologi', 2),
('I8', 'Membuat peta dasar laut', 2),
('R1', 'Menguji kualitas bagian sebelum pengiriman', 1),
('R2', 'Menyusun batu bata atau ubin', 1),
('R4', 'Merakit bagian elektronik', 1),
('R6', 'Memperbaiki keran yang rusak', 1),
('R7', 'Merakit produk di pabrik', 1),
('R8', 'Memasang lantai di rumah', 1),
('S1', 'Memberi bimbingan karir kepada orang lain', 4),
('S3', 'Membantu orang yang memiliki masalah dengan \nobat-obatan atau alkohol', 4),
('S5', 'Membantu orang dengan masalah keluarga', 4),
('S6', 'Mengawas aktivitas anak-anak di perkemahan', 4),
('S7', 'Mengajar anak-anak membaca', 4),
('S8', 'Membantu orang tua dengan aktivitas sehari-hari', 4),
('TIPI1', 'Ekstrovert, antusias.', 7),
('TIPI10', 'Konvensional, tidak kreatif.', 7),
('TIPI2', 'Kritis, suka bertengkar.', 7),
('TIPI3', 'Dapat diandalkan, disiplin diri.', 7),
('TIPI4', 'Cemas, mudah marah.', 7),
('TIPI5', 'Terbuka terhadap pengalaman baru, kompleks.', 7),
('TIPI6', 'Pendiam, tenang.', 7),
('TIPI7', 'Simpatik, hangat.', 7),
('TIPI8', 'Tidak terorganisir, ceroboh.', 7),
('TIPI9', 'Tenang, stabil secara emosional.', 7),
('VCL1', 'boat', 8),
('VCL10', 'decide', 8),
('VCL11', 'pastiche', 8),
('VCL12', 'verdid', 8),
('VCL13', 'abysmal', 8),
('VCL14', 'lucid', 8),
('VCL15', 'betray', 8),
('VCL2', 'incoherent', 8),
('VCL3', 'pallid', 8),
('VCL4', 'robot', 8),
('VCL5', 'audible', 8),
('VCL6', 'cuivocal', 8);

-- --------------------------------------------------------

--
-- Table structure for table `category_option`
--

CREATE TABLE `category_option` (
  `category_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_option`
--

INSERT INTO `category_option` (`category_id`, `option_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11),
(7, 12);

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
(9, 'Lunch Break', '2024-06-01', '12:30:00', '13:00:00', 30, 0, 30, 'Low', 0, 3, 1, '2024-06-01 07:58:32'),
(10, 'Client Call', '2024-06-01', '14:00:00', '15:00:00', 60, 55, 5, 'High', 0, 2, 1, '2024-06-05 07:34:47'),
(11, 'Study Algebra', '2024-06-01', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 1, '2024-05-31 15:17:15'),
(13, 'Study Science', '2024-06-01', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 0, '2024-05-31 22:16:35'),
(14, 'Study Geo', '2024-06-01', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 1, '2024-06-01 07:53:41'),
(15, 'Study Physics', '2024-06-01', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 0, '2024-06-05 07:33:18'),
(16, 'Study Advanced history', '2024-06-02', '07:00:00', '08:00:00', 60, 20, 10, 'medium', 1, 2, 0, '2024-06-05 07:33:07'),
(17, 'History Assigment', '2024-06-13', '12:30:00', '13:00:00', 30, 0, 30, 'Low', 0, 3, 0, '2024-05-31 07:48:24'),
(18, 'Student Council Meeting', '2024-06-20', '14:00:00', '15:00:00', 60, 55, 5, 'High', 0, 2, 0, '2024-05-31 07:48:24'),
(19, 'Java Language Exam', '2024-07-06', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 0, '2024-06-05 07:32:50'),
(20, 'Study Java Advanced', '2024-07-11', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 0, '2024-05-31 15:16:35'),
(21, 'Study German Language', '2024-08-01', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 0, '2024-05-31 15:16:50'),
(22, 'Study Math Logaritmic', '2024-08-09', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 0, '2024-06-05 07:32:58'),
(23, 'Study Physics', '2024-06-01', '07:00:00', '08:00:00', 60, 20, 10, 'low', 1, 2, 0, '2024-06-05 14:34:39');

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
  `username` varchar(255) DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `user_birthDate` date DEFAULT NULL,
  `user_school` varchar(100) DEFAULT NULL,
  `user_gender` int(10) DEFAULT NULL,
  `user_engNat` tinyint(1) DEFAULT NULL,
  `user_religion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`user_id`, `username`, `user_fullname`, `user_birthDate`, `user_school`, `user_gender`, `user_engNat`, `user_religion`) VALUES
(2, 'john', 'Sergio Putra', '1990-01-01', 'SMA Negeri 3 Malang', 1, 1, 'Islam'),
(3, 'jane', 'Sergia Putri', '2003-01-01', 'SMA Negeri 3 Malang', 2, 1, 'Islam'),
(4, 'alice', 'Alice Johnson Boulder', '1988-04-04', 'Sample High School', 0, 0, 'Buddhism'),
(5, 'bob', 'Bob White Black', '1995-05-05', 'Example College', 1, 1, 'Atheism'),
(6, 'charlie', 'Charlie Brown Green', '1985-03-03', 'Another High School', 1, 0, 'Hinduism'),
(7, 'johndoe', 'John Doe', '1990-01-01', 'SMA Negeri 1', 1, 1, 'Agnostik'),
(8, 'janesmith', 'Jane Smith', '1992-02-02', 'SMA Negeri 2', 0, 1, 'Islam'),
(9, 'mikebrown', 'Mike Brown', '1985-03-03', 'SMA Negeri 3', 1, 0, 'Ateis'),
(10, 'alicejohnson', 'Alice Johnson', '1988-04-04', ' SMA Negeri 4', 0, 0, 'Budha'),
(11, 'bobwhite', 'Bob White', '1995-05-05', 'SMA Negeri 5', 1, 1, 'Hindu');

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
(2, 4),
(3, 1),
(4, 2),
(5, 3),
(6, 5),
(7, 1);

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
-- Indexes for table `category_option`
--
ALTER TABLE `category_option`
  ADD PRIMARY KEY (`category_id`,`option_id`),
  ADD KEY `option_id` (`option_id`);

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
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- Constraints for table `category_option`
--
ALTER TABLE `category_option`
  ADD CONSTRAINT `category_option_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `assessment_category` (`category_id`),
  ADD CONSTRAINT `category_option_ibfk_2` FOREIGN KEY (`option_id`) REFERENCES `assessment_option` (`option_id`);

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
