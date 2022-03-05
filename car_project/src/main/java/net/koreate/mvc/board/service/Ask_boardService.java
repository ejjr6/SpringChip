package net.koreate.mvc.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import net.koreate.mvc.board.vo.AskBoardVO;
import net.koreate.mvc.common.util.Criteria;
import net.koreate.mvc.common.util.PageMaker;

@Service
public interface Ask_boardService<M, P, C> {

	public List<AskBoardVO> getList() throws Exception; // 게시글 목록 불러오기

	public void register(AskBoardVO vo) throws Exception; // 게시글 작성

	public AskBoardVO get(int bno) throws Exception; // dao. read 게시글 번호로 특정 게시물 가져오기

	public boolean modify(AskBoardVO vo) throws Exception; // 게시글 수정

	public boolean remove(int bno) throws Exception; // 게시글 삭제

	public void updateViewCnt(int bno) throws Exception; // 조회수 +1

	public List<AskBoardVO> list(Criteria cri) throws Exception;

	public PageMaker getPageMaker(Criteria cri) throws Exception;

}
