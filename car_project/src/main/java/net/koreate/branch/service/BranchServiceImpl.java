package net.koreate.branch.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.branch.dao.BranchDAO;
import net.koreate.branch.vo.AreaVO;
import net.koreate.branch.vo.BranchVO;
import net.koreate.common.utils.ReserveCriteria;
import net.koreate.common.utils.ReservePageMaker;

@Service
public class BranchServiceImpl implements BranchService {

	@Inject
	BranchDAO bd;
	
	@Override
	public List<AreaVO> siDoList() throws Exception {
		return bd.siDoList();
	}

	@Override
	public List<AreaVO> guGunList(String nsi) throws Exception{
		return bd.guGunList(nsi);
	}

	@Override
	public List<BranchVO> branchList(ReserveCriteria cri) throws Exception {
		return bd.branchList(cri);
	}

	@Override
	public ReservePageMaker getPageMaker(ReserveCriteria cri) throws Exception {
		int totalCount = bd.totalCount(cri);
		ReservePageMaker pm = new ReservePageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(totalCount);
		return pm;
	}

}
