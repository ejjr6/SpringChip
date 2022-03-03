package net.koreate.mvc.mapper;

import static org.junit.Assert.assertNotNull;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import net.koreate.mvc.board.service.Ask_boardService;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/context/root-context.xml" })
public class ServiceTest {
	@Inject
	Ask_boardService service;

	@Test
	void testExist() {
		log.info(service);
		assertNotNull(service);

	}

}
