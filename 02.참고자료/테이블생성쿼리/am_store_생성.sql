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


-- am_store 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `am_store` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `am_store`;

-- 테이블 am_store.menu_detail 구조 내보내기
CREATE TABLE IF NOT EXISTS `menu_detail` (
  `menu_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '메뉴번호',
  `menu_type_no` bigint(20) NOT NULL COMMENT '메뉴 타입 번호',
  `store_no` bigint(20) NOT NULL COMMENT '점포번호',
  `menu_name` varchar(20) NOT NULL COMMENT '메뉴명',
  `menu_description` varchar(255) NOT NULL COMMENT '메뉴설명',
  `price` int(11) NOT NULL DEFAULT 0 COMMENT '가격',
  `use_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '사용 여부',
  `recommend_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '추천 여부',
  `new_menu_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '신메뉴 여부',
  `sold_out_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '품절 여부',
  `order_no` int(11) DEFAULT NULL COMMENT '정렬번호',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`menu_no`),
  KEY `menu_detail_FK` (`menu_type_no`),
  KEY `menu_detail_FK_1` (`store_no`),
  CONSTRAINT `menu_detail_FK` FOREIGN KEY (`menu_type_no`) REFERENCES `menu_type` (`menu_type_no`),
  CONSTRAINT `menu_detail_FK_1` FOREIGN KEY (`store_no`) REFERENCES `store` (`store_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메뉴 상세 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_store.menu_keyword 구조 내보내기
CREATE TABLE IF NOT EXISTS `menu_keyword` (
  `menu_keyword_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '메뉴 키워드 번호',
  `menu_keyword_manage_no` bigint(20) NOT NULL COMMENT '메뉴 키워드 관리 번호',
  `menu_no` bigint(20) NOT NULL COMMENT '메뉴 번호',
  `use_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '사용여부',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`menu_keyword_no`) USING BTREE,
  KEY `menu_keyword_FK` (`menu_keyword_manage_no`),
  KEY `menu_keyword_FK_1` (`menu_no`),
  CONSTRAINT `menu_keyword_FK` FOREIGN KEY (`menu_keyword_manage_no`) REFERENCES `menu_keyword_manage` (`menu_keyword_manage_no`),
  CONSTRAINT `menu_keyword_FK_1` FOREIGN KEY (`menu_no`) REFERENCES `menu_detail` (`menu_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메뉴 키워드 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_store.menu_keyword_manage 구조 내보내기
CREATE TABLE IF NOT EXISTS `menu_keyword_manage` (
  `menu_keyword_manage_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '메뉴키워드관리번호',
  `menu_keyword_manage_name` varchar(50) NOT NULL COMMENT '메뉴키워드관리명',
  `use_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '사용 여부',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`menu_keyword_manage_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메뉴 키워드 관리 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_store.menu_type 구조 내보내기
CREATE TABLE IF NOT EXISTS `menu_type` (
  `menu_type_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '메뉴 타입 번호',
  `menu_type_name` varchar(20) NOT NULL COMMENT '메뉴타입명',
  `use_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '사용 여부',
  `order_no` int(11) DEFAULT NULL COMMENT '정렬번호',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`menu_type_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메뉴 타입';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_store.store 구조 내보내기
CREATE TABLE IF NOT EXISTS `store` (
  `store_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '점포번호',
  `store_code` char(5) NOT NULL COMMENT '점포코드',
  `store_name` varchar(50) NOT NULL COMMENT '점포 명',
  `latitude` varchar(30) NOT NULL COMMENT '위도',
  `longitude` varchar(30) NOT NULL COMMENT '경도',
  `store_description` varchar(50) NOT NULL COMMENT '점포설명',
  `use_information` text DEFAULT NULL COMMENT '이용안내',
  `tel_no` varchar(11) NOT NULL COMMENT '전화번호',
  `zip_code` char(5) NOT NULL COMMENT '우편번호',
  `load_name_address` varchar(50) NOT NULL COMMENT '도로명주소',
  `zone_no_address` varchar(50) NOT NULL COMMENT '지번주소',
  `detail_address` varchar(80) NOT NULL COMMENT '상세주소',
  `area_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '지역번호',
  `ceo_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '점주회원번호',
  `business_no` char(12) NOT NULL COMMENT '사업자번호',
  `closed_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '폐업여부',
  `founding_date` char(8) DEFAULT NULL COMMENT '개업일',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일',
  `reg_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`store_no`) USING BTREE,
  UNIQUE KEY `STORE_CODE` (`store_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='점포';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_store.store_and_store_type_detail 구조 내보내기
CREATE TABLE IF NOT EXISTS `store_and_store_type_detail` (
  `store_detail_type_manage_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '점포상세타입관리번호',
  `store_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '점포번호',
  `store_type_detail_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '점포상세타입번호',
  `representation_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '대표여부',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`store_detail_type_manage_no`) USING BTREE,
  KEY `store_and_store_type_detail_FK` (`store_no`),
  KEY `store_and_store_type_detail_FK_1` (`store_type_detail_no`),
  CONSTRAINT `store_and_store_type_detail_FK` FOREIGN KEY (`store_no`) REFERENCES `store` (`store_no`),
  CONSTRAINT `store_and_store_type_detail_FK_1` FOREIGN KEY (`store_type_detail_no`) REFERENCES `store_type_detail` (`store_type_detail_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='점포&점포타입상세';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_store.store_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `store_image` (
  `store_image_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '점포이미지번호',
  `store_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '점포번호',
  `representation_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '대표이미지여부',
  `image_sort` char(2) NOT NULL COMMENT '이미지구분',
  `delete_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '삭제여부',
  `order_no` int(11) NOT NULL COMMENT '정렬번호',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`store_image_no`) USING BTREE,
  KEY `store_image_FK` (`store_no`),
  CONSTRAINT `store_image_FK` FOREIGN KEY (`store_no`) REFERENCES `store` (`store_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='점포 이미지 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_store.store_keyword 구조 내보내기
CREATE TABLE IF NOT EXISTS `store_keyword` (
  `store_keyword_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '점포 키워드 번호',
  `store_keyword_manage_no` bigint(20) NOT NULL COMMENT '점포 키워드 관리 번호',
  `store_no` bigint(20) NOT NULL COMMENT '점포 번호',
  `use_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '사용여부',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`store_keyword_no`) USING BTREE,
  KEY `store_keyword_FK` (`store_no`),
  KEY `store_keyword_FK_1` (`store_keyword_manage_no`),
  CONSTRAINT `store_keyword_FK` FOREIGN KEY (`store_no`) REFERENCES `store` (`store_no`),
  CONSTRAINT `store_keyword_FK_1` FOREIGN KEY (`store_keyword_manage_no`) REFERENCES `store_keyword_manage` (`store_keyword_manage_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='점포 키워드 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_store.store_keyword_manage 구조 내보내기
CREATE TABLE IF NOT EXISTS `store_keyword_manage` (
  `store_keyword_manage_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '점포 키워드 관리 번호',
  `store_keyword_manage_name` varchar(50) NOT NULL COMMENT '점포 키워드 관리 명',
  `use_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '사용여부',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`store_keyword_manage_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='점포 키워드 관리 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_store.store_opening_time 구조 내보내기
CREATE TABLE IF NOT EXISTS `store_opening_time` (
  `store_opening_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '점포 영업시간 번호',
  `store_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '점포번호',
  `day` char(2) NOT NULL COMMENT '요일',
  `time_type` char(2) DEFAULT NULL COMMENT '시간 타입',
  `additional_infomation` varchar(200) DEFAULT NULL COMMENT '부가정보',
  `start_hour` char(2) DEFAULT NULL COMMENT '시작 시',
  `end_hour` char(2) DEFAULT NULL COMMENT '종료 시',
  `start_minute` char(2) DEFAULT NULL COMMENT '시작 분',
  `order_no` int(11) DEFAULT NULL COMMENT '정렬번호',
  `end_minute` char(2) DEFAULT NULL COMMENT '종료 분',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`store_opening_no`) USING BTREE,
  KEY `store_opening_time_FK` (`store_no`),
  CONSTRAINT `store_opening_time_FK` FOREIGN KEY (`store_no`) REFERENCES `store` (`store_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='점포 영업시간 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_store.store_type 구조 내보내기
CREATE TABLE IF NOT EXISTS `store_type` (
  `store_type_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '점포타입번호',
  `store_type_code` char(3) NOT NULL COMMENT '점포타입코드',
  `store_type_name` varchar(50) NOT NULL COMMENT '점포타입명',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `order_no` int(11) DEFAULT NULL COMMENT '정렬번호',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`store_type_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='점포타입';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_store.store_type_detail 구조 내보내기
CREATE TABLE IF NOT EXISTS `store_type_detail` (
  `store_type_detail_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '점포타입상세번호',
  `store_type_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '점포타입번호',
  `store_type_detail_code` char(3) NOT NULL COMMENT '점포타입상세코드',
  `store_type_detail_name` varchar(50) NOT NULL COMMENT '점포타입상세명',
  `use_yn` char(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `order_no` int(11) DEFAULT NULL COMMENT '정렬번호',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`store_type_detail_no`) USING BTREE,
  KEY `store_type_detail_FK` (`store_type_no`),
  CONSTRAINT `store_type_detail_FK` FOREIGN KEY (`store_type_no`) REFERENCES `store_type` (`store_type_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='점포타입상세';

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
