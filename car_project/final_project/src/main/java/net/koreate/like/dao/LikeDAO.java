package net.koreate.like.dao;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.vo.CarVO;
import net.koreate.vo.LikeVO;
import net.koreate.vo.ReserveVO;
import net.koreate.vo.UserVO;


public interface LikeDAO {

	
	// 찜하기 추가
	@Insert("INSERT INTO like_tbl(uno,cno,favorite) VALUES(#{uno},#{cno},#{favorite})")
	void addLikeCar(LikeVO vo) throws Exception;
	
	
	// 찜하기 삭제
	@Delete("DELETE FROM like_tbl WHERE uno = #{uno} AND cno = #{cno}")
	void deleteLikeCar(LikeVO vo);
	
	
	// 찜 목록 검색
	@Select("SELECT * FROM like_tbl WHERE uno = #{uno}")
	List<LikeVO> searchLikeList(int uno) throws Exception ;
	
	
	// 로그인된 사용자 검색
	@Select("SELECT * FROM user_tbl WHERE uno = #{uno}")
	UserVO searchUser(int uno) throws Exception ;

	// 자동차 상세 조회
	@Select("SELECT * FROM tbl_car WHERE cno = #{cno}")
	CarVO searchInfoCar(int cno) throws Exception;

	// 찜한 자동차 정보 검색
	@Select("SELECT C.* FROM like_tbl AS L JOIN tbl_car AS C on L.cno = C.cno WHERE uno = #{uno}")
	List<CarVO> infoCar(int uno) throws Exception;
	
	// ??
	@Select("SELECT * FROM user_tbl WHERE uid = #{uid} AND upw = #{upw}")
	UserVO checkPW(
			@Param("uid") String uid,
			@Param("upw") String upw) throws Exception;

	
	// 회원 정보 수정(비밀번호+전화번호)
	@Update("UPDATE user_tbl SET upw = #{reupw}, reupw = #{reupw}, uphone = #{uphone} WHERE uid = #{uid} ")
	int updateInfo(UserVO vo) throws Exception;
	
	// 예약 현황 조회
	@Select("SELECT * FROM tbl_userIfm WHERE uno = #{uno}")
	List<ReserveVO> reserveInfo(int uno) throws Exception;
	
}
