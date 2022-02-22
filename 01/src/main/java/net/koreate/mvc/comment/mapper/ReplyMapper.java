package net.koreate.mvc.comment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.mvc.comment.vo.ReplyVO;
import net.koreate.mvc.common.util.Criteria;

public interface ReplyMapper {

	@Insert("INSERT INTO ask_reply (bno,reply,replyer,replyDate) VALUES (#{bno}, #{reply}, #{replyer}, now())")
	public int insert(ReplyVO vo) throws Exception;

	@Select("SELECT * FROM ask_reply WHERE rno = ${rno}")
	public ReplyVO read(int rno) throws Exception;

	@Delete("DELETE FROM ask_reply WHERE rno = ${rno}")
	public int delete(int rno) throws Exception;

	@Update("UPDATE ask_reply set reply = #{reply}, updatedate = now() WHERE rno = #{rno}")
	public int update(ReplyVO vo) throws Exception;

	@Select("SELECT rno,bno,reply,replyer,replyDate,updatedate FROM ask_reply WHERE bno =${bno} ORDER BY rno DESC ")
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") int bno);

	@Select("SELECT count(rno) FROM ask_reply WHERE bno = #{bno}")
	int totalCount(int bno) throws Exception;
}
