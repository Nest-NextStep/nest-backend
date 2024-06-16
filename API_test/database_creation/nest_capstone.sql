-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 16, 2024 at 04:18 AM
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
(6, 1, 'Sangat Tidak Setuju'),
(7, 2, 'Cukup Tidak Setuju'),
(8, 3, 'Sedikit Tidak Setuju'),
(9, 4, 'Netral'),
(10, 5, 'Sedikit Setuju'),
(11, 6, 'Cukup Setuju'),
(12, 7, 'Sangat Setuju'),
(13, 0, 'Tidak Tahu'),
(14, 1, 'Tahu');

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
(7, 12),
(8, 13),
(8, 14);

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `major_id` int(11) NOT NULL,
  `major_name` varchar(30) NOT NULL,
  `major_description` varchar(1000) NOT NULL,
  `major_cover` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`major_id`, `major_name`, `major_description`, `major_cover`) VALUES
(1, 'Psikologi', 'Jurusan Psikologi adalah salah satu bidang keilmuan yang mempelajari tentang manusia. Manusia yang dimaksud di sini tak sebatas pada perilakunya saja, melainkan mempelajari jiwa yang mempengaruhi tindakan tersebut. Misalnya pada konteks sosial, seperti mempelajari bagaimana manusia berinteraksi dengan lingkungannya, atau dalam konteks industri mempelajari bagaimana seseorang berperilaku terkait dengan posisinya di sebuah perusahaan.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/Psikologi.png'),
(2, 'Manajemen Bisnis', 'Jurusan Manajemen Bisnis merupakan bidang studi yang melibatkan 2 area yang luas untuk keperluan perekrutan, pelatihan dan koordinasi serta menjadi manajer untuk pengambilan keputusan yang efektif demi mengatur dan mencapai tujuan bisnis dengan mendalami ilmu dan skill pengelolaan bisnis.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/Manajemen%20Bisnis%201.png'),
(3, 'Sastra Inggris', 'Sastra Inggris merupakan bidang ilmu yang mempelajari Bahasa Inggris dari sisi linguistik dan sastra secara mendalam. Jadi jangan heran kalau kamu akan melakukan banyak kajian terhadap berbagai karya, seperti puisi, prosa, novel drama, maupun film. Selain itu, kamu juga akan banyak membahas kebudayaan negara-negara dengan Bahasa Inggris sebagai bahasa ibu.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/Sastra%20Inggris%201.png'),
(4, 'Keperawatan', 'Ilmu Keperawatan merupakan bidang studi yang menyiapkan kamu menjadi seorang perawat. Di jurusan ini Quipperian akan mempelajari teori dan teknologi baru untuk mengembalikan dan merawat kesehatan mental dan fisik seseorang yang mengidap suatu penyakit dan penyandang disabilitas. Bidang spesialisasi untuk setiap kelas perawat antara lain perawat dewasa, perawat anak-anak, perawat manula, perawat untuk mental, dan perawatan jalan.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/keperawatan%201.png'),
(5, 'Akuntansi', 'Jurusan Akuntansi adalah bidang studi yang mempelajari materi terkait metode pencatatan dan penyusunan laporan keuangan yang berguna membantu pemangku kepentingan dalam proses pengambilan keputusan.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/akutansi.png'),
(6, 'Biologi', 'Biologi merupakan cabang dari Ilmu Pengetahuan Alam. Lebih jauh, jika Quipperian memilih jurusan Biologi pada jenjang kuliah maka kamu akan mendalami segala fenomena yang berkaitan sama benda hidup seperti sel, struktur/ fungsi organ/ fenomena psikologis yang menjangkiti organisme, interaksi biologi dan lingkungan, keragaman spesies dan warisan, perkembangan, dan evolusi.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/biologi.png'),
(7, 'Kedokteran', 'Pendidikan Dokter mempelajari cara mendiagnosis penyakit yang dialami pasien kemudian mengobati dan mencegah timbulnya kembali penyakit itu. Selama kuliah kamu banyak belajar anatomi tubuh manusia, biologi sel dan molekuler, genetika, biokimia, juga farmakologi. Kamu juga dibekali dengan latihan keterampilan dalam skill lab. Nah setelah fase perkuliahan pre-klinik, kamu bakalan dapat pelatihan dasar di berbagai stase di Rumah Sakit. Setelah itu, baru deh diputuskan mau langsung ambil program spesialisasi atau bekerja pada institusi kesehatan', 'https://storage.googleapis.com/nextstep-bucket/university-cover/kedokteran%201.png'),
(8, 'Seni Rupa', 'Seni Rupa adalah bidang seni yang bermula dari pemahaman tradisi “fine art,” sebuah wacana dari modernisme yang dikembangkan dalam kesadaran nilai-nilai lokal juga global. Kamu akan diajari cara berekspresi melalui melukis, seni grafis, seni pahat, kerajinan, dan sebagainya. Kuliah di jurusan ini juga akan mempelajari sejarah seni, komposisi, dan tematik dalam karya seni.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/seni%20rupa%201.png'),
(9, 'Teknik Informatika', 'Teknik Informatika merupakan bidang ilmu yang mempelajari bagaimana menggunakan teknologi komputer secara optimal guna menangani masalah transformasi atau pengolahan data dengan proses logika. Di Jurusan Teknik Informatika kamu akan mempelajari berbagai prinsip terkait ilmu komputer mulai dari proses perancangan, pengembangan, pengujian, hingga evaluasi sistem operasi perangkat lunak. Selama kuliah kamu akan banyak mengkaji pemrograman dan komputasi, dan dibekali pula dengan keterampilan merancang perangkat lunak.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/Teknik%20Informatika.png'),
(10, 'Ilmu Komunikasi', 'Jurusan Ilmu Komunikasi adalah studi yang mempelajari proses penyampaian pesan secara efektif dari komunikator (pemberi pesan) kepada komunikan (penerima pesan) melalui berbagai media. Di jurusan ini kamu akan mempelajari komunikasi dalam berbagai tingkatan, mulai dari individu, media, periklanan/publisitas, komunikasi interkultural, hingga komunikasi media sosial.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/Ilmu%20Komunikasi.png'),
(11, 'Ilmu Kesejahteraan Sosial', 'Jurusan Ilmu Kesejahteraan Sosial adalah jurusan yang mempelajari cara mencegah, mengidentifikasi, dan mencari solusi untuk suatu permasalahan sosial supaya bisa meningkatkan kualitas hidup masyarakat. Di Jurusan Ilmu Kesejahteraan Sosial kamu juga akan belajar soft skill seperti analisis, public speaking, simpati & empati, serta problem solving. Setelah lulus nanti, kamu diharapkan bisa berkontribusi dalam mengurangi ketidakadilan sosial dan kesenjangan sosial yang terjadi.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/kesejahteraan%20sosial.png'),
(12, 'Ekonomi', 'Jurusan Ekonomi fokus pada upaya pengalokasian sumber daya yang terbatas dan memperoleh keuntungan optimal. Selain itu, kamu juga akan mengeksplorasi upaya pemberdayaan ekonomi. Dewasa ini, tren pembelajaran Ilmu Ekonomi mulai banyak yang mengarah pada behavioral economics lho. Selain itu, mulai berkembang pula crime economics, jadi kamu bisa melakukan analisis terhadap permasalahan hukum yang ditinjau dari sisi ekonomi.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/ekonomi.png'),
(13, 'Hukum', 'Jurusan Ilmu Hukum adalah studi yang mempelajari berbagai sistem hukum yang berkaitan dengan kehidupan kemasyarakatan. Di Prodi Ilmu Hukum, mahasiswa juga belajar mengenai perundang-undangan termasuk di dalamnya hukum dasar (konstitusi, hukum perdata, hukum dagang, hukum tata negara, hukum pidana, hukum tata pidana) hingga hukum internasional dengan cakupan yang cukup luas. Pada akhir masa kuliah, biasanya mahasiswa jurusan ini dituntut untuk mengaplikasikan ilmu yang telah diperoleh selama kuliah melalui magang di berbagai firma hukum, lembaga pengadilan, dan juga kantor kejaksaan.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/hukum.png'),
(14, 'Teknik Sipil', 'Teknik sipil adalah bidang ilmu yang mempelajari perencanaan/perancangan, manufaktur, manajemen/pengelolaan, dan konservasi dari beragam fasilitas dan sistem untuk mendukung sebuah kota, pedesaan, dan perkotaan. Artinya, seorang lulusan teknik sipil perlu menguasai ilmu terkait desain (saat melakukan perancangan), konsturksi (saat melakukan pembangunan dan menyusun sistem pengelolaan), hingga pemeliharaan lingkungan (saat melihat dampak pembangunan dari berbagai aspek).', 'https://storage.googleapis.com/nextstep-bucket/university-cover/teknik%20sipil.png'),
(15, 'Kriminologi', 'Kriminologi adalah ilmu yang mempelajari berbagai aspek tentang kejahatan. Kata kriminologi berasal dari bahasa Latin, yaitu gabungan crimen yang artinya kejahatan dan logos yang artinya ilmu. Mempelajari kriminologi artinya kamu akan mengenali berbagai faktor penyebab timbulnya kejahatan. Maka dari itu, kriminologi memiliki hubungan dengan ilmu-ilmu lainnya mulai dari sosiologi, psikologi, psikiatri, ekonomi, sejarah, biologi, geografi, antropologi, filsafat, politik, hukum, dan bahkan ilmu jurnalistik.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/kriminologi.png'),
(16, 'Sejarah', 'Jurusan sejarah mempelajari segala hal yang berkaitan dengan sejarah, mulai dari geografi sejarah, sejarah kerajaan nusantara, sejarah dunia, sejarah Indonesia, dan sebagainya. Ilmu sejarah itu berkaitan erat sama kehidupan manusia, seperti politik, sosial, budaya, bahasa, ekonomi, dan militer.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/sejarah.png'),
(17, 'Bimbingan Konseling', 'Jurusan Bimbingan Konseling adalah jurusan yang mempelajari ilmu pendidikan, yang berhubungan dengan cara pembelajaran, pemahaman pendidikan, dan pemahaman terhadap peserta didik. Ilmu pendidikan ini dipakai sebagai dasar dalam melakukan bimbingan bagi peserta didik.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/bimbingan%20konseling.png'),
(18, 'Administrasi Bisnis', 'Jurusan Administrasi Bisnis itu mempelajari berbagai hal yang berhubungan dengan operasional bisnis sebuah perusahaan dengan berbagai pendekatan strategis. Lulusannya akan siap untuk memulai karier baik sebagai seorang business analyst, konsultan, staf HRD, marketer, ataupun membangun perusahaan sendiri sekaligus mengaplikasikan semua keilmuan yang telah dimiliki.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/administrasi%20bisnis.png'),
(19, 'Marketing', 'Jurusan Manajemen Pemasaran (marketing)  adalah jurusan yang fokus pada perencanaan, pengelolaan, pelaksanaan, dan pengawasan hingga ke tahap evaluasi terhadap semua proses pemasaran barang maupun jasa oleh perusahaan. Mahasiswa akan belajar tentang bagaimana mengembangkan jangkauan pasar serta bagaimana jalannya pergerakan atau distribusi produk hingga ke tangan konsumen. Ilmu Manajemen Pemasaran mencakup juga tentang bagaimana memahami perilaku serta dinamika pada konsumen, melakukan analisa terhadap permintaan pasar, teori harga, mengenali segmentasi pasar, pemilihan metode dan media promosi atau iklan serta aspek-aspek di dalam kegiatan marketing lainnya.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/marketing.png'),
(20, 'Matematika', 'Jurusan Matematika fokus mempelajari berbagai teori matematika secara mendalam, seperti geometri, aljabar, hingga matematika diskrit. Jadi, Quipperian akan bertemu dengan beragam konsep dalam matematika seperti mempelajari fitur lain dari angka, juga ruang multidimensi.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/matematika.png'),
(21, 'Sosiologi', 'Sosiologi merupakan ilmu yang membahas perilaku sosial antar individu, antar kelompok, maupun antara individu dan kelompok. Di jurusan ini kamu juga akan membicarakan \"apa itu masyarakat.\" Kamu akan mempelajari struktur dan karakter masyarakat, problematika masyarakat, fenomena sosial, dan gerakan masyarakat. Selain itu, mempelajari metode survei sosial seperti kuisioner dan statistik, serta metode analisis dari hasil survei.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/Sosiologi.png'),
(22, 'Teknik Mesin', 'Teknik mesin belajar hal-hal terkait konversi energi, konstruksi dan perancangan, teknik produksi, juga material. Memang benar sih, secara umum kamu akan mempelajari mesin dengan menggunakan dasar fisika dan matematika, seperti pergerakan mesin, aliran air untuk mesin, material dan desain mesin, elemen penting seperti roda gigi dan sumber mata air, metode pengolahan, metode produksi, pengendalian melalui komputer, dsb.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/teknik%20lingkungan.png'),
(23, 'Ilmu Politik', 'Ilmu Politik merupakan bidang ilmu yang banyak mengkaji gejala maupun fenomena sosial politik sehingga nantinya mampu menerapkan teori-teori ilmu politik untuk menawarkan solusi dari permasalahan sosial politik. Jurusan ini tidak hanya mempelajari bagaimana politik di Indonesia, tapi juga politik di berbagai negara.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/Ilmu%20politik.png'),
(24, 'Teknologi Informasi', 'Jurusan Teknologi Informasi atau TI mendalami solusi-solusi terkait teknologi komputer yang diterapkan pada berbagai bidang, di antaranya yakni pemerintahan, kesehatan, pendidikan, termasuk pengembangan bisnis.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/Teknologi%20Informasi.png'),
(25, 'Kimia', 'jurusan yang mempelajari tentang ilmu kimia meliputi sifat, struktur, hingga reaksi zat-zat kimia. Mahasiswa jurusan ini akan banyak mempelajari tentang struktur zat mulai dari atom hingga molekul, sifat zat kimia, dan reaksi zat kimia yang berpengaruh dalam kehidupan sehari-hari baik di bidang farmasi, Industri, kehutanan, dan bidang lainnya. Meskipun jurusan ini sudah dipelajari di sekolah, tetapi terdapat materi yang lebih diperdalam di tingkat universitas diantaranya kimia organik, kimia anorganik, biokimia, dan manajemen laboratorium.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/kimia.png'),
(26, 'Manajemen', 'Jurusan Manajemen merupakan bidang keilmuan yang mempelajari tentang kegiatan perusahaan atau korporasi, yang masih memiliki keterkaitan dengan ilmu ekonomi dan bisnis. Jika Quipperian mendalami Ilmu Manajemen maka akan belajar menjadi seorang “pengendali” layaknya tokoh Aang pada serial Avatar. Jika Aang mengendalikan elemen bumi, kamu akan mengendalikan roda perusahaan berupa kegiatan yang meliputi kebijakan manajemen perusahaan, organisasi, strategi bisnis, ketenagakerjaan dan kepegawaian, manajemen produksi, pemasaran, administrasi, hingga organisasi nirlaba.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/manajemen.png'),
(27, 'Hubungan Masyarakat', 'Manajemen Sumber Daya Manusia merupakan salah satu departemen yang berada di perusahaan yang mengurusi permasalahan antara perusahaan dengan karyawan dalam pengelolaan dan pengembangan potensi sumber daya manusia. Dalam hal ini kajian yang akan dibahas terkait dinamika sumber daya manusia, hubungan kerja, hak sipil, hukum dan aturan kerja, sistem motivasi dan kompensasi, manajemen karir, pengujian dan penilaian karyawan, hingga program pelatihan karyawan.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/manajemen%20sdm.png'),
(28, 'Musik', 'Di jurusan Musik kamu akan mempelajari bidang ilmu yang mempelajari teori musik dan membekalimu dengan keterampilan praktis seperti instrumen dalam musik, teknik vokal, dan komposisi. Selain itu, kamu juga akan mempelajari berbagai aliran musik seperti jazz, pop, musik tradisional, dan sebagainya.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/musik.png'),
(29, 'Arsitektur', 'Arsitektur merupakan salah satu jurusan yang cukup populer di Indonesia. Para mahasiswa di program studi Arsitektur mempelajari desain dan rancangan konstruksi bangunan. Arsitektur lebih cenderung menuangkan ide, konsep, dan desain di atas kertas, sedangkan realisasi pembangunannya akan dikerjakan oleh Teknik Sipil. Dalam mendalami arsitektur, para mahasiswa harus mempelajari kekuatan bangunan (firmitas), estetika atau keindahan bangunan (venustas), dan fungsi bangunan (utilitas).\n\n', 'https://storage.googleapis.com/nextstep-bucket/university-cover/arsitektur.png'),
(30, 'Teknik Elektro', 'Teknik Elektro merupakan bidang ilmu yang mempelajari listrik dan aplikasinya dalam kehidupan sehari-hari. Kalian akan dibekali dengan ilmu dan pengetahuan seputar konsep, perancangan, pengembangan, serta produksi perangkat listrik dan elektronik. Kamu juga akan banyak membahas metode pembangkit dengan sumber energi baru, metode penyimpanan energi, dan metode kontrol penghematan energi.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/elektro.png'),
(31, 'Fisika', 'Fisika merupakan bidang ilmu yang fokus mempelajari gejala alam tidak hidup (materi) dalam lingkup ruang dan waktu. Mulai dari menelusuri dasar-dasar hukum alam partikel submikroskopis yang membentuk materi hingga perilaku materi alam semesta sebagai satu kesatuan kosmos. Selain itu, Quipperian juga bakal belajar fisika secara fundamental dan modern seperti; dinamika, gaya elektromagnetik, mekanika kuantum, termodinamika, dan sebagainya.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/fisika.png'),
(32, 'Hubungan Internasional', 'Hubungan Internasional berkaitan erat dengan upaya suatu negara menghadapi tantangan internasional seperti ketidakseimbangan perdagangan dunia, isu keamanan, masalah lingkungan secara global, dan kemiskinan melalui kerja sama antarnegara. Kuliah di jurusan ini memungkinkanmu untuk merasakan atmosfer internasional melalui berbagai simulasi pertemuan-pertemuan penting di dunia, salah satunya sidang PBB.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/hubungan%20internasional.png'),
(33, 'Pendidikan Olahraga', 'Pendidikan Olahraga merupakan bidang ilmu yang fokus mempelajari olahraga dari sudut pandang seorang pengajar. Quipperian akan mempelajari berbagai aturan dalam olahraga, kesehatan mental dan fisik, peningkatan fungsi fisik, olahraga dan nutrisi, metode pelatihan untuk kompetisi, taktik dan strategi, dan metode pengajaran. Kamu pun akan mempelajari hampir seluruh cabang olahraga mulai dari sepak bola, basket, voli, renang, atletik, sampai woodball.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/pendidikan%20olahraga.png'),
(34, 'Teknik Kimia', 'Jurusan Teknik Kimia merupakan bidang studi yang mempelajari rekayasa untuk menghasilkan suatu produk dengan nilai ekonomis tinggi. Kamu akan mencari dan mengembangkan suatu teknik produksi. Jadi, jurusan ini berbeda dengan program studi kimia atau pendidikan kimia ya. Nah, nantinya kamu akan banyak mengembangkan penelitian terkait desain molekular baru, sintesis, dan reaksi kimia untuk mewujudkan masyarakat ramah lingkungan.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/teknik%20kimia.png'),
(35, 'Kesehatan Masyarakat', 'Program Studi Kesehatan Masyarakat merupakan bidang ilmu yang mempelajari pencegahan dan pengobatan penyakit pada individu. Bidang ilmu ini juga bertujuan menjaga dan mempromosikan kesehatan sosial dengan mempelajari hubungan antara manusia dan lingkungan dan metode pencegahan penyakit, kesehatan dalam suatu kawasan, maupun kesehatan di lingkungan kerja. Pada Prodi Kesehatan Masyarakat, mahasiswa juga akan mempelajari tentang ilmu gizi, manajemen dan administrasi kesehatan, dan proses penyuluhan kesehatan di masyarakat.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/Kesehatan%20Masyarakat.png'),
(36, 'Pariwisata', 'Pariwisata di Indonesia sedang mengalami perkembangan yang cukup pesat dan menjadikan bidang ini sebagai salah satu bidang yang sangat menjanjikan di masa depan. Pariwisata nggak sekadar jalan-jalan aja lho, tetapi lebih luas juga membahas manajemen dan strateginya. Ilmu Pariwisata berhubungan erat dengan sejarah, geografi, budaya, ekonomi, dan sebagainya. Bidang ilmu ini mempelajari sumber daya pariwisata, pembangunan kawasan pariwisata, juga manajemen perhotelan. Bekal pengetahuan tersebut sangat berguna ketika kamu bekerja di industri pariwisata seperti agen perjalanan maupun perhotelan.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/pariwisata.png'),
(37, 'Filsafat', 'Filsafat merupakan bidang ilmu yang mempelajari cara berpikir. Kalian dilatih untuk mempertanyakan suatu keadaan. Selain itu, juga akan diajarkan bagaimana memformulasikan dan mengokohkan pandanganmu secara merdeka tentang suatu permasalahan di dunia ini. Kamu akan diajak untuk mengenal jenis-jenis kesesatan berpikir, karakteristik ilmu pengetahuan, mengkritik suatu karya seni, pentingnya empati, mengkaji kapan suatu tindakan bisa dikatakan baik dan buruk, dan sebagainya.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/filsafat.png'),
(38, 'Jurnalistik', 'Jurusan Jurnalistik mengajak mahasiswa mendalami dunia jurnalistik beserta karakter dan dinamika yang terjadi di berbagai media massa (televisi, radio, cetak, dan online). Mahasiswa akan mempelajari bagaimana suatu informasi didistribusikan melalui media massa, dan mengetahui karakter masing-masing media beserta perubahannya. Dalam perkuliahan, mahasiswa akan belajar berbagai hal termasuk mencari, menulis, serta menyunting berita. Kemampuanmu menyampaikan pesan melalui berbagai media massa akan terus diasah selama mengenyam pendidikan di jurusan ini. Umumnya, Jurnalistik menjadi salah satu pilihan konsentrasi di Jurusan Ilmu Komunikasi. Namun, di beberapa kampus Jurusan Jurnalistik bisa berdiri sendiri.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/jurnalistik.png'),
(39, 'Teknik Komputer', 'Teknik Komputer adalah ilmu yang kokoh berdiri pada teori dan prinsip komputasi, Matematika, serta rekayasa. Hal tersebut diaplikasikan untuk merancang perangkat lunak, perangkat keras, jaringan, dan instrumen atau peralatan terkomputerisasi untuk menyelesaikan berbagai permasalahan teknis serta bisa diterapkan pada berbagai area.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/teknik%20komputer.png'),
(40, 'Farmasi', 'Jurusan yang satu ini bisa jadi pilihan yang cocok bagi kamu jika ingin berkecimpung di dunia medis selain menjadi dokter atau perawat. Farmasi merupakan kombinasi antara ilmu kesehatan dengan ilmu kimia dan tentunya sangat diperlukan di dunia medis.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/farmasi.png'),
(41, 'Teknik Lingkungan', 'Jurusan Teknik Lingkungan adalah bidang ilmu yang mempelajari berbagai permasalahan lingkungan dan solusinya seperti konservasi sumber daya air, pengelolaan lingkungan, pengendalian pencemaran akibat limbah dan lainnya. Contoh permasalahan lingkungan yang sering kita temui saat ini misalnya pencemaran udara dan air di area industri, kurangnya akses air bersis di pemukiman padat penduduk, atau timbunan sampah yang tidak tertanangani dengan baik.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/teknik%20lingkungan.png'),
(42, 'Antropologi', 'Antropologi merupakan studi yang mempelajari ciri khas dan kesamaan dari suatu masyarakat dan kebudayaan melalui penelitian tentang bahasa dan agama di dunia, hak asasi manusia, upacara, pola pikir, kemasyarakatan, etika, budaya, dan banyak hal lainnya', 'https://storage.googleapis.com/nextstep-bucket/university-cover/antropologi.png'),
(43, 'Digital Bisnis', 'Bisnis digital termasuk dalam rumpun ilmu terapan. Pada implementasinya, jurusan ini akan mengajarkan untuk merancang dan menjalankan bisnis yang berbasis digital. Ilmu yang akan diperoleh adalah perpaduan dari manajemen, bisnis, teknik informatika, dan juga sistem informasi. Umumnya, Jurusan Bisnis Digital tersedia pada program D4 atau S1.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/digital%20bisnis.png'),
(44, 'Desain Grafis', 'Jurusan Desain Grafis ialah jurusan yang mempelajari tentang konsep, bentuk, dan komposisi suatu karya komunikasi visual berupa gambar, garis, maupun elemen grafis lainnya. Hasil dari karya desain diaplikasikan pada berbagai media. Karya desain grafis dapat dijumpai antara lain pada logo, poster, brosur, undangan, hingga kartu nama baik itu dalam bentuk cetak atau digital. Ilmu desain grafis juga dapat diterapkan untuk membuat desain tampilan antarmuka website bahkan aplikasi mobile.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/desain%20grafis.png'),
(45, 'Teknik Elektronika', 'Teknik Elektronika adalah bidang teknik yang mempelajari tentang listrik arus lemah, komponen-komponen listrik, peralatan semikonduktor serta cara mengaplikasikannya. Listrik arus lemah sendiri merupakan rangkaian atau sistem listrik yang mengalirkan arus kecil. Biasanya, terdapat pada televisi, radio, komputer, laptop, dan alat elektronik lainnya.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/teknik%20elektronika.png'),
(46, 'Teknik Biomedik', 'Jurusan Biomedik memiliki tujuan untuk mengembangkan teknologi dalam bidang kedokteran atau medis. Hal tersebut tentunya akan sangat bermanfaat untuk mempermudah proses diagnosis, rehabilitasi, pengobatan, dan penyembuhan pasien. Lulusan dari jurusan ini diharapkan bisa melakukan pengukuran, perawatan, dan kalibrasi peralatan medis yang ada di rumah sakit. Bukan cuma itu, para lulusan Teknik Biomedis juga diharapkan bisa mengembangkan teknologi atau perangkat baru yang berguna di bidang kesehatan. Apalagi jumlah penduduk di dunia kian meningkat, yang pastinya membuat kebutuhan akan seorang ahli bidang kesehatan turut mengalami peningkatan juga.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/teknik%20biomedik.png'),
(47, 'Geografi', 'Geografi umumnya membahas bentang lahan dan hal-hal terkait fisik bumi. Quipperian akan mempelajari topografi, iklim, hingga geografi manusia untuk mencari hubungan antara kondisi alami dan pengumpulan populasi, penggunaan lahan, industri, sejarah, budaya, dan sebagainya. Selain belajar tentang fisik bumi, kamu juga akan dibekali dengan kemampuan untuk memahami perspektif regional dalam berbagai pengembangan wilayah termasuk penguasaan teknologi sistem informasi geografis.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/geografi.png'),
(48, 'Linguistik', 'Ilmu linguistik adalah ilmu yang mempelajari bahasa secara ilmiah, baik dari segi struktur bahasa, penggunaan bahasa, hingga sejarah perkembangan bahasa. Program studi ini biasanya mencakup materi seperti fonetik dan fonologi, morfologi, sintaksis, semantik, pragmatik, sosiolinguistik, psikolinguistik, neurolinguistik, dan analisis wacana.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/linguistik.png'),
(49, 'Pendidikan Anak Usia Dini', 'Jurusan Pendidikan Anak Usia Dini (PAUD) adalah jurusan yang akan membuat kamu memahami dunia anak-anak. Ada sebagian orang yang meremehkan jurusan yang terlihat gampang ini. Padahal kenyataannya berbanding terbalik, karena saat berkuliah di sini maka kamu dituntut untuk menguasai berbagai bidang. Beberapa di antaranya seperti bahasa, ilmu gizi, olahraga, hingga psikologi. Dengan mempelajari mata kuliah lintas disiplin, calon lulusan diharapkan dapat menjadi pengajar khusus anak usia dini yang mumpuni dan profesional.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/Pendidikan%20Anak%20Usia%20Dini.png'),
(50, 'Teknik Industri', 'Teknik Industri adalah bidang ilmu yang mempelajari bagaimana mengoptimalisasi kegiatan manusia seperti; produksi, pengelolaan dan ekonomi. Lulusan Teknik Industri nantinya bertanggungjawab atas optimalisasi praktis dari sistem produksi pabrik, proposal strategi, serta desain optimal manajemen perusahaan. Di jurusan Teknik Industri, kamu akan banyak melakukan penyelesaian masalah melalui pendekatan matematis.', 'https://storage.googleapis.com/nextstep-bucket/university-cover/teknik%20industri.png');

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
(1, 'Psikolog Klinis', 'IDR 6.000.000 - 12.000.000', 'Memberikan terapi dan konseling untuk individu dengan masalah kesehatan mental.', 1),
(2, 'Psikolog Pendidikan', 'IDR 5.000.000 - 10.000.000', 'Bekerja di sekolah untuk membantu siswa mengatasi masalah belajar dan sosial.', 1),
(3, 'Konselor Karir', 'IDR 4.000.000 - 8.000.000', 'Membantu individu dalam pemilihan dan pengembangan karir.', 1),
(4, 'Manajer Proyek', 'IDR 10.000.000 - 20.000.000', 'Mengelola dan mengawasi proyek dari awal hingga akhir.', 2),
(5, 'Manajer Operasional', 'IDR 8.000.000 - 15.000.000', 'Mengawasi operasional harian perusahaan untuk memastikan efisiensi.', 2),
(6, 'Analis Bisnis', 'IDR 7.000.000 - 14.000.000', 'Menganalisis proses bisnis dan merekomendasikan peningkatan.', 2),
(7, 'Editor', 'IDR 5.000.000 - 10.000.000', 'Mengedit dan merevisi konten tulisan untuk publikasi.', 3),
(8, 'Penulis Konten', 'IDR 4.000.000 - 8.000.000', 'Menulis artikel, blog, dan konten lainnya untuk berbagai media.', 3),
(9, 'Penerjemah', 'IDR 3.000.000 - 6.000.000', 'Menerjemahkan dokumen dari bahasa Inggris ke bahasa Indonesia dan sebaliknya.', 3),
(10, 'Perawat Rumah Sakit', 'IDR 4.000.000 - 8.000.000', 'Merawat pasien di rumah sakit, termasuk memberikan obat dan perawatan.', 4),
(11, 'Perawat Komunitas', 'IDR 3.500.000 - 7.000.000', 'Memberikan perawatan kesehatan di komunitas atau rumah pasien.', 4),
(12, 'Perawat Lansia', 'IDR 3.000.000 - 6.000.000', 'Mengurus dan merawat pasien lanjut usia di panti jompo atau rumah pribadi.', 4),
(13, 'Akuntan Publik', 'IDR 5.000.000 - 10.000.000', 'Menyediakan layanan akuntansi untuk klien individu dan perusahaan.', 5),
(14, 'Auditor Internal', 'IDR 6.000.000 - 12.000.000', 'Memeriksa dan mengevaluasi keuangan perusahaan untuk memastikan kepatuhan dan efisiensi.', 5),
(15, 'Analis Keuangan', 'IDR 7.000.000 - 14.000.000', 'Menganalisis data keuangan untuk membantu keputusan investasi dan manajemen keuangan.', 5),
(16, 'Ahli Bioteknologi', 'IDR 6.000.000 - 12.000.000', 'Mengembangkan produk dan teknologi berbasis biologi.', 6),
(17, 'Peneliti Biologi', 'IDR 5.000.000 - 10.000.000', 'Melakukan penelitian ilmiah dalam bidang biologi.', 6),
(18, 'Ahli Ekologi', 'IDR 5.000.000 - 9.000.000', 'Mempelajari hubungan antara organisme hidup dan lingkungan mereka.', 6),
(19, 'Dokter Umum', 'IDR 8.000.000 - 15.000.000', 'Memberikan perawatan kesehatan dasar dan rujukan ke spesialis.', 7),
(20, 'Dokter Spesialis', 'IDR 15.000.000 - 30.000.000', 'Memberikan perawatan medis lanjutan dalam bidang spesialisasi tertentu.', 7),
(21, 'Peneliti Medis', 'IDR 10.000.000 - 20.000.000', 'Melakukan penelitian untuk mengembangkan obat dan terapi baru.', 7),
(22, 'Seniman', 'IDR 4.000.000 - 8.000.000', 'Menciptakan karya seni untuk pameran atau penjualan.', 8),
(23, 'Kurator Galeri', 'IDR 5.000.000 - 10.000.000', 'Mengelola koleksi dan pameran di galeri seni.', 8),
(24, 'Desainer Grafis', 'IDR 5.000.000 - 10.000.000', 'Membuat desain visual untuk media cetak dan digital.', 8),
(25, 'Pengembang Perangkat Lunak', 'IDR 8.000.000 - 15.000.000', 'Merancang, mengembangkan, dan memelihara aplikasi perangkat lunak.', 9),
(26, 'Analis Sistem', 'IDR 7.000.000 - 14.000.000', 'Menganalisis kebutuhan sistem dan merekomendasikan solusi teknologi.', 9),
(27, 'Spesialis Keamanan Siber', 'IDR 10.000.000 - 20.000.000', 'Melindungi sistem komputer dan jaringan dari ancaman siber.', 9),
(28, 'Spesialis Hubungan Masyarakat', 'IDR 5.000.000 - 10.000.000', 'Mengelola hubungan perusahaan dengan publik dan media.', 10),
(29, 'Manajer Media Sosial', 'IDR 5.000.000 - 10.000.000', 'Mengelola dan mengoptimalkan konten di platform media sosial.', 10),
(30, 'Penyiar Radio/TV', 'IDR 4.000.000 - 8.000.000', 'Menyajikan program radio atau televisi.', 10),
(31, 'Pekerja Sosial', 'IDR 4.000.000 - 8.000.000', 'Memberikan dukungan dan layanan kepada individu dan keluarga yang membutuhkan.', 11),
(32, 'Konselor Kesehatan Mental', 'IDR 5.000.000 - 10.000.000', 'Memberikan konseling dan terapi kepada individu dengan masalah kesehatan mental.', 11),
(33, 'Pengelola LSM', 'IDR 5.000.000 - 10.000.000', 'Mengelola program dan proyek dalam Lembaga Swadaya Masyarakat (LSM).', 11),
(34, 'Analis Ekonomi', 'IDR 7.000.000 - 14.000.000', 'Menganalisis data ekonomi untuk memberikan wawasan dan rekomendasi kebijakan.', 12),
(35, 'Ekonom Penelitian', 'IDR 8.000.000 - 15.000.000', 'Melakukan penelitian tentang tren ekonomi dan memberikan laporan analitis.', 12),
(36, 'Konsultan Ekonomi', 'IDR 10.000.000 - 20.000.000', 'Memberikan saran tentang isu ekonomi kepada perusahaan dan pemerintah.', 12),
(37, 'Pengacara', 'IDR 8.000.000 - 20.000.000', 'Memberikan nasihat hukum dan mewakili klien di pengadilan.', 13),
(38, 'Notaris', 'IDR 10.000.000 - 15.000.000', 'Mengurus akta dan dokumen legal serta memberikan jasa notarization.', 13),
(39, 'Konsultan Hukum', 'IDR 7.000.000 - 14.000.000', 'Memberikan saran hukum kepada perusahaan atau individu.', 13),
(40, 'Insinyur Konstruksi', 'IDR 8.000.000 - 16.000.000', 'Merancang, mengawasi, dan mengelola proyek konstruksi.', 14),
(41, 'Manajer Proyek Konstruksi', 'IDR 10.000.000 - 20.000.000', 'Mengawasi pelaksanaan proyek konstruksi dari awal hingga akhir.', 14),
(42, 'Insinyur Struktur', 'IDR 9.000.000 - 18.000.000', 'Menganalisis dan merancang struktur bangunan agar kuat dan tahan lama.', 14),
(43, 'Analis Kriminal', 'IDR 7.000.000 - 14.000.000', 'Menganalisis data kriminal untuk memahami pola dan mencegah kejahatan.', 15),
(44, 'Peneliti Kriminologi', 'IDR 6.000.000 - 12.000.000', 'Melakukan penelitian tentang penyebab dan dampak kejahatan.', 15),
(45, 'Konsultan Keamanan', 'IDR 8.000.000 - 15.000.000', 'Memberikan saran keamanan kepada perusahaan atau organisasi.', 15),
(46, 'Sejarawan', 'IDR 5.000.000 - 10.000.000', 'Melakukan penelitian dan menulis tentang peristiwa sejarah.', 16),
(47, 'Kurator Museum', 'IDR 4.000.000 - 8.000.000', 'Mengelola koleksi dan pameran di museum.', 16),
(48, 'Dosen Sejarah', 'IDR 6.000.000 - 12.000.000', 'Mengajar mata pelajaran sejarah di perguruan tinggi dan melakukan penelitian akademis.', 16),
(49, 'Konselor Sekolah', 'IDR 5.000.000 - 10.000.000', 'Membantu siswa dengan masalah akademik, sosial, dan emosional.', 17),
(50, 'Konselor Karir', 'IDR 4.000.000 - 8.000.000', 'Membantu individu dalam pemilihan dan pengembangan karir.', 17),
(51, 'Konselor Kesehatan Mental', 'IDR 5.000.000 - 10.000.000', 'Memberikan konseling dan terapi kepada individu dengan masalah kesehatan mental.', 17),
(52, 'Manajer Operasional', 'IDR 8.000.000 - 15.000.000', 'Mengawasi operasional harian perusahaan untuk memastikan efisiensi.', 18),
(53, 'Manajer Proyek', 'IDR 10.000.000 - 20.000.000', 'Mengelola dan mengawasi proyek dari awal hingga akhir.', 18),
(54, 'Analis Bisnis', 'IDR 7.000.000 - 14.000.000', 'Menganalisis proses bisnis dan merekomendasikan peningkatan.', 18),
(55, 'Manajer Pemasaran', 'IDR 8.000.000 - 15.000.000', 'Merancang strategi pemasaran untuk meningkatkan penjualan produk atau layanan.', 19),
(56, 'Spesialis Digital Marketing', 'IDR 6.000.000 - 12.000.000', 'Mengelola kampanye pemasaran digital dan media sosial.', 19),
(57, 'Analis Pemasaran', 'IDR 5.000.000 - 10.000.000', 'Menganalisis data pasar untuk mengidentifikasi tren dan peluang.', 19),
(58, 'Analis Data', 'IDR 7.000.000 - 14.000.000', 'Menganalisis data untuk membantu pengambilan keputusan bisnis.', 20),
(59, 'Aktuaris', 'IDR 8.000.000 - 16.000.000', 'Menganalisis risiko keuangan menggunakan matematika, statistik, dan teori keuangan.', 20),
(60, 'Peneliti Matematika', 'IDR 6.000.000 - 12.000.000', 'Melakukan penelitian dalam bidang matematika dan menerapkan penemuan tersebut.', 20),
(61, 'Analis Sosial', 'IDR 6.000.000 - 12.000.000', 'Menganalisis data sosial untuk memahami tren dan isu-isu masyarakat.', 21),
(62, 'Peneliti Sosial', 'IDR 5.000.000 - 10.000.000', 'Melakukan penelitian tentang isu-isu sosial dan dampaknya.', 21),
(63, 'Konsultan Sosial', 'IDR 7.000.000 - 14.000.000', 'Memberikan saran dan rekomendasi tentang kebijakan sosial.', 21),
(64, 'Insinyur Mesin', 'IDR 8.000.000 - 16.000.000', 'Merancang, mengembangkan, dan menguji mesin dan peralatan mekanis.', 22),
(65, 'Manajer Produksi', 'IDR 10.000.000 - 20.000.000', 'Mengawasi proses produksi di pabrik untuk memastikan efisiensi dan kualitas.', 22),
(66, 'Teknisi Pemeliharaan', 'IDR 5.000.000 - 10.000.000', 'Memelihara dan memperbaiki mesin dan peralatan mekanis.', 22),
(67, 'Analis Kebijakan Publik', 'IDR 7.000.000 - 14.000.000', 'Menganalisis dan mengevaluasi kebijakan publik untuk memberikan rekomendasi.', 23),
(68, 'Konsultan Politik', 'IDR 8.000.000 - 15.000.000', 'Memberikan saran strategis kepada kandidat politik dan partai.', 23),
(69, 'Peneliti Politik', 'IDR 6.000.000 - 12.000.000', 'Melakukan penelitian tentang sistem politik, kebijakan, dan perilaku politik.', 23),
(70, 'Pengembang Perangkat Lunak', 'IDR 8.000.000 - 15.000.000', 'Merancang, mengembangkan, dan memelihara aplikasi perangkat lunak.', 24),
(71, 'Analis Sistem', 'IDR 7.000.000 - 14.000.000', 'Menganalisis kebutuhan sistem dan merekomendasikan solusi teknologi.', 24),
(72, 'Spesialis Keamanan Siber', 'IDR 10.000.000 - 20.000.000', 'Melindungi sistem komputer dan jaringan dari ancaman siber.', 24),
(73, 'Ahli Kimia', 'IDR 6.000.000 - 12.000.000', 'Melakukan penelitian dan eksperimen untuk mengembangkan produk dan proses kimia.', 25),
(74, 'Analis Laboratorium', 'IDR 5.000.000 - 10.000.000', 'Menganalisis sampel kimia untuk memastikan kualitas dan kepatuhan.', 25),
(75, 'Peneliti Kimia', 'IDR 6.000.000 - 12.000.000', 'Melakukan penelitian untuk mengembangkan produk dan proses kimia baru.', 25),
(76, 'Business Manager', 'IDR 7.000.000 - 15.000.000', 'Mengelola operasi bisnis sehari-hari dan membuat keputusan strategis.', 26),
(77, 'Operations Manager', 'IDR 6.000.000 - 12.000.000', 'Mengawasi efisiensi operasional dan produktivitas perusahaan.', 26),
(78, 'Marketing Manager', 'IDR 6.000.000 - 10.000.000', 'Merencanakan dan mengarahkan strategi pemasaran perusahaan.', 26),
(79, 'Public Relations Specialist', 'IDR 5.000.000 - 10.000.000', 'Membangun dan memelihara citra publik perusahaan.', 27),
(80, 'Communications Manager', 'IDR 6.000.000 - 12.000.000', 'Mengelola komunikasi internal dan eksternal perusahaan.', 27),
(81, 'Media Relations Coordinator', 'IDR 5.000.000 - 8.000.000', 'Mengelola hubungan dengan media dan menyiapkan rilis berita.', 27),
(82, 'Music Producer', 'IDR 5.000.000 - 12.000.000', 'Mengarahkan dan mengelola proses produksi musik.', 28),
(83, 'Sound Engineer', 'IDR 4.000.000 - 8.000.000', 'Mengoperasikan peralatan perekaman dan mengedit audio.', 28),
(84, 'Music Teacher', 'IDR 4.000.000 - 7.000.000', 'Mengajar keterampilan musik dan teori musik kepada siswa.', 28),
(85, 'Architect', 'IDR 7.000.000 - 15.000.000', 'Merancang bangunan dan memastikan kepatuhan terhadap kode bangunan.', 29),
(86, 'Interior Designer', 'IDR 5.000.000 - 10.000.000', 'Merancang interior ruangan untuk fungsi dan estetika.', 29),
(87, 'Urban Planner', 'IDR 6.000.000 - 12.000.000', 'Merencanakan dan merancang tata letak kota dan wilayah.', 29),
(88, 'Electrical Engineer', 'IDR 6.000.000 - 12.000.000', 'Merancang dan mengembangkan sistem kelistrikan dan elektronik.', 30),
(89, 'Control Systems Engineer', 'IDR 6.000.000 - 10.000.000', 'Mengembangkan dan memelihara sistem kontrol otomatis.', 30),
(90, 'Power Systems Engineer', 'IDR 7.000.000 - 14.000.000', 'Merancang dan memelihara jaringan distribusi tenaga listrik.', 30),
(91, 'Physicist', 'IDR 7.000.000 - 15.000.000', 'Meneliti fenomena fisik dan mengembangkan teori ilmiah.', 31),
(92, 'Research Scientist', 'IDR 6.000.000 - 12.000.000', 'Melakukan penelitian dalam berbagai disiplin ilmu fisika.', 31),
(93, 'Laboratory Technician', 'IDR 4.000.000 - 7.000.000', 'Menjalankan eksperimen dan menganalisis data di laboratorium.', 31),
(94, 'Diplomat', 'IDR 8.000.000 - 18.000.000', 'Mewakili negara dalam hubungan internasional dan negosiasi.', 32),
(95, 'International Relations Specialist', 'IDR 6.000.000 - 12.000.000', 'Mengelola hubungan internasional dan kebijakan luar negeri.', 32),
(96, 'Policy Analyst', 'IDR 5.000.000 - 10.000.000', 'Menganalisis kebijakan publik dan memberikan rekomendasi.', 32),
(97, 'Sports Coach', 'IDR 4.000.000 - 10.000.000', 'Melatih atlet dan mengembangkan keterampilan olahraga mereka.', 33),
(98, 'Physical Education Teacher', 'IDR 4.000.000 - 8.000.000', 'Mengajar pendidikan jasmani di sekolah-sekolah.', 33),
(99, 'Fitness Trainer', 'IDR 4.000.000 - 9.000.000', 'Membantu individu mencapai tujuan kebugaran mereka.', 33),
(100, 'Chemical Engineer', 'IDR 6.000.000 - 12.000.000', 'Merancang proses produksi bahan kimia dan produk terkait.', 34),
(101, 'Process Engineer', 'IDR 5.000.000 - 10.000.000', 'Mengoptimalkan proses produksi untuk efisiensi dan kualitas.', 34),
(102, 'Quality Control Analyst', 'IDR 4.000.000 - 8.000.000', 'Mengawasi kontrol kualitas dan memastikan standar dipenuhi.', 34),
(103, 'Public Health Specialist', 'IDR 6.000.000 - 12.000.000', 'Merancang dan mengimplementasikan program kesehatan masyarakat.', 35),
(104, 'Epidemiologist', 'IDR 7.000.000 - 15.000.000', 'Meneliti pola penyakit dan kesehatan dalam populasi.', 35),
(105, 'Health Educator', 'IDR 4.000.000 - 8.000.000', 'Mengedukasi masyarakat tentang kesehatan dan pencegahan penyakit.', 35),
(106, 'Tour Guide', 'IDR 4.000.000 - 8.000.000', 'Memimpin tur dan memberikan informasi kepada wisatawan.', 36),
(107, 'Travel Agent', 'IDR 4.500.000 - 9.000.000', 'Mengatur perjalanan dan paket wisata untuk klien.', 36),
(108, 'Event Planner', 'IDR 5.000.000 - 10.000.000', 'Merencanakan dan mengkoordinasikan acara-acara khusus.', 36),
(109, 'Philosopher', 'IDR 5.000.000 - 10.000.000', 'Mempelajari dan mengajarkan teori-teori filosofis.', 37),
(110, 'Ethics Officer', 'IDR 5.000.000 - 10.000.000', 'Menyusun kebijakan etika untuk organisasi.', 37),
(111, 'Research Analyst', 'IDR 4.500.000 - 8.000.000', 'Melakukan penelitian dalam bidang filsafat dan humaniora.', 37),
(112, 'Journalist', 'IDR 4.000.000 - 8.000.000', 'Menulis dan melaporkan berita untuk media cetak atau digital.', 38),
(113, 'Editor', 'IDR 5.000.000 - 10.000.000', 'Mengedit dan mengelola konten untuk publikasi.', 38),
(114, 'Broadcast Journalist', 'IDR 5.000.000 - 9.000.000', 'Menyampaikan berita melalui media penyiaran.', 38),
(115, 'Software Developer', 'IDR 6.000.000 - 12.000.000', 'Mengembangkan dan memelihara perangkat lunak aplikasi.', 39),
(116, 'Systems Analyst', 'IDR 5.000.000 - 10.000.000', 'Menganalisis kebutuhan sistem dan mengembangkan solusi teknologi.', 39),
(117, 'Network Engineer', 'IDR 6.000.000 - 11.000.000', 'Merancang dan memelihara jaringan komputer.', 39),
(118, 'Pharmacist', 'IDR 6.000.000 - 12.000.000', 'Menyiapkan dan mendistribusikan obat-obatan kepada pasien.', 40),
(119, 'Clinical Research Associate', 'IDR 6.000.000 - 12.000.000', 'Mengelola dan mengawasi uji klinis obat-obatan baru.', 40),
(120, 'Pharmaceutical Sales Representative', 'IDR 5.000.000 - 10.000.000', 'Menjual produk farmasi kepada profesional kesehatan.', 40),
(121, 'Environmental Engineer', 'IDR 6.000.000 - 12.000.000', 'Merancang solusi untuk masalah lingkungan seperti polusi.', 41),
(122, 'Environmental Consultant', 'IDR 5.000.000 - 10.000.000', 'Memberikan saran tentang praktik ramah lingkungan kepada perusahaan.', 41),
(123, 'Sustainability Specialist', 'IDR 5.000.000 - 10.000.000', 'Mempromosikan praktik berkelanjutan dalam organisasi.', 41),
(124, 'Anthropologist', 'IDR 5.000.000 - 10.000.000', 'Mempelajari dan meneliti budaya dan masyarakat manusia.', 42),
(125, 'Cultural Resource Manager', 'IDR 5.000.000 - 10.000.000', 'Mengelola dan melestarikan sumber daya budaya.', 42),
(126, 'Museum Curator', 'IDR 4.500.000 - 9.000.000', 'Mengelola koleksi artefak dan pameran di museum.', 42),
(127, 'E-commerce Manager', 'IDR 6.000.000 - 12.000.000', 'Mengelola dan mengembangkan platform e-commerce.', 43),
(128, 'Digital Marketing Specialist', 'IDR 5.000.000 - 10.000.000', 'Merancang dan melaksanakan strategi pemasaran digital.', 43),
(129, 'SEO Specialist', 'IDR 4.500.000 - 9.000.000', 'Mengoptimalkan konten untuk meningkatkan peringkat mesin pencari.', 43),
(130, 'Graphic Designer', 'IDR 4.500.000 - 9.000.000', 'Membuat desain visual untuk media cetak dan digital.', 44),
(131, 'UI/UX Designer', 'IDR 5.000.000 - 10.000.000', 'Merancang antarmuka pengguna dan pengalaman pengguna.', 44),
(132, 'Art Director', 'IDR 6.000.000 - 12.000.000', 'Mengarahkan konsep visual dalam proyek kreatif.', 44),
(133, 'Electronics Engineer', 'IDR 5.500.000 - 11.000.000', 'Merancang dan mengembangkan perangkat elektronik.', 45),
(134, 'Embedded Systems Engineer', 'IDR 6.000.000 - 12.000.000', 'Mengembangkan sistem tertanam untuk perangkat elektronik.', 45),
(135, 'Test Engineer', 'IDR 4.500.000 - 9.000.000', 'Menguji dan memverifikasi perangkat elektronik.', 45),
(136, 'Biomedical Engineer', 'IDR 5.500.000 - 11.000.000', 'Mengembangkan peralatan medis dan teknologi kesehatan.', 46),
(137, 'Clinical Engineer', 'IDR 4.500.000 - 9.000.000', 'Memelihara dan mengelola peralatan medis di fasilitas kesehatan.', 46),
(138, 'Research Scientist', 'IDR 6.000.000 - 12.000.000', 'Melakukan penelitian dalam bidang biomedis.', 46),
(139, 'Geographer', 'IDR 4.500.000 - 9.000.000', 'Mempelajari dan menganalisis fenomena geografis.', 47),
(140, 'GIS Specialist', 'IDR 5.000.000 - 10.000.000', 'Mengelola dan menganalisis data geografis menggunakan GIS.', 47),
(141, 'Environmental Consultant', 'IDR 5.000.000 - 10.000.000', 'Memberikan saran tentang isu lingkungan berdasarkan data geografis.', 47),
(142, 'Linguist', 'IDR 4.500.000 - 9.000.000', 'Mempelajari dan menganalisis bahasa.', 48),
(143, 'Translator', 'IDR 4.000.000 - 8.000.000', 'Menerjemahkan teks dari satu bahasa ke bahasa lain.', 48),
(144, 'Language Instructor', 'IDR 4.000.000 - 8.000.000', 'Mengajar bahasa asing kepada siswa.', 48),
(145, 'Early Childhood Educator', 'IDR 3.500.000 - 7.000.000', 'Mengajar dan merawat anak-anak usia dini.', 49),
(146, 'Childcare Center Director', 'IDR 5.000.000 - 10.000.000', 'Mengelola dan mengawasi pusat penitipan anak.', 49),
(147, 'Curriculum Developer', 'IDR 4.500.000 - 9.000.000', 'Mengembangkan kurikulum pendidikan untuk anak-anak usia dini.', 49),
(148, 'Industrial Engineer', 'IDR 7.000.000 - 15.000.000', 'Merancang dan mengoptimalkan sistem produksi dan proses bisnis.', 50),
(149, 'Production Planner', 'IDR 6.000.000 - 12.000.000', 'Merencanakan dan menjadwalkan produksi sesuai permintaan.', 50),
(150, 'Quality Control Engineer', 'IDR 6.500.000 - 13.000.000', 'Memastikan produk memenuhi standar kualitas melalui inspeksi.', 50);

-- --------------------------------------------------------

--
-- Table structure for table `profileOption`
--

CREATE TABLE `profileOption` (
  `option_id` int(11) NOT NULL,
  `option_value` int(11) NOT NULL,
  `option_text` varchar(255) NOT NULL,
  `profile_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profileOption`
--

INSERT INTO `profileOption` (`option_id`, `option_value`, `option_text`, `profile_id`) VALUES
(1, 1, 'Kurang dari sekolah menengah', 1),
(2, 2, 'Sekolah Menengah', 1),
(3, 3, 'Sarjana', 1),
(4, 4, 'Pascasarjana', 1),
(5, 1, 'Laki-laki', 2),
(6, 2, 'Perempuan', 2),
(7, 3, 'Lainnya', 2),
(8, 1, 'Ya', 3),
(9, 2, 'Tidak', 3),
(10, 1, 'Agnostik', 4),
(11, 2, 'Ateis', 4),
(12, 3, 'Buddha', 4),
(13, 4, 'Kristen (Katolik)', 4),
(14, 5, 'Kristen (Mormon)', 4),
(15, 6, 'Kristen (Protestan)', 4),
(16, 7, 'Kristen (Lainnya)', 4),
(17, 8, 'Hindu', 4),
(18, 9, 'Yahudi', 4),
(19, 10, 'Muslim', 4),
(20, 11, 'Sikh', 4),
(21, 12, 'Lainnya', 4),
(22, 1, 'Ya', 5),
(23, 2, 'Tidak', 5);

-- --------------------------------------------------------

--
-- Table structure for table `profileQuestion`
--

CREATE TABLE `profileQuestion` (
  `profile_id` int(11) NOT NULL,
  `profile_question` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profileQuestion`
--

INSERT INTO `profileQuestion` (`profile_id`, `profile_question`) VALUES
(1, 'Apakah pendidikan terakhir Anda?'),
(2, 'Apa jenis kelamin Anda?'),
(3, 'Apakah bahasa Inggris adalah bahasa ibu Anda?'),
(4, 'Apa agama Anda?'),
(5, 'Apakah Anda berusia lebih dari 17 tahun?'),
(6, 'Apakah pendidikan terakhir Anda?'),
(7, 'Apa jenis kelamin Anda?'),
(8, 'Apakah bahasa Inggris adalah bahasa ibu Anda?'),
(9, 'Apa agama Anda?'),
(10, 'Apakah Anda berusia lebih dari 17 tahun?');

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
(1, 'Study for Exam', '2024-06-15', '10:00:00', '12:00:00', 60, 15, 15, 'High', 1, 1, 0, '2024-06-14 14:57:29'),
(2, 'Prepare Presentation', '2024-06-16', '14:00:00', '16:00:00', 60, 15, 15, 'Medium', 1, 1, 1, '2024-06-14 15:00:44'),
(3, 'Study Advanced Algebra', '2024-06-02', '07:00:00', '08:00:00', 60, 20, 10, 'medium', 1, 1, 1, '2024-06-14 14:59:49');

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `university_id` int(11) NOT NULL,
  `university_name` varchar(100) NOT NULL,
  `university_location` varchar(30) NOT NULL,
  `university_acreditation` char(10) NOT NULL,
  `university_link` varchar(500) NOT NULL,
  `major_major_id` int(11) NOT NULL,
  `university_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`university_id`, `university_name`, `university_location`, `university_acreditation`, `university_link`, `major_major_id`, `university_image`) VALUES
(1, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://psikologi.ui.ac.id/', 1, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(2, 'Universitas Pendidikan Indonesia', 'Bandung, Jawa Barat', 'UNGGUL', 'https://psikologi.upi.edu/', 1, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-upi.png'),
(3, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://ugm.ac.id/id/fakultas/fakultas-psikologi/', 1, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(4, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://feb.ui.ac.id/manajemen/', 2, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(5, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://feb.ugm.ac.id/id/pendidikan/program-studi', 2, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(6, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://unair.ac.id/fakultas-ekonomi-dan-bisnis/', 2, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(7, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://www.ui.ac.id/program-studi/sastra-inggris/', 3, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(8, 'Universitas Sanata Dharma', 'Yogyakarta, Yogyakarta', 'UNGGUL', 'https://web.usd.ac.id/fakultas/sastra/sasing/', 3, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-sanata-dharma.png'),
(9, 'Universitas Pendidikan Indonesia', 'Bandung, Jawa Barat', 'UNGGUL', 'https://englishlanguage.upi.edu/', 3, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-upi.png'),
(10, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://nursing.ui.ac.id/', 4, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(11, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://unair.ac.id/fakultas-keperawatan/', 4, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(12, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://nursing.fkkmk.ugm.ac.id/psik_s1/', 4, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(13, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://feb.ui.ac.id/akuntansi/', 5, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(14, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://akuntansi.feb.unair.ac.id/s1-akuntansi/', 5, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(15, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://ugm.ac.id/id/prodi/akuntansi/', 5, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(16, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://biologi.ugm.ac.id/', 6, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(17, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://biologi.ui.ac.id/', 6, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(18, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://biologi.fst.unair.ac.id/', 6, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(19, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://fk.ui.ac.id/', 7, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(20, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://fkkmk.ugm.ac.id/', 7, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(21, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://fk.unair.ac.id/', 7, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(22, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://www.itb.ac.id/fakultas-seni-rupa-dan-desain', 8, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(23, 'Institut Seni Indonesia Yogyakarta', 'Kab. Bantul, Yogyakarta', 'A', 'https://fsr.isi.ac.id/', 8, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-isi-jogja.png'),
(24, 'Institut Seni Indonesia Denpasar', 'Denpasar, Bali', 'A', 'https://isi-dps.ac.id/fakultas-seni-rupa-dan-desain/', 8, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-isi-denpasar.png'),
(25, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://stei.itb.ac.id/program-sarjana/sarjana-informatika/', 9, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(26, 'Institut Teknologi Sepuluh Nopember', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://www.its.ac.id/informatika/id/beranda/', 9, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-its.png'),
(27, 'Universitas Padjadjaran', 'Bandung, Jawa Barat', 'UNGGUL', 'https://informatika.unpad.ac.id/program-studi-teknik-informatika/', 9, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unpad.png'),
(28, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://www.ui.ac.id/program-studi/ilmu-komunikasi/', 10, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(29, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://komunikasi.fisip.unair.ac.id/program-studi/', 10, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(30, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://dikom.fisipol.ugm.ac.id/program-sarjana/', 10, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(31, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://socialwelfare.fisip.ui.ac.id/sarjana/', 11, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(32, 'Universitas Padjadjaran', 'Bandung, Jawa Barat', 'UNGGUL', 'https://fisip.unpad.ac.id/program/sarjana-kesejahteraan-sosial/', 11, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unpad.png'),
(33, 'Universitas Islam Negeri Sunan Kalijaga', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://iks.uin-suka.ac.id/', 11, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-uin-sunan-kalijaga.png'),
(34, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://feb.ui.ac.id/', 12, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(35, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://feb.ugm.ac.id/id/pendidikan/program-studi', 12, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(36, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://unair.ac.id/fakultas-ekonomi-dan-bisnis/', 12, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(37, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://fh.unair.ac.id/', 13, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(38, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://law.ui.ac.id/', 13, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(39, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://law.ugm.ac.id/', 13, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(40, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://si.itb.ac.id/', 14, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(41, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://tsipil.ugm.ac.id/id/dtslftugm/', 14, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(42, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://civil.ui.ac.id/', 14, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(43, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://criminology.fisip.ui.ac.id/sarjana/', 15, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(44, 'Universitas Budi Luhur', 'Jakarta Selatan, DKI Jakarta', 'B', 'https://www.budiluhur.ac.id/kriminologi/', 15, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-budi-luhur.png'),
(45, 'Universitas Islam Riau', 'Pekanbaru, Riau', 'B', 'https://soc.uir.ac.id/', 15, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-univ-islam-riau.png'),
(46, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://sejarah.fib.ugm.ac.id/program-sarjana/', 16, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(47, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://fib.ui.ac.id/akademik/program-sarjana-s1/program-studi-sejarah/', 16, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(48, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://fib.unair.ac.id/ilmusejarah/en/home/', 16, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(50, 'Universitas Negeri Padang', 'Padang, Sumatera Barat', 'UNGGUL', 'https://fip.unp.ac.id/jurusan/12', 17, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unp.png'),
(51, 'Universitas Negeri Jakarta', 'Jakarta Timur, DKI Jakarta', 'UNGGUL', 'https://fip.unj.ac.id/?page_id=71', 17, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unj.png'),
(52, 'Universitas Diponegoro', 'Semarang, Jawa Tengah', 'UNGGUL', 'https://admbisnis.fisip.undip.ac.id/V1/', 18, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-undip.png'),
(53, 'Universitas Brawijaya', 'Malang, Jawa Timur', 'UNGGUL', 'https://fia.ub.ac.id/pendidikan/program-studi-administrasi-bisnis/', 18, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ub.png'),
(54, 'Universitas Padjadjaran', 'Bandung, Jawa Barat', 'UNGGUL', 'https://www.unpad.ac.id/fakultas/ilmu-sosial-ilmu-politik/administrasi-bisnis/', 18, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unpad.png'),
(55, 'Universitas Padjadjaran', 'Bandung, Jawa Barat', 'UNGGUL', 'https://feb.unpad.ac.id/s1-bisnis-digital/', 19, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unpad.png'),
(56, 'Universitas Negeri Jakarta', 'Jakarta Timur, DKI Jakarta', 'UNGGUL', 'https://fe.unj.ac.id/?page_id=330', 19, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unj.png'),
(57, 'Telkom University', 'Bandung, Jawa Barat', 'UNGGUL', 'https://mm.telkomuniversity.ac.id/digital-marketing/', 19, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-telu-bandung.png'),
(58, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://math.fmipa.ugm.ac.id/id/', 20, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(59, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://www.itb.ac.id/program-studi-sarjana-matematika', 20, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(60, 'Universitas Brawijaya', 'Malang, Jawa Timur', 'UNGGUL', 'https://matematika.ub.ac.id/', 20, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ub.png'),
(61, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://sosiologi.fisipol.ugm.ac.id/', 21, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(62, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://sosiologi.fisip.ui.ac.id/', 21, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(63, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://sosiologi.fisip.unair.ac.id/', 21, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(64, 'Universitas Negeri Semarang', 'Semarang, Jawa Tengah', 'UNGGUL', 'https://unnes.ac.id/teknik-mesin-s1/', 22, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unnes.png'),
(65, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://mech.eng.ui.ac.id/', 22, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(66, 'Universitas Sebelas Maret', 'Surakarta, Jawa Tengah', 'UNGGUL', 'https://mesin.ft.uns.ac.id/', 22, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-uns.png'),
(67, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://fisip.ui.ac.id/', 23, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(68, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://politik.fisip.unair.ac.id/', 23, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(69, 'Universitas Brawijaya', 'Malang, Jawa Timur', 'UNGGUL', 'https://politik.ub.ac.id/', 23, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ub.png'),
(70, 'Telkom University', 'Bandung, Jawa Barat', 'UNGGUL', 'https://bit.telkomuniversity.ac.id/', 24, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-telu-bandung.png'),
(71, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://sarjana.jteti.ugm.ac.id/program-sarjana/program-studi-teknologi-informasi/', 24, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(72, 'Institut Teknologi Sepuluh Nopember', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://www.its.ac.id/it/id/beranda/', 24, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-its.png'),
(73, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://chemistry.ugm.ac.id/', 25, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(74, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://www.chem.itb.ac.id/', 25, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(75, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://www.sci.ui.ac.id/kimia/', 25, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(76, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://feb.ui.ac.id/manajemen/', 26, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(77, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://www.itb.ac.id/program-studi-sarjana-manajemen', 26, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(78, 'Universitas Pendidikan Indonesia', 'Bandung, Jawa Barat', 'UNGGUL', 'https://kurikulum.upi.edu/struktur/prodi/L505', 26, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-upi.png'),
(79, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://feb.ui.ac.id/course/manajemen-sdm/', 27, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(80, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', '', 27, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(81, 'Universitas Diponegoro', 'Semarang, Jawa Tengah', 'UNGGUL', 'https://fisip.undip.ac.id/id/manajemen-sumber-daya-manusia/', 27, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-undip.png'),
(82, 'Universitas Negeri Jakarta', 'Jakarta Timur, DKI Jakarta', 'UNGGUL', 'https://fbs.unj.ac.id/musik/', 28, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unj.png'),
(83, 'Universitas Negeri Semarang', 'Semarang, Jawa Tengah', 'UNGGUL', 'https://unnes.ac.id/pendidikam-seni-musik-s1/', 28, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unnes.png'),
(84, 'Universitas Negeri Malang', 'Malang, Jawa Timur', 'UNGGUL', 'http://sedesa.sastra.um.ac.id/s1-pendidikan-seni-tari-dan-musik/', 28, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-um.png'),
(85, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://architecture.ui.ac.id/', 29, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(86, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://ar.itb.ac.id/id_id/', 29, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(87, 'Universitas Pendidikan Indonesia', 'Bandung, Jawa Barat', 'UNGGUL', 'https://arsitektur.upi.edu/', 29, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-upi.png'),
(88, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://ee.ui.ac.id/', 30, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(89, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://ftmm.unair.ac.id/teknik-elektro-program-studi/', 30, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(90, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://www.itb.ac.id/program-studi-sarjana-teknik-elektro', 30, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(91, 'Universitas Hasanuddin', 'Makassar, Sulawesi Selatan', 'UNGGUL', 'https://sci.unhas.ac.id/fisika/', 31, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unhas.png'),
(92, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://www.sci.ui.ac.id/fisika/', 31, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(93, 'Universitas Sebelas Maret', 'Surakarta, Jawa Tengah', 'UNGGUL', 'https://mipa.uns.ac.id/fisika/', 31, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-uns.png'),
(94, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://ir.fisip.ui.ac.id/', 32, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(95, 'Universitas Diponegoro', 'Semarang, Jawa Tengah', 'UNGGUL', 'https://hi.fisip.undip.ac.id/v1/', 32, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-undip.png'),
(97, 'Universitas Pendidikan Indonesia', 'Bandung, Jawa Barat', 'UNGGUL', 'https://fpok.upi.edu/profil-fakultas/jurusan', 33, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-upi.png'),
(98, 'Universitas Negeri Semarang', 'Semarang, Jawa Tengah', 'UNGGUL', 'https://unnes.ac.id/ilmu-keolahragaan-s1/', 33, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unnes.png'),
(99, 'Universitas Negeri Jakarta', 'Jakarta Timur, DKI Jakarta', 'UNGGUL', 'https://penmaba.unj.ac.id/fakultas-ilmu-olahraga/', 33, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unj.png'),
(100, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://www.ui.ac.id/program-studi/teknik-kimia/', 34, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(101, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://kimia.fst.unair.ac.id/', 34, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(102, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://www.che.itb.ac.id/ID/', 34, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(103, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://www.fkm.ui.ac.id/', 35, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(104, 'Universitas Sumatera Utara', 'Medan, Sumatera Utara', 'UNGGUL', 'https://fkm.usu.ac.id/', 35, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-usu.png'),
(105, 'Universitas Diponegoro', 'Semarang, Jawa Tengah', 'UNGGUL', 'https://fkm.undip.ac.id/', 35, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-undip.png'),
(107, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://pariwisata.fib.ugm.ac.id/', 36, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(108, 'Universitas Udayana', 'Kab. Badung, Bali', 'UNGGUL', 'https://www.unud.ac.id/in/fakultas11-Fakultas%20Pariwisata.html', 36, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-udayana.png'),
(109, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://fib.ui.ac.id/akademik/program-sarjana-s1/program-studi-filsafat/', 37, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(110, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://filsafat.ugm.ac.id/', 37, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(111, 'Universitas Negeri Yogyakarta', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://kp.fipp.uny.ac.id/', 37, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-uny.png'),
(112, 'Universitas Padjadjaran', 'Bandung, Jawa Barat', 'UNGGUL', 'https://jurnalistik.fikom.unpad.ac.id/', 38, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unpad.png'),
(113, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://psdk.ui.ac.id/blog/category/karya-mahasiswa/jurnalisme/', 38, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(114, 'Universitas Prof. Dr. Moestopo', 'Jakarta Selatan, DKI Jakarta', 'B', 'https://fikom.moestopo.ac.id/', 38, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-univ-dr-moestopo.png'),
(115, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://www.ui.ac.id/program-studi/teknik-komputer/', 39, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(116, 'Binus University', 'Jakarta Barat, DKI Jakarta', 'UNGGUL', 'https://comp-eng.binus.ac.id/ce-lab/', 39, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-binus.png'),
(117, 'Institut Teknologi Sepuluh Nopember', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://www.its.ac.id/komputer/id/beranda/', 39, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-its.png'),
(118, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://farmasi.ui.ac.id/', 40, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(119, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://farmasi.ugm.ac.id/', 40, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(120, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://www.itb.ac.id/sekolah-farmasi', 40, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(121, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://www.ui.ac.id/program-studi/teknik-lingkungan/', 41, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(122, 'Institut Teknologi Sepuluh Nopember', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://enviro.its.ac.id/', 41, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-its.png'),
(123, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://ftsl.itb.ac.id/program-studi/sarjana-teknik-lingkungan/', 41, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(124, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://antropologi.fib.ugm.ac.id/id/', 42, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(125, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://anthropology.fisip.ui.ac.id/', 42, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(126, 'Universitas Sebelas Maret', 'Surakarta, Jawa Tengah', 'UNGGUL', 'https://spmb.uns.ac.id/infoprodi/profil/perkuliahan?kode_prodi=87204', 42, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-uns.png'),
(127, 'Telkom University Surabaya', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://bdb-sby.telkomuniversity.ac.id/', 43, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-telu-sby.png'),
(128, 'Universitas Padjadjaran', 'Bandung, Jawa Barat', 'UNGGUL', 'https://feb.unpad.ac.id/s1-bisnis-digital/', 43, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unpad.png'),
(129, 'Universitas Sebelas Maret', 'Surakarta, Jawa Tengah', 'UNGGUL', 'https://unnes.ac.id/feb/', 43, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-uns.png'),
(130, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://www.itb.ac.id/fakultas-seni-rupa-dan-desain', 44, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(131, 'Institut Kesenian Jakarta', 'Menteng, Jakarta Pusat', 'B', 'https://ikj.ac.id/akademik/fakultas-seni-desain/', 44, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ikj.png'),
(132, 'Universitas Trisakti', 'Jakarta Barat, DKI Jakarta', 'A', 'https://fsrd.trisakti.ac.id/', 44, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-trisakti.png'),
(133, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://www.itb.ac.id/program-studi-sarjana-teknik-elektro', 45, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(134, 'Institut Teknologi Sepuluh Nopember', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://www.its.ac.id/telektro/id/beranda/', 45, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-its.png'),
(135, 'Universitas Padjadjaran', 'Bandung, Jawa Barat', 'UNGGUL', 'https://ee.unpad.ac.id/', 45, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unpad.png'),
(136, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://biomedik.eng.ui.ac.id/', 46, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(137, 'Institut Teknologi Bandung', 'Bandung, Jawa Barat', 'UNGGUL', 'https://stei.itb.ac.id/program-sarjana/sarjana-biomedis/', 46, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-itb.png'),
(138, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://fst.unair.ac.id/s1-teknik-biomedis/', 46, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(139, 'Universitas Gadjah Mada', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://geo.ugm.ac.id/', 47, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ugm.png'),
(140, 'Universitas Negeri Semarang', 'Semarang, Jawa Tengah', 'UNGGUL', 'https://unnes.ac.id/geografi-s1/', 47, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unnes.png'),
(141, 'Universitas Negeri Yogyakarta', 'Kab. Sleman, Yogyakarta', 'UNGGUL', 'https://pendidikan-geografi.fishipol.uny.ac.id/', 47, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-uny.png'),
(142, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', '', 48, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(143, 'Universitas Airlangga', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://fib.unair.ac.id/linguistik/10-2/', 48, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unair.png'),
(144, 'Universitas Padjadjaran', 'Bandung, Jawa Barat', 'UNGGUL', 'https://fib.unpad.ac.id/program-pendidikan/ilmu-linguistik/', 48, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unpad.png'),
(145, 'Universitas Pendidikan Indonesia', 'Bandung, Jawa Barat', 'UNGGUL', 'https://pgpaud.upi.edu/', 49, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-upi.png'),
(146, 'Universitas Sriwijaya', 'Palembang, Sumatera Selatan', 'UNGGUL', 'https://unsri.ac.id/web-prodi/kurikulum/3b70c651-58bb-4730-bc94-8a610a358162/detail-kurikulum/4809a2d0-4340-4716-adbc-317a86fd4ce6', 49, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unsri.png'),
(147, 'Universitas Negeri Jakarta', 'Jakarta Timur, DKI Jakarta', 'UNGGUL', 'https://fip.unj.ac.id/?page_id=132', 49, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-unj.png'),
(148, 'Institut Pertanian Bogor', 'Bogor, Jawa Barat', 'UNGGUL', 'https://panduansupport.ipb.ac.id/KurikulumMultistrata/Kurikulum/S1?prodi=928', 50, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ipb.png'),
(149, 'Universitas Indonesia', 'Depok, Jawa Barat', 'UNGGUL', 'https://www.ie.ui.ac.id/', 50, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-ui.png'),
(150, 'Institut Teknologi Sepuluh Nopember', 'Surabaya, Jawa Timur', 'UNGGUL', 'https://www.its.ac.id/tindustri/', 50, 'https://storage.googleapis.com/nextstep-bucket/university-logo/logo-its.png');

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
  `user_gender` varchar(20) DEFAULT NULL,
  `user_engNat` varchar(10) DEFAULT NULL,
  `user_religion` varchar(50) DEFAULT NULL,
  `user_education` varchar(50) DEFAULT NULL,
  `user_voted` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`user_id`, `username`, `user_fullname`, `user_birthDate`, `user_school`, `user_gender`, `user_engNat`, `user_religion`, `user_education`, `user_voted`) VALUES
(1, 'john', 'John Doe', '2003-05-15', 'SMA Negeri 3', 'Laki-Laki', 'Ya', 'Muslim', 'Sekolah Menengah', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `user_major`
--

CREATE TABLE `user_major` (
  `user_user_id` int(11) NOT NULL,
  `major_major_id` int(11) NOT NULL,
  `user_major_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_major`
--

INSERT INTO `user_major` (`user_user_id`, `major_major_id`, `user_major_date`) VALUES
(1, 3, '2023-05-15'),
(1, 19, '2023-05-16'),
(1, 48, '2024-06-15');

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
-- Indexes for table `profileOption`
--
ALTER TABLE `profileOption`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indexes for table `profileQuestion`
--
ALTER TABLE `profileQuestion`
  ADD PRIMARY KEY (`profile_id`);

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
  MODIFY `major_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `potential_jobs`
--
ALTER TABLE `potential_jobs`
  MODIFY `jobs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `profileOption`
--
ALTER TABLE `profileOption`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `profileQuestion`
--
ALTER TABLE `profileQuestion`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `university_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
-- Constraints for table `profileOption`
--
ALTER TABLE `profileOption`
  ADD CONSTRAINT `profileoption_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profileQuestion` (`profile_id`);

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
