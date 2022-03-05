package net.koreate.branch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import net.koreate.branch.provider.BranchQueryProvider;
import net.koreate.branch.vo.AreaVO;
import net.koreate.branch.vo.BranchVO;
import net.koreate.common.utils.ReserveCriteria;

public interface BranchDAO {

	// 시/도 리스트
	@Select("SELECT * FROM tbl_areaSi")
	List<AreaVO> siDoList()throws Exception;

	// 구/군 리스트
	@Select("SELECT * FROM tbl_areaGu WHERE nsi = #{nsi}")
	List<AreaVO> guGunList(String nsi);

	// 지점 리스트
//	@Select("SELECT * FROM tbl_reserve limit #{startRow}, #{perPageNum}")
	@SelectProvider(type=BranchQueryProvider.class, method="searchSelectSql")
	List<BranchVO> branchList(ReserveCriteria cri);

	// 리스트 totalCount
//	@Select("SELECT count(*) FROM tbl_reserve")
	@SelectProvider(type=BranchQueryProvider.class, method="searchSelectCount")
	int totalCount(ReserveCriteria cri) throws Exception;
	
	
}
