package net.koreate.branch.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.common.utils.ReserveCriteria;

public class BranchQueryProvider {

	/* 검색 시 쿼리 */
	public String searchSelectSql(ReserveCriteria cri) {
		
		SQL sql = new SQL();
		sql.SELECT("*");
		sql.FROM("tbl_reserve");
		
		getSearchWhere(cri, sql);
		
		sql.LIMIT(cri.getStartRow()+", "+cri.getPerPageNum());
		
		String query = sql.toString();
		System.out.println(query);
		return query;
	}
	
	
	
	// 수정 요망 ! (WHERE이 여러개 붙으면 and로 () 묶여서 or이 이상하게 적용됨.)
	
	// WHERE 조건 절
	public void getSearchWhere(ReserveCriteria cri, SQL sql) {
		
		if(cri.getNsi() != null && !cri.getNsi().equals("")
				&&
		   cri.getNgu() != null && !cri.getNgu().equals("")) {
			sql.WHERE("nsi= '"+cri.getNsi()+"' AND ngu = '"+cri.getNgu()+"'");
			
			getKeywhere(cri,sql);
			
		}else if(cri.getNsi() != null
				 &&
				!cri.getNsi().equals("")) {
			
			sql.WHERE("nsi ='"+cri.getNsi()+"'");
			
			getKeywhere(cri,sql);
			
		}else if(cri.getKeyword() != null) {
			
			getKeywhere(cri,sql);
		}
	}
	
	// keyword 검색 조건절
	public void getKeywhere(ReserveCriteria cri, SQL sql) {
		if(cri.getKeyword() != null && !cri.getKeyword().equals("")) {
			sql.WHERE("baddr LIKE CONCAT('%','"+cri.getKeyword()+"','%')").OR()
			.WHERE("bname LIKE CONCAT('%','"+cri.getKeyword()+"','%')");
			
		}
	}
	
	
	/* 검색한 후 totalCount */
	public String searchSelectCount(ReserveCriteria cri) {
		return new SQL(){
			{
				SELECT("count(*)");
				FROM("tbl_reserve");
				getSearchWhere(cri, this);
			}
		}.toString();
	}
	

}
