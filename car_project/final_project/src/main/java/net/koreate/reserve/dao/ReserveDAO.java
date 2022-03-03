package net.koreate.reserve.dao;

import org.apache.ibatis.annotations.Insert;

import net.koreate.reserve.vo.UserIfmVO;

public interface ReserveDAO {

	@Insert("INSERT INTO tbl_userIfm "
			+ " VALUES(#{uno},#{uname},#{uphone},#{utext},#{cname},#{bname},#{baddr},#{bphone})")
	int insertRe(UserIfmVO vo) throws Exception;
	
}
