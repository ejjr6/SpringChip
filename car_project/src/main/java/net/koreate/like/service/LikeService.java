package net.koreate.like.service;


import java.util.List;

import net.koreate.vo.CarVO;
import net.koreate.vo.LikeVO;
import net.koreate.vo.ReserveVO;
import net.koreate.vo.UserVO;



public interface LikeService {
	
	// 좋아요 추가
	public void addLikeCar(LikeVO vo) throws Exception;
	
	// 좋아요 취소
	public void deleteLikeCar(LikeVO vo) throws Exception;

	// 회원의 좋아요 목록
	public List<LikeVO> likeCarList(int uno) throws Exception;

	// 회원 정보 검색
	public UserVO searchUser(int uno) throws Exception;

	// 자동차 상세 정보 조회
	public CarVO searchInfoCar(int cno) throws Exception;
	
	// 회원의 좋아요 한 차의 정보 목록
	public List<CarVO> infoCar(int uno) throws Exception;

	// 회원 비밀번호 체크
	public boolean checkPW(String uid, String upw) throws Exception;

	// 회원 정보 수정(비밀번호+전화번호)
	public boolean updateInfo(UserVO vo) throws Exception;

	// 예약 현황
	public List<ReserveVO> reserveInfo(int uno) throws Exception;
	
}
