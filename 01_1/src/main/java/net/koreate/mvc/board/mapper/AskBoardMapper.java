package net.koreate.mvc.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.mvc.board.vo.AskBoardVO;
import net.koreate.mvc.common.util.Criteria;

public interface AskBoardMapper {
	@Select("select * from ask_board WHERE bno > 0")
	public List<AskBoardVO> getList() throws Exception;

	@Insert("insert into ask_board (title,content,writer) VALUES(#{title},#{content},#{writer})")
	public void insert(AskBoardVO vo) throws Exception;

	@Select("SELECT * FROM ask_board WHERE bno = ${bno}")
	public AskBoardVO read(int bno) throws Exception;

	@Delete("DELETE FROM ask_board WHERE bno = #{bno}")
	public int delete(int bno) throws Exception;

	@Update("UPDATE ask_board set title = #{title}, content = #{content}, writer = #{writer} , updateDate = now() WHERE bno = #{bno}")
	public int update(AskBoardVO vo) throws Exception;

	@Update("UPDATE ask_board SET viewcnt = viewcnt +1 WHERE bno = #{bno}")
	public int updatecnt(int bno) throws Exception;

	@Select("SELECT count(*) FROM ask_board")
	public int listcount() throws Exception;

	@Select("SELECT * FROM ask_board ORDER BY bno DESC limit #{startRow}, #{perPageNum}")
	public List<AskBoardVO> list(Criteria cri) throws Exception;

}
