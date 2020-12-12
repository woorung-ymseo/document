-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.5-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- am_event 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `am_event` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `am_event`;

-- 테이블 am_event.event 구조 내보내기
CREATE TABLE IF NOT EXISTS `event` (
  `event_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '이벤트 번호',
  `event_name` varchar(50) NOT NULL COMMENT '이벤트 명',
  `store_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '점포번호',
  `start_date` date NOT NULL COMMENT '시작 일자',
  `end_date` date NOT NULL COMMENT '종료 일자',
  `start_hour` char(2) DEFAULT NULL COMMENT '시작 시',
  `start_minute` char(2) DEFAULT NULL COMMENT '시작 분',
  `end_hour` char(2) DEFAULT NULL COMMENT '종료 시',
  `end_minute` char(2) DEFAULT NULL COMMENT '종료 분',
  `event_content` mediumtext NOT NULL DEFAULT '' COMMENT '이벤트 내용',
  `display_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '전시 여부',
  `reg_datetime` datetime NOT NULL COMMENT '등록일시',
  `mod_datetime` datetime DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`event_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='이벤트 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
