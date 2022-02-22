package net.koreate.mvc.board.service;

import net.koreate.mvc.board.vo.AskCommentVO;

public interface Ask_commentService {

	// 댓글 작성
	String addComment(AskCommentVO vo) throws Exception;

	// 댓글 삭제
	String deleteString(int cno) throws Exception;
	// 게시물 번호가 일치 페이지 블럭 정보

	// 페이징 처리된 해당 번호의 댓글 리스트
}
