package net.koreate.vo;

import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	
	private int uno;
	private String uid;
	private String upw;
	private String reupw;
	private String uname;
	private String uphone;
	
	/*
	 * public UserVO(String upw) { this.setUpw(upw); }
	 * 
	 * public UserVO(String upw, int uphone) { this.setUpw(upw);
	 * this.setUphone(uphone); }
	 */
	
	// private List<LikeVO> likeList;
}
