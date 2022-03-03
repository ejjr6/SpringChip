package net.koreate.mvc.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AskBoardVO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	private int viewcnt;
}
