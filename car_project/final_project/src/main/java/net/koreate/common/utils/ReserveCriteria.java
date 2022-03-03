package net.koreate.common.utils;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReserveCriteria {
	
	private int page;
	private int perPageNum;
	
	// 검색
	private String carType;
	
	// 대리점 검색
	private String nsi;
	private String ngu;
	private String addr;
	private String keyword;
	
	
	public ReserveCriteria() {
		this(1,5);
	}
	
	public ReserveCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	
	
	public int getStartRow() {
		return (this.page - 1) * this.perPageNum;
	}

	// page, perPageNum 유효성 검사 보류






	
}
