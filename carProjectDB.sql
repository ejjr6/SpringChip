use smartweb;

-- 회원 정보 테이블

CREATE TABLE user_tbl(
	uno int PRIMARY KEY auto_increment,
    uid VARCHAR(50) NOT NULL,
    upw VARCHAR(200) NOT NULL,
    reupw VARCHAR(200) NOT NULL,
    uname VARCHAR(50) NOT NULL,
    uphone VARCHAR(50) NOT NULL
);

-- 첫번째 회원 삽입
INSERT INTO user_tbl(uno,uid,upw,reupw,uname,uphone) VALUES(1,'id001','pw001','pw001','아이키',01012345678);

SELECT * FROM user_tbl;
commit;

-- 차 정보 테이블
CREATE TABLE tbl_car(
	cno INT AUTO_INCREMENT PRIMARY KEY,		-- 차 번호
    ctype VARCHAR(100) NOT NULL,			-- 차 타입 버스/트럭
    cname LONGTEXT NOT NULL,				-- 차 이름
    cexpl LONGTEXT							-- 차 설명
);

-- 트럭 : 뉴파워트럭, 엑시언트, 엑시언트 수소전기트럭
-- 버스 : 쏠라티, 유니버스 모바일 오피스, 일렉시티 수소전기버스
INSERT INTO tbl_car(ctype,cname) VALUES('트럭','뉴파워트럭');
INSERT INTO tbl_car(ctype,cname) VALUES('트럭','엑시언트');
INSERT INTO tbl_car(ctype,cname) VALUES('트럭','엑시언트 수소전기트럭');
INSERT INTO tbl_car(ctype,cname) VALUES('버스','쏠라티');
INSERT INTO tbl_car(ctype,cname) VALUES('버스','유니버스 모바일 오피스');
INSERT INTO tbl_car(ctype,cname) VALUES('버스','일렉시티 수소전기버스');

SELECT * FROM tbl_car;
commit;

-- 찜하기 테이블
CREATE TABLE like_tbl(
	uno INT NOT NULL,						-- 좋아요 한 회원 번호
    cno INT NOT NULL,						-- 좋아요 체크된 자동자 번호
    favorite INT NOT NULL DEFAULT 0,		-- 좋아요 1 /취소 0 
    FOREIGN KEY (uno) REFERENCES user_tbl(uno) ON DELETE CASCADE,
    FOREIGN KEY (cno) REFERENCES tbl_car(cno)
);

SELECT * FROM like_tbl;
commit;

-- 시/도 테이블
CREATE TABLE tbl_areaSi(
	nsi VARCHAR(50) NOT NULL,
	si VARCHAR(50) NOT NULL
);

INSERT INTO tbl_areaSi(nsi, si) VALUES('S001','서울');
INSERT INTO tbl_areaSi(nsi, si) VALUES('G001','경기');
INSERT INTO tbl_areaSi(nsi, si) VALUES('B001','부산');

SELECT * FROM tbl_areaSi;
commit;

-- 구/군 테이블
CREATE TABLE tbl_areaGu(
	ngu VARCHAR(50) NOT NULL,
    nsi VARCHAR(50) NOT NULL,
    gu VARCHAR(50) NOT NULL,
    si VARCHAR(50) NOT NULL
);

INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('SG001','S001','강남구','서울');
INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('SG002','S001','서초구','서울');
INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('GG001','G001','용인시','경기');
INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('GG002','G001','김포시','경기');
INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('BG001','B001','해운대구','부산');
INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('BG002','B001','동래구','부산');

SELECT * FROM tbl_areaGu;
commit;

-- 지점 정보 테이블
CREATE TABLE tbl_reserve(
	si VARCHAR(50) NOT NULL,
	nsi VARCHAR(50) NOT NULL,
	gu VARCHAR(50) NOT NULL,			
	ngu VARCHAR(50) NOT NULL,
    bname VARCHAR(100) NOT NULL,
	baddr LONGTEXT NOT NULL,
	bphone VARCHAR(100) NOT NULL,		
    blati LONGTEXT NOT NULL,			-- 위도
    blongi LONGTEXT NOT NULL			-- 경도
);

INSERT INTO tbl_reserve(si,nsi,gu,ngu,bname,baddr,bphone,blati,blongi) VALUES('서울','S001','강남구','SG001','압구정지점','서울특별시 강남구 압구정로 417','02-556-3933','37.52752124411975','127.0429813532702');
INSERT INTO tbl_reserve(si,nsi,gu,ngu,bname,baddr,bphone,blati,blongi) VALUES('서울','S001','서초구','SG002','남부지점','서울특별시 서초구 사평대로 334','02-2048-3017','37.502542621538794','127.01948882975388');
INSERT INTO tbl_reserve(si,nsi,gu,ngu,bname,baddr,bphone,blati,blongi) VALUES('서울','S001','서초구','SG002','남부2지점','서울특별시 서초구 양재대로 1161-19','02-522-5015','37.46158354558493','127.03547783650556');
INSERT INTO tbl_reserve(si,nsi,gu,ngu,bname,baddr,bphone,blati,blongi) VALUES('경기','G001','용인시','GG001','경기남부지점','경기도 용인시 기흥구 흥덕1로 13 타워동','031-370-1123','37.27088600716331','127.06638486431518');
INSERT INTO tbl_reserve(si,nsi,gu,ngu,bname,baddr,bphone,blati,blongi) VALUES('경기','G001','용인시','GG001','경기지점','경기도 용인시 기흥구 흥덕2로 87번길 18','031-206-0501','37.27719482802781','127.07148131162307');
INSERT INTO tbl_reserve(si,nsi,gu,ngu,bname,baddr,bphone,blati,blongi) VALUES('경기','G001','김포시','GG002','김포지점','경기도 김포시 양촌읍 김포대로 1763','031-989-5445','37.66980711255514','126.6437402724278');
INSERT INTO tbl_reserve(si,nsi,gu,ngu,bname,baddr,bphone,blati,blongi) VALUES('부산','B001','해운대구','BG001','해운대지점','부산광역시 해운대구 좌동순환로 503','051-747-7979','35.16537985613059','129.16853522552995');
INSERT INTO tbl_reserve(si,nsi,gu,ngu,bname,baddr,bphone,blati,blongi) VALUES('부산','B001','동래구','BG002','안락지점','부산광역시 동래구 충렬대로 302','051-531-6565','35.19967422063654','35.19967422063654');
INSERT INTO tbl_reserve(si,nsi,gu,ngu,bname,baddr,bphone,blati,blongi) VALUES('부산','B001','동래구','BG002','명륜지점','부산광역시 동래구 명륜로 218-1','051-553-3373','35.20752698374594','129.07019171183452');

SELECT * FROM tbl_reserve;
commit;

-- 예약 테이블
CREATE TABLE tbl_userIfm(
	uno INT  NOT NULL,							-- 회원 번호
    uname VARCHAR(100) NOT NULL,				-- 회원 이름
    uphone VARCHAR(100) NOT NULL,				-- 회원 전화번호
    utext LONGTEXT,								-- 회원 신청내용(null이여도 됨.)
    cname LONGTEXT NOT NULL,					-- 차 이름
    bname VARCHAR(100) NOT NULL,				-- 지점 이름
    baddr VARCHAR(200) NOT NULL,				-- 지점 주소
    bphone VARCHAR(100) NOT NULL,				-- 지점 전화번호 
    FOREIGN KEY (uno) REFERENCES user_tbl(uno) ON DELETE CASCADE
);

SELECT * FROM tbl_userIfm;
commit;

-- 게시판 테이블
 CREATE TABLE ask_board(
	bno INT PRIMARY KEY auto_increment,
    title VARCHAR(200) NOT NULL,
    content LONGTEXT NOT NULL,
    writer VARCHAR(50) NOT NULL,
    regdate TIMESTAMP NOT NULL DEFAULT now(),
    updatedate TIMESTAMP DEFAULT now(),
    viewcnt INT DEFAULT 0,
    secret tinyint(1)		-- 0 false , 1 ture
 );

INSERT INTO ask_board(title,content,writer) VALUES('안뇽','안뇽','아이키');

SELECT * FROM ask_board;
commit;


-- Q&A 테이블
CREATE TABLE ask_reply(
	rno INT PRIMARY KEY auto_increment,
	bno INT NOT NULL default 0,
	reply TEXT NOT NULL,
	replyer VARCHAR(50) NOT NULL,
	replyDate TIMESTAMP NOT NULL default now(),
	updatedate TIMESTAMP NOT NULL default now(),
CONSTRAINT fk_ask_reply_bno FOREIGN KEY(bno) REFERENCES ask_board(bno)
);

SELECT * FROM ask_reply;
commit;

