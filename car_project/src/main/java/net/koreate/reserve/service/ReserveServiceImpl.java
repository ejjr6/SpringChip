package net.koreate.reserve.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.reserve.dao.ReserveDAO;
import net.koreate.reserve.vo.UserIfmVO;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Inject
	ReserveDAO rd;
	
	@Override
	public boolean insertRe(UserIfmVO vo) throws Exception {
		int result = rd.insertRe(vo);
		return result < 0 ? false : true ;
	}

}
