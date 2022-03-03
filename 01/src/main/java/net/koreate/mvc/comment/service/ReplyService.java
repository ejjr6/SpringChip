package net.koreate.mvc.comment.service;

import java.util.List;

import net.koreate.mvc.comment.vo.ReplyVO;
import net.koreate.mvc.common.util.Criteria;
import net.koreate.mvc.common.util.PageMaker;

public interface ReplyService {

	public int register(ReplyVO vo) throws Exception;

	public ReplyVO get(int rno) throws Exception;

	public int modify(ReplyVO vo) throws Exception;

	public int remove(int rno) throws Exception;

	public List<ReplyVO> getList(Criteria cri, int bno) throws Exception;

	PageMaker getPageMaker(Criteria cri, int bno) throws Exception;

}
