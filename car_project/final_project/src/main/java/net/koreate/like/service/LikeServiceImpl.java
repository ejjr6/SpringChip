package net.koreate.like.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.like.dao.LikeDAO;
import net.koreate.vo.CarVO;
import net.koreate.vo.LikeVO;
import net.koreate.vo.ReserveVO;
import net.koreate.vo.UserVO;


@Service
public class LikeServiceImpl implements LikeService {

	@Inject
	LikeDAO ld;
	
	// 찜하기 추가
	@Override
	public void addLikeCar(LikeVO vo) throws Exception {
		ld.addLikeCar(vo);
	}
	
	// 찜하기 취소
	@Override
	public void deleteLikeCar(LikeVO vo) throws Exception {
		ld.deleteLikeCar(vo);
	}
	
	// 찜하기 목록 검색
	@Override
	public List<LikeVO> likeCarList(int uno) throws Exception  {
		List<LikeVO> vo = ld.searchLikeList(uno);
		return vo;
	}

	// 회원 정보 검색
	@Override
	public UserVO searchUser(int uno) throws Exception  {
		UserVO vo = ld.searchUser(uno);
		return vo;
	}

	// 자동차 상세 정보 조회
	@Override
	public CarVO searchInfoCar(int cno) throws Exception {
		CarVO car = ld.searchInfoCar(cno);
		return car;
	}

	// 찜한 자동차 검색
	@Override
	public List<CarVO> infoCar(int uno) throws Exception {
		List<CarVO> car = ld.infoCar(uno);
		return car;
	}

	// 비밀번호 확인
	@Override
	public boolean checkPW(String uid, String upw) throws Exception {
		UserVO vo = ld.checkPW(uid,upw);
		System.out.println(vo);
		// vo가 널이면 일치하는 회원이 없으니까 false 반환
		return vo == null ? false : true;
	}

	// 회원 정보 수정
	@Override
	public boolean updateInfo(UserVO vo) throws Exception {
		return ld.updateInfo(vo) > 0 ? true : false;
	}

	// 예약 현황 조회
	@Override
	public List<ReserveVO> reserveInfo(int uno) throws Exception {
		List<ReserveVO> list = ld.reserveInfo(uno);
		return list;
	}
}
