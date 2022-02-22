package net.koreate.mvc.comment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.mvc.comment.mapper.ReplyMapper;
import net.koreate.mvc.comment.vo.ReplyVO;
import net.koreate.mvc.common.util.Criteria;
import net.koreate.mvc.common.util.PageMaker;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyMapper mapper;

	@Override
	public int register(ReplyVO vo) throws Exception {

		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(int rno) throws Exception {

		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) throws Exception {

		return mapper.update(vo);
	}

	@Override
	public int remove(int rno) throws Exception {

		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int bno) throws Exception {

		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public PageMaker getPageMaker(Criteria cri, int bno) throws Exception {
		int totalCount = mapper.totalCount(bno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		return pageMaker;
	}

}