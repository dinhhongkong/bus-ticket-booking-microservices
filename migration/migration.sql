CREATE DATABASE  IF NOT EXISTS `bus_ticket_booking_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bus_ticket_booking_db`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: bus_ticket_booking_db
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `bus_id` int NOT NULL AUTO_INCREMENT,
  `license_plates` varchar(20) NOT NULL,
  `status` tinyint DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`bus_id`),
  KEY `bus_bus_type_type_id_fk` (`type_id`),
  CONSTRAINT `bus_bus_type_type_id_fk` FOREIGN KEY (`type_id`) REFERENCES `bus_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1,'47A-MD4.555.88',1,1),(3,'23A-CB1932',1,2),(4,'67B-3A384',1,1),(5,'47A-AB4.15.232',1,1),(6,'18AB-CA834.343',1,2);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_type`
--

DROP TABLE IF EXISTS `bus_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_type`
--

LOCK TABLES `bus_type` WRITE;
/*!40000 ALTER TABLE `bus_type` DISABLE KEYS */;
INSERT INTO `bus_type` VALUES (1,'Giường'),(2,'Limousine');
/*!40000 ALTER TABLE `bus_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_document`
--

DROP TABLE IF EXISTS `business_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_document` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_document_employee_employee_id_fk` (`employee_id`),
  CONSTRAINT `business_document_employee_employee_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_document`
--

LOCK TABLES `business_document` WRITE;
/*!40000 ALTER TABLE `business_document` DISABLE KEYS */;
INSERT INTO `business_document` VALUES (3,'Quyền Và Nghĩa Vụ Của Khách Hàng','1.  Được tham khảo những thông tin cơ bản liên quan đến việc chọn và đặt vé như: tên hãng xe, tuyến xe, mã số ghế, phương thức và thời hạn thanh toán.\n\n2.  Thông tin cá nhân của khách hàng trên FUTABUS.VN được FUTABUS.VN cam kết bảo mật tuyệt đối theo chính sách bảo vệ thông tin khách hang của FUTABUS.VN.\n\n- Việc thu thập và sử dụng thông tin của khách hàng chỉ được thực hiện khi có sự đồng ý của khách hàng đó trừ những trường hợp pháp luật có quy định khác.\n\n3. Khách hàng có thể gửi khiếu nại trực tiếp đến bộ phận hỗ trợ khách hàng của FUTABUS.VN. Khi nhận được khiếu nại của hành khách, bộ phận hỗ trợ khách hàng của FUTABUS.VN sẽ chuyển ngay khiếu nại đó đến Hãng xe bằng các phương thức nhanh nhất và yêu cầu giải quyết.\n\n4. Khách hàng cần phải thường xuyên đọc và tuân theo các Chính sách và Quy định đang được đăng trên FUTABUS.VN để có thể hiểu và thực hiện được các Chính sách và Quy định tại thời điểm đó.\n\n5. Khách hàng đồng ý không truy cập (hoặc cố truy cập) bất kỳ các dịch vụ nào bằng bất kỳ các phương tiện nào khác ngoài giao diện được cung cấp bởi FUTABUS.VN.\n\n6. Khách hàng đồng ý rằng sẽ không tiến hành bất kỳ hoạt động nào quấy nhiễu hoặc phá các dịch vụ.\n\n7. Quý khách vui lòng có mặt tại bến xuất phát của xe trước ít nhất 30 phút giờ xe khởi hành, mang theo thông báo đã thanh toán vé thành công có chứa mã vé được gửi từ hệ thống FUTA BUS LINE.\n\n8.  Thông tin hành khách phải chính xác, nếu không sẽ không thể lên xe hoặc hủy/đổi vé.\n\n9. Mọi trường hợp có hành vi gian lận , hack , phá hoại hệ thống , ... Chúng tôi sẽ không giải quyết và sẽ chuyển cơ quan chức năng xử lý theo pháp luật.\n\n10.  Nếu quý khách có nhu cầu trung chuyển, vui lòng liên hệ số điện thoại 1900 6918 trước khi đặt vé . Chúng tôi sẽ không đón / trung chuyển tại những địa điểm xe trung chuyển không thể tới được !\n\n11. Thí sinh đi thi đại học vui lòng mang theo CMND và GIẤY BÁO THI. Mọi trường hợp gian lận mua vé không phải thí sinh công ty Phương Trang sẽ KHÔNG chịu trách nhiệm cung cấp vé và hoàn trả tiền.',NULL),(4,'Tôi có đăng ký vé thành công nhưng tôi không đến bến xe/văn phòng đúng giờ hẹn. Tôi có thể được hỗ trợ sang chuyến đi tiếp theo không?','Trong trường hợp Anh/Chị đến trễ so với chuyến đi đã đăng ký trước đó:\n\nĐối với vé đã thanh toán: Liên hệ trực tiếp với nhân viên tại bến xe/văn phòng vé để được hướng dẫn hỗ trợ.\n\nĐối với vé chưa thanh toán: Anh/Chị có thể đăng ký lại vé khác cho chuyến đi tiếp theo tùy theo thời điểm Anh/Chị có mặt tại bến xe/văn phòng vé.',NULL),(5,'Tôi đặt vé qua TTTĐ (Trung tâm tổng đài), có thể thanh toán vé bằng hình thức nào?','Thanh toán trực tiếp bằng tiền mặt tại văn phòng vé.\n\nThanh toán trực tuyến qua QR code được gửi tự động về ZALO cá nhân. (Các hình thức như: Thanh toán thẻ VISA/MASTER card, thẻ ATM nội địa (có đăng ký thanh toán trực tuyến và internet banking), ví điện tử (Momo, Zalo, Shopee, VN PAY), ví FUTA PAY.)',NULL),(6,'Tôi mua vé qua hình thức Online (website/app) nhưng lại nhập sai thông tin cá nhân (SĐT, họ tên,..) và đã đặt nhầm ngày, tôi phải làm gì?','Anh/Chị vui lòng liên hệ trực tiếp TTTĐ 19006067 gặp BP Online để được hỗ trợ hướng dẫn thêm.\n\nTrường hợp vé online đã thanh toán thành công, Công ty sẽ hỗ trợ chuyển đổi vé 1 lần duy nhất, điều kiện: cùng tuyến đường đi và cùng giá vé và tuyến xe cần chuyển còn trống vé, vé hoàn toàn chưa thay đổi trước đó và vé sau khi thay đổi Công ty không hỗ trợ chuyển đổi lần 2 hoặc hủy vé. (thông tin có hiển thị tại mục \"Điều khoản & Lưu ý\" khi Anh/Chị thao tác mua vé).',NULL),(7,'ĐIỀU KHOẢN ĐẶT VÉ TRỰC TUYẾN','I. ĐIỀU KHOẢN VÀ QUY ĐỊNH CHUNG\nĐiều 1. Giải thích từ ngữ và từ viết tắt\n1. “Biểu phí”: là các loại phí thuế theo quy định của Hãng vận tải và Nhà chức trách;\n\n2. “Bến xe ô tô khách”: là công trình thuộc kết cấu hạ tầng giao thông đường bộ thực hiện chức năng phục vụ xe ô tô đón, trả hành khách và các dịch vụ hỗ trợ vận tải hành khách;\n\n3.  “Chúng tôi”: là Công Ty Cổ Phần Xe Khách Phương Trang FUTA Bus Lines;\n\n4. “Điểm đón/trả”: là điểm khởi hành và điểm đến theo lịch trong hành trình của khách hàng;\n\n5. “Điều kiện bất khả kháng”: là sự kiện xảy ra mang tính khách quan và nằm ngoài tầm kiểm soát của các bên bao gồm, nhưng không giới hạn đến động đất, bão, lũ lụt, lốc, sóng thần, lở đất, hỏa hoạn, chiến tranh hoặc có nguy cơ xảy ra chiến tranh, bạo động, nổi loạn, đình công… và các thảm họa khác chưa lường hết được, sự thay đổi chính sách hoặc ngăn cấm của cơ quan có thẩm quyền của Việt Nam;\n\n6. “Điều kiện vận chuyển”: là các yêu cầu, nội dung của FUTA thông báo đến hành khách liên quan đến các dịch vụ vận chuyển, bao gồm các thông tin được thể hiện trên vé/phiếu xác nhận hành trình và/hoặc trên website, ứng dụng và/hoặc trong điều khoản sử dụng đã được phê duyệt và/hoặc các hình thức công bố khác;\n\n7. “Hành khách”: là bất kỳ cá nhân nào sử dụng dịch vụ của FUTA;\n\n8. “Hành lý”: là những vật phẩm, đồ dùng tư trang và tài sản cá nhân của hành khách mang theo, sử dụng trong chuyến đi của mình, trừ khi được quy định khác đi;\n\n9. “Hợp đồng vận chuyển”: là các thỏa thuận của Hãng vận chuyển và hành khách trong việc cung cấp các dịch vụ theo nhu cầu của hành khách được thể hiện bằng vé hoặc hình thức khác có giá trị tương đương với vé;\n\n10. “Hóa đơn điện tử”: hóa đơn có mã hoặc không có mã của cơ quan thuế được thể hiện ở dạng dữ liệu điện tử do FUTA cung cấp dịch vụ, lập bằng phương tiện điện tử để ghi nhận thông tin, cung cấp dịch vụ theo quy định của pháp luật về kế toán, pháp luật về thuế;\n\n11. “Mã tra cứu”: là mã số bao gồm 9 ký tự được hiển thị trong thông tin mua vé,  dùng cho việc tra cứu hóa đơn điện tử sau khi khách hàng thanh toán thành công;\n\n12. “Mã đặt vé”: là các thông tin chi tiết của Hành khách đã được nhập vào hệ thống đặt giữ chỗ của Chúng tôi thông qua website/hoặc ứng dụng FUTA, Phòng vé, Đại lý, Tổng đài;\n\n13. “Ngày”: có nghĩa là các ngày dương lịch, bao gồm bảy (07) ngày trong tuần; với điều kiện là khi dùng trong việc gửi thông báo thì ngày gửi thông báo đi không được tính và khi dùng cho mục đích xác định;\n\n14.  “Thông tin cá nhân”: Hành khách chấp nhận rằng thông tin cá nhân của hành khách được chuyển cho FUTA vì mục đích sử dụng dịch vụ do FUTA cung cấp. Vì mục đích trên, hành khách đồng ý cho phép FUTA lưu trữ và sử dụng các thông tin cá nhân và chuyển tải các thông tin đó tới hãng vận chuyển, các đại diện ủy quyền phát hành vé, cơ quan nhà nước có thẩm quyền, hoặc các nhà cung cấp dịch vụ liên quan khác;\n\n15. “Thẻ lên xe (vé)”: là bằng chứng xác nhận hợp đồng vận chuyển hành khách và FUTA Bus Lines. Có giá trị đối với hành khách có tên và hành trình được ghi rõ trong vé. Vé có thể được chuyển, hủy theo quy định của FUTA Bus Lines.\n\n16. “ZNS”: là dịch vụ gửi thông báo chăm sóc khách hàng trên Zalo.\n\n17. Đề mục hoặc tiêu đề của mỗi điều của Điều lệ vận chuyển này chỉ được sử dụng cho mục đích thuận tiện tra cứu và không được sử dụng để giải thích nội dung của điều khoản đó.\n\nĐiều 2. Quy định đặt vé trực tuyến\n1. Phạm vi áp dụng: Chương trình thanh toán online được áp dụng cho các chuyến xe nhất định của FUTA Bus Lines. Thành viên của FUTA Bus Lines cũng như khách vãng lai thực hiện được hình thức thanh toán này. Việc đăng ký tham gia Thành viên FUTA Bus Lines là hoàn toàn miễn phí.\n\n2. Đặt chỗ\n\na) Quý khách kiểm tra cẩn thận các thông tin vé trước khi tiến hành xác nhận đặt vé và thanh toán. Bằng việc thanh toán qua website này, Quý khách chấp nhận giờ khởi hành, vị trí ghế ngồi v.v mà Quý khách đã đặt. Quý khách đồng ý rằng, trong những trường hợp có sự thay đổi về chuyến đi hoặc bất khả kháng, chúng tôi có quyền hoàn trả lại bất kỳ vé nào từ việc mua bán qua website này hoặc thực hiện việc chuyển vé cho Quý khách qua chuyến khác theo yêu cầu của Quý khách trong trường hợp chúng tôi còn chỗ;\n\nb) Đặt chỗ chỉ được xác nhận sau khi việc thanh toán tiền vé đã hoàn tất đồng thời FUTA cung cấp cho Hành khách Mã đặt vé xác định tên Hành khách, hành trình, giờ khởi hành, số ghế, giá vé;\n\nc) Chúng tôi sẽ không chịu trách nhiệm về bất kỳ tổn thất nào mà Hành khách có thể phải chịu từ việc đặt chỗ  thông qua bất kỳ tổ chức/cá nhân nào không phải là Chúng tôi hoặc Bên thứ ba được ủy quyền của Chúng tôi.\n\n3. Xác nhận thanh toán: Sau khi hoàn thành việc thanh toán vé trực tuyến, Quý khách sẽ nhận được thư xác nhận thông tin chi tiết vé đã đặt thông qua địa chỉ thư điện tử (email) mà Quý khách đã cung cấp. Đồng thời, chúng tôi cũng sẽ gửi tin nhắn (SMS) hoặc ZNS qua Zalo thông báo mã giao dịch tới số điện thoại Quý khách đăng ký.\n\nLưu ý:\n\na) Chúng tôi không chịu trách nhiệm trong trường hợp Quý khách nhập sai địa chỉ email, số điện thoại và thông tin cá nhân khác dẫn đến không nhận được thư xác nhận. Vì vậy Quý khách vui lòng kiểm tra lại chính xác các thông tin trước khi thực hiện thanh toán. Với email, SMS và ZNS chỉ có tính chất xác nhận thông tin vé sau khi Quý khách đã đặt vé thành công;\n\nb) Chúng tôi đề nghị Quý khách đọc kỹ các thông tin về chuyến đi, giờ khởi hành và chỗ ngồi v.v. trước khi hoàn tất việc xác nhận tất cả các thông tin về vé;\n\nc) Email xác nhận thông tin đặt vé có thể đi vào hộp thư rác (spam mail) của Quý khách, vì vậy hãy kiểm tra trước khi liên lạc với chúng tôi;\n\nd) Sau 30 phút kể từ khi Quý khách thanh toán thành công mà vẫn chưa nhận được bất kỳ xác nhận nào (qua email hoặc SMS/ ZNS), Quý khách vui lòng liên hệ chúng tôi qua tổng đài 1900 6067 để được hỗ trợ. Nếu Quý khách không liên hệ lại coi như FUTA Bus Lines đã hoàn thành nghĩa vụ với Quý khách.\n\n4. Bảo đảm an toàn giao dịch\n\na) Quản lý thông tin nhà cung cấp dịch vụ: FUTA Bus Lines (hoặc bên thứ ba - nhà cung cấp cổng thanh toán điện tử, hoặc/và các bên ký kết khác) sẽ sử dụng các công nghệ đặc biệt để nhận biết các hoạt động giả mạo trên trang mạng như: sử dụng thẻ tín dụng giả v.v. Sự chấp nhận hợp tác của Quý khách cùng với nỗ lực của FUTA Bus Lines là rất cần thiết. Quý khách chấp nhận rằng FUTA Bus Lines có thể chấm dứt quyền truy cập và sử dụng trang mạng của FUTA Bus Lines nếu Quý khách hoặc người khác hành động nhân danh Quý khách vì lý do nào đó nằm trong diện nghi vấn có gian lận hoặc vi phạm các điều khoản này;\n\nb) Kiểm soát giao dịch và thông tin phản hồi khách hàng: FUTA Bus Lines sẽ hết sức cố gắng sử dụng mọi biện pháp và tuân theo mọi cách thức có thể để giữ an toàn cho tất cả các thông tin cá nhân của Quý khách, và chúng tôi cũng sẽ thường xuyên cập nhật những thông tin chính xác nhất. Website này có những công nghệ an ninh đảm bảo việc bảo vệ các thông tin bị thất lạc, lạm dụng hoặc thay đổi. Tất cả các giao dịch và thông tin về thẻ được sử dụng đều được đảm bảo an toàn cho các giao dịch kinh tế ngày nay. Mặc dù vậy, không phải tất cả các dữ liệu truyền qua Internet đều có thể đảm bảo 100%, vì thế chúng tôi không thể đưa ra một sự đảm bảo tuyệt đối rằng mọi thông tin Quý khách cung cấp đều được bảo vệ tất cả mọi lúc.\n\n5. Thông tin cá nhân\n\na) Thông tin cá nhân của Quý khách mà chúng tôi có được trong quá trình giao dịch chỉ dùng vào các mục đích sau:\n\n- Hỗ trợ và giải đáp các thắc mắc của Quý khách;\n\n- Cập nhật các thông tin mới nhất về các chương trình, dịch vụ v.v. của FUTA Bus Lines đến Quý khách.\n\nb) Chúng tôi thu thập và sử dụng thông tin cá nhân của Quý khách phù hợp với mục đích đã nêu bên trên và hoàn toàn tuân thủ nội dung của “Chính sách bảo mật”. Chúng tôi cam kết chỉ sử dụng cho mục đích và phạm vi đã nêu và không tiết lộ cho bất kỳ bên thứ ba nào khi chưa có sự đồng ý bằng văn bản của Quý khách;\n\nc) Xin lưu ý chúng tôi được quyền cung cấp thông tin cá nhân của Quý khách trong trường hợp khi có yêu cầu từ các cơ quan Nhà nước có thẩm quyền.\n\n6. Chính sách hoàn/hủy/đổi vé\n\na) Quy định hoàn trả tiền mua vé Online do lỗi giao dịch\n\n- Các trường hợp hoàn trả tiền mua vé online cho khách do lỗi giao dịch:\n\n- Khách hàng mua vé online giao dịch không thành công (lỗi giao dịch) chưa có Mã đặt vé (code) nhưng đã bị trừ tiền;\n\n- Hiện nay, có một số Thẻ ATM của khách hàng (Thẻ ATM cũ được làm từ 3-4 năm trước) chỉ thực hiện được hình thức chuyển khoản không có chức năng thanh toán trực tuyến nên khi khách hàng thực hiện giao dịch chuyển khoản vào cuối tuần hoặc vào ngày Lễ, Tết, hệ thống ngân hàng không xác nhận tiền trong tài khoản của FUTA Bus Lines nên khách hàng phải thanh toán trực tiếp tại quầy vé (Khách hàng vừa bị trừ tiền trong tài khoản vừa phải ra quầy vé thanh toán tiền mặt lấy vé).\n\nb) Thời gian hoàn trả tiền cho khách hàng\n\n- Đối với Bộ phận Tổng đài: Thời gian hoàn trả tiền tới tài khoản khách hàng là từ 03 ngày đến 05 ngày làm việc kể từ khi Ban Tài chính – Kế toán nhận chứng từ thanh toán;\n\n- Đối với các quầy vé: Giao dịch trực tiếp với khách hàng và hoàn trả ngay thời điểm giao dịch.\n\n- Đối với hoàn trả tiền mua vé qua App: Thời gian theo chính sách của từng nhà phát triển App\n\nc) Quy định thay đổi hoặc hủy vé\n\n- Chỉ được chuyển đổi vé 1 lần duy nhất\n\n- Chi phí hủy vé từ 10% – 30% giá vé tùy thuộc thời gian hủy vé so với giờ khởi hành ghi trên vé và số lượng vé cá nhân/tập thể áp dụng theo các quy định hiện hành.\n\n- Quý khách khi có nhu cầu muốn thay đổi hoặc hủy vé đã thanh toán, cần liên hệ với Trung tâm tổng đài 1900 6067 hoặc quầy vé chậm nhất trước 24h so với giờ xe khởi hành được ghi trên vé, trên email hoặc tin nhắn để được hướng dẫn thêm.\n\n7. Kênh bán vé\n\na) FUTA Bus Lines khuyến cáo Quý khách mua vé lựa chọn một trong các phương thức mua vé bao gồm mua trực tiếp tại website, app, phòng vé chính thức hoặc mua vé qua Tổng đài 1900 6067 để đảm bảo không mua phải vé giả, vé bị nâng giá v.v.;\n\nb) Nếu phát hiện ra Quý khách gian lận, vi phạm điều khoản sử dụng, có hành vi đầu cơ, mua đi bán lại, bán vé chợ đen. FUTA Bus Lines có quyền từ chối cung cấp dịch vụ và không giải quyết các vấn đề phát sinh nếu Quý khách mua vé từ các kênh không thuộc hệ thống bán vé của FUTA Bus Lines.\n\n8. Trung chuyển: Nếu quý khách có nhu cầu trung chuyển, vui lòng liên hệ số điện thoại 1900 6067 trước khi đặt vé. Chúng tôi sẽ không đón/trung chuyển tại những địa điểm xe trung chuyển không thể đến được.\n\nĐiều 3: Quy định vận chuyển\n1. Trẻ em dưới 6 tuổi và phụ nữ có thai\n\na) Trẻ em dưới 6 tuổi, cao từ 1.3m trở xuống, cân nặng dưới 30kg thì không phải mua vé.\n\nb) Phụ nữ có thai cần đảm bảo sức khoẻ trong suốt quá trình di chuyển.\n\n2. Hành lý\n\na) Tổng trọng lượng hành lý không vượt quá 20kg;\n\nb) Đối với hành lý quá khổ, cồng kềnh vui lòng liên hệ Tổng đài 1900 6067\n\n3. Yêu cầu khi lên xe\n\na) Có mặt trước giờ xe khởi hành 30 phút tại Bến đi (đối với ngày lễ tết cần ra trước 60 phút)\n\nb) Xuất trình thông tin vé được gửi qua SMS/Email/Futa App hoặc liên hệ quầy vé để nhận thông tin vé trước khi lên xe.\n\nc) Không mang đồ ăn, thức ăn có mùi lên xe;\n\nd) Không hút thuốc, uống rượu, sử dụng chất kích thích trên xe;\n\ne) Không mang các vật dễ cháy nổ lên xe;\n\nf) Không vứt rác trên xe;\n\ng) Không mang động vật lên xe.\n\nII. CHÍNH SÁCH BẢO MẬT\nĐiều 1. Quy định chung\n1. Nhằm mang lại trải nghiệm tốt nhất cho người dùng trên website của FUTA Bus Lines, thông tin nhận dạng cá nhân hoặc dữ liệu cá nhân của quý khách hàng sẽ được thu thập, sử dụng, tiết lộ, xử lý trong khuôn khổ bảo vệ người dùng;\n\n2. Sau khi đọc Chính sách bảo mật này, quý khách hàng tự quyết định việc chia sẻ dữ liệu cá nhân với chúng tôi. Dữ liệu cá nhân ở đây đề cập đến mọi thông tin liên quan đến một cá nhân có thể định danh/ nhận dạng được. Khi nhấp chọn \"đồng ý\", quý khách hàng thừa nhận rằng quý khách hàng đã đọc, đồng ý và chấp thuận cho chúng tôi thu thập, sử dụng và xử lý Dữ liệu cá nhân theo Chính sách bảo mật này và/hoặc các Điều khoản sử dụng. Đồng thời, quý khách hàng cũng thừa nhận rằng toàn bộ Dữ liệu cá nhân mà quý khách hàng đã cung cấp hoặc sẽ cung cấp là dữ liệu chính chủ, đúng và chính xác.\n\n3.  Tùy từng thời điểm FUTA Bus Lines có thể sửa đổi Chính sách bảo mật này để phản ánh các thay đổi về luật pháp và quy định, thông lệ sử dụng của FUTA Bus Lines, các tính năng Hệ thống và/hoặc các tiến bộ công nghệ. Chúng tôi khuyến khích khách hàng thường xuyên xem lại Chính sách Bảo mật thông tin cá nhân trên FUTA. Cập nhật thông tin liên tục có thể đảm bảo bạn biết và thực hiện tốt quản lý cá nhân.\n\nĐiều 2. Chính sách bảo mật\n1. Thông tin thu thập: Khi được sự đồng ý của quý khách hàng, chúng tôi có thể thu thập Dữ liệu cá nhân của quý khách hàng để cung cấp dịch vụ của chúng tôi cho quý khách hàng khi sử dụng Hệ thống dữ liệu FUTA. Dữ liệu cá nhân bao gồm những thông tin được trình bày như sau:\n\na) Thông tin cá nhân cơ bản: khi quý khách hàng đang sử dụng Hệ thống của chúng tôi, chúng tôi có thể yêu cầu quý khách hàng tạo một tài khoản để tiến hành đặt chỗ. Dữ liệu cá nhân được thu thập sẽ bao gồm, nhưng không giới hạn tên của quý khách hàng, thông tin nhận dạng người dùng và thông tin đăng nhập của FUTA ID, Địa chỉ thư điện tử (email), số điện thoại, địa chỉ và phương thức thanh toán;\n\nb) Thông tin cá nhân cụ thể: chúng tôi có thể thu thập Dữ liệu cá nhân của quý khách hàng dựa trên quá trình quý khách hàng sử dụng Hệ thống của chúng tôi, ví dụ: chi tiết về quyền thành viên thường xuyên cũng như những đánh giá của quý khách hàng. Chúng tôi cũng có thể thu thập một số thông tin nhất định từ quý khách hàng khi quý khách hàng đang sử dụng Hệ thống của chúng tôi, chẳng hạn như vị trí địa lý, địa chỉ IP, tùy chọn tìm kiếm cũng như các dữ liệu liên quan đến việc sử dụng Internet chung khác;\n\nc) Vị trí địa lý: khi được sự đồng ý của quý khách hàng, chúng tôi có thể thu thập Dữ liệu cá nhân của quý khách hàng  về vị trí thực tế của quý khách hàng để cung cấp cho quý khách hàng các ưu đãi ở các vị trí liên quan được cung cấp trên Hệ thống của chúng tôi. Chúng tôi cũng có thể lấy được vị trí gần đúng của quý khách hàng từ địa chỉ IP và GPS của quý khách hàng;\n\nd) Thông tin nhật ký: khi quý khách hàng đang sử dụng Hệ thống của chúng tôi, chúng tôi có thể thu thập dữ liệu của quý khách hàng mà chúng tôi gọi là \"thông tin nhật ký\". Thông tin nhật ký vẫn có thể được thu thập ngay cả khi quý khách hàng không tạo bất kỳ tài khoản nào trên Hệ thống của chúng tôi. Thông tin nhật ký này có thể bao gồm địa chỉ IP, loại trình duyệt, hệ điều hành, quốc tịch, vị trí truy cập trang, nhà cung cấp dịch vụ di động, thông tin thiết bị và lịch sử tìm kiếm cũng như thông tin liên quan đến việc sử dụng internet chung khác. Chúng tôi sử dụng thông tin nhật ký để cung cấp cho người dùng trải nghiệm tốt hơn khi sử dụng Hệ thống của chúng tôi;\n\ne) Cookies và các công nghệ tương tự: chúng tôi có thể sử dụng cookie và/hoặc các công nghệ tương tự (như tập tin chỉ báo-web beacons, thẻ-tags, tập lệnh-scripts). Cookies là một phần nhỏ dữ liệu được lưu trữ trong máy tính hoặc thiết bị di động của quý khách hàng để giúp chúng tôi theo dõi quý khách hàng. Giống như các trang web khác, chúng tôi có thể sử dụng cookies để cung cấp cho quý khách hàng trải nghiệm tốt hơn, vì vậy máy tính và/hoặc thiết bị di động của quý khách hàng sẽ nhận ra quý khách hàng khi quý khách hàng sử dụng Hệ thống của Chúng tôi sau đó. Vui lòng hủy tùy chọn cookies, nếu quý khách hàng muốn chúng tôi dừng tính năng cookies.\n\n2. Mục đích sử dụng thông tin: Chúng tôi sẽ nhận thông tin dữ liệu cá nhân khi khách hàng cài đặt và sử dụng. Khi được sự đồng ý của quý khách hàng, Chúng tôi có thể sử dụng thông tin của quý khách hàng được thu thập thông qua Hệ thống cho các mục đích sau:\n\na) Đăng ký sử dụng và/hoặc truy cập hệ thống;\n\nb) Quản lý, vận hành, quản trị và/hoặc truy cập hệ thống;\n\nc) Liên hệ với quý khách hàng về các vấn đề liên quan đến việc quý khách hàng sử dụng và/hoặc truy cập vào Hệ thống và quản lý các truy vấn và/hoặc yêu cầu do quý khách hàng gửi qua Hệ thống;\n\nd) Tùy chỉnh trải nghiệm của quý khách hàng khi sử dụng hệ thống và cải thiện trải nghiệm và sự hài lòng của khách hàng;\n\ne)  Thực thi các quy định trong các Điều khoản và Điều kiện của chúng tôi;\n\nf)  Giải quyết tranh chấp, thu tiền thanh toán còn tồn đọng và xử lý sự cố và/hoặc cho các mục đích về tiếp thị như:\n\n- Tiếp thị truyền thống trong đó, bao gồm nhưng không giới hạn, gửi email cho quý khách hàng về các sản phẩm mới, khuyến mại đặc biệt và các cuộc khảo sát hoặc các thông tin khác mà chúng tôi nghĩ quý khách hàng có thể thấy thú vị;\n\n- Tiếp thị kỹ thuật số bao gồm, nhưng không giới hạn truyền thông xã hội, quảng cáo hiển thị, tối ưu hóa công cụ tìm kiếm (\"SEO\"), tiếp thị qua công cụ tìm kiếm (\"SEM\"), thông báo đẩy (Push Notification) bằng cách sử dụng các kỹ thuật đồ thị mở.\n\n3. Chia sẻ Dữ liệu cá nhân: Tùy thuộc vào từng trường hợp cụ thể phải cung cấp thông tin cho những người hoặc các tổ chức có thể được tiếp cận, FUTA Bus Lines có thể tiết lộ Dữ liệu cá nhân của quý khách hàng với các điều kiện sau:\n\na) Cung cấp thông tin khi có sự chấp thuận: Chúng tôi chỉ chia sẻ Dữ liệu cá nhân của quý khách hàng với Bên thứ ba khi Chúng tôi nhận được sự chấp thuận của quý khách hàng cho phép Chúng tôi làm như vậy. Chúng tôi sẽ cần sự chấp thuận của quý khách hàng để chia sẻ bất kỳ Dữ liệu cá nhân nhạy cảm nào, theo yêu cầu của luật pháp và quy định hiện hành. Khi nhấp chọn nút \"Đồng ý\", quý khách hàng đã thiết lập một hành động khẳng định rõ ràng và một thỏa thuận tự nguyện, cụ thể, đã hiểu rõ và không mơ hồ về việc xử lý Dữ liệu cá nhân. Điều này có thể bao gồm cả việc chia sẻ Dữ liệu cá nhân đã thu thập cho Bên thứ ba;\n\nb) Cung cấp thông tin vì lý do pháp lý: Chúng tôi có thể có toàn quyền quyết định về việc chia sẻ Dữ liệu cá nhân của quý khách hàng với Bên thứ ba nếu chúng tôi cho rằng việc chia sẻ dữ liệu là cần thiết để:\n\n- Tuân thủ luật pháp và quy định hiện hành;\n\n- Thực thi các Điều khoản và Điều kiện của Chúng tôi;\n\n- Điều tra bất kỳ hành vi gian lận hoặc hành vi bất hợp pháp nào;\n\n- Bảo vệ thương hiệu, uy tín cũng như tài sản của Chúng tôi.\n\n4. Bảo mật dữ liệu cá nhân\n\na) Cam kết bảo mật:\n\n- Chúng tôi nỗ lực đảm bảo cung cấp thông tin có trách nhiệm và hệ thống hoạt động chính xác;\n\n- FUTA Bus Lines mong muốn mang lại cảm giác an toàn cho khách hàng khi sử dụng dịch vụ mua vé xe online. Chúng tôi cam kết bảo vệ tất cả thông tin mà Chúng tôi nhận được từ khách hàng. Để ngăn chặn truy cập trái phép, đảm bảo sử dụng đúng thông tin, Chúng tôi sẽ sử dụng các phương pháp và công nghệ bảo mật Internet hợp lý.\n\nb) An toàn dữ liệu: Chúng tôi đã và đang thực hiện nhiều biện pháp an toàn, bao gồm:\n\n- Chúng tôi lưu trữ không tin cá nhân khách hàng trong môi trường vận hành an toàn. Chỉ có nhân viên, đại diện và nhà cung cấp mới có thể truy cập khi cần phải biết;\n\n-  Chúng tôi tuân theo các tiêu chuẩn ngành, pháp luật trong việc bảo mật thông tin cá nhân khách hàng.\n\n5. Lưu trữ Dữ liệu cá nhân\n\na) Miễn là thông tin của quý khách hàng vẫn còn tồn tại, chúng tôi sẽ lưu Dữ liệu cá nhân của quý khách hàng để cung cấp các dịch vụ khi cần. Chúng tôi sẽ ngừng lưu trữ Dữ liệu cá nhân hoặc với nỗ lực hợp lý để xóa các phương tiện có liên quan đến Dữ liệu cá nhân của Quý khách hàng, ngay khi:\n\n- Mục đích thu thập Dữ liệu cá nhân không còn phù hợp với việc lưu trữ dữ liệu;\n\n- Khách hàng yêu cầu hủy bỏ.\n\nb) Thời gian lưu trữ dữ liệu bắt đầu từ khi FUTA BUSLINES nhận được yêu cầu lưu trữ dữ liệu đến khi kết thúc yêu cầu. Thời gian lưu trữ tối thiểu là 24 tháng.\n\n6. Quyền của khách hàng đối với Dữ liệu cá nhân: Quý khách hàng có quyền cập nhật, thay đổi hoặc hủy bỏ Dữ liệu cá nhân bất kỳ lúc nào. Trong các tình huống cần lưu ý dưới đây:\n\na) Phương thức truy cập hoặc chỉnh sửa Dữ liệu cá nhân: Khi quý khách hàng cung cấp cho Chúng tôi Dữ liệu cá nhân của quý khách hàng, vui lòng đảm bảo rằng những dữ liệu đó là chính xác và đầy đủ. Nếu quý khách hàng tin rằng bất kỳ thông tin nào mà Chúng tôi đang nắm giữ có sai sót hoặc thiếu sót, vui lòng đăng nhập vào tài khoản của quý khách hàng trên Hệ thống và sửa lại thông tin. Ngoài ra, quý khách hàng nên nhanh chóng cập nhật Dữ liệu cá nhân thông qua tài khoản nếu có bất kỳ thay đổi nào;\n\nb) Rút lại sự chấp thuận: Quý khách hàng có thể rút lại sự chấp thuận đối với việc thu thập, sử dụng hoặc tiết lộ Dữ liệu cá nhân của Chúng tôi bằng cách gửi thông báo hợp lý cho Chúng tôi theo thông tin liên hệ trình bày bên dưới. Theo yêu cầu của quý khách hàng, Chúng tôi sẽ ngừng thu thập, sử dụng hoặc tiết lộ Dữ liệu cá nhân của quý khách hàng, trừ khi pháp luật yêu cầu hoặc nếu Chúng tôi có các mục đích kinh doanh hoặc pháp lý hợp pháp để giữ lại dữ liệu đó;\n\nLưu ý: khi Quý khách hàng rút lại sự đồng thuận đối với việc thu thập, sử dụng hoặc tiết lộ Dữ liệu cá nhân sẽ khiến Chúng tôi không thể tiếp tục cung cấp cho quý khách hàng các dịch vụ của Chúng tôi và quý khách hàng đồng ý rằng Chúng tôi sẽ không chịu trách nhiệm với quý khách hàng về bất kỳ tổn thất hoặc thiệt hại nào phát sinh từ hoặc liên quan đến việc chấm dứt dịch vụ như vậy.\n\nc) Xóa Dữ liệu cá nhân: Quý khách hàng có thể yêu cầu xóa Dữ liệu cá nhân của quý khách hàng do Chúng tôi thu thập và xử lý, bằng cách gửi cho Chúng tôi một lý do hợp lý và thông báo cho Chúng tôi theo thông tin liên hệ của Chúng tôi được trình bày bên dưới.\n\n7. Đăng ký và quyền thành viên: Hệ thống này cho phép quý khách hàng tạo tài khoản người dùng dựa trên dữ liệu quý khách hàng cung cấp. Bằng cách cung cấp dữ liệu, đăng ký và tạo tài khoản của quý khách hàng, quý khách hàng đảm bảo rằng:\n\na) Quý khách hàng đã đủ 18 tuổi;\n\nb) Thông tin về quý khách hàng là đúng và chính xác, ở thời điểm hiện tại và đầy đủ theo yêu cầu trong mẫu đăng ký trên Hệ thống \"Dữ liệu đăng ký\" và Quý khách hàng sẽ cập nhật Dữ liệu đăng ký này để duy trì tính chính xác và đầy đủ.\n\nThông tin liên hệ của FUTA Bus Lines: Nếu quý khách hàng có bất kỳ câu hỏi hoặc yêu cầu nào liên quan đến Chính sách Bảo mật này, vui lòng liên hệ với Chúng tôi qua: hotro@futabus.vn hoặc gọi đến số điện thoại 1900 6067.',NULL),(8,'Giá vé dịp Lễ,Tết sẽ có sự thay đổi như thế nào?','Giá vé xe của Công ty vào dịp Lễ, Tết sẽ thay đổi theo quy định của Sở Kế hoạch và Đầu tư.',NULL),(9,'Tôi đã mua vé thành công, tuy nhiên tôi đã vô tình xóa thông tin xác nhận được gửi qua email/sms. Tôi phải làm gì?','Anh/Chị vui lòng liên hệ trực tiếp trung tâm tổng đài 19006067 gặp BP Online để được hỗ trợ hướng dẫn thêm.',NULL),(10,'Tôi là khách hàng thường xuyên, có nhu cầu đi lại giữa các tỉnh khác nhiều, vậy có ưu đãi gì không?','Hiện tại Công ty thường có những chương trình ưu đãi khi khách hàng mua vé xe qua các ứng dụng app có liên kết với Công ty (app Momo , Zalo, VN Pay,..).\n\nCác thông tin của chương trinh khuyến mã sẽ luôn được cập nhật tại website hoặc fanpage của Công ty.',NULL),(11,'Tôi đã mua vé thành công, làm sao để tôi có thể kiểm tra lại thông tin chuyến đi đã mua?','Để kiểm tra thông tin vé đã đặt:\n\n1. Trường hợp đặt vé online trên Website, vui lòng kiểm tra tin nhắn xác nhận được gửi về số điện thoại đặt vé hoặc qua email.\n\n2. Trường hợp đặt vé online trên App FUTA, vui lòng kiểm tra mục lịch sử mua vé trên App hoặc qua email.\n\n3. Trường hợp đặt vé online trên App liên kết với Công ty, vui lòng kiểm tra thông tin được hiển thị ngay trên app.\n\n4. Trường hợp đặt vé qua tổng đài, vui lòng kiểm tra tin nhắn xác nhận từ Zalo của Phương Trang Futa Buslines.',NULL),(12,'Giá vé được hiển thị trên website của các chuyến đi đã bao gồm những phí gì?','Giá vé xe của Công ty đã bao gốm thuế VAT, phí bảo hiểm du lịch và không phát sinh thêm phụ phí.',NULL),(13,'Khách hàng có thể biết được khi chuyến xe đã mua có sự thay đổi (giờ xe khởi hành/..v..v) ?','Công ty sẽ chủ động liên hệ khách hàng để thông tin/thông báo về sự việc thay đổi chuyến đi của khách cũng như hướng khắc phục, giải quyết thỏa đáng trong điều kiện nhanh nhất có thể.',NULL),(14,'Trường hợp mua vé bằng hình thức online, có thể thanh toán bằng hình thức nào?','Thanh toán thẻ VISA/MASTER card,\n\nThẻ ATM nội địa (có đăng ký thanh toán trực tuyến và internet banking),\n\nVí điện tử (Momo, Zalo, Shopee, VN PAY), ví FUTA PAY.',NULL),(15,'Chính sách mua vé trẻ em','Chính sách mua vé dành cho trẻ em như thế nào?\nTheo quy định của Công ty:\n\nTrẻ em từ 6 tuối trở lên: Vé tương đương với giá vé người lớn thông thường.\n\nTrẻ em dưới 6 tuổi, chiều cao dưới 1.3m, cân nặng dưới 30kg: Có thể đi kèm với người lớn ( 1 người lớn chỉ được kèm 1 trẻ).',NULL),(16,'Tôi có thể mua vé của FUTA Bus Lines bằng các hình thức nào?','Mua vé trực tiếp tại các văn phòng vé Phương Trang.\n\nMua vé qua hình thức webiste/app FUTA/app liên kết với Công ty\n\nĐăng ký vé giữ chỗ qua Trung Tâm Tổng Đài -Thanh toán trực tuyến bằng hình thức QR code',NULL),(17,'Trong trường hợp tôi có nhu cầu cần hủy vé, tôi phải làm gì?','Trong trường hợp Anh/Chị có nhu cầu hủy vé:\n\n1. Trường hợp đã mua vé giấy/mua vé trực tiếp tại văn phòng vé: Vui lòng mang đầy đủ liên vé đến quầy hủy trực tiếp.\n\n2. Trường hợp mua vé Online (qua hình thức website, các app liên kết khác): Vui lòng mang mã code vé (hoặc liên vé nếu đã đổi ra vé giấy) + CMND trùng tên vé đến quầy hủy trực tiếp.\n\n# Thời gian hủy vé: Từ 1 - 3 vé: trước ít nhất 4 tiếng giờ khởi hành.\n\nTừ 4 - 9 vé: trước ít nhất 24 tiếng giờ khởi hành.\n\nTừ 10 vé trở lên: trước ít nhất 48 tiếng giờ khởi hành.\n\n# Lưu ý: * Phí hủy áp dụng:\n\n+ Trước ít nhất 4 tiếng giờ khởi hành: 10%/vé.\n\n+ Trước ít nhất 30 phút giờ khởi hành: 30%/vé\n\n+ Sau 30 phút: Không hỗ trợ hủy\n\n3. trường hợp mua vé Online (qua hình thức app FUTA): Vui lòng truy cập App, chọn mục \"Lịch sử\" (được thể hiện ở phía dưới màn hình, cùng vị trí ngang với mục \"Trang chủ\") chọn vé cần hủy => bấm hủy.\n\n# Lưu ý:\n\n--Hủy vé trên ứng dụng FUTA sẽ hủy đồng loạt tất cả các vé trên cùng 1 mã vé, không thể tách riêng.\n\n--Từ 1-3 vé hủy trước ít nhất 24 tiếng giờ khởi hành, phí hủy 10% (vé ngày thường).\n\n--Tiền hủy vé sẽ được hoàn lại tài khoản thanh toán ban đầu (7-15 ngày tùy vào thời gian làm việc của Ngân hàng).\n\n*Quy định trên sẽ không áp dụng hủy vé nếu vé đã thay đổi (giờ, ngày khởi hành) trước đó.',NULL),(18,'Tôi có thể mang thú cưng (động vật sống) trên xe được không?','Mong Anh/Chị thông cảm theo quy định của Công Ty Phương Trang, chúng tôi không nhận vận chuyển động vật sống/thú cưng trên xe.',NULL),(19,'Sẽ có bất kỳ phụ phí nào ngoài giá vé được hiển thị trên website?','Không có bất kỳ phụ phí nào ngoài tổng số tiền (giá vé) được hiển thị trên website.\n\nTrừ trường hợp hành lý đi kèm với khách vượt quá mức quy định (quá 20kg) thì bắt buộc khách hàng phải thêm phí hàng hóa theo kèm.',NULL),(20,'Tôi có thể hút thuốc, ăn uống (thực phẩm nặng mùi) trên xe được không?','Để đảm bảo sức khỏe và vệ sinh chung, Anh/Chị vui lòng không hút thuốc, không ăn uống (những thực phẩm nặng mùi) trên xe.',NULL),(21,'Dịch vụ đi kèm trên xe khi sử dụng dịch vụ là gì?','Dịch vụ đi kèm, không tính phí bao gồm:\n\nKhăn, nước, dép đi lại khi lên xuống xe giường nằm.\n\nTivi (áp dụng đối với loại xe limousine 34 giường), mền, wifi.\n\nDịch vụ trung chuyển tại các văn phòng tỉnh thành (trong khu vực phạm vi cho phép, nội ô bán kính 8-10km tùy thuộc địa điểm).',NULL),(22,'Ngoài hình thức mua vé qua website thì tôi có thể chọn vị trí chỗ ngồi qua các hình thức mua vé khác không?','Anh/Chị có thể yêu cầu vị trí chỗ ngồi theo nhu cầu cá nhân khi đăng ký vé giữ chỗ qua hotline 19006067.\nAnh/Chị có thể yêu cầu vị trí chỗ ngồi theo nhu cầu cá nhân khi mua vé trực tiếp tại các văn phòng vé.',NULL),(23,'Trường hợp tôi mua vé online, tài khoản cá nhân đã thông báo giao dịch thành công nhưng tôi vẫn chưa nhận được thông tin xác nhận, tôi phải làm gì và liên hệ với bộ phận nào?','Trong trường hợp trên, Anh/Chị vui lòng liên hệ ngay TTTĐ 19006067 gặp Bộ Phận Online hoặc nhắn tin trực tiếp với nhân viên CSKH ngay trên website cung cấp đầy đủ thông tin để được hỗ trợ.',NULL);
/*!40000 ALTER TABLE `business_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_intent`
--

DROP TABLE IF EXISTS `chat_intent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_intent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_intent_employee_employee_id_fk` (`employee_id`),
  CONSTRAINT `chat_intent_employee_employee_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_intent`
--

LOCK TABLES `chat_intent` WRITE;
/*!40000 ALTER TABLE `chat_intent` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_intent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_number` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_pk` (`user_id`),
  CONSTRAINT `customer_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_chunk`
--

DROP TABLE IF EXISTS `document_chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_chunk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `content` text NOT NULL,
  `business_document_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `document_chunk_business_document_id_fk` (`business_document_id`),
  CONSTRAINT `document_chunk_business_document_id_fk` FOREIGN KEY (`business_document_id`) REFERENCES `business_document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_chunk`
--

LOCK TABLES `document_chunk` WRITE;
/*!40000 ALTER TABLE `document_chunk` DISABLE KEYS */;
INSERT INTO `document_chunk` VALUES (29,'08803a2e-b893-4532-8227-a013f263be1a','Quyền Và Nghĩa Vụ Của Khách Hàng\n1.  Được tham khảo những thông tin cơ bản liên quan đến việc chọn và đặt vé như: tên hãng xe, tuyến xe, mã số ghế, phương thức và thời hạn thanh toán.\n\n2.  Thông tin cá nhân của khách hàng trên FUTABUS.VN được FUTABUS.VN cam kết bảo mật tuyệt đối theo chính sách bảo vệ thông tin khách hang của FUTABUS.VN.\n\n- Việc thu thập và sử dụng thông tin của khách hàng chỉ được thực hiện khi có sự đồng ý của khách hàng đó trừ những trường hợp pháp luật có quy định khác.\n\n3. Khách hàng có thể gửi khiếu nại trực tiếp đến bộ phận hỗ trợ khách hàng của FUTABUS.VN. Khi nhận được khiếu nại của hành khách, bộ phận hỗ trợ khách hàng của FUTABUS.VN sẽ chuyển ngay khiếu nại đó đến Hãng xe bằng các phương thức nhanh nhất và yêu cầu giải quyết.\n\n4. Khách hàng cần phải thường xuyên đọc và tuân theo các Chính sách và Quy định đang được đăng trên FUTABUS.VN để có thể hiểu và thực hiện được các Chính sách và Quy định tại thời điểm đó.\n\n5. Khách hàng đồng ý không truy cập (hoặc cố truy cập) bất kỳ các dịch vụ nào bằng bất kỳ các phương tiện nào khác ngoài giao diện được cung cấp bởi FUTABUS.VN.\n\n6. Khách hàng đồng ý rằng sẽ không tiến hành bất kỳ hoạt động nào quấy nhiễu hoặc phá các dịch vụ.\n\n7. Quý khách vui lòng có mặt tại bến xuất phát của xe trước ít nhất 30 phút giờ xe khởi hành, mang theo thông báo đã thanh toán vé thành công có chứa mã vé được gửi từ hệ thống FUTA BUS LINE.\n\n8.  Thông tin hành khách phải chính xác, nếu không sẽ không thể lên xe hoặc hủy/đổi vé.\n\n9. Mọi trường hợp có hành vi gian lận , hack , phá hoại hệ thống , ... Chúng tôi sẽ không giải quyết và sẽ chuyển cơ quan chức năng xử lý theo pháp luật.\n\n10.',3),(30,'0d2106a7-086f-42d2-8529-f2ba6dff0da6','Nếu quý khách có nhu cầu trung chuyển, vui lòng liên hệ số điện thoại 1900 6918 trước khi đặt vé . Chúng tôi sẽ không đón / trung chuyển tại những địa điểm xe trung chuyển không thể tới được !\n\n11. Thí sinh đi thi đại học vui lòng mang theo CMND và GIẤY BÁO THI. Mọi trường hợp gian lận mua vé không phải thí sinh công ty Phương Trang sẽ KHÔNG chịu trách nhiệm cung cấp vé và hoàn trả tiền.',3),(31,'3ce1ce86-4ddf-4380-bd2b-36cb571df768','Tôi có đăng ký vé thành công nhưng tôi không đến bến xe/văn phòng đúng giờ hẹn. Tôi có thể được hỗ trợ sang chuyến đi tiếp theo không?\nTrong trường hợp Anh/Chị đến trễ so với chuyến đi đã đăng ký trước đó:\n\nĐối với vé đã thanh toán: Liên hệ trực tiếp với nhân viên tại bến xe/văn phòng vé để được hướng dẫn hỗ trợ.\n\nĐối với vé chưa thanh toán: Anh/Chị có thể đăng ký lại vé khác cho chuyến đi tiếp theo tùy theo thời điểm Anh/Chị có mặt tại bến xe/văn phòng vé.',4),(32,'c4f26bf8-daf7-42e3-8322-5cffd632101e','Tôi đặt vé qua TTTĐ (Trung tâm tổng đài), có thể thanh toán vé bằng hình thức nào?\nThanh toán trực tiếp bằng tiền mặt tại văn phòng vé.\n\nThanh toán trực tuyến qua QR code được gửi tự động về ZALO cá nhân. (Các hình thức như: Thanh toán thẻ VISA/MASTER card, thẻ ATM nội địa (có đăng ký thanh toán trực tuyến và internet banking), ví điện tử (Momo, Zalo, Shopee, VN PAY), ví FUTA PAY.',5),(33,'4a5b1fac-ce2a-4a7c-a0f4-efdd028287b2','Tôi mua vé qua hình thức Online (website/app) nhưng lại nhập sai thông tin cá nhân (SĐT, họ tên,..) và đã đặt nhầm ngày, tôi phải làm gì?\nAnh/Chị vui lòng liên hệ trực tiếp TTTĐ 19006067 gặp BP Online để được hỗ trợ hướng dẫn thêm.\n\nTrường hợp vé online đã thanh toán thành công, Công ty sẽ hỗ trợ chuyển đổi vé 1 lần duy nhất, điều kiện: cùng tuyến đường đi và cùng giá vé và tuyến xe cần chuyển còn trống vé, vé hoàn toàn chưa thay đổi trước đó và vé sau khi thay đổi Công ty không hỗ trợ chuyển đổi lần 2 hoặc hủy vé. (thông tin có hiển thị tại mục \"Điều khoản & Lưu ý\" khi Anh/Chị thao tác mua vé).',6),(34,'93b534f4-a327-47bf-a125-2de8bd9b3a56','ĐIỀU KHOẢN ĐẶT VÉ TRỰC TUYẾN\nI. ĐIỀU KHOẢN VÀ QUY ĐỊNH CHUNG\nĐiều 1. Giải thích từ ngữ và từ viết tắt\n1. “Biểu phí”: là các loại phí thuế theo quy định của Hãng vận tải và Nhà chức trách;\n\n2. “Bến xe ô tô khách”: là công trình thuộc kết cấu hạ tầng giao thông đường bộ thực hiện chức năng phục vụ xe ô tô đón, trả hành khách và các dịch vụ hỗ trợ vận tải hành khách;\n\n3.  “Chúng tôi”: là Công Ty Cổ Phần Xe Khách Phương Trang FUTA Bus Lines;\n\n4. “Điểm đón/trả”: là điểm khởi hành và điểm đến theo lịch trong hành trình của khách hàng;\n\n5. “Điều kiện bất khả kháng”: là sự kiện xảy ra mang tính khách quan và nằm ngoài tầm kiểm soát của các bên bao gồm, nhưng không giới hạn đến động đất, bão, lũ lụt, lốc, sóng thần, lở đất, hỏa hoạn, chiến tranh hoặc có nguy cơ xảy ra chiến tranh, bạo động, nổi loạn, đình công… và các thảm họa khác chưa lường hết được, sự thay đổi chính sách hoặc ngăn cấm của cơ quan có thẩm quyền của Việt Nam;\n\n6. “Điều kiện vận chuyển”: là các yêu cầu, nội dung của FUTA thông báo đến hành khách liên quan đến các dịch vụ vận chuyển, bao gồm các thông tin được thể hiện trên vé/phiếu xác nhận hành trình và/hoặc trên website, ứng dụng và/hoặc trong điều khoản sử dụng đã được phê duyệt và/hoặc các hình thức công bố khác;\n\n7. “Hành khách”: là bất kỳ cá nhân nào sử dụng dịch vụ của FUTA;\n\n8. “Hành lý”: là những vật phẩm, đồ dùng tư trang và tài sản cá nhân của hành khách mang theo, sử dụng trong chuyến đi của mình, trừ khi được quy định khác đi;\n\n9. “Hợp đồng vận chuyển”: là các thỏa thuận của Hãng vận chuyển và hành khách trong việc cung cấp các dịch vụ theo nhu cầu của hành khách được thể hiện bằng vé hoặc hình thức khác có giá trị tương đương với vé;\n\n10.',7),(35,'5dd26345-d7dd-4021-b594-e24d9b799f25','“Hóa đơn điện tử”: hóa đơn có mã hoặc không có mã của cơ quan thuế được thể hiện ở dạng dữ liệu điện tử do FUTA cung cấp dịch vụ, lập bằng phương tiện điện tử để ghi nhận thông tin, cung cấp dịch vụ theo quy định của pháp luật về kế toán, pháp luật về thuế;\n\n11. “Mã tra cứu”: là mã số bao gồm 9 ký tự được hiển thị trong thông tin mua vé,  dùng cho việc tra cứu hóa đơn điện tử sau khi khách hàng thanh toán thành công;\n\n12. “Mã đặt vé”: là các thông tin chi tiết của Hành khách đã được nhập vào hệ thống đặt giữ chỗ của Chúng tôi thông qua website/hoặc ứng dụng FUTA, Phòng vé, Đại lý, Tổng đài;\n\n13. “Ngày”: có nghĩa là các ngày dương lịch, bao gồm bảy (07) ngày trong tuần; với điều kiện là khi dùng trong việc gửi thông báo thì ngày gửi thông báo đi không được tính và khi dùng cho mục đích xác định;\n\n14.  “Thông tin cá nhân”: Hành khách chấp nhận rằng thông tin cá nhân của hành khách được chuyển cho FUTA vì mục đích sử dụng dịch vụ do FUTA cung cấp. Vì mục đích trên, hành khách đồng ý cho phép FUTA lưu trữ và sử dụng các thông tin cá nhân và chuyển tải các thông tin đó tới hãng vận chuyển, các đại diện ủy quyền phát hành vé, cơ quan nhà nước có thẩm quyền, hoặc các nhà cung cấp dịch vụ liên quan khác;\n\n15. “Thẻ lên xe (vé)”: là bằng chứng xác nhận hợp đồng vận chuyển hành khách và FUTA Bus Lines. Có giá trị đối với hành khách có tên và hành trình được ghi rõ trong vé. Vé có thể được chuyển, hủy theo quy định của FUTA Bus Lines.\n\n16. “ZNS”: là dịch vụ gửi thông báo chăm sóc khách hàng trên Zalo.\n\n17. Đề mục hoặc tiêu đề của mỗi điều của Điều lệ vận chuyển này chỉ được sử dụng cho mục đích thuận tiện tra cứu và không được sử dụng để giải thích nội dung của điều khoản đó.\n\nĐiều 2. Quy định đặt vé trực tuyến\n1.',7),(36,'283de759-fde5-45f0-928d-bf7c1fc633b1','Phạm vi áp dụng: Chương trình thanh toán online được áp dụng cho các chuyến xe nhất định của FUTA Bus Lines. Thành viên của FUTA Bus Lines cũng như khách vãng lai thực hiện được hình thức thanh toán này. Việc đăng ký tham gia Thành viên FUTA Bus Lines là hoàn toàn miễn phí.\n\n2. Đặt chỗ\n\na) Quý khách kiểm tra cẩn thận các thông tin vé trước khi tiến hành xác nhận đặt vé và thanh toán. Bằng việc thanh toán qua website này, Quý khách chấp nhận giờ khởi hành, vị trí ghế ngồi v.v mà Quý khách đã đặt. Quý khách đồng ý rằng, trong những trường hợp có sự thay đổi về chuyến đi hoặc bất khả kháng, chúng tôi có quyền hoàn trả lại bất kỳ vé nào từ việc mua bán qua website này hoặc thực hiện việc chuyển vé cho Quý khách qua chuyến khác theo yêu cầu của Quý khách trong trường hợp chúng tôi còn chỗ;\n\nb) Đặt chỗ chỉ được xác nhận sau khi việc thanh toán tiền vé đã hoàn tất đồng thời FUTA cung cấp cho Hành khách Mã đặt vé xác định tên Hành khách, hành trình, giờ khởi hành, số ghế, giá vé;\n\nc) Chúng tôi sẽ không chịu trách nhiệm về bất kỳ tổn thất nào mà Hành khách có thể phải chịu từ việc đặt chỗ  thông qua bất kỳ tổ chức/cá nhân nào không phải là Chúng tôi hoặc Bên thứ ba được ủy quyền của Chúng tôi.\n\n3. Xác nhận thanh toán: Sau khi hoàn thành việc thanh toán vé trực tuyến, Quý khách sẽ nhận được thư xác nhận thông tin chi tiết vé đã đặt thông qua địa chỉ thư điện tử (email) mà Quý khách đã cung cấp. Đồng thời, chúng tôi cũng sẽ gửi tin nhắn (SMS) hoặc ZNS qua Zalo thông báo mã giao dịch tới số điện thoại Quý khách đăng ký.\n\nLưu ý:\n\na) Chúng tôi không chịu trách nhiệm trong trường hợp Quý khách nhập sai địa chỉ email, số điện thoại và thông tin cá nhân khác dẫn đến không nhận được thư xác nhận.',7),(37,'8c313903-74ae-4ec6-8b45-1f6dab510349','Vì vậy Quý khách vui lòng kiểm tra lại chính xác các thông tin trước khi thực hiện thanh toán. Với email, SMS và ZNS chỉ có tính chất xác nhận thông tin vé sau khi Quý khách đã đặt vé thành công;\n\nb) Chúng tôi đề nghị Quý khách đọc kỹ các thông tin về chuyến đi, giờ khởi hành và chỗ ngồi v.v. trước khi hoàn tất việc xác nhận tất cả các thông tin về vé;\n\nc) Email xác nhận thông tin đặt vé có thể đi vào hộp thư rác (spam mail) của Quý khách, vì vậy hãy kiểm tra trước khi liên lạc với chúng tôi;\n\nd) Sau 30 phút kể từ khi Quý khách thanh toán thành công mà vẫn chưa nhận được bất kỳ xác nhận nào (qua email hoặc SMS/ ZNS), Quý khách vui lòng liên hệ chúng tôi qua tổng đài 1900 6067 để được hỗ trợ. Nếu Quý khách không liên hệ lại coi như FUTA Bus Lines đã hoàn thành nghĩa vụ với Quý khách.\n\n4. Bảo đảm an toàn giao dịch\n\na) Quản lý thông tin nhà cung cấp dịch vụ: FUTA Bus Lines (hoặc bên thứ ba - nhà cung cấp cổng thanh toán điện tử, hoặc/và các bên ký kết khác) sẽ sử dụng các công nghệ đặc biệt để nhận biết các hoạt động giả mạo trên trang mạng như: sử dụng thẻ tín dụng giả v.v. Sự chấp nhận hợp tác của Quý khách cùng với nỗ lực của FUTA Bus Lines là rất cần thiết. Quý khách chấp nhận rằng FUTA Bus Lines có thể chấm dứt quyền truy cập và sử dụng trang mạng của FUTA Bus Lines nếu Quý khách hoặc người khác hành động nhân danh Quý khách vì lý do nào đó nằm trong diện nghi vấn có gian lận hoặc vi phạm các điều khoản này;\n\nb) Kiểm soát giao dịch và thông tin phản hồi khách hàng: FUTA Bus Lines sẽ hết sức cố gắng sử dụng mọi biện pháp và tuân theo mọi cách thức có thể để giữ an toàn cho tất cả các thông tin cá nhân của Quý khách, và chúng tôi cũng sẽ thường xuyên cập nhật những thông tin chính xác nhất.',7),(38,'d98c2993-04ac-4f18-ba84-4ad71bd31228','Website này có những công nghệ an ninh đảm bảo việc bảo vệ các thông tin bị thất lạc, lạm dụng hoặc thay đổi. Tất cả các giao dịch và thông tin về thẻ được sử dụng đều được đảm bảo an toàn cho các giao dịch kinh tế ngày nay. Mặc dù vậy, không phải tất cả các dữ liệu truyền qua Internet đều có thể đảm bảo 100%, vì thế chúng tôi không thể đưa ra một sự đảm bảo tuyệt đối rằng mọi thông tin Quý khách cung cấp đều được bảo vệ tất cả mọi lúc.\n\n5. Thông tin cá nhân\n\na) Thông tin cá nhân của Quý khách mà chúng tôi có được trong quá trình giao dịch chỉ dùng vào các mục đích sau:\n\n- Hỗ trợ và giải đáp các thắc mắc của Quý khách;\n\n- Cập nhật các thông tin mới nhất về các chương trình, dịch vụ v.v. của FUTA Bus Lines đến Quý khách.\n\nb) Chúng tôi thu thập và sử dụng thông tin cá nhân của Quý khách phù hợp với mục đích đã nêu bên trên và hoàn toàn tuân thủ nội dung của “Chính sách bảo mật”. Chúng tôi cam kết chỉ sử dụng cho mục đích và phạm vi đã nêu và không tiết lộ cho bất kỳ bên thứ ba nào khi chưa có sự đồng ý bằng văn bản của Quý khách;\n\nc) Xin lưu ý chúng tôi được quyền cung cấp thông tin cá nhân của Quý khách trong trường hợp khi có yêu cầu từ các cơ quan Nhà nước có thẩm quyền.\n\n6. Chính sách hoàn/hủy/đổi vé\n\na) Quy định hoàn trả tiền mua vé Online do lỗi giao dịch\n\n- Các trường hợp hoàn trả tiền mua vé online cho khách do lỗi giao dịch:\n\n- Khách hàng mua vé online giao dịch không thành công (lỗi giao dịch) chưa có Mã đặt vé (code) nhưng đã bị trừ tiền;',7),(39,'2452f3d4-a33a-4d5f-956d-d4db7a48df01','- Hiện nay, có một số Thẻ ATM của khách hàng (Thẻ ATM cũ được làm từ 3-4 năm trước) chỉ thực hiện được hình thức chuyển khoản không có chức năng thanh toán trực tuyến nên khi khách hàng thực hiện giao dịch chuyển khoản vào cuối tuần hoặc vào ngày Lễ, Tết, hệ thống ngân hàng không xác nhận tiền trong tài khoản của FUTA Bus Lines nên khách hàng phải thanh toán trực tiếp tại quầy vé (Khách hàng vừa bị trừ tiền trong tài khoản vừa phải ra quầy vé thanh toán tiền mặt lấy vé).\n\nb) Thời gian hoàn trả tiền cho khách hàng\n\n- Đối với Bộ phận Tổng đài: Thời gian hoàn trả tiền tới tài khoản khách hàng là từ 03 ngày đến 05 ngày làm việc kể từ khi Ban Tài chính – Kế toán nhận chứng từ thanh toán;\n\n- Đối với các quầy vé: Giao dịch trực tiếp với khách hàng và hoàn trả ngay thời điểm giao dịch.\n\n- Đối với hoàn trả tiền mua vé qua App: Thời gian theo chính sách của từng nhà phát triển App\n\nc) Quy định thay đổi hoặc hủy vé\n\n- Chỉ được chuyển đổi vé 1 lần duy nhất\n\n- Chi phí hủy vé từ 10% – 30% giá vé tùy thuộc thời gian hủy vé so với giờ khởi hành ghi trên vé và số lượng vé cá nhân/tập thể áp dụng theo các quy định hiện hành.\n\n- Quý khách khi có nhu cầu muốn thay đổi hoặc hủy vé đã thanh toán, cần liên hệ với Trung tâm tổng đài 1900 6067 hoặc quầy vé chậm nhất trước 24h so với giờ xe khởi hành được ghi trên vé, trên email hoặc tin nhắn để được hướng dẫn thêm.\n\n7. Kênh bán vé\n\na) FUTA Bus Lines khuyến cáo Quý khách mua vé lựa chọn một trong các phương thức mua vé bao gồm mua trực tiếp tại website, app, phòng vé chính thức hoặc mua vé qua Tổng đài 1900 6067 để đảm bảo không mua phải vé giả, vé bị nâng giá v.v.;\n\nb) Nếu phát hiện ra Quý khách gian lận, vi phạm điều khoản sử dụng, có hành vi đầu cơ, mua đi bán lại, bán vé chợ đen.',7),(40,'52968265-780f-4e4e-978e-3b90571e1fc4','FUTA Bus Lines có quyền từ chối cung cấp dịch vụ và không giải quyết các vấn đề phát sinh nếu Quý khách mua vé từ các kênh không thuộc hệ thống bán vé của FUTA Bus Lines.\n\n8. Trung chuyển: Nếu quý khách có nhu cầu trung chuyển, vui lòng liên hệ số điện thoại 1900 6067 trước khi đặt vé. Chúng tôi sẽ không đón/trung chuyển tại những địa điểm xe trung chuyển không thể đến được.\n\nĐiều 3: Quy định vận chuyển\n1. Trẻ em dưới 6 tuổi và phụ nữ có thai\n\na) Trẻ em dưới 6 tuổi, cao từ 1.3m trở xuống, cân nặng dưới 30kg thì không phải mua vé.\n\nb) Phụ nữ có thai cần đảm bảo sức khoẻ trong suốt quá trình di chuyển.\n\n2. Hành lý\n\na) Tổng trọng lượng hành lý không vượt quá 20kg;\n\nb) Đối với hành lý quá khổ, cồng kềnh vui lòng liên hệ Tổng đài 1900 6067\n\n3. Yêu cầu khi lên xe\n\na) Có mặt trước giờ xe khởi hành 30 phút tại Bến đi (đối với ngày lễ tết cần ra trước 60 phút)\n\nb) Xuất trình thông tin vé được gửi qua SMS/Email/Futa App hoặc liên hệ quầy vé để nhận thông tin vé trước khi lên xe.\n\nc) Không mang đồ ăn, thức ăn có mùi lên xe;\n\nd) Không hút thuốc, uống rượu, sử dụng chất kích thích trên xe;\n\ne) Không mang các vật dễ cháy nổ lên xe;\n\nf) Không vứt rác trên xe;\n\ng) Không mang động vật lên xe.\n\nII. CHÍNH SÁCH BẢO MẬT\nĐiều 1. Quy định chung\n1. Nhằm mang lại trải nghiệm tốt nhất cho người dùng trên website của FUTA Bus Lines, thông tin nhận dạng cá nhân hoặc dữ liệu cá nhân của quý khách hàng sẽ được thu thập, sử dụng, tiết lộ, xử lý trong khuôn khổ bảo vệ người dùng;\n\n2. Sau khi đọc Chính sách bảo mật này, quý khách hàng tự quyết định việc chia sẻ dữ liệu cá nhân với chúng tôi. Dữ liệu cá nhân ở đây đề cập đến mọi thông tin liên quan đến một cá nhân có thể định danh/ nhận dạng được.',7),(41,'2c4e82d6-8b9b-4b80-afea-68f97c106ea2','Khi nhấp chọn \"đồng ý\", quý khách hàng thừa nhận rằng quý khách hàng đã đọc, đồng ý và chấp thuận cho chúng tôi thu thập, sử dụng và xử lý Dữ liệu cá nhân theo Chính sách bảo mật này và/hoặc các Điều khoản sử dụng. Đồng thời, quý khách hàng cũng thừa nhận rằng toàn bộ Dữ liệu cá nhân mà quý khách hàng đã cung cấp hoặc sẽ cung cấp là dữ liệu chính chủ, đúng và chính xác.\n\n3.  Tùy từng thời điểm FUTA Bus Lines có thể sửa đổi Chính sách bảo mật này để phản ánh các thay đổi về luật pháp và quy định, thông lệ sử dụng của FUTA Bus Lines, các tính năng Hệ thống và/hoặc các tiến bộ công nghệ. Chúng tôi khuyến khích khách hàng thường xuyên xem lại Chính sách Bảo mật thông tin cá nhân trên FUTA. Cập nhật thông tin liên tục có thể đảm bảo bạn biết và thực hiện tốt quản lý cá nhân.\n\nĐiều 2. Chính sách bảo mật\n1. Thông tin thu thập: Khi được sự đồng ý của quý khách hàng, chúng tôi có thể thu thập Dữ liệu cá nhân của quý khách hàng để cung cấp dịch vụ của chúng tôi cho quý khách hàng khi sử dụng Hệ thống dữ liệu FUTA. Dữ liệu cá nhân bao gồm những thông tin được trình bày như sau:\n\na) Thông tin cá nhân cơ bản: khi quý khách hàng đang sử dụng Hệ thống của chúng tôi, chúng tôi có thể yêu cầu quý khách hàng tạo một tài khoản để tiến hành đặt chỗ. Dữ liệu cá nhân được thu thập sẽ bao gồm, nhưng không giới hạn tên của quý khách hàng, thông tin nhận dạng người dùng và thông tin đăng nhập của FUTA ID, Địa chỉ thư điện tử (email), số điện thoại, địa chỉ và phương thức thanh toán;\n\nb) Thông tin cá nhân cụ thể: chúng tôi có thể thu thập Dữ liệu cá nhân của quý khách hàng dựa trên quá trình quý khách hàng sử dụng Hệ thống của chúng tôi, ví dụ: chi tiết về quyền thành viên thường xuyên cũng như những đánh giá của quý khách hàng.',7),(42,'9881e112-b5dc-4f52-8b5d-a472c08c9b7c','Chúng tôi cũng có thể thu thập một số thông tin nhất định từ quý khách hàng khi quý khách hàng đang sử dụng Hệ thống của chúng tôi, chẳng hạn như vị trí địa lý, địa chỉ IP, tùy chọn tìm kiếm cũng như các dữ liệu liên quan đến việc sử dụng Internet chung khác;\n\nc) Vị trí địa lý: khi được sự đồng ý của quý khách hàng, chúng tôi có thể thu thập Dữ liệu cá nhân của quý khách hàng  về vị trí thực tế của quý khách hàng để cung cấp cho quý khách hàng các ưu đãi ở các vị trí liên quan được cung cấp trên Hệ thống của chúng tôi. Chúng tôi cũng có thể lấy được vị trí gần đúng của quý khách hàng từ địa chỉ IP và GPS của quý khách hàng;\n\nd) Thông tin nhật ký: khi quý khách hàng đang sử dụng Hệ thống của chúng tôi, chúng tôi có thể thu thập dữ liệu của quý khách hàng mà chúng tôi gọi là \"thông tin nhật ký\". Thông tin nhật ký vẫn có thể được thu thập ngay cả khi quý khách hàng không tạo bất kỳ tài khoản nào trên Hệ thống của chúng tôi. Thông tin nhật ký này có thể bao gồm địa chỉ IP, loại trình duyệt, hệ điều hành, quốc tịch, vị trí truy cập trang, nhà cung cấp dịch vụ di động, thông tin thiết bị và lịch sử tìm kiếm cũng như thông tin liên quan đến việc sử dụng internet chung khác. Chúng tôi sử dụng thông tin nhật ký để cung cấp cho người dùng trải nghiệm tốt hơn khi sử dụng Hệ thống của chúng tôi;\n\ne) Cookies và các công nghệ tương tự: chúng tôi có thể sử dụng cookie và/hoặc các công nghệ tương tự (như tập tin chỉ báo-web beacons, thẻ-tags, tập lệnh-scripts). Cookies là một phần nhỏ dữ liệu được lưu trữ trong máy tính hoặc thiết bị di động của quý khách hàng để giúp chúng tôi theo dõi quý khách hàng.',7),(43,'475495c4-220a-43b5-abdb-e2816e1e2de2','Giống như các trang web khác, chúng tôi có thể sử dụng cookies để cung cấp cho quý khách hàng trải nghiệm tốt hơn, vì vậy máy tính và/hoặc thiết bị di động của quý khách hàng sẽ nhận ra quý khách hàng khi quý khách hàng sử dụng Hệ thống của Chúng tôi sau đó. Vui lòng hủy tùy chọn cookies, nếu quý khách hàng muốn chúng tôi dừng tính năng cookies.\n\n2. Mục đích sử dụng thông tin: Chúng tôi sẽ nhận thông tin dữ liệu cá nhân khi khách hàng cài đặt và sử dụng. Khi được sự đồng ý của quý khách hàng, Chúng tôi có thể sử dụng thông tin của quý khách hàng được thu thập thông qua Hệ thống cho các mục đích sau:\n\na) Đăng ký sử dụng và/hoặc truy cập hệ thống;\n\nb) Quản lý, vận hành, quản trị và/hoặc truy cập hệ thống;\n\nc) Liên hệ với quý khách hàng về các vấn đề liên quan đến việc quý khách hàng sử dụng và/hoặc truy cập vào Hệ thống và quản lý các truy vấn và/hoặc yêu cầu do quý khách hàng gửi qua Hệ thống;\n\nd) Tùy chỉnh trải nghiệm của quý khách hàng khi sử dụng hệ thống và cải thiện trải nghiệm và sự hài lòng của khách hàng;\n\ne)  Thực thi các quy định trong các Điều khoản và Điều kiện của chúng tôi;\n\nf)  Giải quyết tranh chấp, thu tiền thanh toán còn tồn đọng và xử lý sự cố và/hoặc cho các mục đích về tiếp thị như:\n\n- Tiếp thị truyền thống trong đó, bao gồm nhưng không giới hạn, gửi email cho quý khách hàng về các sản phẩm mới, khuyến mại đặc biệt và các cuộc khảo sát hoặc các thông tin khác mà chúng tôi nghĩ quý khách hàng có thể thấy thú vị;\n\n- Tiếp thị kỹ thuật số bao gồm, nhưng không giới hạn truyền thông xã hội, quảng cáo hiển thị, tối ưu hóa công cụ tìm kiếm (\"SEO\"), tiếp thị qua công cụ tìm kiếm (\"SEM\"), thông báo đẩy (Push Notification) bằng cách sử dụng các kỹ thuật đồ thị mở.\n\n3.',7),(44,'b38f2581-fcb2-459b-8f0c-0ea813835ee2','Chia sẻ Dữ liệu cá nhân: Tùy thuộc vào từng trường hợp cụ thể phải cung cấp thông tin cho những người hoặc các tổ chức có thể được tiếp cận, FUTA Bus Lines có thể tiết lộ Dữ liệu cá nhân của quý khách hàng với các điều kiện sau:\n\na) Cung cấp thông tin khi có sự chấp thuận: Chúng tôi chỉ chia sẻ Dữ liệu cá nhân của quý khách hàng với Bên thứ ba khi Chúng tôi nhận được sự chấp thuận của quý khách hàng cho phép Chúng tôi làm như vậy. Chúng tôi sẽ cần sự chấp thuận của quý khách hàng để chia sẻ bất kỳ Dữ liệu cá nhân nhạy cảm nào, theo yêu cầu của luật pháp và quy định hiện hành. Khi nhấp chọn nút \"Đồng ý\", quý khách hàng đã thiết lập một hành động khẳng định rõ ràng và một thỏa thuận tự nguyện, cụ thể, đã hiểu rõ và không mơ hồ về việc xử lý Dữ liệu cá nhân. Điều này có thể bao gồm cả việc chia sẻ Dữ liệu cá nhân đã thu thập cho Bên thứ ba;\n\nb) Cung cấp thông tin vì lý do pháp lý: Chúng tôi có thể có toàn quyền quyết định về việc chia sẻ Dữ liệu cá nhân của quý khách hàng với Bên thứ ba nếu chúng tôi cho rằng việc chia sẻ dữ liệu là cần thiết để:\n\n- Tuân thủ luật pháp và quy định hiện hành;\n\n- Thực thi các Điều khoản và Điều kiện của Chúng tôi;\n\n- Điều tra bất kỳ hành vi gian lận hoặc hành vi bất hợp pháp nào;\n\n- Bảo vệ thương hiệu, uy tín cũng như tài sản của Chúng tôi.\n\n4. Bảo mật dữ liệu cá nhân\n\na) Cam kết bảo mật:\n\n- Chúng tôi nỗ lực đảm bảo cung cấp thông tin có trách nhiệm và hệ thống hoạt động chính xác;\n\n- FUTA Bus Lines mong muốn mang lại cảm giác an toàn cho khách hàng khi sử dụng dịch vụ mua vé xe online. Chúng tôi cam kết bảo vệ tất cả thông tin mà Chúng tôi nhận được từ khách hàng.',7),(45,'f62072e6-ac6d-4b54-aa28-c423b78c17a8','Để ngăn chặn truy cập trái phép, đảm bảo sử dụng đúng thông tin, Chúng tôi sẽ sử dụng các phương pháp và công nghệ bảo mật Internet hợp lý.\n\nb) An toàn dữ liệu: Chúng tôi đã và đang thực hiện nhiều biện pháp an toàn, bao gồm:\n\n- Chúng tôi lưu trữ không tin cá nhân khách hàng trong môi trường vận hành an toàn. Chỉ có nhân viên, đại diện và nhà cung cấp mới có thể truy cập khi cần phải biết;\n\n-  Chúng tôi tuân theo các tiêu chuẩn ngành, pháp luật trong việc bảo mật thông tin cá nhân khách hàng.\n\n5. Lưu trữ Dữ liệu cá nhân\n\na) Miễn là thông tin của quý khách hàng vẫn còn tồn tại, chúng tôi sẽ lưu Dữ liệu cá nhân của quý khách hàng để cung cấp các dịch vụ khi cần. Chúng tôi sẽ ngừng lưu trữ Dữ liệu cá nhân hoặc với nỗ lực hợp lý để xóa các phương tiện có liên quan đến Dữ liệu cá nhân của Quý khách hàng, ngay khi:\n\n- Mục đích thu thập Dữ liệu cá nhân không còn phù hợp với việc lưu trữ dữ liệu;\n\n- Khách hàng yêu cầu hủy bỏ.\n\nb) Thời gian lưu trữ dữ liệu bắt đầu từ khi FUTA BUSLINES nhận được yêu cầu lưu trữ dữ liệu đến khi kết thúc yêu cầu. Thời gian lưu trữ tối thiểu là 24 tháng.\n\n6. Quyền của khách hàng đối với Dữ liệu cá nhân: Quý khách hàng có quyền cập nhật, thay đổi hoặc hủy bỏ Dữ liệu cá nhân bất kỳ lúc nào. Trong các tình huống cần lưu ý dưới đây:\n\na) Phương thức truy cập hoặc chỉnh sửa Dữ liệu cá nhân: Khi quý khách hàng cung cấp cho Chúng tôi Dữ liệu cá nhân của quý khách hàng, vui lòng đảm bảo rằng những dữ liệu đó là chính xác và đầy đủ. Nếu quý khách hàng tin rằng bất kỳ thông tin nào mà Chúng tôi đang nắm giữ có sai sót hoặc thiếu sót, vui lòng đăng nhập vào tài khoản của quý khách hàng trên Hệ thống và sửa lại thông tin.',7),(46,'5979947e-e799-431a-b36d-313f1251b0f7','Ngoài ra, quý khách hàng nên nhanh chóng cập nhật Dữ liệu cá nhân thông qua tài khoản nếu có bất kỳ thay đổi nào;\n\nb) Rút lại sự chấp thuận: Quý khách hàng có thể rút lại sự chấp thuận đối với việc thu thập, sử dụng hoặc tiết lộ Dữ liệu cá nhân của Chúng tôi bằng cách gửi thông báo hợp lý cho Chúng tôi theo thông tin liên hệ trình bày bên dưới. Theo yêu cầu của quý khách hàng, Chúng tôi sẽ ngừng thu thập, sử dụng hoặc tiết lộ Dữ liệu cá nhân của quý khách hàng, trừ khi pháp luật yêu cầu hoặc nếu Chúng tôi có các mục đích kinh doanh hoặc pháp lý hợp pháp để giữ lại dữ liệu đó;\n\nLưu ý: khi Quý khách hàng rút lại sự đồng thuận đối với việc thu thập, sử dụng hoặc tiết lộ Dữ liệu cá nhân sẽ khiến Chúng tôi không thể tiếp tục cung cấp cho quý khách hàng các dịch vụ của Chúng tôi và quý khách hàng đồng ý rằng Chúng tôi sẽ không chịu trách nhiệm với quý khách hàng về bất kỳ tổn thất hoặc thiệt hại nào phát sinh từ hoặc liên quan đến việc chấm dứt dịch vụ như vậy.\n\nc) Xóa Dữ liệu cá nhân: Quý khách hàng có thể yêu cầu xóa Dữ liệu cá nhân của quý khách hàng do Chúng tôi thu thập và xử lý, bằng cách gửi cho Chúng tôi một lý do hợp lý và thông báo cho Chúng tôi theo thông tin liên hệ của Chúng tôi được trình bày bên dưới.\n\n7. Đăng ký và quyền thành viên: Hệ thống này cho phép quý khách hàng tạo tài khoản người dùng dựa trên dữ liệu quý khách hàng cung cấp. Bằng cách cung cấp dữ liệu, đăng ký và tạo tài khoản của quý khách hàng, quý khách hàng đảm bảo rằng:\n\na) Quý khách hàng đã đủ 18 tuổi;',7),(47,'b21a39e3-f30d-48f7-8b83-206de39dc5f8','b) Thông tin về quý khách hàng là đúng và chính xác, ở thời điểm hiện tại và đầy đủ theo yêu cầu trong mẫu đăng ký trên Hệ thống \"Dữ liệu đăng ký\" và Quý khách hàng sẽ cập nhật Dữ liệu đăng ký này để duy trì tính chính xác và đầy đủ.\n\nThông tin liên hệ của FUTA Bus Lines: Nếu quý khách hàng có bất kỳ câu hỏi hoặc yêu cầu nào liên quan đến Chính sách Bảo mật này, vui lòng liên hệ với Chúng tôi qua: hotro@futabus.vn hoặc gọi đến số điện thoại 1900 6067.',7),(48,'20ff1371-c43e-4f24-beed-5f7f312ff4bb','Giá vé dịp Lễ,Tết sẽ có sự thay đổi như thế nào?\nGiá vé xe của Công ty vào dịp Lễ, Tết sẽ thay đổi theo quy định của Sở Kế hoạch và Đầu tư.',8),(49,'a56b9c63-1ab7-43f8-aab8-ae383da48a5f','Tôi đã mua vé thành công, tuy nhiên tôi đã vô tình xóa thông tin xác nhận được gửi qua email/sms. Tôi phải làm gì?\nAnh/Chị vui lòng liên hệ trực tiếp trung tâm tổng đài 19006067 gặp BP Online để được hỗ trợ hướng dẫn thêm.',9),(50,'1b8d935c-16a8-45ec-a37f-f324adf41e8d','Tôi là khách hàng thường xuyên, có nhu cầu đi lại giữa các tỉnh khác nhiều, vậy có ưu đãi gì không?\nHiện tại Công ty thường có những chương trình ưu đãi khi khách hàng mua vé xe qua các ứng dụng app có liên kết với Công ty (app Momo , Zalo, VN Pay,..).\n\nCác thông tin của chương trinh khuyến mã sẽ luôn được cập nhật tại website hoặc fanpage của Công ty.',10),(51,'8bc3849d-d493-49f5-a683-ea1706ab10cd','Tôi đã mua vé thành công, làm sao để tôi có thể kiểm tra lại thông tin chuyến đi đã mua?\nĐể kiểm tra thông tin vé đã đặt:\n\n1. Trường hợp đặt vé online trên Website, vui lòng kiểm tra tin nhắn xác nhận được gửi về số điện thoại đặt vé hoặc qua email.\n\n2. Trường hợp đặt vé online trên App FUTA, vui lòng kiểm tra mục lịch sử mua vé trên App hoặc qua email.\n\n3. Trường hợp đặt vé online trên App liên kết với Công ty, vui lòng kiểm tra thông tin được hiển thị ngay trên app.\n\n4. Trường hợp đặt vé qua tổng đài, vui lòng kiểm tra tin nhắn xác nhận từ Zalo của Phương Trang Futa Buslines.',11),(52,'88e31056-3ce9-479b-a2cf-d52b0691bd34','Giá vé được hiển thị trên website của các chuyến đi đã bao gồm những phí gì?\nGiá vé xe của Công ty đã bao gốm thuế VAT, phí bảo hiểm du lịch và không phát sinh thêm phụ phí.',12),(53,'f971fd3b-2fd9-452a-9671-47e13cd292b8','Khách hàng có thể biết được khi chuyến xe đã mua có sự thay đổi (giờ xe khởi hành/..v..v) ?\nCông ty sẽ chủ động liên hệ khách hàng để thông tin/thông báo về sự việc thay đổi chuyến đi của khách cũng như hướng khắc phục, giải quyết thỏa đáng trong điều kiện nhanh nhất có thể.',13),(54,'0be5cd40-0a47-4fbc-bfd0-e9c046438c78','Trường hợp mua vé bằng hình thức online, có thể thanh toán bằng hình thức nào?\nThanh toán thẻ VISA/MASTER card,\n\nThẻ ATM nội địa (có đăng ký thanh toán trực tuyến và internet banking),\n\nVí điện tử (Momo, Zalo, Shopee, VN PAY), ví FUTA PAY.',14),(55,'fe1af788-ffac-4fa5-9cea-cf3bb2088aa4','Chính sách mua vé trẻ em\nChính sách mua vé dành cho trẻ em như thế nào?\nTheo quy định của Công ty:\n\nTrẻ em từ 6 tuối trở lên: Vé tương đương với giá vé người lớn thông thường.\n\nTrẻ em dưới 6 tuổi, chiều cao dưới 1.3m, cân nặng dưới 30kg: Có thể đi kèm với người lớn ( 1 người lớn chỉ được kèm 1 trẻ).',15),(56,'52239b45-ac2b-4d0c-8210-ab589e7e81fa','Tôi có thể mua vé của FUTA Bus Lines bằng các hình thức nào?\nMua vé trực tiếp tại các văn phòng vé Phương Trang.\n\nMua vé qua hình thức webiste/app FUTA/app liên kết với Công ty\n\nĐăng ký vé giữ chỗ qua Trung Tâm Tổng Đài -Thanh toán trực tuyến bằng hình thức QR code',16),(57,'7aefd8ef-c1da-4d4a-bf77-1e65038d840f','Trong trường hợp tôi có nhu cầu cần hủy vé, tôi phải làm gì?\nTrong trường hợp Anh/Chị có nhu cầu hủy vé:\n\n1. Trường hợp đã mua vé giấy/mua vé trực tiếp tại văn phòng vé: Vui lòng mang đầy đủ liên vé đến quầy hủy trực tiếp.\n\n2. Trường hợp mua vé Online (qua hình thức website, các app liên kết khác): Vui lòng mang mã code vé (hoặc liên vé nếu đã đổi ra vé giấy) + CMND trùng tên vé đến quầy hủy trực tiếp.\n\n# Thời gian hủy vé: Từ 1 - 3 vé: trước ít nhất 4 tiếng giờ khởi hành.\n\nTừ 4 - 9 vé: trước ít nhất 24 tiếng giờ khởi hành.\n\nTừ 10 vé trở lên: trước ít nhất 48 tiếng giờ khởi hành.\n\n# Lưu ý: * Phí hủy áp dụng:\n\n+ Trước ít nhất 4 tiếng giờ khởi hành: 10%/vé.\n\n+ Trước ít nhất 30 phút giờ khởi hành: 30%/vé\n\n+ Sau 30 phút: Không hỗ trợ hủy\n\n3. trường hợp mua vé Online (qua hình thức app FUTA): Vui lòng truy cập App, chọn mục \"Lịch sử\" (được thể hiện ở phía dưới màn hình, cùng vị trí ngang với mục \"Trang chủ\") chọn vé cần hủy => bấm hủy.\n\n# Lưu ý:\n\n--Hủy vé trên ứng dụng FUTA sẽ hủy đồng loạt tất cả các vé trên cùng 1 mã vé, không thể tách riêng.\n\n--Từ 1-3 vé hủy trước ít nhất 24 tiếng giờ khởi hành, phí hủy 10% (vé ngày thường).\n\n--Tiền hủy vé sẽ được hoàn lại tài khoản thanh toán ban đầu (7-15 ngày tùy vào thời gian làm việc của Ngân hàng).\n\n*Quy định trên sẽ không áp dụng hủy vé nếu vé đã thay đổi (giờ, ngày khởi hành) trước đó.',17),(58,'fe2e7c27-f0cb-4bbd-ae2b-23dfb666d7ba','Tôi có thể mang thú cưng (động vật sống) trên xe được không?\nMong Anh/Chị thông cảm theo quy định của Công Ty Phương Trang, chúng tôi không nhận vận chuyển động vật sống/thú cưng trên xe.',18),(59,'a273ea90-5cff-4028-ac37-a5ef3b51f98d','Sẽ có bất kỳ phụ phí nào ngoài giá vé được hiển thị trên website?\nKhông có bất kỳ phụ phí nào ngoài tổng số tiền (giá vé) được hiển thị trên website.\n\nTrừ trường hợp hành lý đi kèm với khách vượt quá mức quy định (quá 20kg) thì bắt buộc khách hàng phải thêm phí hàng hóa theo kèm.',19),(60,'7c56032c-8b4a-4f17-aacf-ff83dd06db0f','Tôi có thể hút thuốc, ăn uống (thực phẩm nặng mùi) trên xe được không?\nĐể đảm bảo sức khỏe và vệ sinh chung, Anh/Chị vui lòng không hút thuốc, không ăn uống (những thực phẩm nặng mùi) trên xe.',20),(61,'205f7b09-3e44-48a6-9b26-584676262451','Dịch vụ đi kèm trên xe khi sử dụng dịch vụ là gì?\nDịch vụ đi kèm, không tính phí bao gồm:\n\nKhăn, nước, dép đi lại khi lên xuống xe giường nằm.\n\nTivi (áp dụng đối với loại xe limousine 34 giường), mền, wifi.\n\nDịch vụ trung chuyển tại các văn phòng tỉnh thành (trong khu vực phạm vi cho phép, nội ô bán kính 8-10km tùy thuộc địa điểm).',21),(62,'d2c35bbb-d56f-4e58-af24-e38112638ac0','Ngoài hình thức mua vé qua website thì tôi có thể chọn vị trí chỗ ngồi qua các hình thức mua vé khác không?\nAnh/Chị có thể yêu cầu vị trí chỗ ngồi theo nhu cầu cá nhân khi đăng ký vé giữ chỗ qua hotline 19006067.\nAnh/Chị có thể yêu cầu vị trí chỗ ngồi theo nhu cầu cá nhân khi mua vé trực tiếp tại các văn phòng vé.',22),(63,'3a76f216-cd55-4000-8e45-8a4de3deb2ad','Trường hợp tôi mua vé online, tài khoản cá nhân đã thông báo giao dịch thành công nhưng tôi vẫn chưa nhận được thông tin xác nhận, tôi phải làm gì và liên hệ với bộ phận nào?\nTrong trường hợp trên, Anh/Chị vui lòng liên hệ ngay TTTĐ 19006067 gặp Bộ Phận Online hoặc nhắn tin trực tiếp với nhân viên CSKH ngay trên website cung cấp đầy đủ thông tin để được hỗ trợ.',23);
/*!40000 ALTER TABLE `document_chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driver_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `cccd` varchar(20) DEFAULT NULL,
  `license` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_number` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`driver_id`),
  UNIQUE KEY `driver_pk` (`user_id`),
  CONSTRAINT `driver_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (2,'Dương Tam Kha','065555569787','hạng F','0868307198','tamkha333@gmail.com','Nam','97 man thiện, HCM',NULL),(3,'Doãn Đại Hiệp','02358998872','hạng F','0868307198','doan2002@gmail.com','Nam','97 man thiện, HCM',NULL),(4,'Nguyễn Thanh Tùng','464879784564','hạng F','0868334234','thanhtung2002@gmail.com','Nam','97 man thiện, HCM',NULL);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_details`
--

DROP TABLE IF EXISTS `driver_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_details` (
  `driver_id` int NOT NULL,
  `trip_id` int NOT NULL,
  PRIMARY KEY (`trip_id`,`driver_id`),
  KEY `driver_details_driver_driver_id_fk` (`driver_id`),
  CONSTRAINT `driver_details_driver_driver_id_fk` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`),
  CONSTRAINT `driver_details_trip_trip_id_fk` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_details`
--

LOCK TABLES `driver_details` WRITE;
/*!40000 ALTER TABLE `driver_details` DISABLE KEYS */;
INSERT INTO `driver_details` VALUES (2,1),(2,9),(3,11),(4,10),(4,11);
/*!40000 ALTER TABLE `driver_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `embedding_data_v1`
--

DROP TABLE IF EXISTS `embedding_data_v1`;
/*!50001 DROP VIEW IF EXISTS `embedding_data_v1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `embedding_data_v1` AS SELECT 
 1 AS `journey_id`,
 1 AS `content`,
 1 AS `schedule`,
 1 AS `details_address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `embedding_data_v2`
--

DROP TABLE IF EXISTS `embedding_data_v2`;
/*!50001 DROP VIEW IF EXISTS `embedding_data_v2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `embedding_data_v2` AS SELECT 
 1 AS `journey_id`,
 1 AS `schedule`,
 1 AS `details_address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `cccd` varchar(20) DEFAULT NULL,
  `phone_number` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_pk` (`user_id`),
  CONSTRAINT `employee_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Đinh Hồng Kông','066292998431','0357294771','dinhhongkong2002@gmail.com','Nam','97 manthien ',2),(3,'Trần thanh văn','065234469787','1233443443','nguyennamviet5555@gmail.com','Nam','Gần khu cn cao',12),(5,'Nguyễn Thị Trang','06665512225','0345321232','test@gmail.com','Nữ','97 man thiện, Thủ Đức, HCM',15),(6,'Ninja KONG','065555569787','02183982193','abct5555@gmail.com','Nam','97 man thiện, HCM',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(13) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `invoice_user_user_id_fk` (`user_id`),
  CONSTRAINT `invoice_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (9,'2024-07-27 02:20:53','VNPAY',0,NULL,NULL,NULL,NULL),(10,'2024-07-26 17:06:24','VNPAY',0,NULL,NULL,NULL,1),(11,'2024-07-26 17:08:36','VNPAY',0,NULL,NULL,NULL,1),(12,'2024-07-26 17:18:09','VNPAY',0,NULL,NULL,NULL,1),(13,'2024-07-26 17:29:25','VNPAY',0,NULL,NULL,NULL,1),(14,'2024-07-26 17:33:26','VNPAY',0,NULL,NULL,NULL,1),(15,'2024-07-27 03:22:29','VNPAY',0,NULL,NULL,NULL,1),(22,'2024-07-27 17:42:00','VNPAY',0,NULL,NULL,NULL,NULL),(23,'2024-07-27 20:27:19','VNPAY',0,NULL,NULL,NULL,NULL),(24,'2024-07-27 21:40:35','VNPAY',1,NULL,NULL,NULL,NULL),(25,'2024-07-28 03:00:32','VNPAY',3,NULL,NULL,NULL,NULL),(26,'2024-08-10 13:46:37','VNPAY',0,NULL,NULL,NULL,NULL),(27,'2024-08-10 13:47:39','VNPAY',0,NULL,NULL,NULL,NULL),(28,'2024-08-10 13:52:34','VNPAY',1,NULL,NULL,NULL,NULL),(29,'2024-08-10 14:06:09','VNPAY',1,NULL,NULL,NULL,NULL),(30,'2024-08-10 14:14:08','VNPAY',1,NULL,NULL,NULL,NULL),(31,'2024-08-10 14:25:03','VNPAY',1,NULL,NULL,NULL,NULL),(32,'2024-08-10 15:22:09','VNPAY',1,NULL,NULL,NULL,NULL),(33,'2024-08-10 15:26:40','VNPAY',0,NULL,NULL,NULL,NULL),(34,'2024-08-15 12:09:13','VNPAY',1,NULL,NULL,NULL,NULL),(35,'2024-08-15 16:24:40','VNPAY',1,NULL,NULL,NULL,NULL),(37,'2024-11-25 01:50:03',NULL,0,'Dinh Hong Kong','0868307198','dinhhongkong2002@gmail.com',NULL),(38,'2024-11-25 01:51:26',NULL,0,'Dinh Hong Kong','0868307198','dinhhongkong2002@gmail.com',NULL),(42,'2024-11-25 02:01:57',NULL,0,'Ninja','02183982193','nguyennamviet5555@gmail.com',NULL),(43,'2024-11-25 02:21:44','VNPAY',1,'Dinh Hong Kong','0868307198','dinhhongkong2002@gmail.com',NULL),(44,'2024-11-25 02:56:27','VNPAY',1,'Dinh Hong Kong','0868307198','dinhhongkong2002@gmail.com',NULL),(45,'2024-12-08 08:03:34','VNPAY',1,'doan trung kien','0869145874','nguyennamviet5555@gmail.com',NULL),(46,'2024-12-08 12:42:27',NULL,0,'Nguyễn Đình Chiến','0377424841','',NULL),(47,'2024-12-08 12:52:24','Thanh toán tại quầy',2,'Dinh Hong Kong','0868307198','dinhhongkong2002@gmail.com',12),(48,'2024-12-22 15:36:02',NULL,0,'Ninja','02183982193','nguyennamviet5555@gmail.com',NULL),(49,'2024-12-22 15:36:25','VNPAY',2,'Dinh Hong Kong','0868307198','dinhhongkong2002@gmail.com',NULL),(50,'2024-12-24 02:43:49','VNPAY',1,'Dinh Hong Kong','0868307198','nguyennamviet5555@gmail.com',NULL),(51,'2024-12-24 08:09:54','VNPAY',1,'Ninja','02183982193','nguyennamviet5555@gmail.com',NULL),(52,'2024-12-24 09:26:28','VNPAY',1,'Ninja','02183982193','nguyennamviet5555@gmail.com',NULL),(53,'2025-01-08 10:27:11','VNPAY',1,'Ninja','02183982193','nguyennamviet5555@gmail.com',NULL);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journey`
--

DROP TABLE IF EXISTS `journey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journey` (
  `journey_id` int NOT NULL AUTO_INCREMENT,
  `departure_time` time DEFAULT NULL,
  `travel_time` varchar(10) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`journey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey`
--

LOCK TABLES `journey` WRITE;
/*!40000 ALTER TABLE `journey` DISABLE KEYS */;
INSERT INTO `journey` VALUES (1,'09:00:00','09:00:00',1),(2,'22:00:00','10:00:00',1),(11,'09:00:00','09:00:00',1),(12,'09:00:00','09:00:00',1);
/*!40000 ALTER TABLE `journey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journey_detail`
--

DROP TABLE IF EXISTS `journey_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journey_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `delta_time` time DEFAULT NULL,
  `journey_id` int DEFAULT NULL,
  `office_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `journey_detail_journey_journey_id_fk` (`journey_id`),
  KEY `journey_detail_office_office_id_fk` (`office_id`),
  CONSTRAINT `journey_detail_journey_journey_id_fk` FOREIGN KEY (`journey_id`) REFERENCES `journey` (`journey_id`),
  CONSTRAINT `journey_detail_office_office_id_fk` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey_detail`
--

LOCK TABLES `journey_detail` WRITE;
/*!40000 ALTER TABLE `journey_detail` DISABLE KEYS */;
INSERT INTO `journey_detail` VALUES (1,'08:30:00',1,2,3),(2,'00:00:00',1,1,1),(3,'00:00:00',2,2,1),(4,'10:00:00',2,1,3),(25,'00:00:00',11,2,1),(26,'18:00:00',11,1,3),(27,'00:30:00',11,6,0),(28,'00:00:00',12,2,1),(29,'18:00:00',12,1,3),(30,'00:30:00',12,6,0),(31,'04:00:00',12,7,2);
/*!40000 ALTER TABLE `journey_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `manage_ticket`
--

DROP TABLE IF EXISTS `manage_ticket`;
/*!50001 DROP VIEW IF EXISTS `manage_ticket`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `manage_ticket` AS SELECT 
 1 AS `ticket_id`,
 1 AS `full_name`,
 1 AS `phone_number`,
 1 AS `email`,
 1 AS `bus_id`,
 1 AS `license_plates`,
 1 AS `pickup_point`,
 1 AS `pickup_address`,
 1 AS `drop_off_point`,
 1 AS `drop_off_address`,
 1 AS `pickup_province`,
 1 AS `dropoff_province`,
 1 AS `departure_day`,
 1 AS `departure_time`,
 1 AS `delta_time`,
 1 AS `seat_name`,
 1 AS `total_seat`,
 1 AS `price`,
 1 AS `is_cancel`,
 1 AS `payment_method`,
 1 AS `invoice_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office` (
  `office_id` int NOT NULL AUTO_INCREMENT,
  `office_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `province_id` int DEFAULT NULL,
  PRIMARY KEY (`office_id`),
  KEY `office_province_province_id_fk` (`province_id`),
  CONSTRAINT `office_province_province_id_fk` FOREIGN KEY (`province_id`) REFERENCES `province` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,'BX Miền Đông','Quầy vé số 43 – 44, Đường 292 Đinh Bộ Lĩnh, Phường 26, Bình Thạnh, TP. Hồ Chí Minh',30),(2,'BX Phía Nam','48/89 Phan Huy Chú, Khánh Xuân, Tp. Buôn Ma Thuột, Đắk Lắk',16),(6,'Văn phòng Lê Duẩn','172 Lê Duẩn, TP Buôn Ma Thuột, Đắk Lắk',16),(7,'Bến xe Gia nghĩa','226 Hai Bà Trưng, Nghĩa Thành, Gia Nghĩa, Đắk Nông',17),(8,'BX Miền Tây','Quầy vé số 31, Số 395 Đường Kinh Dương Vương, Phường An Lạc, Bình Tân, TP. Hồ Chí Minh',30),(9,'Xa Lộ Hà Nội – Quận 9','Số 798A Xa Lộ Hà Nội, Phường Hiệp Phú, Quận 9, TP. Hồ Chí Minh',30),(10,'Đề Thám – Quận 1','Đường 272 Đề Thám, Quận 1, Phường Phạm Ngũ Lão , Quận 1, TP. Hồ Chí Minh',30);
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_status`
--

DROP TABLE IF EXISTS `payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamps` datetime NOT NULL,
  `payment_status` tinyint NOT NULL,
  `invoice_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_status_invoice_invoice_id_fk` (`invoice_id`),
  CONSTRAINT `payment_status_invoice_invoice_id_fk` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_status`
--

LOCK TABLES `payment_status` WRITE;
/*!40000 ALTER TABLE `payment_status` DISABLE KEYS */;
INSERT INTO `payment_status` VALUES (9,'2024-07-26 17:00:53',0,9),(10,'2024-07-26 17:06:24',0,10),(11,'2024-07-26 17:08:36',0,11),(12,'2024-07-26 17:18:09',0,12),(13,'2024-07-26 17:29:26',0,13),(14,'2024-07-26 17:33:26',0,14),(15,'2024-07-27 03:22:29',0,15),(20,'2024-07-27 17:42:00',0,22),(21,'2024-07-27 20:27:19',0,23),(22,'2024-07-27 21:40:35',0,24),(23,'2024-07-28 03:00:32',0,25),(28,'2024-08-10 13:46:37',0,26),(29,'2024-08-10 13:47:39',0,27),(30,'2024-08-10 13:52:34',0,28),(31,'2024-08-10 13:57:42',1,28),(32,'2024-08-10 13:57:42',1,28),(33,'2024-08-10 14:01:37',1,28),(34,'2024-08-10 14:01:37',1,28),(35,'2024-08-10 14:06:09',0,29),(36,'2024-08-10 14:07:28',1,29),(38,'2024-08-10 14:14:08',0,30),(39,'2024-08-10 14:14:36',1,30),(40,'2024-08-10 14:14:36',1,30),(41,'2024-08-10 14:25:03',0,31),(42,'2024-08-10 14:26:13',1,31),(43,'2024-08-10 14:26:13',1,31),(44,'2024-08-10 14:47:11',1,31),(45,'2024-08-10 14:47:11',1,31),(46,'2024-08-10 14:56:52',1,31),(47,'2024-08-10 14:56:52',1,31),(48,'2024-08-10 15:22:09',0,32),(49,'2024-08-10 15:22:37',1,32),(50,'2024-08-10 15:22:37',1,32),(51,'2024-08-10 15:26:40',0,33),(52,'2024-08-15 12:09:13',0,34),(53,'2024-08-15 12:09:41',1,34),(54,'2024-08-15 12:09:41',1,34),(55,'2024-08-15 12:51:58',1,34),(56,'2024-08-15 12:51:58',1,34),(57,'2024-08-15 16:24:40',0,35),(58,'2024-08-15 16:25:01',1,35),(59,'2024-08-15 16:25:01',1,35),(60,'2024-11-25 01:50:03',0,37),(61,'2024-11-25 01:51:26',0,38),(65,'2024-11-25 02:01:57',0,42),(66,'2024-11-25 02:21:44',0,43),(67,'2024-11-25 02:53:30',1,43),(68,'2024-11-25 02:53:30',1,43),(69,'2024-11-25 02:56:27',0,44),(70,'2024-11-25 02:56:56',1,44),(71,'2024-11-25 02:56:56',1,44),(72,'2024-12-08 08:03:34',0,45),(77,'2024-12-08 08:13:46',1,45),(78,'2024-12-08 08:13:48',1,45),(79,'2024-12-08 08:16:43',1,45),(80,'2024-12-08 08:16:47',1,45),(81,'2024-12-08 08:17:36',1,45),(82,'2024-12-08 08:17:40',1,45),(83,'2024-12-08 12:42:27',0,46),(84,'2024-12-08 12:52:24',1,47),(85,'2024-12-22 15:36:02',0,48),(86,'2024-12-22 15:36:25',0,49),(87,'2024-12-22 15:37:12',1,49),(88,'2024-12-22 15:37:14',1,49),(89,'2024-12-22 15:37:32',1,49),(90,'2024-12-22 15:37:33',1,49),(91,'2024-12-24 02:43:49',0,50),(92,'2024-12-24 02:44:33',1,50),(93,'2024-12-24 02:44:35',1,50),(94,'2024-12-24 02:51:17',1,50),(95,'2024-12-24 02:51:21',1,50),(96,'2024-12-24 08:09:54',0,51),(97,'2024-12-24 08:10:58',1,51),(98,'2024-12-24 09:26:28',0,52),(99,'2024-12-24 09:27:18',1,52),(100,'2024-12-24 09:27:31',1,52),(101,'2025-01-08 10:27:11',0,53),(102,'2025-01-08 10:28:00',1,53);
/*!40000 ALTER TABLE `payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `price_id` int NOT NULL AUTO_INCREMENT,
  `date_start` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,'2024-07-01',250000),(2,'2024-08-10',500000),(3,'2024-08-15',450000);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `province_id` int NOT NULL AUTO_INCREMENT,
  `province_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'An Giang'),(2,'Bà Rịa - Vũng Tàu'),(3,'Bạc Liêu'),(4,'Bắc Giang'),(5,'Bắc Kạn'),(6,'Bắc Ninh'),(7,'Bến Tre'),(8,'Bình Dương'),(9,'Bình Định'),(10,'Bình Phước'),(11,'Bình Thuận'),(12,'Cà Mau'),(13,'Cao Bằng'),(14,'Cần Thơ'),(15,'Đà Nẵng'),(16,'Đắk Lắk'),(17,'Đắk Nông'),(18,'Điện Biên'),(19,'Đồng Nai'),(20,'Đồng Tháp'),(21,'Gia Lai'),(22,'Hà Giang'),(23,'Hà Nam'),(24,'Hà Nội'),(25,'Hà Tĩnh'),(26,'Hải Dương'),(27,'Hải Phòng'),(28,'Hậu Giang'),(29,'Hoà Bình'),(30,'Hồ Chí Minh'),(31,'Hưng Yên'),(32,'Khánh Hòa'),(33,'Kiên Giang'),(34,'Kon Tum'),(35,'Lai Châu'),(36,'Lạng Sơn'),(37,'Lào Cai'),(38,'Lâm Đồng'),(39,'Long An'),(40,'Nam Định'),(41,'Nghệ An'),(42,'Ninh Bình'),(43,'Ninh Thuận'),(44,'Phú Thọ'),(45,'Phú Yên'),(46,'Quảng Bình'),(47,'Quảng Nam'),(48,'Quảng Ngãi'),(49,'Quảng Ninh'),(50,'Quảng Trị'),(51,'Sóc Trăng'),(52,'Sơn La'),(53,'Tây Ninh'),(54,'Thái Bình'),(55,'Thái Nguyên'),(56,'Thanh Hóa'),(57,'Thừa Thiên Huế'),(58,'Tiền Giang'),(59,'Trà Vinh'),(60,'Tuyên Quang'),(61,'Vĩnh Long'),(62,'Vĩnh Phúc'),(63,'Yên Bái');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'CUSTOMER'),(2,'ADMIN'),(3,'MANAGER'),(4,'TICKET_STAFF'),(5,'DRIVER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `pickup_point_id` int NOT NULL,
  `drop_off_point_id` int NOT NULL,
  `description` text,
  `is_cancel` bit(1) DEFAULT NULL,
  `trip_id` int DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `ticket_office_office_id_fk` (`pickup_point_id`),
  KEY `ticket_office_office_id_fk_2` (`drop_off_point_id`),
  KEY `ticket_trip_trip_id_fk` (`trip_id`),
  KEY `ticket_invoice_invoice_id_fk` (`invoice_id`),
  CONSTRAINT `ticket_invoice_invoice_id_fk` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`),
  CONSTRAINT `ticket_office_office_id_fk` FOREIGN KEY (`pickup_point_id`) REFERENCES `office` (`office_id`),
  CONSTRAINT `ticket_office_office_id_fk_2` FOREIGN KEY (`drop_off_point_id`) REFERENCES `office` (`office_id`),
  CONSTRAINT `ticket_trip_trip_id_fk` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,2,NULL,NULL,1,9),(2,1,2,NULL,NULL,1,10),(3,1,2,NULL,NULL,1,11),(4,1,2,NULL,NULL,1,12),(5,1,2,NULL,NULL,1,13),(6,1,2,NULL,NULL,1,14),(7,1,2,NULL,NULL,1,15),(12,1,2,NULL,NULL,1,22),(13,1,2,NULL,NULL,1,22),(14,1,2,NULL,NULL,1,23),(15,1,2,NULL,NULL,1,23),(17,1,2,NULL,NULL,1,24),(18,2,1,NULL,NULL,2,25),(19,1,2,NULL,NULL,1,26),(20,1,2,NULL,NULL,1,26),(21,1,2,NULL,NULL,1,27),(22,1,2,NULL,NULL,1,27),(23,1,2,NULL,NULL,1,28),(24,1,2,NULL,NULL,1,28),(26,6,1,NULL,NULL,9,30),(27,7,1,NULL,NULL,9,31),(28,7,1,NULL,NULL,9,32),(29,7,1,NULL,NULL,9,33),(30,1,2,NULL,NULL,10,34),(31,1,2,NULL,NULL,1,35),(34,1,2,NULL,NULL,1,42),(35,1,2,NULL,NULL,1,43),(36,1,2,NULL,NULL,1,44),(37,2,1,NULL,NULL,2,44),(38,1,2,NULL,NULL,10,45),(39,2,1,NULL,NULL,2,46),(40,2,1,NULL,NULL,2,47),(41,1,2,NULL,NULL,1,48),(42,1,2,NULL,NULL,1,49),(43,2,1,NULL,NULL,2,50),(44,2,1,NULL,NULL,2,51),(45,1,2,NULL,NULL,1,52),(46,1,2,NULL,NULL,1,53),(47,2,1,NULL,NULL,2,53);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_detail`
--

DROP TABLE IF EXISTS `ticket_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `seat_name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_detail_seat_seat_id_fk` (`seat_name`),
  KEY `ticket_detail_ticket_ticket_id_fk` (`ticket_id`),
  CONSTRAINT `ticket_detail_ticket_ticket_id_fk` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_detail`
--

LOCK TABLES `ticket_detail` WRITE;
/*!40000 ALTER TABLE `ticket_detail` DISABLE KEYS */;
INSERT INTO `ticket_detail` VALUES (19,1,'B12'),(20,1,'B08'),(21,1,'B11'),(22,2,'B07'),(23,2,'B08'),(24,2,'B11'),(25,3,'B07'),(26,3,'B08'),(27,3,'B07'),(28,4,'B08'),(29,4,'B08'),(30,4,'B11'),(31,5,'B07'),(32,5,'B08'),(33,5,'B11'),(34,6,'B07'),(35,6,'B08'),(36,6,'B11'),(37,7,'B12'),(38,7,'B15'),(43,12,'B02'),(44,13,'A02'),(45,14,'B02'),(46,15,'A02'),(48,17,'A02'),(49,18,'B02'),(50,19,'B03'),(51,20,'A04'),(52,21,'B17'),(53,22,'A15'),(54,23,'B10'),(55,24,'A11'),(57,26,'A01'),(58,26,'A02'),(59,27,'A03'),(60,28,'A06'),(61,28,'A05'),(62,29,'A22'),(63,30,'A07'),(64,30,'A08'),(65,31,'A06'),(70,34,'A22'),(71,34,'A21'),(72,35,'A22'),(73,36,'B18'),(74,37,'B03'),(75,38,'B15'),(76,38,'B16'),(77,39,'A09'),(78,39,'A12'),(79,40,'B01'),(80,40,'B02'),(81,41,'B05'),(82,41,'B08'),(83,42,'A15'),(84,42,'B13'),(85,43,'B02'),(86,43,'B01'),(87,44,'A01'),(88,45,'B01'),(89,45,'B02'),(90,46,'B12'),(91,47,'A10'),(92,47,'A14');
/*!40000 ALTER TABLE `ticket_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ticket_information`
--

DROP TABLE IF EXISTS `ticket_information`;
/*!50001 DROP VIEW IF EXISTS `ticket_information`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ticket_information` AS SELECT 
 1 AS `ticket_id`,
 1 AS `full_name`,
 1 AS `phone_number`,
 1 AS `email`,
 1 AS `pickup_point`,
 1 AS `pickup_address`,
 1 AS `drop_off_point`,
 1 AS `drop_off_address`,
 1 AS `pickup_province`,
 1 AS `dropoff_province`,
 1 AS `departure_day`,
 1 AS `departure_time`,
 1 AS `delta_time`,
 1 AS `seat_name`,
 1 AS `total_seat`,
 1 AS `price`,
 1 AS `is_cancel`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `trip_id` int NOT NULL AUTO_INCREMENT,
  `departure_day` date NOT NULL,
  `price_id` int DEFAULT NULL,
  `journey_id` int DEFAULT NULL,
  `bus_id` int DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `trip_journey_journey_id_fk` (`journey_id`),
  KEY `trip_price_price_id_fk` (`price_id`),
  KEY `trip_bus_bus_id_fk` (`bus_id`),
  CONSTRAINT `trip_bus_bus_id_fk` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`),
  CONSTRAINT `trip_journey_journey_id_fk` FOREIGN KEY (`journey_id`) REFERENCES `journey` (`journey_id`),
  CONSTRAINT `trip_price_price_id_fk` FOREIGN KEY (`price_id`) REFERENCES `price` (`price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,'2025-04-25',1,1,4),(2,'2025-04-25',1,2,1),(9,'2025-04-25',1,12,4),(10,'2025-04-25',3,1,3),(11,'2025-04-25',1,1,5);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `trip_information`
--

DROP TABLE IF EXISTS `trip_information`;
/*!50001 DROP VIEW IF EXISTS `trip_information`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `trip_information` AS SELECT 
 1 AS `departure`,
 1 AS `destination`,
 1 AS `pickup_address`,
 1 AS `dropoff_address`,
 1 AS `departure_day`,
 1 AS `departure_time`,
 1 AS `price`,
 1 AS `type_name`,
 1 AS `url`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `enable` bit(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_roles_role_id_fk` (`role_id`),
  CONSTRAINT `user_roles_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'dinhhongkong2002@gmail.com','$2a$10$hf3MmW9Budsv75yzfMRx6uWppJncUlnE3NhejRK2kFcbORZbByv1q',1,_binary ''),(2,'admin','$2a$10$hf3MmW9Budsv75yzfMRx6uWppJncUlnE3NhejRK2kFcbORZbByv1q',2,_binary ''),(12,'nguyennamviet5555@gmail.com','$2a$12$pnnVZKMeLXHCnjcYK9Hrm.huO/xZvuQ98ubFIQuXS9dbOfFJ1D.ze',4,_binary ''),(13,'abc12345','$2a$10$ThOlNsFN6qPmdVYMvzOCj.zHDGQoYZospyNfB2b9ReQSersLHtKXm',1,_binary ''),(14,'bcd','$2a$10$RMgvWpYba.vqV7lI8zcXD.xVc7LxT/dJuB3sUYvUehiTT0YmfTTrm',1,_binary ''),(15,'test@gmail.com','$2a$12$pnnVZKMeLXHCnjcYK9Hrm.huO/xZvuQ98ubFIQuXS9dbOfFJ1D.ze',3,_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `embedding_data_v1`
--

/*!50001 DROP VIEW IF EXISTS `embedding_data_v1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `embedding_data_v1` AS with `journey_info` as (select `journey`.`journey_id` AS `journey_id`,`journey`.`departure_time` AS `departure_time`,`journey`.`travel_time` AS `travel_time`,`journey_detail`.`delta_time` AS `delta_time`,`office`.`office_name` AS `office_name`,`office`.`address` AS `address`,`province`.`province_name` AS `province_name`,`journey_detail`.`type` AS `type`,(case when (`journey_detail`.`type` = 0) then 'Điểm bắt xe trung chuyển' when (`journey_detail`.`type` = 1) then 'Điểm khởi hành' when (`journey_detail`.`type` = 2) then 'Điểm dừng chân' when (`journey_detail`.`type` = 3) then 'Điểm đến' end) AS `type_description`,(case when (`journey_detail`.`type` = 0) then time_format(timediff(`journey`.`departure_time`,`journey_detail`.`delta_time`),'%H:%i:%s') when (`journey_detail`.`type` = 1) then time_format(addtime(`journey`.`departure_time`,`journey`.`travel_time`),'%H:%i:%s') when (`journey_detail`.`type` = 2) then time_format(addtime(`journey`.`departure_time`,`journey_detail`.`delta_time`),'%H:%i:%s') when (`journey_detail`.`type` = 3) then `journey`.`departure_time` end) AS `time` from (((`journey` join `journey_detail` on((`journey`.`journey_id` = `journey_detail`.`journey_id`))) join `office` on((`journey_detail`.`office_id` = `office`.`office_id`))) join `province` on((`office`.`province_id` = `province`.`province_id`))) where (`journey`.`status` = true) order by `journey_detail`.`type`), `trip_info` as (select `journey`.`journey_id` AS `journey_id`,`trip`.`trip_id` AS `trip_id`,`trip`.`departure_day` AS `departure_day`,`price`.`price` AS `price`,`bus_type`.`type_name` AS `type_name` from ((((`journey` join `trip` on((`journey`.`journey_id` = `trip`.`journey_id`))) join `price` on((`trip`.`price_id` = `price`.`price_id`))) join `bus` on((`trip`.`bus_id` = `bus`.`bus_id`))) join `bus_type` on((`bus`.`type_id` = `bus_type`.`type_id`)))) select `journey_description`.`journey_id` AS `journey_id`,`trip_description`.`content` AS `content`,`journey_description`.`schedule` AS `schedule`,concat('Từ: ',`journey_description`.`details_address`) AS `details_address` from ((select `trip_info`.`journey_id` AS `journey_id`,group_concat('Ngày: ',convert(date_format(`trip_info`.`departure_day`,'%d-%m-%Y') using utf8mb3),' giá: ',convert(format(`trip_info`.`price`,0) using utf8mb3),' VND với loại xe: ',`trip_info`.`type_name`,'\n' separator ' ') AS `content` from `trip_info` group by `trip_info`.`journey_id`,`trip_info`.`price`) `trip_description` join (select `journey_info`.`journey_id` AS `journey_id`,group_concat(convert(`journey_info`.`type_description` using utf8mb3),': ','tại ',`journey_info`.`office_name`,' tại địa chỉ ',`journey_info`.`address`,' vào lúc ',convert(`journey_info`.`time` using utf8mb3),' (',`journey_info`.`province_name`,')' order by `journey_info`.`type` ASC separator '\n') AS `schedule`,group_concat(`journey_info`.`address` order by `journey_info`.`type` ASC separator ' Đến: ') AS `details_address` from `journey_info` group by `journey_info`.`journey_id`) `journey_description` on((`trip_description`.`journey_id` = `journey_description`.`journey_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `embedding_data_v2`
--

/*!50001 DROP VIEW IF EXISTS `embedding_data_v2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `embedding_data_v2` AS with `journey_info` as (select `journey`.`journey_id` AS `journey_id`,`journey`.`departure_time` AS `departure_time`,`journey`.`travel_time` AS `travel_time`,`journey_detail`.`delta_time` AS `delta_time`,`office`.`office_name` AS `office_name`,`office`.`address` AS `address`,`province`.`province_name` AS `province_name`,`journey_detail`.`type` AS `type`,(case when (`journey_detail`.`type` = 0) then 'Điểm bắt xe trung chuyển' when (`journey_detail`.`type` = 1) then 'Điểm khởi hành' when (`journey_detail`.`type` = 2) then 'Điểm dừng chân' when (`journey_detail`.`type` = 3) then 'Điểm đến' end) AS `type_description`,(case when (`journey_detail`.`type` = 0) then time_format(timediff(`journey`.`departure_time`,`journey_detail`.`delta_time`),'%H:%i:%s') when (`journey_detail`.`type` = 1) then time_format(addtime(`journey`.`departure_time`,`journey`.`travel_time`),'%H:%i:%s') when (`journey_detail`.`type` = 2) then time_format(addtime(`journey`.`departure_time`,`journey_detail`.`delta_time`),'%H:%i:%s') when (`journey_detail`.`type` = 3) then `journey`.`departure_time` end) AS `time` from (((`journey` join `journey_detail` on((`journey`.`journey_id` = `journey_detail`.`journey_id`))) join `office` on((`journey_detail`.`office_id` = `office`.`office_id`))) join `province` on((`office`.`province_id` = `province`.`province_id`))) where (`journey`.`status` = true) order by `journey_detail`.`type`) select `journey_description`.`journey_id` AS `journey_id`,`journey_description`.`schedule` AS `schedule`,concat('Từ: ',`journey_description`.`details_address`) AS `details_address` from (select `journey_info`.`journey_id` AS `journey_id`,group_concat(convert(`journey_info`.`type_description` using utf8mb3),': ','tại ',`journey_info`.`office_name`,' tại địa chỉ ',`journey_info`.`address`,' vào lúc ',convert(`journey_info`.`time` using utf8mb3),' (',`journey_info`.`province_name`,')' order by `journey_info`.`type` ASC separator '\n') AS `schedule`,group_concat(`journey_info`.`address` order by `journey_info`.`type` ASC separator ' Đến: ') AS `details_address` from `journey_info` group by `journey_info`.`journey_id`) `journey_description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manage_ticket`
--

/*!50001 DROP VIEW IF EXISTS `manage_ticket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manage_ticket` AS select `ticket`.`ticket_id` AS `ticket_id`,`invoice`.`full_name` AS `full_name`,`invoice`.`phone_number` AS `phone_number`,`invoice`.`email` AS `email`,`trip`.`bus_id` AS `bus_id`,`bus`.`license_plates` AS `license_plates`,`pickup`.`office_name` AS `pickup_point`,`pickup`.`address` AS `pickup_address`,`dropoff`.`office_name` AS `drop_off_point`,`dropoff`.`address` AS `drop_off_address`,`pickup_province`.`province_name` AS `pickup_province`,`dropoff_province`.`province_name` AS `dropoff_province`,`trip`.`departure_day` AS `departure_day`,`journey`.`departure_time` AS `departure_time`,`journey_detail`.`delta_time` AS `delta_time`,group_concat(`ticket_detail`.`seat_name` separator ',') AS `seat_name`,count(`ticket_detail`.`seat_name`) AS `total_seat`,`price`.`price` AS `price`,`ticket`.`is_cancel` AS `is_cancel`,`invoice`.`payment_method` AS `payment_method`,`invoice`.`status` AS `invoice_status` from (((((((((((`ticket` join `invoice` on((`ticket`.`invoice_id` = `invoice`.`invoice_id`))) join `office` `pickup` on((`ticket`.`pickup_point_id` = `pickup`.`office_id`))) join `office` `dropoff` on((`ticket`.`drop_off_point_id` = `dropoff`.`office_id`))) join `trip` on((`ticket`.`trip_id` = `trip`.`trip_id`))) join `journey` on((`trip`.`journey_id` = `journey`.`journey_id`))) join `journey_detail` on((`journey`.`journey_id` = `journey_detail`.`journey_id`))) join `ticket_detail` on((`ticket`.`ticket_id` = `ticket_detail`.`ticket_id`))) join `price` on((`trip`.`price_id` = `price`.`price_id`))) join `province` `pickup_province` on((`pickup`.`province_id` = `pickup_province`.`province_id`))) join `province` `dropoff_province` on((`dropoff`.`province_id` = `dropoff_province`.`province_id`))) join `bus` on((`trip`.`bus_id` = `bus`.`bus_id`))) where ((`journey_detail`.`office_id` = `pickup`.`office_id`) and (`trip`.`departure_day` >= curdate()) and (`invoice`.`status` <> 2)) group by `ticket`.`ticket_id`,`journey_detail`.`delta_time` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ticket_information`
--

/*!50001 DROP VIEW IF EXISTS `ticket_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ticket_information` AS select `ticket`.`ticket_id` AS `ticket_id`,`invoice`.`full_name` AS `full_name`,`invoice`.`phone_number` AS `phone_number`,`invoice`.`email` AS `email`,`pickup`.`office_name` AS `pickup_point`,`pickup`.`address` AS `pickup_address`,`dropoff`.`office_name` AS `drop_off_point`,`dropoff`.`address` AS `drop_off_address`,`pickup_province`.`province_name` AS `pickup_province`,`dropoff_province`.`province_name` AS `dropoff_province`,`trip`.`departure_day` AS `departure_day`,`journey`.`departure_time` AS `departure_time`,`journey_detail`.`delta_time` AS `delta_time`,group_concat(`ticket_detail`.`seat_name` separator ',') AS `seat_name`,count(`ticket_detail`.`seat_name`) AS `total_seat`,`price`.`price` AS `price`,`ticket`.`is_cancel` AS `is_cancel` from ((((((((((`ticket` join `invoice` on((`ticket`.`invoice_id` = `invoice`.`invoice_id`))) join `office` `pickup` on((`ticket`.`pickup_point_id` = `pickup`.`office_id`))) join `office` `dropoff` on((`ticket`.`drop_off_point_id` = `dropoff`.`office_id`))) join `trip` on((`ticket`.`trip_id` = `trip`.`trip_id`))) join `journey` on((`trip`.`journey_id` = `journey`.`journey_id`))) join `journey_detail` on((`journey`.`journey_id` = `journey_detail`.`journey_id`))) join `ticket_detail` on((`ticket`.`ticket_id` = `ticket_detail`.`ticket_id`))) join `price` on((`trip`.`price_id` = `price`.`price_id`))) join `province` `pickup_province` on((`pickup`.`province_id` = `pickup_province`.`province_id`))) join `province` `dropoff_province` on((`dropoff`.`province_id` = `dropoff_province`.`province_id`))) where (`journey_detail`.`office_id` = `pickup`.`office_id`) group by `ticket`.`ticket_id`,`journey_detail`.`delta_time` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trip_information`
--

/*!50001 DROP VIEW IF EXISTS `trip_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trip_information` AS select `pickup_province`.`province_name` AS `departure`,`dropoff_province`.`province_name` AS `destination`,`pickup`.`address` AS `pickup_address`,`dropoff`.`address` AS `dropoff_address`,date_format(`trip`.`departure_day`,'%Y-%m-%d') AS `departure_day`,addtime(`journey`.`departure_time`,`departure`.`delta_time`) AS `departure_time`,`price`.`price` AS `price`,`bus_type`.`type_name` AS `type_name`,concat('http://localhost:3000/booking-ticket?tripId=',`trip`.`trip_id`) AS `url` from ((((((((((`journey` join `trip` on((`journey`.`journey_id` = `trip`.`journey_id`))) join `price` on((`trip`.`price_id` = `price`.`price_id`))) join `bus` on((`trip`.`bus_id` = `bus`.`bus_id`))) join `bus_type` on((`bus`.`type_id` = `bus_type`.`type_id`))) join `journey_detail` `departure` on((`journey`.`journey_id` = `departure`.`journey_id`))) join `journey_detail` `destination` on((`journey`.`journey_id` = `destination`.`journey_id`))) join `office` `pickup` on((`pickup`.`office_id` = `departure`.`office_id`))) join `office` `dropoff` on((`dropoff`.`office_id` = `destination`.`office_id`))) join `province` `pickup_province` on((`pickup_province`.`province_id` = `pickup`.`province_id`))) join `province` `dropoff_province` on((`dropoff_province`.`province_id` = `dropoff`.`province_id`))) where ((`journey`.`status` = 1) and (`trip`.`departure_day` >= curdate()) and (`departure`.`type` <> 0) and (`departure`.`type` <> 3) and (`destination`.`type` = 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-24  0:56:32
CREATE DATABASE  IF NOT EXISTS `bus-booking-ticket-chatbot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bus-booking-ticket-chatbot`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: bus-booking-ticket-chatbot
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` longtext NOT NULL,
  `answer` longtext,
  `is_train` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_data`
--

DROP TABLE IF EXISTS `document_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_data` (
  `id` varchar(36) NOT NULL,
  `title` longtext,
  `content` longtext,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_data`
--

LOCK TABLES `document_data` WRITE;
/*!40000 ALTER TABLE `document_data` DISABLE KEYS */;
INSERT INTO `document_data` VALUES ('27074aeb-e744-45ed-a601-06699bbf1b16','Quyền Và Nghĩa Vụ Của Khách Hàng','1.  Được tham khảo những thông tin cơ bản liên quan đến việc chọn và đặt vé như: tên hãng xe, tuyến xe, mã số ghế, phương thức và thời hạn thanh toán.\n\n2.  Thông tin cá nhân của khách hàng trên FUTABUS.VN được FUTABUS.VN cam kết bảo mật tuyệt đối theo chính sách bảo vệ thông tin khách hang của FUTABUS.VN.\n\n- Việc thu thập và sử dụng thông tin của khách hàng chỉ được thực hiện khi có sự đồng ý của khách hàng đó trừ những trường hợp pháp luật có quy định khác.\n\n3. Khách hàng có thể gửi khiếu nại trực tiếp đến bộ phận hỗ trợ khách hàng của FUTABUS.VN. Khi nhận được khiếu nại của hành khách, bộ phận hỗ trợ khách hàng của FUTABUS.VN sẽ chuyển ngay khiếu nại đó đến Hãng xe bằng các phương thức nhanh nhất và yêu cầu giải quyết.\n\n4. Khách hàng cần phải thường xuyên đọc và tuân theo các Chính sách và Quy định đang được đăng trên FUTABUS.VN để có thể hiểu và thực hiện được các Chính sách và Quy định tại thời điểm đó.\n\n5. Khách hàng đồng ý không truy cập (hoặc cố truy cập) bất kỳ các dịch vụ nào bằng bất kỳ các phương tiện nào khác ngoài giao diện được cung cấp bởi FUTABUS.VN.\n\n6. Khách hàng đồng ý rằng sẽ không tiến hành bất kỳ hoạt động nào quấy nhiễu hoặc phá các dịch vụ.\n\n7. Quý khách vui lòng có mặt tại bến xuất phát của xe trước ít nhất 30 phút giờ xe khởi hành, mang theo thông báo đã thanh toán vé thành công có chứa mã vé được gửi từ hệ thống FUTA BUS LINE.\n\n8.  Thông tin hành khách phải chính xác, nếu không sẽ không thể lên xe hoặc hủy/đổi vé.\n\n9. Mọi trường hợp có hành vi gian lận , hack , phá hoại hệ thống , ... Chúng tôi sẽ không giải quyết và sẽ chuyển cơ quan chức năng xử lý theo pháp luật.\n\n10.  Nếu quý khách có nhu cầu trung chuyển, vui lòng liên hệ số điện thoại 1900 6918 trước khi đặt vé . Chúng tôi sẽ không đón / trung chuyển tại những địa điểm xe trung chuyển không thể tới được !\n\n11. Thí sinh đi thi đại học vui lòng mang theo CMND và GIẤY BÁO THI. Mọi trường hợp gian lận mua vé không phải thí sinh công ty Phương Trang sẽ KHÔNG chịu trách nhiệm cung cấp vé và hoàn trả tiền.',0),('326304bc-2281-424c-ba51-31dc2cddc884','Tôi có đăng ký vé thành công nhưng tôi không đến bến xe/văn phòng đúng giờ hẹn. Tôi có thể được hỗ trợ sang chuyến đi tiếp theo không?','Trong trường hợp Anh/Chị đến trễ so với chuyến đi đã đăng ký trước đó:\n\nĐối với vé đã thanh toán: Liên hệ trực tiếp với nhân viên tại bến xe/văn phòng vé để được hướng dẫn hỗ trợ.\n\nĐối với vé chưa thanh toán: Anh/Chị có thể đăng ký lại vé khác cho chuyến đi tiếp theo tùy theo thời điểm Anh/Chị có mặt tại bến xe/văn phòng vé.',0),('335ab49e-9375-41ff-b7e2-39270f88bcb1','Tôi đặt vé qua TTTĐ (Trung tâm tổng đài), có thể thanh toán vé bằng hình thức nào?','Thanh toán trực tiếp bằng tiền mặt tại văn phòng vé.\n\nThanh toán trực tuyến qua QR code được gửi tự động về ZALO cá nhân. (Các hình thức như: Thanh toán thẻ VISA/MASTER card, thẻ ATM nội địa (có đăng ký thanh toán trực tuyến và internet banking), ví điện tử (Momo, Zalo, Shopee, VN PAY), ví FUTA PAY.)',0),('3f8348e3-cf83-4203-aa9b-121b8f70e36e','Tôi mua vé qua hình thức Online (website/app) nhưng lại nhập sai thông tin cá nhân (SĐT, họ tên,..) và đã đặt nhầm ngày, tôi phải làm gì?','Anh/Chị vui lòng liên hệ trực tiếp TTTĐ 19006067 gặp BP Online để được hỗ trợ hướng dẫn thêm.\n\nTrường hợp vé online đã thanh toán thành công, Công ty sẽ hỗ trợ chuyển đổi vé 1 lần duy nhất, điều kiện: cùng tuyến đường đi và cùng giá vé và tuyến xe cần chuyển còn trống vé, vé hoàn toàn chưa thay đổi trước đó và vé sau khi thay đổi Công ty không hỗ trợ chuyển đổi lần 2 hoặc hủy vé. (thông tin có hiển thị tại mục \"Điều khoản & Lưu ý\" khi Anh/Chị thao tác mua vé).',0),('56ec8fab-1a5e-4d46-bb98-3960449aa0e7','ĐIỀU KHOẢN ĐẶT VÉ TRỰC TUYẾN','I. ĐIỀU KHOẢN VÀ QUY ĐỊNH CHUNG\nĐiều 1. Giải thích từ ngữ và từ viết tắt\n1. “Biểu phí”: là các loại phí thuế theo quy định của Hãng vận tải và Nhà chức trách;\n\n2. “Bến xe ô tô khách”: là công trình thuộc kết cấu hạ tầng giao thông đường bộ thực hiện chức năng phục vụ xe ô tô đón, trả hành khách và các dịch vụ hỗ trợ vận tải hành khách;\n\n3.  “Chúng tôi”: là Công Ty Cổ Phần Xe Khách Phương Trang FUTA Bus Lines;\n\n4. “Điểm đón/trả”: là điểm khởi hành và điểm đến theo lịch trong hành trình của khách hàng;\n\n5. “Điều kiện bất khả kháng”: là sự kiện xảy ra mang tính khách quan và nằm ngoài tầm kiểm soát của các bên bao gồm, nhưng không giới hạn đến động đất, bão, lũ lụt, lốc, sóng thần, lở đất, hỏa hoạn, chiến tranh hoặc có nguy cơ xảy ra chiến tranh, bạo động, nổi loạn, đình công… và các thảm họa khác chưa lường hết được, sự thay đổi chính sách hoặc ngăn cấm của cơ quan có thẩm quyền của Việt Nam;\n\n6. “Điều kiện vận chuyển”: là các yêu cầu, nội dung của FUTA thông báo đến hành khách liên quan đến các dịch vụ vận chuyển, bao gồm các thông tin được thể hiện trên vé/phiếu xác nhận hành trình và/hoặc trên website, ứng dụng và/hoặc trong điều khoản sử dụng đã được phê duyệt và/hoặc các hình thức công bố khác;\n\n7. “Hành khách”: là bất kỳ cá nhân nào sử dụng dịch vụ của FUTA;\n\n8. “Hành lý”: là những vật phẩm, đồ dùng tư trang và tài sản cá nhân của hành khách mang theo, sử dụng trong chuyến đi của mình, trừ khi được quy định khác đi;\n\n9. “Hợp đồng vận chuyển”: là các thỏa thuận của Hãng vận chuyển và hành khách trong việc cung cấp các dịch vụ theo nhu cầu của hành khách được thể hiện bằng vé hoặc hình thức khác có giá trị tương đương với vé;\n\n10. “Hóa đơn điện tử”: hóa đơn có mã hoặc không có mã của cơ quan thuế được thể hiện ở dạng dữ liệu điện tử do FUTA cung cấp dịch vụ, lập bằng phương tiện điện tử để ghi nhận thông tin, cung cấp dịch vụ theo quy định của pháp luật về kế toán, pháp luật về thuế;\n\n11. “Mã tra cứu”: là mã số bao gồm 9 ký tự được hiển thị trong thông tin mua vé,  dùng cho việc tra cứu hóa đơn điện tử sau khi khách hàng thanh toán thành công;\n\n12. “Mã đặt vé”: là các thông tin chi tiết của Hành khách đã được nhập vào hệ thống đặt giữ chỗ của Chúng tôi thông qua website/hoặc ứng dụng FUTA, Phòng vé, Đại lý, Tổng đài;\n\n13. “Ngày”: có nghĩa là các ngày dương lịch, bao gồm bảy (07) ngày trong tuần; với điều kiện là khi dùng trong việc gửi thông báo thì ngày gửi thông báo đi không được tính và khi dùng cho mục đích xác định;\n\n14.  “Thông tin cá nhân”: Hành khách chấp nhận rằng thông tin cá nhân của hành khách được chuyển cho FUTA vì mục đích sử dụng dịch vụ do FUTA cung cấp. Vì mục đích trên, hành khách đồng ý cho phép FUTA lưu trữ và sử dụng các thông tin cá nhân và chuyển tải các thông tin đó tới hãng vận chuyển, các đại diện ủy quyền phát hành vé, cơ quan nhà nước có thẩm quyền, hoặc các nhà cung cấp dịch vụ liên quan khác;\n\n15. “Thẻ lên xe (vé)”: là bằng chứng xác nhận hợp đồng vận chuyển hành khách và FUTA Bus Lines. Có giá trị đối với hành khách có tên và hành trình được ghi rõ trong vé. Vé có thể được chuyển, hủy theo quy định của FUTA Bus Lines.\n\n16. “ZNS”: là dịch vụ gửi thông báo chăm sóc khách hàng trên Zalo.\n\n17. Đề mục hoặc tiêu đề của mỗi điều của Điều lệ vận chuyển này chỉ được sử dụng cho mục đích thuận tiện tra cứu và không được sử dụng để giải thích nội dung của điều khoản đó.\n\nĐiều 2. Quy định đặt vé trực tuyến\n1. Phạm vi áp dụng: Chương trình thanh toán online được áp dụng cho các chuyến xe nhất định của FUTA Bus Lines. Thành viên của FUTA Bus Lines cũng như khách vãng lai thực hiện được hình thức thanh toán này. Việc đăng ký tham gia Thành viên FUTA Bus Lines là hoàn toàn miễn phí.\n\n2. Đặt chỗ\n\na) Quý khách kiểm tra cẩn thận các thông tin vé trước khi tiến hành xác nhận đặt vé và thanh toán. Bằng việc thanh toán qua website này, Quý khách chấp nhận giờ khởi hành, vị trí ghế ngồi v.v mà Quý khách đã đặt. Quý khách đồng ý rằng, trong những trường hợp có sự thay đổi về chuyến đi hoặc bất khả kháng, chúng tôi có quyền hoàn trả lại bất kỳ vé nào từ việc mua bán qua website này hoặc thực hiện việc chuyển vé cho Quý khách qua chuyến khác theo yêu cầu của Quý khách trong trường hợp chúng tôi còn chỗ;\n\nb) Đặt chỗ chỉ được xác nhận sau khi việc thanh toán tiền vé đã hoàn tất đồng thời FUTA cung cấp cho Hành khách Mã đặt vé xác định tên Hành khách, hành trình, giờ khởi hành, số ghế, giá vé;\n\nc) Chúng tôi sẽ không chịu trách nhiệm về bất kỳ tổn thất nào mà Hành khách có thể phải chịu từ việc đặt chỗ  thông qua bất kỳ tổ chức/cá nhân nào không phải là Chúng tôi hoặc Bên thứ ba được ủy quyền của Chúng tôi.\n\n3. Xác nhận thanh toán: Sau khi hoàn thành việc thanh toán vé trực tuyến, Quý khách sẽ nhận được thư xác nhận thông tin chi tiết vé đã đặt thông qua địa chỉ thư điện tử (email) mà Quý khách đã cung cấp. Đồng thời, chúng tôi cũng sẽ gửi tin nhắn (SMS) hoặc ZNS qua Zalo thông báo mã giao dịch tới số điện thoại Quý khách đăng ký.\n\nLưu ý:\n\na) Chúng tôi không chịu trách nhiệm trong trường hợp Quý khách nhập sai địa chỉ email, số điện thoại và thông tin cá nhân khác dẫn đến không nhận được thư xác nhận. Vì vậy Quý khách vui lòng kiểm tra lại chính xác các thông tin trước khi thực hiện thanh toán. Với email, SMS và ZNS chỉ có tính chất xác nhận thông tin vé sau khi Quý khách đã đặt vé thành công;\n\nb) Chúng tôi đề nghị Quý khách đọc kỹ các thông tin về chuyến đi, giờ khởi hành và chỗ ngồi v.v. trước khi hoàn tất việc xác nhận tất cả các thông tin về vé;\n\nc) Email xác nhận thông tin đặt vé có thể đi vào hộp thư rác (spam mail) của Quý khách, vì vậy hãy kiểm tra trước khi liên lạc với chúng tôi;\n\nd) Sau 30 phút kể từ khi Quý khách thanh toán thành công mà vẫn chưa nhận được bất kỳ xác nhận nào (qua email hoặc SMS/ ZNS), Quý khách vui lòng liên hệ chúng tôi qua tổng đài 1900 6067 để được hỗ trợ. Nếu Quý khách không liên hệ lại coi như FUTA Bus Lines đã hoàn thành nghĩa vụ với Quý khách.\n\n4. Bảo đảm an toàn giao dịch\n\na) Quản lý thông tin nhà cung cấp dịch vụ: FUTA Bus Lines (hoặc bên thứ ba - nhà cung cấp cổng thanh toán điện tử, hoặc/và các bên ký kết khác) sẽ sử dụng các công nghệ đặc biệt để nhận biết các hoạt động giả mạo trên trang mạng như: sử dụng thẻ tín dụng giả v.v. Sự chấp nhận hợp tác của Quý khách cùng với nỗ lực của FUTA Bus Lines là rất cần thiết. Quý khách chấp nhận rằng FUTA Bus Lines có thể chấm dứt quyền truy cập và sử dụng trang mạng của FUTA Bus Lines nếu Quý khách hoặc người khác hành động nhân danh Quý khách vì lý do nào đó nằm trong diện nghi vấn có gian lận hoặc vi phạm các điều khoản này;\n\nb) Kiểm soát giao dịch và thông tin phản hồi khách hàng: FUTA Bus Lines sẽ hết sức cố gắng sử dụng mọi biện pháp và tuân theo mọi cách thức có thể để giữ an toàn cho tất cả các thông tin cá nhân của Quý khách, và chúng tôi cũng sẽ thường xuyên cập nhật những thông tin chính xác nhất. Website này có những công nghệ an ninh đảm bảo việc bảo vệ các thông tin bị thất lạc, lạm dụng hoặc thay đổi. Tất cả các giao dịch và thông tin về thẻ được sử dụng đều được đảm bảo an toàn cho các giao dịch kinh tế ngày nay. Mặc dù vậy, không phải tất cả các dữ liệu truyền qua Internet đều có thể đảm bảo 100%, vì thế chúng tôi không thể đưa ra một sự đảm bảo tuyệt đối rằng mọi thông tin Quý khách cung cấp đều được bảo vệ tất cả mọi lúc.\n\n5. Thông tin cá nhân\n\na) Thông tin cá nhân của Quý khách mà chúng tôi có được trong quá trình giao dịch chỉ dùng vào các mục đích sau:\n\n- Hỗ trợ và giải đáp các thắc mắc của Quý khách;\n\n- Cập nhật các thông tin mới nhất về các chương trình, dịch vụ v.v. của FUTA Bus Lines đến Quý khách.\n\nb) Chúng tôi thu thập và sử dụng thông tin cá nhân của Quý khách phù hợp với mục đích đã nêu bên trên và hoàn toàn tuân thủ nội dung của “Chính sách bảo mật”. Chúng tôi cam kết chỉ sử dụng cho mục đích và phạm vi đã nêu và không tiết lộ cho bất kỳ bên thứ ba nào khi chưa có sự đồng ý bằng văn bản của Quý khách;\n\nc) Xin lưu ý chúng tôi được quyền cung cấp thông tin cá nhân của Quý khách trong trường hợp khi có yêu cầu từ các cơ quan Nhà nước có thẩm quyền.\n\n6. Chính sách hoàn/hủy/đổi vé\n\na) Quy định hoàn trả tiền mua vé Online do lỗi giao dịch\n\n- Các trường hợp hoàn trả tiền mua vé online cho khách do lỗi giao dịch:\n\n- Khách hàng mua vé online giao dịch không thành công (lỗi giao dịch) chưa có Mã đặt vé (code) nhưng đã bị trừ tiền;\n\n- Hiện nay, có một số Thẻ ATM của khách hàng (Thẻ ATM cũ được làm từ 3-4 năm trước) chỉ thực hiện được hình thức chuyển khoản không có chức năng thanh toán trực tuyến nên khi khách hàng thực hiện giao dịch chuyển khoản vào cuối tuần hoặc vào ngày Lễ, Tết, hệ thống ngân hàng không xác nhận tiền trong tài khoản của FUTA Bus Lines nên khách hàng phải thanh toán trực tiếp tại quầy vé (Khách hàng vừa bị trừ tiền trong tài khoản vừa phải ra quầy vé thanh toán tiền mặt lấy vé).\n\nb) Thời gian hoàn trả tiền cho khách hàng\n\n- Đối với Bộ phận Tổng đài: Thời gian hoàn trả tiền tới tài khoản khách hàng là từ 03 ngày đến 05 ngày làm việc kể từ khi Ban Tài chính – Kế toán nhận chứng từ thanh toán;\n\n- Đối với các quầy vé: Giao dịch trực tiếp với khách hàng và hoàn trả ngay thời điểm giao dịch.\n\n- Đối với hoàn trả tiền mua vé qua App: Thời gian theo chính sách của từng nhà phát triển App\n\nc) Quy định thay đổi hoặc hủy vé\n\n- Chỉ được chuyển đổi vé 1 lần duy nhất\n\n- Chi phí hủy vé từ 10% – 30% giá vé tùy thuộc thời gian hủy vé so với giờ khởi hành ghi trên vé và số lượng vé cá nhân/tập thể áp dụng theo các quy định hiện hành.\n\n- Quý khách khi có nhu cầu muốn thay đổi hoặc hủy vé đã thanh toán, cần liên hệ với Trung tâm tổng đài 1900 6067 hoặc quầy vé chậm nhất trước 24h so với giờ xe khởi hành được ghi trên vé, trên email hoặc tin nhắn để được hướng dẫn thêm.\n\n7. Kênh bán vé\n\na) FUTA Bus Lines khuyến cáo Quý khách mua vé lựa chọn một trong các phương thức mua vé bao gồm mua trực tiếp tại website, app, phòng vé chính thức hoặc mua vé qua Tổng đài 1900 6067 để đảm bảo không mua phải vé giả, vé bị nâng giá v.v.;\n\nb) Nếu phát hiện ra Quý khách gian lận, vi phạm điều khoản sử dụng, có hành vi đầu cơ, mua đi bán lại, bán vé chợ đen. FUTA Bus Lines có quyền từ chối cung cấp dịch vụ và không giải quyết các vấn đề phát sinh nếu Quý khách mua vé từ các kênh không thuộc hệ thống bán vé của FUTA Bus Lines.\n\n8. Trung chuyển: Nếu quý khách có nhu cầu trung chuyển, vui lòng liên hệ số điện thoại 1900 6067 trước khi đặt vé. Chúng tôi sẽ không đón/trung chuyển tại những địa điểm xe trung chuyển không thể đến được.\n\nĐiều 3: Quy định vận chuyển\n1. Trẻ em dưới 6 tuổi và phụ nữ có thai\n\na) Trẻ em dưới 6 tuổi, cao từ 1.3m trở xuống, cân nặng dưới 30kg thì không phải mua vé.\n\nb) Phụ nữ có thai cần đảm bảo sức khoẻ trong suốt quá trình di chuyển.\n\n2. Hành lý\n\na) Tổng trọng lượng hành lý không vượt quá 20kg;\n\nb) Đối với hành lý quá khổ, cồng kềnh vui lòng liên hệ Tổng đài 1900 6067\n\n3. Yêu cầu khi lên xe\n\na) Có mặt trước giờ xe khởi hành 30 phút tại Bến đi (đối với ngày lễ tết cần ra trước 60 phút)\n\nb) Xuất trình thông tin vé được gửi qua SMS/Email/Futa App hoặc liên hệ quầy vé để nhận thông tin vé trước khi lên xe.\n\nc) Không mang đồ ăn, thức ăn có mùi lên xe;\n\nd) Không hút thuốc, uống rượu, sử dụng chất kích thích trên xe;\n\ne) Không mang các vật dễ cháy nổ lên xe;\n\nf) Không vứt rác trên xe;\n\ng) Không mang động vật lên xe.\n\nII. CHÍNH SÁCH BẢO MẬT\nĐiều 1. Quy định chung\n1. Nhằm mang lại trải nghiệm tốt nhất cho người dùng trên website của FUTA Bus Lines, thông tin nhận dạng cá nhân hoặc dữ liệu cá nhân của quý khách hàng sẽ được thu thập, sử dụng, tiết lộ, xử lý trong khuôn khổ bảo vệ người dùng;\n\n2. Sau khi đọc Chính sách bảo mật này, quý khách hàng tự quyết định việc chia sẻ dữ liệu cá nhân với chúng tôi. Dữ liệu cá nhân ở đây đề cập đến mọi thông tin liên quan đến một cá nhân có thể định danh/ nhận dạng được. Khi nhấp chọn \"đồng ý\", quý khách hàng thừa nhận rằng quý khách hàng đã đọc, đồng ý và chấp thuận cho chúng tôi thu thập, sử dụng và xử lý Dữ liệu cá nhân theo Chính sách bảo mật này và/hoặc các Điều khoản sử dụng. Đồng thời, quý khách hàng cũng thừa nhận rằng toàn bộ Dữ liệu cá nhân mà quý khách hàng đã cung cấp hoặc sẽ cung cấp là dữ liệu chính chủ, đúng và chính xác.\n\n3.  Tùy từng thời điểm FUTA Bus Lines có thể sửa đổi Chính sách bảo mật này để phản ánh các thay đổi về luật pháp và quy định, thông lệ sử dụng của FUTA Bus Lines, các tính năng Hệ thống và/hoặc các tiến bộ công nghệ. Chúng tôi khuyến khích khách hàng thường xuyên xem lại Chính sách Bảo mật thông tin cá nhân trên FUTA. Cập nhật thông tin liên tục có thể đảm bảo bạn biết và thực hiện tốt quản lý cá nhân.\n\nĐiều 2. Chính sách bảo mật\n1. Thông tin thu thập: Khi được sự đồng ý của quý khách hàng, chúng tôi có thể thu thập Dữ liệu cá nhân của quý khách hàng để cung cấp dịch vụ của chúng tôi cho quý khách hàng khi sử dụng Hệ thống dữ liệu FUTA. Dữ liệu cá nhân bao gồm những thông tin được trình bày như sau:\n\na) Thông tin cá nhân cơ bản: khi quý khách hàng đang sử dụng Hệ thống của chúng tôi, chúng tôi có thể yêu cầu quý khách hàng tạo một tài khoản để tiến hành đặt chỗ. Dữ liệu cá nhân được thu thập sẽ bao gồm, nhưng không giới hạn tên của quý khách hàng, thông tin nhận dạng người dùng và thông tin đăng nhập của FUTA ID, Địa chỉ thư điện tử (email), số điện thoại, địa chỉ và phương thức thanh toán;\n\nb) Thông tin cá nhân cụ thể: chúng tôi có thể thu thập Dữ liệu cá nhân của quý khách hàng dựa trên quá trình quý khách hàng sử dụng Hệ thống của chúng tôi, ví dụ: chi tiết về quyền thành viên thường xuyên cũng như những đánh giá của quý khách hàng. Chúng tôi cũng có thể thu thập một số thông tin nhất định từ quý khách hàng khi quý khách hàng đang sử dụng Hệ thống của chúng tôi, chẳng hạn như vị trí địa lý, địa chỉ IP, tùy chọn tìm kiếm cũng như các dữ liệu liên quan đến việc sử dụng Internet chung khác;\n\nc) Vị trí địa lý: khi được sự đồng ý của quý khách hàng, chúng tôi có thể thu thập Dữ liệu cá nhân của quý khách hàng  về vị trí thực tế của quý khách hàng để cung cấp cho quý khách hàng các ưu đãi ở các vị trí liên quan được cung cấp trên Hệ thống của chúng tôi. Chúng tôi cũng có thể lấy được vị trí gần đúng của quý khách hàng từ địa chỉ IP và GPS của quý khách hàng;\n\nd) Thông tin nhật ký: khi quý khách hàng đang sử dụng Hệ thống của chúng tôi, chúng tôi có thể thu thập dữ liệu của quý khách hàng mà chúng tôi gọi là \"thông tin nhật ký\". Thông tin nhật ký vẫn có thể được thu thập ngay cả khi quý khách hàng không tạo bất kỳ tài khoản nào trên Hệ thống của chúng tôi. Thông tin nhật ký này có thể bao gồm địa chỉ IP, loại trình duyệt, hệ điều hành, quốc tịch, vị trí truy cập trang, nhà cung cấp dịch vụ di động, thông tin thiết bị và lịch sử tìm kiếm cũng như thông tin liên quan đến việc sử dụng internet chung khác. Chúng tôi sử dụng thông tin nhật ký để cung cấp cho người dùng trải nghiệm tốt hơn khi sử dụng Hệ thống của chúng tôi;\n\ne) Cookies và các công nghệ tương tự: chúng tôi có thể sử dụng cookie và/hoặc các công nghệ tương tự (như tập tin chỉ báo-web beacons, thẻ-tags, tập lệnh-scripts). Cookies là một phần nhỏ dữ liệu được lưu trữ trong máy tính hoặc thiết bị di động của quý khách hàng để giúp chúng tôi theo dõi quý khách hàng. Giống như các trang web khác, chúng tôi có thể sử dụng cookies để cung cấp cho quý khách hàng trải nghiệm tốt hơn, vì vậy máy tính và/hoặc thiết bị di động của quý khách hàng sẽ nhận ra quý khách hàng khi quý khách hàng sử dụng Hệ thống của Chúng tôi sau đó. Vui lòng hủy tùy chọn cookies, nếu quý khách hàng muốn chúng tôi dừng tính năng cookies.\n\n2. Mục đích sử dụng thông tin: Chúng tôi sẽ nhận thông tin dữ liệu cá nhân khi khách hàng cài đặt và sử dụng. Khi được sự đồng ý của quý khách hàng, Chúng tôi có thể sử dụng thông tin của quý khách hàng được thu thập thông qua Hệ thống cho các mục đích sau:\n\na) Đăng ký sử dụng và/hoặc truy cập hệ thống;\n\nb) Quản lý, vận hành, quản trị và/hoặc truy cập hệ thống;\n\nc) Liên hệ với quý khách hàng về các vấn đề liên quan đến việc quý khách hàng sử dụng và/hoặc truy cập vào Hệ thống và quản lý các truy vấn và/hoặc yêu cầu do quý khách hàng gửi qua Hệ thống;\n\nd) Tùy chỉnh trải nghiệm của quý khách hàng khi sử dụng hệ thống và cải thiện trải nghiệm và sự hài lòng của khách hàng;\n\ne)  Thực thi các quy định trong các Điều khoản và Điều kiện của chúng tôi;\n\nf)  Giải quyết tranh chấp, thu tiền thanh toán còn tồn đọng và xử lý sự cố và/hoặc cho các mục đích về tiếp thị như:\n\n- Tiếp thị truyền thống trong đó, bao gồm nhưng không giới hạn, gửi email cho quý khách hàng về các sản phẩm mới, khuyến mại đặc biệt và các cuộc khảo sát hoặc các thông tin khác mà chúng tôi nghĩ quý khách hàng có thể thấy thú vị;\n\n- Tiếp thị kỹ thuật số bao gồm, nhưng không giới hạn truyền thông xã hội, quảng cáo hiển thị, tối ưu hóa công cụ tìm kiếm (\"SEO\"), tiếp thị qua công cụ tìm kiếm (\"SEM\"), thông báo đẩy (Push Notification) bằng cách sử dụng các kỹ thuật đồ thị mở.\n\n3. Chia sẻ Dữ liệu cá nhân: Tùy thuộc vào từng trường hợp cụ thể phải cung cấp thông tin cho những người hoặc các tổ chức có thể được tiếp cận, FUTA Bus Lines có thể tiết lộ Dữ liệu cá nhân của quý khách hàng với các điều kiện sau:\n\na) Cung cấp thông tin khi có sự chấp thuận: Chúng tôi chỉ chia sẻ Dữ liệu cá nhân của quý khách hàng với Bên thứ ba khi Chúng tôi nhận được sự chấp thuận của quý khách hàng cho phép Chúng tôi làm như vậy. Chúng tôi sẽ cần sự chấp thuận của quý khách hàng để chia sẻ bất kỳ Dữ liệu cá nhân nhạy cảm nào, theo yêu cầu của luật pháp và quy định hiện hành. Khi nhấp chọn nút \"Đồng ý\", quý khách hàng đã thiết lập một hành động khẳng định rõ ràng và một thỏa thuận tự nguyện, cụ thể, đã hiểu rõ và không mơ hồ về việc xử lý Dữ liệu cá nhân. Điều này có thể bao gồm cả việc chia sẻ Dữ liệu cá nhân đã thu thập cho Bên thứ ba;\n\nb) Cung cấp thông tin vì lý do pháp lý: Chúng tôi có thể có toàn quyền quyết định về việc chia sẻ Dữ liệu cá nhân của quý khách hàng với Bên thứ ba nếu chúng tôi cho rằng việc chia sẻ dữ liệu là cần thiết để:\n\n- Tuân thủ luật pháp và quy định hiện hành;\n\n- Thực thi các Điều khoản và Điều kiện của Chúng tôi;\n\n- Điều tra bất kỳ hành vi gian lận hoặc hành vi bất hợp pháp nào;\n\n- Bảo vệ thương hiệu, uy tín cũng như tài sản của Chúng tôi.\n\n4. Bảo mật dữ liệu cá nhân\n\na) Cam kết bảo mật:\n\n- Chúng tôi nỗ lực đảm bảo cung cấp thông tin có trách nhiệm và hệ thống hoạt động chính xác;\n\n- FUTA Bus Lines mong muốn mang lại cảm giác an toàn cho khách hàng khi sử dụng dịch vụ mua vé xe online. Chúng tôi cam kết bảo vệ tất cả thông tin mà Chúng tôi nhận được từ khách hàng. Để ngăn chặn truy cập trái phép, đảm bảo sử dụng đúng thông tin, Chúng tôi sẽ sử dụng các phương pháp và công nghệ bảo mật Internet hợp lý.\n\nb) An toàn dữ liệu: Chúng tôi đã và đang thực hiện nhiều biện pháp an toàn, bao gồm:\n\n- Chúng tôi lưu trữ không tin cá nhân khách hàng trong môi trường vận hành an toàn. Chỉ có nhân viên, đại diện và nhà cung cấp mới có thể truy cập khi cần phải biết;\n\n-  Chúng tôi tuân theo các tiêu chuẩn ngành, pháp luật trong việc bảo mật thông tin cá nhân khách hàng.\n\n5. Lưu trữ Dữ liệu cá nhân\n\na) Miễn là thông tin của quý khách hàng vẫn còn tồn tại, chúng tôi sẽ lưu Dữ liệu cá nhân của quý khách hàng để cung cấp các dịch vụ khi cần. Chúng tôi sẽ ngừng lưu trữ Dữ liệu cá nhân hoặc với nỗ lực hợp lý để xóa các phương tiện có liên quan đến Dữ liệu cá nhân của Quý khách hàng, ngay khi:\n\n- Mục đích thu thập Dữ liệu cá nhân không còn phù hợp với việc lưu trữ dữ liệu;\n\n- Khách hàng yêu cầu hủy bỏ.\n\nb) Thời gian lưu trữ dữ liệu bắt đầu từ khi FUTA BUSLINES nhận được yêu cầu lưu trữ dữ liệu đến khi kết thúc yêu cầu. Thời gian lưu trữ tối thiểu là 24 tháng.\n\n6. Quyền của khách hàng đối với Dữ liệu cá nhân: Quý khách hàng có quyền cập nhật, thay đổi hoặc hủy bỏ Dữ liệu cá nhân bất kỳ lúc nào. Trong các tình huống cần lưu ý dưới đây:\n\na) Phương thức truy cập hoặc chỉnh sửa Dữ liệu cá nhân: Khi quý khách hàng cung cấp cho Chúng tôi Dữ liệu cá nhân của quý khách hàng, vui lòng đảm bảo rằng những dữ liệu đó là chính xác và đầy đủ. Nếu quý khách hàng tin rằng bất kỳ thông tin nào mà Chúng tôi đang nắm giữ có sai sót hoặc thiếu sót, vui lòng đăng nhập vào tài khoản của quý khách hàng trên Hệ thống và sửa lại thông tin. Ngoài ra, quý khách hàng nên nhanh chóng cập nhật Dữ liệu cá nhân thông qua tài khoản nếu có bất kỳ thay đổi nào;\n\nb) Rút lại sự chấp thuận: Quý khách hàng có thể rút lại sự chấp thuận đối với việc thu thập, sử dụng hoặc tiết lộ Dữ liệu cá nhân của Chúng tôi bằng cách gửi thông báo hợp lý cho Chúng tôi theo thông tin liên hệ trình bày bên dưới. Theo yêu cầu của quý khách hàng, Chúng tôi sẽ ngừng thu thập, sử dụng hoặc tiết lộ Dữ liệu cá nhân của quý khách hàng, trừ khi pháp luật yêu cầu hoặc nếu Chúng tôi có các mục đích kinh doanh hoặc pháp lý hợp pháp để giữ lại dữ liệu đó;\n\nLưu ý: khi Quý khách hàng rút lại sự đồng thuận đối với việc thu thập, sử dụng hoặc tiết lộ Dữ liệu cá nhân sẽ khiến Chúng tôi không thể tiếp tục cung cấp cho quý khách hàng các dịch vụ của Chúng tôi và quý khách hàng đồng ý rằng Chúng tôi sẽ không chịu trách nhiệm với quý khách hàng về bất kỳ tổn thất hoặc thiệt hại nào phát sinh từ hoặc liên quan đến việc chấm dứt dịch vụ như vậy.\n\nc) Xóa Dữ liệu cá nhân: Quý khách hàng có thể yêu cầu xóa Dữ liệu cá nhân của quý khách hàng do Chúng tôi thu thập và xử lý, bằng cách gửi cho Chúng tôi một lý do hợp lý và thông báo cho Chúng tôi theo thông tin liên hệ của Chúng tôi được trình bày bên dưới.\n\n7. Đăng ký và quyền thành viên: Hệ thống này cho phép quý khách hàng tạo tài khoản người dùng dựa trên dữ liệu quý khách hàng cung cấp. Bằng cách cung cấp dữ liệu, đăng ký và tạo tài khoản của quý khách hàng, quý khách hàng đảm bảo rằng:\n\na) Quý khách hàng đã đủ 18 tuổi;\n\nb) Thông tin về quý khách hàng là đúng và chính xác, ở thời điểm hiện tại và đầy đủ theo yêu cầu trong mẫu đăng ký trên Hệ thống \"Dữ liệu đăng ký\" và Quý khách hàng sẽ cập nhật Dữ liệu đăng ký này để duy trì tính chính xác và đầy đủ.\n\nThông tin liên hệ của FUTA Bus Lines: Nếu quý khách hàng có bất kỳ câu hỏi hoặc yêu cầu nào liên quan đến Chính sách Bảo mật này, vui lòng liên hệ với Chúng tôi qua: hotro@futabus.vn hoặc gọi đến số điện thoại 1900 6067.',0),('66df2ea0-80dd-4f32-84ae-117fc7af5a09','Giá vé dịp Lễ,Tết sẽ có sự thay đổi như thế nào?','Giá vé xe của Công ty vào dịp Lễ, Tết sẽ thay đổi theo quy định của Sở Kế hoạch và Đầu tư.',0),('73048033-43c4-418a-bdc1-7ddd85f4abde','Tôi đã mua vé thành công, tuy nhiên tôi đã vô tình xóa thông tin xác nhận được gửi qua email/sms. Tôi phải làm gì?','Anh/Chị vui lòng liên hệ trực tiếp trung tâm tổng đài 19006067 gặp BP Online để được hỗ trợ hướng dẫn thêm.',0),('7c2f931f-e97e-42d5-911f-3eaf00c0e425','Tôi là khách hàng thường xuyên, có nhu cầu đi lại giữa các tỉnh khác nhiều, vậy có ưu đãi gì không?','Hiện tại Công ty thường có những chương trình ưu đãi khi khách hàng mua vé xe qua các ứng dụng app có liên kết với Công ty (app Momo , Zalo, VN Pay,..).\n\nCác thông tin của chương trinh khuyến mã sẽ luôn được cập nhật tại website hoặc fanpage của Công ty.',0),('839f3d65-e743-477c-a443-cf2ba8717139','Tôi đã mua vé thành công, làm sao để tôi có thể kiểm tra lại thông tin chuyến đi đã mua?','Để kiểm tra thông tin vé đã đặt:\n\n1. Trường hợp đặt vé online trên Website, vui lòng kiểm tra tin nhắn xác nhận được gửi về số điện thoại đặt vé hoặc qua email.\n\n2. Trường hợp đặt vé online trên App FUTA, vui lòng kiểm tra mục lịch sử mua vé trên App hoặc qua email.\n\n3. Trường hợp đặt vé online trên App liên kết với Công ty, vui lòng kiểm tra thông tin được hiển thị ngay trên app.\n\n4. Trường hợp đặt vé qua tổng đài, vui lòng kiểm tra tin nhắn xác nhận từ Zalo của Phương Trang Futa Buslines.',0),('980993ad-af62-42be-a35c-0bfaf1e48c56','Giá vé được hiển thị trên website của các chuyến đi đã bao gồm những phí gì?','Giá vé xe của Công ty đã bao gốm thuế VAT, phí bảo hiểm du lịch và không phát sinh thêm phụ phí.',0),('add4db3d-e279-4eb6-8632-ec1d313c71a5','Khách hàng có thể biết được khi chuyến xe đã mua có sự thay đổi (giờ xe khởi hành/..v..v) ?','Công ty sẽ chủ động liên hệ khách hàng để thông tin/thông báo về sự việc thay đổi chuyến đi của khách cũng như hướng khắc phục, giải quyết thỏa đáng trong điều kiện nhanh nhất có thể.',0),('b9965918-450d-4c94-8db0-d97394d517d7','Trường hợp mua vé bằng hình thức online, có thể thanh toán bằng hình thức nào?','Thanh toán thẻ VISA/MASTER card,\n\nThẻ ATM nội địa (có đăng ký thanh toán trực tuyến và internet banking),\n\nVí điện tử (Momo, Zalo, Shopee, VN PAY), ví FUTA PAY.',0),('be089279-0029-4170-8ebe-aa9dbba5c4fc','Chính sách mua vé trẻ em','Chính sách mua vé dành cho trẻ em như thế nào?\nTheo quy định của Công ty:\n\nTrẻ em từ 6 tuối trở lên: Vé tương đương với giá vé người lớn thông thường.\n\nTrẻ em dưới 6 tuổi, chiều cao dưới 1.3m, cân nặng dưới 30kg: Có thể đi kèm với người lớn ( 1 người lớn chỉ được kèm 1 trẻ).',0),('bf4efab5-7bd7-4ac0-b20a-7aba97c087b6','Tôi có thể mua vé của FUTA Bus Lines bằng các hình thức nào?','Mua vé trực tiếp tại các văn phòng vé Phương Trang.\n\nMua vé qua hình thức webiste/app FUTA/app liên kết với Công ty\n\nĐăng ký vé giữ chỗ qua Trung Tâm Tổng Đài -Thanh toán trực tuyến bằng hình thức QR code',0),('c10bb86b-78b8-4636-89ae-12c593fad28b','Trong trường hợp tôi có nhu cầu cần hủy vé, tôi phải làm gì?','Trong trường hợp Anh/Chị có nhu cầu hủy vé:\n\n1. Trường hợp đã mua vé giấy/mua vé trực tiếp tại văn phòng vé: Vui lòng mang đầy đủ liên vé đến quầy hủy trực tiếp.\n\n2. Trường hợp mua vé Online (qua hình thức website, các app liên kết khác): Vui lòng mang mã code vé (hoặc liên vé nếu đã đổi ra vé giấy) + CMND trùng tên vé đến quầy hủy trực tiếp.\n\n# Thời gian hủy vé: Từ 1 - 3 vé: trước ít nhất 4 tiếng giờ khởi hành.\n\nTừ 4 - 9 vé: trước ít nhất 24 tiếng giờ khởi hành.\n\nTừ 10 vé trở lên: trước ít nhất 48 tiếng giờ khởi hành.\n\n# Lưu ý: * Phí hủy áp dụng:\n\n+ Trước ít nhất 4 tiếng giờ khởi hành: 10%/vé.\n\n+ Trước ít nhất 30 phút giờ khởi hành: 30%/vé\n\n+ Sau 30 phút: Không hỗ trợ hủy\n\n3. trường hợp mua vé Online (qua hình thức app FUTA): Vui lòng truy cập App, chọn mục \"Lịch sử\" (được thể hiện ở phía dưới màn hình, cùng vị trí ngang với mục \"Trang chủ\") chọn vé cần hủy => bấm hủy.\n\n# Lưu ý:\n\n--Hủy vé trên ứng dụng FUTA sẽ hủy đồng loạt tất cả các vé trên cùng 1 mã vé, không thể tách riêng.\n\n--Từ 1-3 vé hủy trước ít nhất 24 tiếng giờ khởi hành, phí hủy 10% (vé ngày thường).\n\n--Tiền hủy vé sẽ được hoàn lại tài khoản thanh toán ban đầu (7-15 ngày tùy vào thời gian làm việc của Ngân hàng).\n\n*Quy địnnh trên sẽ không áp dụng hủy vé nếu vé đã thay đổi (giờ, ngày khởi hành) trước đó.',0),('c217019f-e8a4-4099-803c-32bb8308bd3c','Tôi có thể mang thú cưng (động vật sống) trên xe được không?','Mong Anh/Chị thông cảm theo quy định của Công Ty Phương Trang, chúng tôi không nhận vận chuyển động vật sống/thú cưng trên xe.',0),('c276146a-4385-4f45-9bbf-dc5eca76ef9c','Sẽ có bất kỳ phụ phí nào ngoài giá vé được hiển thị trên website?','Không có bất kỳ phụ phí nào ngoài tổng số tiền (giá vé) được hiển thị trên website.\n\nTrừ trường hợp hành lý đi kèm với khách vượt quá mức quy định (quá 20kg) thì bắt buộc khách hàng phải thêm phí hàng hóa theo kèm.',0),('dcde86a2-ee73-4e26-a905-4d43ba3c7344','Tôi có thể hút thuốc, ăn uống (thực phẩm nặng mùi) trên xe được không?','Để đảm bảo sức khỏe và vệ sinh chung, Anh/Chị vui lòng không hút thuốc, không ăn uống (những thực phẩm nặng mùi) trên xe.',0),('f95dc2ad-c70f-4166-a060-8f4647a7007b','Dịch vụ đi kèm trên xe khi sử dụng dịch vụ là gì?','Dịch vụ đi kèm, không tính phí bao gồm:\n\nKhăn, nước, dép đi lại khi lên xuống xe giường nằm.\n\nTivi (áp dụng đối với loại xe limousine 34 giường), mền, wifi.\n\nDịch vụ trung chuyển tại các văn phòng tỉnh thành (trong khu vực phạm vi cho phép, nội ô bán kính 8-10km tùy thuộc địa điểm).',0),('fac037a9-8dd5-4ccd-98c2-89808f7b71b2','Ngoài hình thức mua vé qua website thì tôi có thể chọn vị trí chỗ ngồi qua các hình thức mua vé khác không?','Anh/Chị có thể yêu cầu vị trí chỗ ngồi theo nhu cầu cá nhân khi đăng ký vé giữ chỗ qua hotline 19006067.\n\nAnh/Chị có thể yêu cầu vị trí chỗ ngồi theo nhu cầu cá nhân khi mua vé trực tiếp tại các văn phòng vé.',0),('fb5c775c-5b54-42e6-93f1-4b5be147e8bb','Trường hợp tôi mua vé online, tài khoản cá nhân đã thông báo giao dịch thành công nhưng tôi vẫn chưa nhận được thông tin xác nhận, tôi phải làm gì và liên hệ với bộ phận nào?','Trong trường hợp trên, Anh/Chị vui lòng liên hệ ngay TTTĐ 19006067 gặp Bộ Phận Online hoặc nhắn tin trực tiếp với nhân viên CSKH ngay trên website cung cấp đầy đủ thông tin để được hỗ trợ.',0);
/*!40000 ALTER TABLE `document_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-24  0:56:32
