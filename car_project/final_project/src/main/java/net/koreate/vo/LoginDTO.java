package net.koreate.vo;

import lombok.Data;

@Data
public class LoginDTO {

	private String uid;
	private String upw;
	private boolean useCookie;
	
}
