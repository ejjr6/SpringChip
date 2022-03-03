package net.koreate.reserve.service;

import net.koreate.reserve.vo.UserIfmVO;

public interface ReserveService {

	// 예약 정보 / DB insert
	boolean insertRe(UserIfmVO vo)throws Exception;

}
