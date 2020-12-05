-- --------------------------------------------------------
-- 호스트:                          around-me.cvmosru6coso.ap-northeast-2.rds.amazonaws.com
-- 서버 버전:                        10.4.8-MariaDB - Source distribution
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- am_common 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `am_common` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `am_common`;

-- 테이블 am_common.area 구조 내보내기
CREATE TABLE IF NOT EXISTS `area` (
  `area_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '지역번호',
  `depth` char(1) NOT NULL COMMENT '깊이',
  `sigungu_code` char(5) DEFAULT NULL COMMENT '시군구코드',
  `road_code` char(7) DEFAULT NULL COMMENT '도로명코드',
  `road_name` varchar(50) DEFAULT NULL COMMENT '도로명',
  `dong_serial_no` varchar(2) DEFAULT NULL COMMENT '읍면동일련번호',
  `sido_name` varchar(20) DEFAULT NULL COMMENT '시도명',
  `sigungu_name` varchar(20) DEFAULT NULL COMMENT '시군구명',
  `dong_sort` varchar(2) DEFAULT NULL COMMENT '읍면동구분',
  `dong_code` varchar(3) DEFAULT NULL COMMENT '읍면동코드',
  `dong_name` varchar(20) DEFAULT NULL COMMENT '읍면동명',
  `upper_road_code` char(7) DEFAULT NULL COMMENT '상위도로코드',
  `upper_road_name` varchar(50) DEFAULT NULL COMMENT '상위도로명',
  PRIMARY KEY (`area_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='지역';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_common.common_code 구조 내보내기
CREATE TABLE IF NOT EXISTS `common_code` (
  `common_group_code_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '공통코드 번호',
  `common_group_code` char(5) NOT NULL COMMENT '공통그룹코드',
  `common_code` varchar(10) NOT NULL COMMENT '공통코드',
  `common_code_name` varchar(20) NOT NULL COMMENT '공통코드명',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `order_no` int(11) NOT NULL COMMENT '정렬번호',
  `description` varchar(200) DEFAULT NULL COMMENT '설명',
  `filter1` varchar(50) DEFAULT NULL COMMENT '필터1',
  `filter2` varchar(50) DEFAULT NULL COMMENT '필터2',
  `filter3` varchar(50) DEFAULT NULL COMMENT '필터3',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`common_group_code_no`) USING BTREE,
  KEY `common_code_FK` (`common_group_code`),
  CONSTRAINT `common_code_FK` FOREIGN KEY (`common_group_code`) REFERENCES `common_group_code` (`common_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='공통코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_common.common_group_code 구조 내보내기
CREATE TABLE IF NOT EXISTS `common_group_code` (
  `common_group_code_no` bigint(20) NOT NULL AUTO_INCREMENT,
  `common_group_code` char(5) NOT NULL,
  `common_group_name` varchar(20) NOT NULL,
  `use_yn` char(1) NOT NULL DEFAULT 'Y',
  `order_no` int(11) NOT NULL DEFAULT 0,
  `description` varchar(200) DEFAULT NULL,
  `reg_datetime` char(14) NOT NULL,
  `mod_datetime` char(14) DEFAULT NULL,
  `reg_user_no` bigint(20) NOT NULL,
  `mod_user_no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`common_group_code_no`) USING BTREE,
  UNIQUE KEY `COMMON_GROUP_CODE` (`common_group_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='공통그룹코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_common.term 구조 내보내기
CREATE TABLE IF NOT EXISTS `term` (
  `term_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '약관 번호',
  `term_name` varchar(255) NOT NULL COMMENT '약관명',
  `term_type` char(10) NOT NULL COMMENT '약관 타입',
  `term_content` mediumtext NOT NULL DEFAULT '' COMMENT '약관내용',
  `display_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '전시여부',
  `required_agree_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '필수동의여부',
  `display_date` char(8) DEFAULT NULL COMMENT '전시일자',
  `use_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '사용여부',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`term_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='약관';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_common.user_term_agree_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_term_agree_history` (
  `term_agree_history_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '약관동의이력번호',
  `term_no` bigint(20) DEFAULT NULL COMMENT '약관번호',
  `user_no` bigint(20) DEFAULT NULL COMMENT '회원번호',
  `agree_yn` char(1) DEFAULT NULL COMMENT '동의여부',
  `agree_datetime` char(8) DEFAULT NULL COMMENT '동의일시',
  `reg_datetime` char(14) DEFAULT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) DEFAULT NULL COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`term_agree_history_no`) USING BTREE,
  KEY `user_term_agree_history_FK` (`term_no`),
  KEY `user_term_agree_history_FK_1` (`user_no`),
  CONSTRAINT `user_term_agree_history_FK` FOREIGN KEY (`term_no`) REFERENCES `term` (`term_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원 약관동의 이력';

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
