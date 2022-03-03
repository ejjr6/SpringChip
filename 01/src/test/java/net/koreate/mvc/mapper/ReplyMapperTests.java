package net.koreate.mvc.mapper;

import java.util.stream.IntStream;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.extern.log4j.Log4j;
import net.koreate.mvc.comment.mapper.ReplyMapper;
import net.koreate.mvc.comment.vo.ReplyVO;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = { "classpath:/context/root-context.xml" })
// Java Config
// @ContextConfiguration(classes = { org.zerock.config.PersistenceConfig.class
// })
@Log4j
public class ReplyMapperTests {

	// 테스트 전에 해당 번호의 게시물이 존재하는지 반드시 확인할 것
	private int[] bnoArr = { 12, 13, 14 };

	@Inject
	ReplyMapper mapper;

	@Test
	public void testCreate() {

		IntStream.rangeClosed(1, 10).forEach(i -> {

			ReplyVO vo = new ReplyVO();

			// 게시물의 번호
			vo.setBno(35);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer" + i);

			try {
				mapper.insert(vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});

	}

	@Test
	public void testRead() {

		int targetRno = 1;

		ReplyVO vo = null;
		try {
			vo = mapper.read(targetRno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		log.info(vo);

	}

	@Test
	public void testMapper() {

		log.info(mapper);
	}

	@Test
	public void testDelete() {

		int targetRno = 1;

		try {
			mapper.delete(targetRno);
		} catch (Exception e) {
			// TODO Auto-generated catch bloc

			e.printStackTrace();
		}
	}

	@Test
	public void testUpdate() throws Exception {

		int targetRno = 1;

		ReplyVO vo = mapper.read(targetRno);

		vo.setReply("Update Reply ");

		int count = mapper.update(vo);

		log.info("UPDATE COUNT: " + count);
	}

}
