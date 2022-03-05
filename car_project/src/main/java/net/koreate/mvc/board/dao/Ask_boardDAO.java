package net.koreate.mvc.board.dao;

import java.util.List;

import net.koreate.mvc.board.vo.AskBoardVO;
import net.koreate.mvc.common.util.Criteria;

public interface Ask_boardDAO {
	// 게시글 작성
	int create(AskBoardVO vo) throws Exception;

	// 게시글 상세보기
	AskBoardVO read(int bno) throws Exception;

	// 게시글 수정
	int update(AskBoardVO vo) throws Exception;

	// 게시글 삭제
	int delete(int bno) throws Exception;

	// 조회수 증가
	void updateCnt(int bno) throws Exception;

	// 전체 게시물의 개수
	int listCount() throws Exception;

	// 페이징 처리된 게시물 리스트
	List<AskBoardVO> list(Criteria cri) throws Exception;

}