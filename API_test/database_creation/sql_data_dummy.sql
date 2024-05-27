-- //task
INSERT INTO `task` (
  `task_name`, 
  `task_date`, 
  `task_startTime`, 
  `task_endTime`, 
  `task_duration`, 
  `task_focusTime`, 
  `task_breakTime`, 
  `task_priority`, 
  `task_repeat`, 
  `user_user_id`
) VALUES
  ('Morning Workout', '2024-06-01', '06:00:00', '07:00:00', 60, 50, 10, 'High', 0, 2),
  ('Team Meeting', '2024-06-01', '09:00:00', '10:00:00', 60, 55, 5, 'Medium', 1, 2),
  ('Project Development', '2024-06-01', '10:30:00', '12:30:00', 120, 110, 10, 'High', 0, 4),
  ('Lunch Break', '2024-06-01', '12:30:00', '13:00:00', 30, 0, 30, 'Low', 0, 3),
  ('Client Call', '2024-06-01', '14:00:00', '15:00:00', 60, 55, 5, 'High', 0, 2);

-- user
INSERT INTO user_data (user_name) 
VALUES 
    ("John Doe"), 
    ("Jane Smith"), 
    ("Alice Johnson"), 
    ("Bob Brown"), 
    ("Charlie Davis");


-- major
Insert INTO major (major_name, major_description)
VALUES 
( 'Teknik Informatika', 'Teknik Informatika merupakan bidang ilmu yang mempelajari bagaimana menggunakan teknologi komputer secara optimal guna menangani masalah transformasi atau pengolahan data dengan proses logika. Di Jurusan Teknik Informatika kamu akan mempelajari berbagai prinsip terkait ilmu komputer mulai dari proses perancangan, pengembangan, pengujian, hingga evaluasi sistem operasi perangkat lunak. Selama kuliah kamu akan banyak mengkaji pemrograman dan komputasi, dan dibekali pula dengan keterampilan merancang perangkat lunak.'),
('Ilmu Hukum','Jurusan Ilmu Hukum adalah studi yang mempelajari berbagai sistem hukum yang berkaitan dengan kehidupan kemasyarakatan. Di Prodi Ilmu Hukum, mahasiswa juga belajar mengenai perundang-undangan termasuk di dalamnya hukum dasar (konstitusi, hukum perdata, hukum dagang, hukum tata negara, hukum pidana, hukum tata pidana) hingga hukum internasional dengan cakupan yang cukup luas. Pada akhir masa kuliah, biasanya mahasiswa jurusan ini dituntut untuk mengaplikasikan ilmu yang telah diperoleh selama kuliah melalui magang di berbagai firma hukum, lembaga pengadilan, dan juga kantor kejaksaan.'),
('Psikologi','Jurusan Psikologi adalah salah satu bidang keilmuan yang mempelajari tentang manusia. Manusia yang dimaksud di sini tak sebatas pada perilakunya saja, melainkan mempelajari jiwa yang mempengaruhi tindakan tersebut. Misalnya pada konteks sosial, seperti mempelajari bagaimana manusia berinteraksi dengan lingkungannya, atau dalam konteks industri mempelajari bagaimana seseorang berperilaku terkait dengan posisinya di sebuah perusahaan.'),
('Teknik Sipil','Teknik sipil adalah bidang ilmu yang mempelajari perencanaan/perancangan, manufaktur, manajemen/pengelolaan, dan konservasi dari beragam fasilitas dan sistem untuk mendukung sebuah kota, pedesaan, dan perkotaan. Artinya, seorang lulusan teknik sipil perlu menguasai ilmu terkait desain (saat melakukan perancangan), konsturksi (saat melakukan pembangunan dan menyusun sistem pengelolaan), hingga pemeliharaan lingkungan (saat melihat dampak pembangunan dari berbagai aspek).'),
('Sistem Informasi','Jurusan Sistem Informasi adalah bidang keilmuan yang menggabungkan ilmu komputer dengan bisnis dan manajemen. Di prodi ini kamu akan belajar gimana mengidentifikasi kebutuhan dan proses bisnis perusahaan berdasarkan data-data yang dimiliki perusahan, kemudian merancang sistem yang sesuai dengan kebutuhan perusahaan.')

-- user_major
INSERT INTO user_major VALUES
(2,4),
(3,1),
(4,2),
(5,3),
(6,5),
(2,1)