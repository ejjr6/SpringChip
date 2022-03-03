package net.koreate.mvc.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.mvc.board.mapper.AskBoardMapper;
import net.koreate.mvc.board.vo.AskBoardVO;
import net.koreate.mvc.common.util.Criteria;
import net.koreate.mvc.common.util.PageMaker;

@Service
public class Ask_boardServiceImpl implements Ask_boardService<AskBoardVO, PageMaker, Criteria> {

	@Inject
	AskBoardMapper mapper;

	@Override
	public List<AskBoardVO> getList() throws Exception {
		return mapper.getList();
	}

	@Override
	public void register(AskBoardVO vo) throws Exception {
		mapper.insert(vo);
	}

	@Override
	public AskBoardVO get(int bno) throws Exception {

		return mapper.read(bno);
	}

	@Override
	public boolean modify(AskBoardVO vo) throws Exception {
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(int bno) throws Exception {
		return mapper.delete(bno) == 1;
	}

	@Override
	public void updateViewCnt(int bno) throws Exception {
		mapper.updatecnt(bno);
	}

	@Override
	public List<AskBoardVO> list(Criteria cri) throws Exception {
		List<AskBoardVO> list = mapper.list(cri);
		System.out.println("list : "+list);
		return list;
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		int totalCount = mapper.listcount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker);

		return pageMaker;
	}

}
