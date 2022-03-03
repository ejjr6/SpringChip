package net.koreate.branch.service;

import java.util.List;

import net.koreate.branch.vo.AreaVO;
import net.koreate.branch.vo.BranchVO;
import net.koreate.common.utils.ReserveCriteria;
import net.koreate.common.utils.ReservePageMaker;

public interface BranchService {

	// 시/도 리스트
	List<AreaVO> siDoList() throws Exception;

	// 구/군 리스트 - ajax
	List<AreaVO> guGunList(String nsi) throws Exception;

	// 지점 리스트
	List<BranchVO> branchList(ReserveCriteria cri) throws Exception;

	// 페이징 블럭 정보
	ReservePageMaker getPageMaker(ReserveCriteria cri) throws Exception;
	
	
	
}
