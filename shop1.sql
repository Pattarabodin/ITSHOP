-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2024 at 08:11 PM
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
-- Database: `shop1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(4) NOT NULL,
  `a_name` varchar(200) NOT NULL,
  `a_username` varchar(200) NOT NULL,
  `a_password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `a_name`, `a_username`, `a_password`) VALUES
(1, 'อารียา ทรงครักษ์', 'admin1', '81dc9bdb52d04dc20036dbd8313ed055'),
(2, 'ฐิติวัฒน์ ไชยฮะนิจ', 'admin2', '81dc9bdb52d04dc20036dbd8313ed055'),
(3, 'นิธิต ศรีวัง', 'admin3', '81dc9bdb52d04dc20036dbd8313ed055'),
(4, 'นาวิน เทียนทอง ', 'admin4', 'b59c67bf196a4758191e42f76670ceba'),
(5, 'ภัทรบดินทร์ ประภาสโนบล', 'admin5', '81dc9bdb52d04dc20036dbd8313ed055'),
(6, 'ลลิตา ไม่เศร้า', 'admin6', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `m_id` int(11) NOT NULL,
  `m_name` int(11) NOT NULL,
  `m_address` int(11) NOT NULL,
  `m_tel` int(11) NOT NULL,
  `m_email` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `oid` int(11) NOT NULL,
  `ototal` decimal(10,2) NOT NULL,
  `odate` datetime DEFAULT current_timestamp(),
  `id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT 1,
  `customer_name` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` enum('pending','completed','failed') DEFAULT 'pending',
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`oid`, `ototal`, `odate`, `id`, `status_id`, `customer_name`, `customer_address`, `payment_method`, `payment_status`, `transaction_id`, `payment_date`) VALUES
(5, 5990.00, '2024-10-06 00:38:22', 2, 3, '', '', '', 'pending', NULL, NULL),
(6, 53900.00, '2024-10-06 00:41:45', 2, 3, '', '', '', 'pending', NULL, NULL),
(7, 53900.00, '2024-10-06 00:47:35', 2, 3, '', '', '', 'pending', NULL, NULL),
(8, 39880.00, '2024-10-06 01:10:28', 2, 3, '', '', '', 'pending', NULL, NULL),
(9, 76600.00, '2024-10-06 01:14:18', 3, 1, '', '', '', 'pending', NULL, NULL),
(10, 53900.00, '2024-10-06 02:09:25', 3, 1, '', '', '', 'pending', NULL, NULL),
(11, 6999.00, '2024-10-06 16:10:05', 2, 3, '', '', '', 'pending', NULL, NULL),
(12, 1590.00, '2024-10-06 17:05:29', 2, 3, '', '', '', 'pending', NULL, NULL),
(13, 72800.00, '2024-10-06 17:10:27', 2, 3, '', '', '', 'pending', NULL, NULL),
(14, 29900.00, '2024-10-06 17:22:08', 2, 3, '', '', '', 'pending', NULL, NULL),
(15, 29900.00, '2024-10-06 18:13:51', 2, 3, '', '', '', 'pending', NULL, NULL),
(18, 29900.00, '2024-10-06 19:04:15', 2, 3, '', '', '', 'pending', NULL, NULL),
(19, 41740.00, '2024-10-06 19:12:15', 2, 3, '', '', '', 'pending', NULL, NULL),
(20, 39900.00, '2024-10-17 13:47:47', 7, 2, '', '', '', 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `od_id` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`od_id`, `oid`, `pid`, `item`) VALUES
(5, 5, 26, 1),
(6, 6, 1, 1),
(7, 7, 1, 1),
(8, 8, 7, 1),
(9, 8, 15, 1),
(10, 9, 9, 2),
(11, 9, 14, 2),
(12, 10, 1, 1),
(13, 11, 6, 1),
(14, 12, 19, 1),
(15, 13, 1, 1),
(16, 13, 29, 1),
(17, 14, 2, 1),
(18, 15, 13, 1),
(19, 18, 2, 1),
(20, 19, 15, 2),
(21, 19, 18, 2),
(22, 19, 28, 2),
(23, 20, 37, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`status_id`, `status_name`) VALUES
(1, 'รอดำเนินการ'),
(2, 'จัดส่งแล้ว'),
(3, 'เสร็จสิ้น');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `p_id` int(4) NOT NULL,
  `p_name` varchar(200) NOT NULL,
  `p_detail` text NOT NULL,
  `p_price` int(6) NOT NULL,
  `p_picture` varchar(200) NOT NULL,
  `pt_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`p_id`, `p_name`, `p_detail`, `p_price`, `p_picture`, `pt_id`) VALUES
(1, 'Apple iPhone 15 Pro 1TB Blue Titanium', 'iPhone 15 Pro เปลี่ยนวัสดุตัวเครื่องเป็นไทเทเนียมที่แข็งแกร่งและมีน้ำหนักเบาเกรดเดียวกับที่ใช้ในอุตสาหกรรมอวกาศ พร้อมกล้องระดับโปรที่อเนกประสงค์ยิ่งกว่าเดิม ถ่ายภาพระยะใกล้ได้คมชัดจากที่ที่ไกลกว่าเดิมด้วยกล้องเทเลโฟโต้ 3 เท่า ให้คุณได้ภาพจากระยะที่ชอบในมุมที่ใช่\r\n\r\n- การเชื่อมต่อระดับโปร ด้วยช่องต่อ USB-C\r\n- ชิป A17 Pro GPU ระดับโปรให้เล่นเกมมือถือรู้สึกเต็มอิ่มสมจริงยิ่งขึ้น\r\n- ปุ่มแอ็คชั่นที่ปรับแต่งได้ตามต้องการทั้ง ปิดเสียง กล้อง บันทึกเสียง และอีกมากมาย', 53900, 'jpg', 1),
(2, 'Apple iPhone 16 128GB Teal', 'iPhone 16 ขอแนะนำตัวควบคุมกล้องให้คุณเข้าถึงเครื่องมือของกล้องได้อย่างรวดเร็ว และพบกับปุ่มแอ็คชั่น แค่กดค้างไว้ก็เรียกใช้สิ่งที่คุณต้องการได้ทันที ไม่ว่าจะเป็นไฟฉาย เสียงบันทึก โหมดปิดเสียง และอีกมากมาย\r\n\r\n- ชิป A18 ที่ฉลาดสุดล้ำ\r\n- จอภาพ Super Retina XDR ขนาด 6.1 นิ้ว\r\n- กล้อง Fusion 48MP ถ่ายภาพความละเอียดสูง และซูมเข้าด้วยเทเลโฟโต้ 2 เท่า', 29900, 'jpg', 1),
(3, 'สมาร์ทโฟน Samsung Galaxy S24 ULTRA (12+512) TITANIUM (5G)', 'สมาร์ทโฟนที่มาพร้อมกล้องที่ดีสุดใน Galaxy และปากกา S Pen ที่เป็นมากกว่าปากกา เปรียบเสมือนผู้ช่วยส่วนตัว ใช้สั่งถ่ายรูป เปลี่ยนสไลด์ แปลภาษา แต่งรูป เล่นเกม และอีกมากมาย พร้อมด้วยกล้องคุณภาพสูง ถ่ายภาพสวย คมชัด เก็บครบทุกรายละเอียด มากกว่าที่ตาคุณเห็น\r\n\r\n- ขนาดหน้าจอ 6.8 นิ้ว   \r\n- แบตเตอรี่ 5,000 mAh\r\n- ชิป Snapdragon 8 Gen 3 แรงสุดใน Galaxy\r\n- มาพร้อมปากกา S Pen ', 48900, 'jpg', 1),
(4, 'สมาร์ทโฟน Huawei Pura 70 Pro (12+512GB) Black (HMS)', 'Huawei Pura 70 Pro    มาพร้อมสเปคกล้องหลังที่สูงกว่า โดยติดตั้งมา 3 ตัว กล้องความเร็วสูงพิเศษทั้งกล้องถ่ายภาพได้คมชัดด้วยกล้องหลัก Ultra Lighting  พร้อมใช้เทคโนโลยี HUAWEI XD Motion ช่วยในการจับภาพที่เคลื่อนไหวรวดเร็วได้ชัดเจนสวยงาม\r\n\r\n- ขนาดหน้าจอ 6.8 นิ้ว\r\n- แบตเตอรี่ 5,050 mAh\r\n- ระบบปฎิบัติการ EMUI 14.2\r\n- มาพร้อมกล้องความคมชัดสูงถึง 50MP', 35990, 'jpg', 1),
(5, 'สมาร์ทโฟน OPPO A60 (8+128) Ripple Blue', 'OPPO A60  สมาร์ทโฟนคุณภาพดี   อีกขั้นของความสนุก จอแสดงผลที่สว่างเป็นพิเศษ 950 nit   มาพร้อมกล้องคู่คมชัด 50MP   ลำโพงคู่ให้เสียงรอบด้านและแบตเตอรี่ขนาดใหญ่ใช้งานได้ยาวนานมีประสิทธิภาพและดีไซน์หรูหรา บางเบา   พกพาไปไหนก็สะดวก เหมาะกับทุกไลฟ์สไตล์การใช้งาน\r\n\r\n- ขนาดหน้าจอ 6.67 นิ้ว\r\n- แบตเตอรี่ 5,000 mAh\r\n- ชาร์จไว 45W Supervooc\r\n- มาพร้อมกล้องหลัง 50MP', 5699, 'jpg', 1),
(6, 'สมาร์ทโฟน Xiaomi Redmi 13C (8+256) Starry Silver (5G)', 'Xiaomi Redmi 13C  รองรับ 5G หน้าจอขนาด 6.74    จอแสดงผล  HD+ แบบเต็มหน้าจอเพื่อมุมมองที่กว้างขึ้น มอบประสบการณ์การรับชมภาพที่น่าทึ่งยิ่งขึ้นทันทีเมื่อชมภาพยนตร์และเล่นเกม ด้วยแบตเตอรี่ขนาดใหญ่  บอกลาปัญหาแบตเตอรี่ต่ำ  เหมาะกับการใช้งานได้ตลอดทั้งวัน\r\n\r\n- ขนาดหน้าจอ 6.74 นิ้ว\r\n- แบตเตอรี่ 5,000 mAh\r\n- ระบบปฏิบัติการ   Android 13 \r\n- กล้องหลัง 50MP', 6999, 'jpg', 1),
(7, 'โน๊ตบุ๊ค Lenovo LOQ 15IRX9 83DV00LDTA Luna Grey', 'โน๊ตบุ๊คเกมมิ่งที่ถูกออกแบบมาเพื่อเล่นเกมและประสิทธิภาพการทำงาน มาพร้อมกับ CPU Intel และ Graphic RTX 30 Series ตัวเครื่องที่ทนทาน การออกแบบเพื่อความเรียบง่ายและใช้งานได้จริงด้วยขนาดที่บางลง\r\n\r\n- CPU:  Intel Core i5-13450HX (2.4GHz up to 4.6GHz, 10C(6P+4E)/16T, 20MB Intel Smart Cache)\r\n- Graphics:  NVIDIA GeForce RTX 3050 6GB GDDR6\r\n- RAM:  24GB (2x12GB) DDR5-4800 SO-DIMM\r\n- SSD:  512GB NVMe PCIe 4.0 x4', 30990, 'jpg', 2),
(8, 'โน๊ตบุ๊ค Asus ProArt P16 OLED H7606WI-ME920WF Nano Black', ' เพื่อนคู่ใจด้านความคิดสร้างสรรค์ที่ดีที่สุด มีโปรเซสเซอร์ AMD Ryzen AI 300 Series มอบพลังการประมวลผลที่ยอดเยี่ยม  และGeForce RTX 40 Series ซึ่งให้กราฟิกที่ทรงพลัง เปลี่ยนทุกที่ให้กลายเป็นสตูดิโอของคุณ\r\n\r\n- CPU: AMD Ryzen AI 9 HX 370 (2.0GHz up to 5.1GHz, 12C/24T, 36MB Cache, AMD Ryzen AI up to 81 TOPs)\r\n- Graphics: NVIDIA GeForce RTX 4070 8GB GDDR6\r\n- RAM: 64GB LPDDR5X\r\n- SSD: 2TB NVMe PCIe 4.0', 100990, 'jpg', 2),
(9, 'โน๊ตบุ๊ค Lenovo LOQ 15APH8-82XT004FTA Storm Grey', ' Lenovo LOQ โน๊ตบุ๊คเกมมิ่งที่ถูกออกแบบมา CPU AMD Ryzen 7000 Series และการ์ดจอ NVIDIA GeForce RTX Series ที่ให้ความรวดเร็ว รวมถึงความคล่องตัวในการพิมพ์ด้วยคีย์บอร์ดอันเป็นเอกลักษณ์ของ Lenovo ตัวเครื่องที่ทนทานดั้บการออกแบบเพื่อความเรียบง่ายและใช้งานได้จริงด้วยขนาดที่บางลง\r\n\r\n- AMD Ryzen 5 7640HS (4.3GHz up to 5.0GHz, 6C/12T, 16MB L3 Cache)\r\n- 8GB DDR5-5600 SO-DIMM\r\n- SSD 512GB NVMe PCIe Gen4x4\r\n- NVIDIA GeForce RTX 3050 Laptop 6GB GDDR6', 29900, 'jpg', 2),
(10, 'โน๊ตบุ๊ค Acer Aspire 5 A515-58M-33PU Steel Gray', 'Acer Aspire 5   เมื่อคุณเลือกใช้แล็ปท็อปรุ่นนี้ ก็เปรียบดั่งคุณได้แสดงจุดยืน จุดยืนที่ว่า “ฉันสามารถไปได้ในทุกหนแห่งอย่างมีสไตล์” ตัวเครื่องที่เพรียวบาง มีรูปลักษณ์สุดเท่ และดูมีเอกลักษณ์เฉพาะตัว \r\n\r\n- CPU: Intel Core i3-1315U  (1.20GHz Up to 4.50GHz, 6C(2P+4E)/8T, 10MB Intel Smart Cache)\r\n- Graphics: Intel UHD Graphics\r\n- RAM: 8GB LPDDR5 Onboard\r\n- SSD: 512GB NVMe PCIe 4.0', 14990, 'jpg', 2),
(11, 'โน๊ตบุ๊ค Dell XPS 14 9440-WCXN9440CTO01GTH Graphite', 'Dell XPS 14 โน๊ตบุ๊ค ai ที่สร้างสรรค์ผลงานได้ทุกที่ด้วยน้ำหนักเบาและบาง แต่ขับเคลื่อนโดยโปรเซสเซอร์ Intel Core Ultra ที่เปิดใช้งาน AI รับชมคอนเทนต์ได้อย่างมีชีวิตชีวาด้วยรายละเอียดที่คมชัดและสีสันที่สมจริง และเสียงที่เข้มข้นแบบภาพยนตร์\r\n\r\n- CPU: Intel Core Ultra 7 155H  (3.80 GHz up to 4.80 GHz, 16C(6P+8E+2LPE)/22T, 24MB Intel Smart Cache)\r\n- Graphics: NVIDIA GeForce RTX 4050 6GB GDDR6\r\n- RAM: 64GB LPDDR5x-7467\r\n- SSD: 2TB NVMe PCIe M.2', 119990, 'jpg', 2),
(12, 'โน๊ตบุ๊ค Microsoft Surface Laptop Studio 2 i7/32/1TB Platinum (Z1I-00021)', 'แล็ปท็อป ล่าสุด Surface Laptop Studio2 จาก Microsoft แล็ปท็อป 2023 แล็ปท็อปดีไซน์ที่ล้ำสมัย ฉีกกรอบเดิม ๆ ในการทำงาน พร้อมมอบประสิทธิภาพการประมวลผลเพิ่มขึ้น 2 เท่า ทำให้ได้ประสิทธิภาพสูงเพื่อจัดการกับการทำงานที่ซับซ้อน ทำงานได้อย่างเต็มประสิทธิภาพด้วยแบตเตอรี่ที่ยาวนานตลอดวัน และยกระดับให้การสร้างสรรค์ผลงานของคุณด้วยอุปกรณ์เครื่องเดียวที่มีถึงสามโหมด ได้แก่ แล็ปท็อป จัดแสดง และสตูดิโอ ทำให้ตอบโจทย์มือโปร สายครีเอเตอร์ ตัดต่อ และสายเกมส์เมอร์ \r\n- ใช้งานได้นานสูงสุด 19 ชั่วโมง\r\n- มีระบบสแกนหน้าเพื่อเข้าใช้งานเครื่อง\r\n- การ์ดจอ NVIDIA GeForce RTX 4050 6 GB', 112990, 'jpg', 2),
(13, 'Apple Watch Series  9', 'Apple Watch Series 9 ช่วยให้คุณต่อติดกับทุกเรื่อง แอ็คทีฟ มีสุขภาพดี และปลอดภัยอยู่เสมอ มาพร้อมคำสั่งนิ้ว \"แตะสองครั้ง\" วิธีที่มหัศจรรย์ในการโต้ตอบกับ Apple Watch จอภาพที่สว่างยิ่งขึ้น รวมไปถึง และคุณสมบัติค้นหาตำแหน่งที่ตั้งจริงสำหรับ iPhone\r\n', 29900, 'jpg', 3),
(14, 'Samsung Galaxy Watch6', 'Galaxy Watch6 สมาร์ทวอชตัวจริงที่ช่วยต่อติดให้ขีวิตง่ายขึ้นหลายระดับเมื่อใช้คู่กันกับสมาร์ทโฟนเชื่อมต่อได้อย่างง่ายดาย คุณจะไม่พลาดทุกสิ่งเมื่ออยู่ห่างจากสมาร์ทโฟน ใช้ชีวิตง่าย ต่อติดทุกเรื่อง เหมือนเชื่อมมือถือทั้งเครื่องไว้บนข้อมือ Galaxy Watch6 สมาร์ทวอทช์สุดทันสมัยพร้อมสายนาฬิกาหลากหลายประเภทมิกซ์แอนด์แมตช์ชุดประจำวันของฉันได้ง่ายได้ทุกลุคทุกสไตล์ด้วย Galaxy Watch เรือนเดียว! ', 8400, 'jpg', 3),
(15, 'Fitbit Versa 4', 'สมาร์ทวอทซ์ที่ช่วยสร้างแรงบันดาลใจสำหรับสุขภาพและการออกกำลังกายมี GPS, Active Zone ในตัว พร้อมมอบประสบการณ์ทางดนตรีที่จะติดตัวกับคุณไปตลอดการเคลื่อนไหว เชื่อมต่อได้ทุกที่ทุกเวลารับการแจ้งเตือนการโทร, ข้อความ และ แอปบนสมาร์ทโฟนจากข้อมือของคุณได้ นับก้าวเดินและนับระยะทางในระหว่างการวิ่งได้แบบเรียลไทม์\r\n\r\n', 8890, 'jpg', 3),
(16, 'Garmin Forerunner 265', 'จีพีเอสสมาร์ทวอทช์สำหรับนักวิ่ง ฝึกฝนผ่านหน้าจอสัมผัสแบบ AMOLED ที่อัดแน่นด้วยฟีเจอร์การฝึกซ้อมขั้นสูง เช่น ฟีเจอร์ Training readiness ที่จะบอกช่วงเวลาที่พร้อมที่สุดสำหรับการฝึกซ้อม ช่วยให้คุณบรรลุทุกเป้าหมาย วางกลยุทธ์การแข่งขันด้วย Race widget ที่แนะนำการฝึกซ้อมประจำวันที่ปรับเปลี่ยนได้ ตามประสิทธิภาพร่างกาย การพักฟื้น และข้อมูลเส้นทาง', 16590, 'jpg', 3),
(17, 'Amazfit GTR 4', 'Amazfit GTR 4 จึงเหมาะสำหรับผู้ที่มองหาสมาร์ตวอชที่มีฟีเจอร์ครบครันสำหรับการออกกำลังกายและการติดตามสุขภาพ! โหมดกีฬา: รองรับมากกว่า 150 โหมดกีฬา รวมถึงการวิ่ง, ปั่นจักรยาน, และว่ายน้ำ\r\n\r\n', 7190, 'jpg', 3),
(18, 'Huawei WATCH GT 3', 'นาฬิกาสมาร์ทวอทช์รุ่นใหม่ล่าสุดจากแบรนด์ Huawei มาพร้อมการออกแบบดีไซน์ที่โดดเด่นเป็นเอกลักษณ์ เข้ากับทุกลุคและทุกสไตล์ อัดแน่นด้วยฟังก์ชั่นการออกกำลังกายตอบโจทย์ทุกการใช้งาน โหมดการออกกำลังกายที่มากถึง 100 โหมด สามารถวัดค่า SpO2 ได้ลอดทั้งวัน ยกระดับการใช้งานและเปรียบเทียบข้อมูลเชิงลึกด้วย AI แบตเตอรี่ในตัวใช้งานได้อย่างยาวนาน หน้าจอคมชัด รองรับการกันน้ำพร้อมใช้งานได้ทุกสถานการณ์ ', 6990, 'jpg', 3),
(19, 'Apple MagSafe Charger', 'USB-C integrated cable (1 m)\r\nการชาร์จไร้สายเป็นเรื่องง่าย รวดเร็วทันใจ\r\nการชาร์จแบบไร้สายเร็วขึ้นสูงสุด 15 วัตต์', 1590, 'jpg', 5),
(20, 'Apple MagSafe Duo Charger', 'ที่ชาร์จ MagSafe แบบคู่ ชาร์จอุปกรณ์ที่รองรับได้อย่างสะดวกสบาย ไม่ว่าจะเป็น iPhone, Apple Watch, เคสชาร์จแบบไร้สายสำหรับ AirPods และอุปกรณ์อื่นๆ ที่ได้รับการรับรองมาตรฐาน Qi ', 5390, 'jpg', 5),
(21, 'ที่ชาร์จไร้สาย AUKEY Wireless Charger Stand 3-in-1 Black (LC-A3)', 'AUKEY 3 in 1 แท่นชาร์จไร้สายที่สามารถชาร์จพร้อมกันได้ทั้ง 3 อุปกรณ์ชาร์จได้ทั้ง สมาร์ทโฟน, Apple Watch, รองรับ Fast Wireless Charge   มีเทคโนโลยี Qi wireless ที่สามารถจ่ายไฟได้สูงสุดถึง 10W\r\nจ่ายไฟได้สูงสุด 10 วัตต์\r\nมีเทคโนโลยี ชาร์จเร็ว (Fast Charge)\r\nรองรับ สมาร์ทโฟน, Apple Watch, AirPods', 1690, 'jpg', 5),
(22, 'ที่ชาร์จไร้สาย Blue Box 3-in-1 Foldable Wireless Charger Pad 15W - White', 'รองรับโทรศัพท์มือถือ & aiprods & apple watch ชาร์จได้ในเวลาเดียวกัน\r\nเอาต์พุต 15W ผ่าน CE FCC ROHS\r\nสามารถพับเก็บได้ในขนาดที่เล็กมาก ง่ายต่อการจัดเก็บและพกพา', 1089, 'jpg', 5),
(23, 'ที่ชาร์จไร้สาย Blue Box 3-in-1 Magnetic Wireless Charger Stand 15W Matte Black', '3 in 1 การชาร์จแบบไร้สายที่รวดเร็วและปลอดภัย\r\nอุปกรณ์ชาร์จแบบไร้สายที่ถอดออกได้\r\nโทรศัพท์มือถือไร้สายเอาท์พุต 15W', 1189, 'jpg', 5),
(24, 'ที่ชาร์จไร้สาย Blue Box 3-in-1 Wireless Charging Station Stand 15W White', 'แท่นชาร์จไร้สาย Blue Box 3-in-1 Wireless Charging Station Stand 15W White ที่ชาร์จได้อย่างรวดเร็วสามารถรองรับการชาร์จโทรศัพท์ airpdos Apple Watch \r\n3 in 1 การชาร์จแบบไร้สายที่รวดเร็วและปลอดภัย\r\nอุปกรณ์ชาร์จแบบไร้สายที่ถอดออกได้\r\nโทรศัพท์มือถือไร้สายเอาท์พุต 15W', 889, 'jpg', 5),
(25, 'หูฟัง Marshall Minor IV ', 'หูฟัง Marshall Minor IV   ด้วยคุณภาพเสียงสุดพรีเมี่ยมที่ได้รับการอัปเกรดให้ดียิ่งขึ้น พร้อมให้คุณดื่มด่ำประสบการณ์แห่งเสียง ชัดเจนทุกท่วงทำนอง  เต็มอิ่มกับการใช้งานได้ยาวนานมากขึ้นด้วยแบตเตอรี่ที่สามารถใช้ได้นานถึง 30 ชั่วโมง ดีไซน์ใหม่  สวมใส่สบายมากขึ้น เมื่อเทียบจากรุ่นก่อนหน้า ให้คุณสนุกสนานกับการใช้งานได้นานขึ้นกว่าเดิม \r\n- รองรับการเชื่อมต่อผ่าน Bluetooth\r\n- รองรับการชาร์จไว\r\n- ควบคุมเสียงเพลงด้วยปลายนิ้วสัมผัส\r\n- ปรับแต่งโปรไฟล์เสียง EQ ได้ตามความต้องการผ่านแอปพลิเคชั่น', 4990, 'jpg', 5),
(26, 'หูฟัง Marshall Major V Black', ' หูฟัง Marshall Major V หูฟังครอบหูรุ่นใหม่ ที่มาพร้อมเสียงสุดพรีเมี่ยมและทรงพลัง โดดเด่นด้วยแบตเตอรี่ที่ได้รับการอัปเกรด ด้วยการใช้งานแบบไร้สายได้นานกว่า 100 ชั่วโมง  ให้คุณดื่มด่ำกับเสียงเพลงได้อย่างเต็มที่ ไดร์ฟเวอร์แบบไดนามิกให้เสียงเบสที่หนักแน่น เสียงกลางที่นุ่มนวล และเสียงแหลมที่ชัดเจน  ดีไซน์ที่พับได้เพื่อให้ง่ายต่อการพกพา  พร้อมให้คุณพกพาและใช้งานได้ทุกที่ทุกเวลา\r\n- รองรับเทคโนโลยี Bluetooth LE\r\n- เข้าถึง Spotify ได้ทันทีเพียงปลายนิ้ว\r\n- ปรับ EQ และ Voice assistant ด้วยปุ่ม M-button', 5990, 'jpg', 5),
(27, 'หูฟังไร้สาย Apple AirPods Pro (2nd gen)', 'AirPods Pro (2nd gen) มาพร้อมการตัดเสียงรบกวนแบบแอ็คทีฟที่ดีขึ้นสูงสุด 2 เท่า เสียงที่ปรับตามสภาพแวดล้อม ซึ่งจะปรับแต่งการควบคุมเสียงให้อัตโนมัติ เพื่อมอบประสบการณ์การฟังที่ดีที่สุดในสภาพแวดล้อมและการโต้ตอบแบบต่าง ๆ ตลอดทั้งวัน\r\n-พอร์ตการเชื่อมต่อ USB-C\r\n-เคสรองรับการชาร์จ MagSafe\r\n-ทนฝุ่น เหงื่อ และน้ำที่ระดับ IP54\r\n-ชิป H2 ที่ออกแบบโดย Apple ตัดเสียงรบกวนให้ดียิ่งขึ้น', 8550, 'jpg', 5),
(28, 'หูฟังไร้สาย Apple AirPods  (2nd gen)', 'AirPods (รุ่นที่ 2) หูฟังไร้สาย True Wireless ใช้ฟังเพลงได้ต่อเนื่อง 5 ชั่วโมง สนทนา 3 ชั่วโมง รองรับการสั่งการผ่าน Siri ด้วยเสียง จะโทรออก เล่นเพลง หรือถามถึงแบตเตอรี่ที่เหลืออยู่ก็ได้ พร้อมไปกับเราได้ทุก ๆ ที่\r\n- พอร์ตการเชื่อมต่อ Lightning\r\n- คำสั่งเสียงแค่พูดว่า “หวัดดี Siri”\r\n- ให้เสียงคุณภาพสูง ทั้งเสียงที่ได้ยินและเสียงพูด', 4990, 'jpg', 5),
(29, 'Apple AirPods Max – Silver', 'หูฟัง AirPods Max แต่ละข้างมาพร้อมชิพ H1 อันทรงพลังที่ออกแบบโดย Apple รวมถึงดีไซน์อะคูสติกแบบเฉพาะ และซอฟต์แวร์อันล้ำสมัย อีกทั้งยังใช้ระบบเสียงที่ประมวลผลด้วย คอมพิวเตอร์เพื่อสร้างประสบการณ์การฟังสุดล้ำ โดยอาศัยคอร์ประมวลผลเสียง ทั้ง 10 คอร์ในชิพ แต่ละตัวเพื่อช่วยตัดเสียงรบกวนจากภายนอก ปรับเสียงให้เข้ากับความกระชับและแนบสนิทของโฟมรองหูแบบบุนุ่ม ซึ่งทั้งหมดนี้จะทำให้เสียงของฉากในภาพยนตร์รู้สึกราวกับว่ากำลังเกิดขึ้นรอบตัวคุณ', 18900, 'jpg', 5),
(30, ' หูฟังบลูทูธ JBL In-Ear Wireless TWS Tune Flex White', 'JBL Flex White  หูฟัง TWS Noise Cancelling เบาสบาย ใส่พอดีหูได้ตลอดวัน ที่สื่อสารกับปลายทางได้ชัดเจน มีไมค์ 4 ตัว สามารถใช้ได้ทั้ง Earbud และ INCAR ป้องกันเสียงรบกวนได้ดีเยี่ยม\r\n- ใช้งานแบตเตอรี่สูงสุด 32 ชั่วโมง\r\n- กันน้ำกันเหงื่อ ระดับ IPX4\r\n- สามารถเชื่อมต่อ JBL Headphones App', 3950, 'jpg', 5),
(31, 'Apple iPad Pro 11-inch Wi-Fi 256GB with Standard glass - Space Black (5th Gen)', 'iPad Pro ใหม่นั้นบางอย่างเหลือเชื่อ พร้อมประสิทธิภาพที่แรงสุดด้วยชิปอันทรงพลัง และกราฟิกที่เร็วสุดขั้ว จอภาพที่สีสันสวยสดงดงามสุดล้ำ ถ่ายทอดสีสันได้อย่างแม่นยำ ให้คุณเชื่อมต่อแบบไร้สายได้รวดเร็ว เพื่อประสิทธิภาพการทำงานที่ไม่มีที่สิ้นสุด\r\n-ชิป M4 ที่มีประสิทธิภาพที่ทรงพลัง\r\n-จอภาพ ULTRA RETINA XDR ขนาด 11 นิ้ว\r\n-กล้องหน้าอัลตร้าไวด์ 12MP และกล้องหลังไวด์ 12MP\r\n-ปลดล็อค iPad Pro ด้วย Face ID ลงชื่อเข้าได้เพียงแค่เหลือบมอง', 39900, 'jpg', 4),
(32, 'Apple iPad Pro 12.9-inch Wi-Fi 512GB Space Gray 2022 (6th Gen)', 'iPad Pro มาพร้อมประสิทธิภาพที่น่าทึ่ง การเชื่อมต่อแบบไร้สายที่เร็วสุดแรง และประสบการณ์การใช้งาน Apple Pencil เจเนอเรชั่นถัดไป บวกกับคุณสมบัติใหม่อันทรงพลังสำหรับประสิทธิภาพการทำงานและการทำงานร่วมกันใน iPadOS 16 นี่แหละ iPad Pro ที่สุดแห่งประสบการณ์ iPad\r\n-จอภาพ Liquid Retina XDR ขนาด 12.9 นิ้ว\r\n-ชิป M2 พร้อม CPU แบบ 8-core และ GPU แบบ 10-core\r\n-กล้องไวด์ความละเอียด 12MP\r\n-กล้องหน้าอัลตร้าไวด์ความละเอียด 12MP  \r\n-ใช้งานได้กับ Apple Pencil (รุ่นที่ 2)\r\n-iPadOS 16 ', 53900, 'jpg', 4),
(33, 'Apple iPad Air 11-inch (M2) Wi-Fi 128GB Space Gray', 'iPad Air อัดฉีดโดยชิปอันทรงพลังที่รวดเร็ว พร้อมจอภาพที่สวยสดงดงาม กล้องในแนวนอนใหม่ที่ลงตัวสุด ๆ สำหรับ FaceTime และการโทรแบบวิดีโอ คุณจึงสามารถทำนั่นทำนี่แบบมัลติทาสก์ ทำงาน เรียนรู้ เล่นสนุก และสร้างสรรค์จากที่ไหนก็ได้\r\n-จอภาพ LIQUID RETINA ขนาด 11 นิ้ว\r\n-ชิป M2 ทำงานมัลติทาสก์และเล่นเกมได้อย่างราบรื่น\r\n-กล้องหน้าอัลตร้าไวด์ 12MP และกล้องหลังไวด์ 12MP\r\n-ปลดล็อคด้วย Touch ID ใช้ลายนิ้วมือเพื่อปลดล็อค iPad Air', 23900, 'jpg', 4),
(34, 'แท็บเล็ต Microsoft Surface Pro11 Eli/32/1TB Platinum', 'Surface Pro 11    Copilot+ PC พลิกโฉมใหม่กับแท็บเล็ตที่มาพร้อมดีไซน์ทันสมัย\r\nมีการประสมประสานระหว่างแล็ปท็อปและแท็บเล็ตได้อย่างลงตัว ใช้งานได้ยืดหยุ่นให้คุณสัมผัสประสบการณ์การใช้งาน Copilot+ ที่ขับเคลื่อนโดย AI และฟีเจอร์ต่าง ๆ และมาพร้อม Windows 11 ที่ใช้งานได้อย่างหลากหลาย ตอบสนองทุกการใช้งาน ได้รวดเร็วดั่งใจ\r\n-RAM 32GB / SSD 1TB\r\n-เป็นแล็ปท็อปที่สามารถถอดคีย์บอร์ดออกมาได้\r\n-ประมวลผลด้วย   Qualcomm Snapdragon X Elite\r\n-ใช้กับปากกา Microsoft Pen ได้ (โปรดตรวจสอบรุ่นที่รองรับ)', 89900, 'jpg', 4),
(35, 'Apple iPad Air 10.9-inch Wi-Fi 64GB Space Gray 2022 (5th Gen)', 'iPad Air (5th Gen) รุ่นล่าสุดสำหรับ iPad Air อัพเกรดขึ้นไปอีกขั้นด้วยจอภาพที่ใหม่และกว้างขึ้น พร้อมชิปประมาลผลที่ทรงประสิทธิภาพ ให้การทำงานหรือเล่นเกมหนัก ๆ ตัดต่อคลิป วาดรูป กลายเป็นเรื่องง่าย ๆ  แต่ยังคงความเบาและบางไว้ได้อยู่\r\n-พอร์ตการเชื่อมต่อแบบ USB-C\r\n-ใช้งานได้กับ Apple Pencil (รุ่นที่ 2)\r\n-ชิป Apple M1 พร้อม Neural Engine\r\n-จอภาพ Liquid Retina ขนาด 10.9 นิ้ว', 18900, 'jpg', 4),
(36, 'แท็บเล็ต Samsung Galaxy Tab S9 Wi-Fi (8+128GB) Graphite', 'Samsung Galaxy Tab S9 Wi-Fi  สี Graphite  แท็บเล็ต Galaxy Tab S รุ่นแรกที่ทนน้ำ ทนฝุ่น พร้อมพาคุณ Work & Play ได้ทุกที่ทั่วโลก ทนน้ำ ทนฝุ่น IP68 และคุณภาพที่ทนทาน พร้อมไปกับคุณได้สุดกว่าเดิม ตอบโจทย์ New normal lifestyle จัดเต็มด้าน Entertainment เติมเต็มความฟินทั้งดูหนัง ดูซีรีย์ เล่นเกม ยกระดับการทำงานไปอีกขั้นอย่างไร้รอยต่อ\r\n-หน้าจอขนาด 11 inch \r\n-ชิป   Snapdragon 8 Gen 2 \r\n-มาตรฐานการกันน้ำและฝุ่น IP68\r\n-รองรับการชาร์จไว 45W', 28900, 'jpg', 4),
(37, 'Apple iPhone 16 Pro 128GB Desert Titanium', 'iPhone 16 Pro มาพร้อมดีไซน์แบบไทเทเนียมที่โดดเด่นสวยงาม พร้อมตัวควบคุมกล้องให้เข้าถึงเครื่องมือของกล้องได้อย่างรวดเร็ว และยกระดับวิดีโอไปอีกขั้นอย่างที่ไม่เคยทำได้มาก่อนด้วย Dolby Vision ระดับ 4K ที่ 120 fps\r\n\r\n- ขุมพลังแห่งชิป A18 PRO\r\n- จอภาพ Super Retina XDR ขนาด 6.3 นิ้ว\r\n- กล้อง Fusion 48MP และไมโครโฟนคุณภาพระดับสตูดิโอ', 39900, 'jpg', 1),
(38, 'Apple iPhone 16 Pro Max 256GB White Titanium', 'iPhone 16 Pro Max มาพร้อมดีไซน์แบบไทเทเนียมที่โดดเด่นสวยงาม พร้อมตัวควบคุมกล้องให้เข้าถึงเครื่องมือของกล้องได้อย่างรวดเร็ว และยกระดับวิดีโอไปอีกขั้นอย่างที่ไม่เคยทำได้มาก่อนด้วย Dolby Vision ระดับ 4K ที่ 120 fps\r\n\r\n- ขุมพลังแห่งชิป A18 PRO\r\n- จอภาพ Super Retina XDR ขนาด 6.9 นิ้ว\r\n- กล้อง Fusion 48MP และไมโครโฟนคุณภาพระดับสตูดิโอ', 48900, 'jpg', 1),
(39, 'Samsung Galaxy Z Flip 4 Ram 8GB Rom 128GB', 'ระบบปฏิบัติการ One UI 4.1 based on Android 12\r\nหน่วยประมวลผล Octa CoreSnapdragon 8+ Gen 13.19GHz 128/256/512GB/ROM 8GB/RAM\r\nกล้องหลัง 12 MP + 12MP (Ultrawide)\r\nกล้องหน้า 10MP\r\nจอแสดงผล 6.7″ Dynamic AMOLED 2X 1080x2640 Pixels\r\nระบบเชื่อมต่อ WIFI WIFIHotspot, Bluetooth, NFC\r\nแบตเตอรี่ 3,700mAh (Standard Battery) ชาร์จไร้สาย ชาร์จเร็ว', 17250, 'jpg', 1),
(40, 'Samsung Galaxy Z Fold4 5G', 'Samsung Galaxy Z Fold 4 5G สมาร์ทโฟนจอพับได้รองรับ 5G ตัวแรง มาพร้อมความเร็วอัจฉริยะ ประมวลผลเหนือกว่า กล้องหลัง 3 เลนส์ หน้าจอใหญ่ 7.6 นิ้ว อัตรารีเฟรชเรท 120 Hz Dynamic AMOLED 2X Display  หน้าจอบานพับแบบใหม่ สามารถกางและวางเครื่องได้ สามารถใช้ 3 แอปพลิเคชั่นในหน้าจอเดียวกัน ความคมชัดมากขึ้นกว่าเดิม รองรับ S-Pen', 38900, 'jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `pt_id` int(4) NOT NULL,
  `pt_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`pt_id`, `pt_name`) VALUES
(1, 'Mobile'),
(2, 'Laptops'),
(3, 'Smartwatch'),
(4, 'Tablet'),
(5, 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `sex`, `username`, `password_hash`, `phone`, `email`, `address`, `created_at`) VALUES
(2, 'Nithit', 'Sriwang', 'Male', 'user1', '$2y$10$0vGJepXE.ILQj.QXAsJGWep3g9c4zgxZ.3at7HT1nP3AILOTZ8Tq2', '09463215624', 'test@gmail.com', '22/99synerauttraia', '2024-09-27 17:41:30'),
(3, 'save', 'jj', 'Male', 'user2', '$2y$10$3jLUIReh/qMgtSmZ.jcgDeE/2u4EgQ98E/HDo6ZplDP13B7rpY7ke', '09463215652', 'ex@gmail.com', '22/99synerauttraia22623541', '2024-09-27 17:48:16'),
(4, 'arm', 'ss', 'Male', 'user3', '$2y$10$c53wS7Ys9VU/JsJg9XyMW.1Y/jiifWizJZ5PNB7teIMTCiaPQKmDC', '09463215625', 'ssx@gmail.com', '22/99synerauttraia58563', '2024-09-27 17:51:58'),
(5, 'นิว1', 'kl', 'Female', 'user4', '$2y$10$fXMToM4qN4W90mz/kcUbeekQQ7QWfVUOFgdHaRpudYF6uYIh4YDCW', '094632158892', 'oip@gmail.com', '22/99synerauttraia22623541ghbcvb', '2024-09-28 05:39:09'),
(7, 'Nithit', 'Sriwang', 'Female', 'user', '$2y$10$Gpu6vFVH0d8TgTN1RIhDQOSjmt97T32NA0MbFCQtG9Ad7izfHsx1O', '0256310224', 'twst@gmail.com', '22/33 ขามเรียง มหาสารคาม', '2024-10-17 06:29:46'),
(8, 'editlast', 'lsat', 'Male', 'edit', '$2y$10$dCMaYF1GRRr8R8gvau2Vv.uMpbo4FLMJMkVPxp78IgEKHE1LxrgJK', '0617151214', 'nithitsriwang@gmail.com', '23/13ขามเรียงกันทรวิชันมหามหาสารคาม', '2024-10-17 17:03:19'),
(12, 'ed', 'te', 'Female', 'nn', '$2y$10$uZSiSxBAewm1m27htZ5/AO.NMFwK7OaSjir2t2auuEFYLv3Ftq8uu', '0658954123', 'mm@gmail.com', '12iuslc', '2024-10-17 17:07:30'),
(13, 'yu', 'uy', '', 'you', '$2y$10$tEzi1cP9v.eRoN9goyyN6.XjBglIdZbJnw1r49OovsZhm/12Kigyy', '03216547890', 'you@gmail.com', '12346xxxsal[av', '2024-10-17 17:10:04'),
(14, 'aq', 'qa', 'Male', 'qa', '$2y$10$fqDBsoWv./RP2XihOI.MheyXucxtmn9madwNUOUXVodZOLB43p6MS', '061715369852', 'ko@gmail.com', '12/23xxxyyyxx', '2024-10-17 17:11:52'),
(15, 'edittwo', 'two', 'Female', 'edits', '$2y$10$MhtroGIxRa1pR8M4HqEZxeIewqY6KNVQ6BfkvERbYITptTBVuYbWy', '0645986321', 'OM@gmail.com', '88/22xxxyyyrrr', '2024-10-17 17:18:42'),
(16, 'UO', 'ou', 'Female', 'asd', '$2y$10$dFEZcXvKfMTl81HvbscyteP644CNzK7N4Mzo3trWHUEBq4lDhRCQO', '023658962', 'asd@gmail.com', '13/99banscsx', '2024-10-17 17:27:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`od_id`),
  ADD KEY `oid` (`oid`),
  ADD KEY `orders_detail_ibfk_2` (`pid`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`pt_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `pt_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_detail_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`p_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
