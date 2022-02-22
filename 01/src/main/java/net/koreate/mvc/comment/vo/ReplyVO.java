package net.koreate.mvc.comment.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int rno; // 댓글 번호
	private int bno; // 댓글이 저장된 게시글 번호
	private String replyer; // 작성자
	private String reply; // 댓글 내용
	private Date replyDate; // 등록 시간
	private Date updatedate; // 수정 시간

}
