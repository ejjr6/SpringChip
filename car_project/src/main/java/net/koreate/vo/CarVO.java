package net.koreate.vo;

import lombok.Data;

@Data
public class CarVO {
	
	private int cno;					// 차 번호
	private String ctype;				// 차종
	private String cname;				// 차 이름
	private String cexpl;				// 차 설명
	private String performance;
	private String technology;
	private String design;
}

