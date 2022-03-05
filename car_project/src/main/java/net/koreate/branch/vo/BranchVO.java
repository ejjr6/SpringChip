package net.koreate.branch.vo;

import lombok.Data;

@Data
public class BranchVO {
	
//	private int bno;				// 지점 번호(각 지점 고유번호)
	private String bname;			// 지점 이름
	private String baddr;			// 지점 주소
	private String bphone;			// 지점 전화번호
	
	private String blati;			// 지도 - 위도
	private String blongi;			// 지도 - 경도
	
	
}
