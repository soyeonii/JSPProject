-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: cgvdb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `code` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `director` varchar(50) DEFAULT NULL,
  `actor` varchar(50) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `rating` varchar(50) DEFAULT NULL,
  `runningTime` int DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `plot` text,
  `fileName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES ('M0002','마녀(魔女) Part2. The Other One','박훈정','신시아, 박은빈, 서은수','액션','15세이상관람가',137,'한국','2022-06-15','통제불능의 존재가 세상 밖으로 나왔다!\r\n \r\n‘자윤’이 사라진 뒤, 정체불명의 집단의 무차별 습격으로 마녀 프로젝트가 진행되고 있는 ‘아크’가 초토화된다.\r\n그곳에서 홀로 살아남은 ‘소녀’는 생애 처음 세상 밖으로 발을 내딛고\r\n우연히 만난 ‘경희’의 도움으로 농장에서 지내며 따뜻한 일상에 적응해간다.\r\n한편, ‘소녀’가 망실되자 행방을 쫓는 책임자 ‘장’과\r\n마녀 프로젝트의 창시자 ‘백총괄’의 지령을 받고 제거에 나선 본사 요원 ‘조현’,\r\n‘경희’의 농장 소유권을 노리는 조직의 보스 ‘용두’와\r\n상해에서 온 의문의 4인방까지\r\n각기 다른 목적을 지닌 세력이 하나 둘 모여들기 시작하면서 ‘소녀’ 안에 숨겨진 본성이 깨어나는데…\r\n \r\n모든 것의 시작,\r\n더욱 거대하고 강력해진 마녀가 온다.','Witch2.jpg'),('M0003','헤어질 결심','박찬욱','탕웨이, 박해일, 이정현','로맨스/멜로','15세이상관람가',138,'한국','2022-06-29','산 정상에서 추락한 한 남자의 변사 사건.\r\n담당 형사 \'해준\'(박해일)은\r\n사망자의 아내 \'서래\'(탕웨이)와 마주하게 된다.\r\n\r\n\"산에 가서 안 오면 걱정했어요, 마침내 죽을까 봐.\"\r\n\r\n남편의 죽음 앞에서 특별한 동요를 보이지 않는 \'서래\'.\r\n경찰은 보통의 유가족과는 다른 \'서래\'를 용의선상에 올린다.\r\n\'해준\'은 사건 당일의 알리바이 탐문과 신문,\r\n잠복수사를 통해 \'서래\'를 알아가면서\r\n그녀에 대한 관심이 점점 커져가는 것을 느낀다.\r\n\r\n한편, 좀처럼 속을 짐작하기 어려운 ‘서래’는\r\n상대가 자신을 의심한다는 것을 알면서도\r\n조금의 망설임도 없이 ‘해준’을 대하는데…','DecisionToLeave1.jpg'),('M0004','범죄도시 2','이상용','마동석, 손석구, 최귀화','범죄','15세이상관람가',106,'한국','2022-05-18','“느낌 오지? 이 놈 잡아야 하는 거”\r\n\r\n가리봉동 소탕작전 후 4년 뒤,\r\n금천서 강력반은 베트남으로 도주한 용의자를 인도받아 오라는 미션을 받는다.\r\n\r\n괴물형사 ‘마석도’(마동석)와 ‘전일만’(최귀화) 반장은 현지 용의자에게서 수상함을 느끼고,\r\n그의 뒤에 무자비한 악행을 벌이는 ‘강해상’(손석구)이 있음을 알게 된다.\r\n\r\n‘마석도’와 금천서 강력반은 한국과 베트남을 오가며\r\n 역대급 범죄를 저지르는 ‘강해상’을 본격적으로 쫓기 시작하는데...','TheRoundup.jpg'),('M0005','브로커','고레에다 히로카즈','송강호, 강동원, 배두나','드라마','12세이상관람가',129,'한국','2022-06-08','세탁소를 운영하지만 늘 빚에 시달리는 ‘상현’(송강호)과\r\n베이비 박스 시설에서 일하는 보육원 출신의 ‘동수’(강동원).\r\n거센 비가 내리는 어느 날 밤,\r\n그들은 베이비 박스에 놓인 한 아기를 몰래 데려간다.\r\n하지만 이튿날, 생각지 못하게 엄마 ‘소영’(이지은)이 아기 ‘우성’을 찾으러 돌아온다.\r\n아기가 사라진 것을 안 소영이 경찰에 신고하려 하자 솔직하게 털어놓는 두 사람.\r\n우성이를 잘 키울 적임자를 찾아 주기 위해서 그랬다는 변명이 기가 막히지만\r\n소영은 우성이의 새 부모를 찾는 여정에 상현, 동수와 함께하기로 한다.\r\n\r\n한편 이 모든 과정을 지켜본 형사 ‘수진’(배두나)과 후배 ‘이형사’(이주영).\r\n이들을 현행범으로 잡고 반 년째 이어온 수사를 마무리하기 위해 조용히 뒤를 쫓는다.','Broker.jpg'),('M0006','극장판 윌벤져스-수상한 캠핑 대소동','신창환','샘 해밍턴, 김서영, 강시현','애니메이션','전체관람가',79,'한국','2022-06-23','사고뭉치 초보 히어로 ‘윌벤져스’의 판타스틱 어드벤처!\r\n동물들과의 대화는 물론, 공룡 젤리를 먹고 엄청난 초능력을 발휘하는 ‘윌리엄’과 ‘벤틀리’는 슈퍼 히어로가 되고 싶은 사고뭉치 히어로 꿈나무들.\r\n어느 날, 샘 아빠와 함께 즐거운 캠핑 여행을 떠난 ‘윌벤져스’는 놀이터에서 신비로운 능력을 가진 여우 소녀 ‘미호’를 만나 친구가 된다\r\n깊은 숲속 신비한 여우굴로 향한 ‘윌벤져스’는 ‘미호’의 놀라운 비밀을 알게 되고, ‘미호’ 가족을 노리는 사냥꾼들의 습격으로 모두가 큰 위험에 빠지고 마는데…\r\n과연 ‘윌벤져스’는 아빠와 친구를 구하고, 무사히 캠핑을 마칠 수 있을까?!','Wilvengers.jpg'),('M0007','버즈 라이트이어','앤거스 맥클레인','크리스 에반스, 타이카 와이티티, 피터 손','애니메이션','전체관람가',105,'미국','2022-06-15','우주 저 너머 운명을 건 미션, 무한한 모험이 시작된다!\r\n\r\n미션 #1\r\n나, 버즈 라이트이어.\r\n인류 구원에 필요한 자원을 감지하고 현재 수많은 과학자들과 미지의 행성으로 향하고 있다.\r\n이번 미션은 인류의 역사를 새롭게 쓸 것이라 확신한다.\r\n\r\n미션 #2\r\n잘못된 신호였다.\r\n이곳은 삭막하고 거대한 외계 생물만이 살고 있는 폐허의 땅이다.\r\n나의 실수로 모두가 이곳에 고립되고 말았다.\r\n모두를 구하기 위해서 모든 것을 제자리에 돌려 놔야 한다.\r\n\r\n미션 #3\r\n실수를 바로잡기 위한 탈출 미션을 위해 1년의 준비를 마쳤다.\r\n어쩌다 한 팀이 된 정예 부대와 이 미션을 수행할 예정이다.\r\n우주를 집어삼킬 ‘저그’와 대규모 로봇 군사의 위협이 계속되지만\r\n나는 절대 포기할 수 없다.\r\n그런데… 여긴 또 어디지? 시간 속에 갇힌 건가?','Lightyear.jpg'),('M0008','탑건-매버릭','조셉 코신스키','톰 크루즈, 마일즈 텔러, 제니퍼 코넬리','액션','12세이상관람가',130,'미국','2022-06-22','최고의 파일럿이자 전설적인 인물 매버릭(톰 크루즈)은 자신이 졸업한 훈련학교 교관으로 발탁된다. \r\n그의 명성을 모르던 팀원들은 매버릭의 지시를 무시하지만 실전을 방불케 하는 상공 훈련에서 눈으로 봐도 믿기 힘든 전설적인 조종 실력에 모두가 압도된다. \r\n\r\n매버릭의 지휘아래 견고한 팀워크를 쌓아가던 팀원들에게 국경을 뛰어넘는 위험한 임무가 주어지자\r\n매버릭은 자신이 가르친 동료들과 함께 마지막이 될 지 모를 하늘 위 비행에 나서는데… ','TopGun.jpg');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `code` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('P0001','리얼치즈팝콘',4500),('P0002','카라멜팝콘',4500),('P0003','죠스떡볶이',5500),('P0004','오징어',3500),('P0005','치킨스틱나쵸',5000),('P0006','칠리치즈나쵸',4500),('P0007','치즈볼',4500),('P0008','핫도그',4000),('P0009','맛밤',3500),('P0010','콜라',2500),('P0011','사이다',2500);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `number` int NOT NULL,
  `id` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `seat` varchar(10) NOT NULL,
  `reservationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`number`,`seat`),
  KEY `code` (`code`),
  KEY `id` (`id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`code`) REFERENCES `movie` (`code`) ON DELETE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'hyewon','M0008','S2','2022-06-22 03:47:18'),(1,'hyewon','M0008','S3','2022-06-22 03:47:18'),(1,'hyewon','M0008','S4','2022-06-22 03:47:18'),(2,'jihun','M0008','Y4','2022-06-22 03:52:30'),(3,'jihun','M0002','Y1','2022-06-22 03:53:43'),(3,'jihun','M0002','Y2','2022-06-22 03:53:43'),(3,'jihun','M0002','Y3','2022-06-22 03:53:43'),(4,'jihun','M0003','S3','2022-06-22 03:54:07'),(4,'jihun','M0003','S4','2022-06-22 03:54:07'),(5,'jimin','M0008','Y1','2022-06-22 04:06:29'),(5,'jimin','M0008','Y2','2022-06-22 04:06:29'),(6,'jimin','M0002','S3','2022-06-22 04:07:00'),(6,'jimin','M0002','S4','2022-06-22 04:07:00'),(7,'jimin','M0003','L3','2022-06-22 04:07:16'),(8,'jimin','M0006','S2','2022-06-22 04:07:44'),(9,'jimin','M0007','Y4','2022-06-22 04:08:08'),(12,'jisoo','M0008','L1','2022-06-22 04:10:22'),(12,'jisoo','M0008','L2','2022-06-22 04:10:22'),(12,'jisoo','M0008','L3','2022-06-22 04:10:22'),(13,'jisoo','M0002','Y4','2022-06-22 04:11:16'),(14,'jisoo','M0004','L4','2022-06-22 04:12:10'),(14,'jisoo','M0004','L5','2022-06-22 04:12:10'),(15,'jisoo','M0003','Y1','2022-06-22 04:12:42'),(15,'jisoo','M0003','Y2','2022-06-22 04:12:42'),(15,'jisoo','M0003','Y3','2022-06-22 04:12:42'),(15,'jisoo','M0003','Y4','2022-06-22 04:12:42'),(16,'jisoo','M0005','L4','2022-06-22 04:13:26'),(16,'jisoo','M0005','L5','2022-06-22 04:13:26'),(17,'jisoo','M0007','Y3','2022-06-22 04:15:07'),(18,'jisoo','M0006','S3','2022-06-22 04:15:15'),(18,'jisoo','M0006','S4','2022-06-22 04:15:15'),(20,'miyeon','M0008','S5','2022-06-22 04:19:05'),(20,'miyeon','M0008','Y3','2022-06-22 04:19:05'),(20,'miyeon','M0008','Y5','2022-06-22 04:19:05'),(21,'miyeon','M0002','Y5','2022-06-22 04:20:30'),(22,'yerin','M0008','L4','2022-06-22 04:25:39'),(22,'yerin','M0008','L5','2022-06-22 04:25:39'),(23,'soyeon','M0008','S1','2022-06-22 04:28:08'),(24,'soyeon','M0002','S1','2022-06-22 04:29:17'),(24,'soyeon','M0002','S2','2022-06-22 04:29:17'),(25,'soyeon','M0004','S2','2022-06-22 04:42:38'),(25,'soyeon','M0004','S3','2022-06-22 04:42:38'),(25,'soyeon','M0004','S4','2022-06-22 04:42:38'),(26,'soyeon','M0005','Y2','2022-06-22 04:42:45'),(26,'soyeon','M0005','Y3','2022-06-22 04:42:45');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `code` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  `star` int DEFAULT NULL,
  `content` text,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`code`,`id`),
  KEY `id` (`id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`code`) REFERENCES `movie` (`code`) ON DELETE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('M0002','hyewon',3,'지루하지만 액션은 최고','2022-06-22 03:45:49'),('M0002','jihun',4,'평이 별루라 기대 안하고 관람햇는데 저는 마녀1보다 더 재밌게 관람했어요 여주 표정연기 완전 굿','2022-06-22 03:54:35'),('M0002','jimin',3,'','2022-06-22 04:07:26'),('M0002','jisoo',5,'좋았습니다 3편이 기대','2022-06-22 04:11:45'),('M0002','miyeon',3,'볼만은한데 액션도 거진없고 마지막에 쬐금있어요 그리구 마무리가 3리을 위해 너무 무심한거같아요','2022-06-22 04:20:50'),('M0002','seokjin',3,'어.. 액션은 화려한데 스토리 따라가기가 쉽지 않다','2022-06-22 04:35:15'),('M0002','soyeon',5,'진짜 연기력에 빠지고 스토리에 빠집니다.','2022-06-22 04:28:34'),('M0002','yerin',2,'1편은 너무 신선하고 소재와 충격적이고 액션감 및 배우 캐스팅 연기력까지 완벽했는데 너무 기대를 많이 했나봅니다 많이 지루했어요.. 3편이 나올것 같은데 음..솔직히 기대가 크게 되지않습니다 ㅠㅠ','2022-06-22 04:26:39'),('M0003','hyewon',4,'마침내! 이 아름답고 시린 영화','2022-06-22 03:46:12'),('M0003','jihun',5,'여운이 짙게 남는 영화다','2022-06-22 03:55:18'),('M0003','jimin',3,'','2022-06-22 04:07:21'),('M0003','jisoo',4,'박찬욱 감독의 감각적인 연출과 탕웨이의 맛깔진 연기가 빛난다','2022-06-22 04:12:55'),('M0003','miyeon',4,'클라스를 보여주는 극본, 연출, 연기, 미술, 음악','2022-06-22 04:20:09'),('M0003','soyeon',3,'헤어질 결심 Decision To Leave','2022-06-22 04:30:21'),('M0003','yerin',5,'','2022-06-22 04:27:04'),('M0004','hyewon',5,'와 미쳤다 재미도 있고 소름이였음','2022-06-22 03:49:19'),('M0004','jihun',5,'너무 재미있었어요(❁´▽`❁)','2022-06-22 03:56:51'),('M0004','jimin',3,'','2022-06-22 04:08:37'),('M0004','jisoo',4,'액션이 끝내주네요 관람하는 내내 지루하지않고 너무 재미있었어요','2022-06-22 04:12:22'),('M0004','miyeon',5,'역시 마동석이 장르다 굿','2022-06-22 04:21:14'),('M0004','soyeon',5,'이 시국에 왜 1000만인지, 왜 마동석인지... 그리고 손석구 최고였습니다.','2022-06-22 04:30:49'),('M0004','yerin',5,'','2022-06-22 04:27:14'),('M0005','hyewon',0,'감독의 기대값을 충족하기엔…','2022-06-22 03:48:54'),('M0005','jihun',3,'브로커 생각한 내용은 아니엇으나 그래도 볼만은했습니다','2022-06-22 03:57:29'),('M0005','jimin',3,'','2022-06-22 04:08:49'),('M0005','jisoo',4,'따뜻한 가족영화 믿고보는배우','2022-06-22 04:13:45'),('M0005','miyeon',1,'재미는 없었지만 안졸고 볼 정도였어요','2022-06-22 04:21:55'),('M0005','soyeon',4,'태어나줘서 고마워. 브로커. 영화는 보는 내내 위로를 받고있는 느낌. 후반으로 갈수록 더욱 고조되는 감정들에 격렬하게 영화속에 스며들 수 있었던. 배우들의 탄탄한 연기력과 완벽한 연출 그리고 믿고보는 이지은 배우님!','2022-06-22 04:31:24'),('M0005','yerin',5,'','2022-06-22 04:27:25'),('M0006','hyewon',4,'귀여운 윌벤져스♥','2022-06-22 03:46:33'),('M0006','jihun',4,'캐릭터 찰떡이네요ㅎㅎ','2022-06-22 03:55:52'),('M0006','jimin',3,'','2022-06-22 04:07:33'),('M0006','jisoo',5,'윌벤져스 짱 팬인데 무대인사도 보고 너무 좋았어요ㅠㅠ 벤토리랑 똑닮은 캐릭터! 엔딩 노래까지 최고... 조카들 데리고 또 보려구요','2022-06-22 04:14:39'),('M0006','miyeon',4,'윌벤 아기들도 정말 실사처럼 귀엽고 다른 캐릭터들도 귀여워요! 동물들 털 표현 연출이 실감나서 신기했음','2022-06-22 04:22:23'),('M0006','soyeon',5,'너무 귀여워~~~~','2022-06-22 03:40:01'),('M0006','yerin',5,'','2022-06-22 04:27:32'),('M0007','hyewon',4,'즐겁게 보았습니다 무한한 공간, 저 너머로!','2022-06-22 03:46:53'),('M0007','jihun',2,'늘 도심을 자극하는듯. 온가족 볼 영화 인데 스토리 전개가 너무 따분해서 중간 중간 지겹게 느껴지는듯','2022-06-22 03:56:20'),('M0007','jimin',3,'','2022-06-22 04:07:57'),('M0007','jisoo',3,'새로운 형태의 유니버스를 꿈꾸었으나 기억에 남는건 삭스의 귀여움뿐.','2022-06-22 04:15:02'),('M0007','miyeon',5,'어렸을때 토이스토리를 너무 재밌게 봤었던 20대로써 버즈의 이야기를 놓칠수 없어서 봤습니다. 예전에 봤던 토이스토리 내용도 생각나고 버즈라이트이어의 이야기도 흥미롭게 잘 풀어낸거 같습니다.','2022-06-22 04:22:43'),('M0007','soyeon',4,'삭스가 너무 귀여워요 무한한 저 우주 너머로','2022-06-22 04:32:04'),('M0007','yerin',5,'','2022-06-22 04:27:38'),('M0008','hyewon',5,'완벽을 넘어서, 갓벽에 가까운..~ 왜 극찬했는지 이해되는 내용과 연출, 영상미로 몰입해서 보게되서 너무 재미있게 봤음!','2022-06-22 03:48:05'),('M0008','jimin',3,'','2022-06-22 04:06:47'),('M0008','jisoo',4,'역시 톰아저씨...짱','2022-06-22 04:10:41'),('M0008','miyeon',4,'해외 극찬평들만큼이나 잘 뽑혔다고는 못 느꼈는데 재밌는 전투기 액션 영화로서는 충분했으니 이것만으로 만족했음. 4D로 보는거 강추b','2022-06-22 04:19:44'),('M0008','seokjin',4,'요약본만 보고갔는데도 재밌었는데... 요약본말고 풀버전으로 보고 가야할듯... 1편 오마주가 한두군데 나오는게 아닌거같은데 그걸 이해못해서 0_0?? 이러고있던게 좀 아쉬울정도... OTT로보면 개손해인영화... 왜 매드맥스라 했는지 이해할수있던 영화... 1편 풀로안봐서 전반부는 좀 지루함!','2022-06-22 04:34:52'),('M0008','soyeon',5,'드디어 탑건 매버릭 개봉 기다리고 있었는데 그날이 왔네요!!! 영화 진짜 재미있게 봤고 톰크루즈 멋있어요!! 또 보고싶은 영화입니다!!','2022-06-22 03:43:45'),('M0008','yerin',5,'개꿀잼! 포드vs페라리 이후 손에 땀을쥐는 영화 오랜만!','2022-06-22 04:25:56');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `number` int NOT NULL,
  `id` varchar(50) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `quantity` int DEFAULT NULL,
  `saleDate` datetime DEFAULT NULL,
  PRIMARY KEY (`number`,`code`),
  KEY `id` (`id`),
  KEY `sale_ibfk_1` (`code`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`code`) REFERENCES `product` (`code`) ON DELETE CASCADE,
  CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'seokjin','P0001',3,'2022-06-22 04:39:58'),(1,'seokjin','P0002',1,'2022-06-22 04:39:58'),(1,'seokjin','P0005',1,'2022-06-22 04:39:58'),(1,'seokjin','P0006',4,'2022-06-22 04:39:58'),(1,'seokjin','P0007',5,'2022-06-22 04:39:58'),(2,'soyeon','P0001',1,'2022-06-22 04:43:14'),(2,'soyeon','P0002',1,'2022-06-22 04:43:14'),(2,'soyeon','P0005',1,'2022-06-22 04:43:14'),(2,'soyeon','P0006',3,'2022-06-22 04:43:14'),(3,'soyeon','P0009',2,'2022-06-22 04:43:27'),(3,'soyeon','P0010',1,'2022-06-22 04:43:27'),(4,'soyeon','P0001',1,'2022-06-22 04:43:40'),(4,'soyeon','P0002',1,'2022-06-22 04:43:40'),(4,'soyeon','P0003',1,'2022-06-22 04:43:40'),(4,'soyeon','P0004',1,'2022-06-22 04:43:40'),(4,'soyeon','P0005',1,'2022-06-22 04:43:40'),(4,'soyeon','P0006',1,'2022-06-22 04:43:40'),(4,'soyeon','P0007',1,'2022-06-22 04:43:40'),(4,'soyeon','P0008',1,'2022-06-22 04:43:40'),(4,'soyeon','P0010',1,'2022-06-22 04:43:40'),(4,'soyeon','P0011',1,'2022-06-22 04:43:40'),(5,'soyeon','P0001',2,'2022-06-22 04:43:53'),(5,'soyeon','P0002',2,'2022-06-22 04:43:53'),(5,'soyeon','P0005',2,'2022-06-22 04:43:53'),(5,'soyeon','P0006',2,'2022-06-22 04:43:53'),(6,'soyeon','P0001',4,'2022-06-22 05:05:00'),(6,'soyeon','P0002',2,'2022-06-22 05:05:00'),(6,'soyeon','P0003',1,'2022-06-22 05:05:00'),(6,'soyeon','P0005',1,'2022-06-22 05:05:00'),(6,'soyeon','P0006',3,'2022-06-22 05:05:00'),(6,'soyeon','P0007',1,'2022-06-22 05:05:00'),(6,'soyeon','P0008',1,'2022-06-22 05:05:00'),(6,'soyeon','P0009',3,'2022-06-22 05:05:00'),(6,'soyeon','P0010',1,'2022-06-22 05:05:00'),(7,'soyeon','P0001',4,'2022-06-22 05:07:24'),(7,'soyeon','P0002',2,'2022-06-22 05:07:24'),(7,'soyeon','P0003',1,'2022-06-22 05:07:24'),(7,'soyeon','P0005',2,'2022-06-22 05:07:24'),(7,'soyeon','P0006',2,'2022-06-22 05:07:24'),(7,'soyeon','P0007',4,'2022-06-22 05:07:24'),(7,'soyeon','P0009',1,'2022-06-22 05:07:24'),(8,'soyeon','P0001',2,'2022-06-22 05:18:05'),(8,'soyeon','P0002',3,'2022-06-22 05:18:05'),(8,'soyeon','P0003',2,'2022-06-22 05:18:05'),(8,'soyeon','P0004',1,'2022-06-22 05:18:05'),(8,'soyeon','P0005',2,'2022-06-22 05:18:05'),(8,'soyeon','P0006',1,'2022-06-22 05:18:05'),(8,'soyeon','P0007',1,'2022-06-22 05:18:05'),(9,'soyeon','P0006',3,'2022-06-22 19:04:20'),(9,'soyeon','P0007',1,'2022-06-22 19:04:20'),(9,'soyeon','P0008',1,'2022-06-22 19:04:20'),(9,'soyeon','P0009',2,'2022-06-22 19:04:20'),(9,'soyeon','P0010',3,'2022-06-22 19:04:20'),(9,'soyeon','P0011',1,'2022-06-22 19:04:20');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `right` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','admin1234','이소연','admin@naver.com','manager'),('hyewon','hyewon1234','강혜원','hyewon@naver.com','user'),('jihun','jihun1234','표지훈','jihun@naver.com','user'),('jimin','jimin1234','박지민','jimin@naver.com','user'),('jisoo','jisoo1234','김지수','jisoo@naver.com','user'),('minho','minho1234','송민호','minho@naver.com','user'),('minjoo','minjoo1234','김민주','minjoo@naver.com','user'),('miyeon','miyeon1234','조미연','miyeon@naver.com','user'),('sehun','sehun1234','오세훈','sehun@naver.com','user'),('seokjin','seokjin1234','김석진','seokjin@naver.com','user'),('sohee','sohee1234','한소희','sohee@naver.com','user'),('soyeon','soyeon1234','이소연','soyeon@naver.com','user'),('yerin','yerin1234','김예린','yerin@naver.com','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-24 22:27:53
