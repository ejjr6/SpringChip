CREATE TABLE ask_reply(
	rno INT PRIMARY KEY auto_increment,
	bno INT NOT NULL default 0,
	reply TEXT NOT NULL,
	replyer VARCHAR(50) NOT NULL,

	replyDate TIMESTAMP NOT NULL default now(),
	updatedate TIMESTAMP NOT NULL default now(),
CONSTRAINT fk_ask_reply_bno FOREIGN KEY(bno) REFERENCES ask_board(bno)
);

 CREATE TABLE ask_board(
bno INT PRIMARY KEY auto_increment,
    title VARCHAR(200) NOT NULL,
    content LONGTEXT NOT NULL,
    writer VARCHAR(50) NOT NULL,
    regdate TIMESTAMP NOT NULL DEFAULT now(),
    updatedate TIMESTAMP DEFAULT now(),
    viewcnt INT DEFAULT 0
 );