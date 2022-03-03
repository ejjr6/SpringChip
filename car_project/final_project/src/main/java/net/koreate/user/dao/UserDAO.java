package net.koreate.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import net.koreate.vo.LoginDTO;
import net.koreate.vo.UserVO;

public interface UserDAO {

	//회원가입
	@Insert("INSERT INTO user_tbl(uid,upw,reupw,uname,uphone) VALUES(#{uid},#{upw},#{reupw},#{uname},#{uphone})")
	void join(UserVO vo) throws Exception;

	//로그인
	@Select("SELECT * FROM user_tbl WHERE uid = #{uid} AND upw = #{upw}")
	UserVO login(LoginDTO dto) throws Exception;

	@Select("SELECT * FROM user_tbl WHERE uid = #{uid}")
	UserVO getUserByID(String uid) throws Exception;
	
}
