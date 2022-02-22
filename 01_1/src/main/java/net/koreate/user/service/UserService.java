package net.koreate.user.service;

import net.koreate.user.vo.LoginDTO;
import net.koreate.user.vo.UserVO;

public interface UserService {

	//회원가입
	void join(UserVO vo) throws Exception;
	
	//로그인
	UserVO login(LoginDTO dto) throws Exception;
	
	// 아이디로 사용자 정보 확인
	UserVO getUserById(String uid) throws Exception;
}
