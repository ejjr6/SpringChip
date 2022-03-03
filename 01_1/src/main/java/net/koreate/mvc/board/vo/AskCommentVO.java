package net.koreate.mvc.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AskCommentVO {
	private int cno;
	private int bno;
	private String commentText;
	private String commentAuth;
	private String commentDelete;
	private Date regDate;
}
