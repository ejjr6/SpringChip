package net.koreate.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.user.dao.UserDAO;
import net.koreate.user.vo.LoginDTO;
import net.koreate.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO dao;
	
	@Override
	public void join(UserVO vo) throws Exception {
		dao.join(vo);
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public UserVO getUserById(String uid) throws Exception {
		return dao.getUserByID(uid);
	}

}
