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


-- am_user 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `am_user` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `am_user`;

-- 테이블 am_user.blacklist_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `blacklist_history` (
  `blacklist_reason_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '블랙리스트 사유 번호',
  `user_no` bigint(20) NOT NULL COMMENT '회원번호',
  `apply_date` char(8) NOT NULL COMMENT '적용일자',
  `blacklist_reason` varchar(255) NOT NULL COMMENT '블랙리스트 사유',
  `delete_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '삭제여부',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`blacklist_reason_no`) USING BTREE,
  KEY `blacklist_history_FK` (`user_no`),
  CONSTRAINT `blacklist_history_FK` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='블랙리스트 이력';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_user.sso_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `sso_user` (
  `sso_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'SSO 번호',
  `user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '회원번호',
  `sso_type` varchar(10) NOT NULL COMMENT 'SSO 타입',
  `sso_key` varchar(255) NOT NULL COMMENT 'SSO KEY\r\n(해당 SSO 측의 키, AUTH)',
  `delete_yn` char(1) NOT NULL DEFAULT 'N' COMMENT 'DELETE Y/N \r\n(SSO 연동을 끊길 원하는 경우)',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일',
  `reg_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '등록자',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정자',
  PRIMARY KEY (`sso_no`) USING BTREE,
  KEY `sso_user_FK` (`user_no`),
  CONSTRAINT `sso_user_FK` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='소셜회원';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_user.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `user_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  `user_password` varchar(255) NOT NULL COMMENT '회원비밀번호',
  `user_name` varchar(50) NOT NULL COMMENT '회원이름',
  `user_email` varchar(50) NOT NULL COMMENT '회원메일',
  `user_mobile` varchar(11) NOT NULL COMMENT '회원핸드폰',
  `gender` char(2) NOT NULL COMMENT '성별',
  `birth` char(8) NOT NULL COMMENT '생년월일',
  `user_sort` char(2) NOT NULL COMMENT '회원구분(회원분류가맹점과 일반을 구분하는 키값)',
  `last_login_date` char(14) DEFAULT NULL COMMENT '최근 로그인 일자',
  `last_password_mod_date` char(14) DEFAULT NULL COMMENT '최근 비밀번호 수정 일자',
  `login_try_count` int(1) NOT NULL DEFAULT 0 COMMENT '로그인 시도 횟수',
  `user_status` char(2) NOT NULL COMMENT '회원상태코드 (정상, 탈퇴, 휴면)',
  `black_list_yn` char(1) NOT NULL DEFAULT 'N' COMMENT '블랙리스트 여부',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '등록회원번호',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정회원번호',
  PRIMARY KEY (`user_no`) USING BTREE,
  UNIQUE KEY `USER_EMAIL` (`user_email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='회원';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_user.user_roles 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_roles_no` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_user_no` bigint(20) DEFAULT NULL,
  `roles` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_roles_no`),
  KEY `user_roles_FK` (`user_user_no`),
  CONSTRAINT `user_roles_FK` FOREIGN KEY (`user_user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_user.wishlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `wishlist` (
  `wishlist_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '찜 번호',
  `store_no` bigint(20) NOT NULL COMMENT '점포번호',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `user_no` bigint(20) NOT NULL COMMENT '회원번호',
  PRIMARY KEY (`wishlist_no`) USING BTREE,
  KEY `wishlist_FK` (`user_no`),
  CONSTRAINT `wishlist_FK` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='찜';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 am_user.withdraw_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `withdraw_user` (
  `withdraw_user_no` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '탈퇴회원번호',
  `user_no` bigint(20) NOT NULL COMMENT '회원번호',
  `withdraw_reason_type` char(2) DEFAULT NULL COMMENT '탈퇴사유타입',
  `withdraw_reason` varchar(255) DEFAULT NULL COMMENT '탈퇴사유',
  `reg_datetime` char(14) NOT NULL COMMENT '등록일시',
  `mod_datetime` char(14) DEFAULT NULL COMMENT '수정일시',
  `reg_user_no` bigint(20) NOT NULL COMMENT '등록회원번호',
  `mod_user_no` bigint(20) DEFAULT NULL COMMENT '수정회원번호',
  PRIMARY KEY (`withdraw_user_no`) USING BTREE,
  KEY `withdraw_user_FK` (`user_no`),
  CONSTRAINT `withdraw_user_FK` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='탈퇴회원';

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
