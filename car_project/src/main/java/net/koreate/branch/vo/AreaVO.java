package net.koreate.branch.vo;

import lombok.Data;

@Data
public class AreaVO {

	private String nsi;			// 시/도 코드번호
	private String si;			// 시/도
	
	private String ngu;			// 구/군 코드번호
	private String gu;			// 구/군
}
