package net.koreate.mvc.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.koreate.mvc.board.mapper.AskBoardMapper;
import net.koreate.mvc.board.vo.AskBoardVO;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/context/root-context.xml" })
public class InsertTest {
	@Setter(onMethod_ = @Autowired)
	private AskBoardMapper mapper;

	@Test
	public void testInsert() throws Exception {
		AskBoardVO vo = new AskBoardVO();
		vo.setTitle("새로 작성하는 글");
		vo.setContent("새로 작성하는 내용");
		vo.setContent("새로 작성하는 내용");
		vo.setWriter("뉴비");
		mapper.insert(vo);
	}

}