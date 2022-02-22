package net.koreate.mvc.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.koreate.mvc.board.mapper.AskBoardMapper;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/context/root-context.xml" })
public class MapperTest {
	@Setter(onMethod_ = @Autowired)
	private AskBoardMapper mapper;

	@Test
	public void testGetlist() throws Exception {
		mapper.getList().forEach(board -> log.info(board));
	}

}
