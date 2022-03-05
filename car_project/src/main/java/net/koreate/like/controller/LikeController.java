package net.koreate.like.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.like.service.LikeService;
import net.koreate.vo.CarVO;
import net.koreate.vo.LikeVO;
import net.koreate.vo.ReserveVO;
import net.koreate.vo.UserVO;

@Controller
public class LikeController {

	@Inject
	LikeService ls;
	
	// 자동차 상세페이지 조회
	@GetMapping("car/carDetail/{cno}")
	public String detailCar(
			@PathVariable("cno") int cno,
			Model model
			) throws Exception {
		System.out.println(cno);
		CarVO car = ls.searchInfoCar(cno);
		model.addAttribute("car", car);
		return "car/carDetail";
	}

	// 마이페이지 조회
	@GetMapping("user/myPage")
	public void myPage(
			HttpServletRequest request,
			Model model
			) throws Exception {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userInfo");
		// 예약 현황 조회
		List<ReserveVO> reserveInfo = ls.reserveInfo(vo.getUno());
		model.addAttribute("reserveInfo", reserveInfo);
	}
	
	// 찜하기
	@PostMapping("likeCar")
	@ResponseBody
	public ResponseEntity<String> likeCar(
			LikeVO vo
			)throws Exception{
		System.out.println(vo);
		// 회원 검색
		UserVO userInfo =  ls.searchUser(vo.getUno());
		System.out.println(userInfo);
		
		ResponseEntity<String> entity = null;
		
		try {
			if(vo.getFavorite() == 1) {
				// 찜 목록 추가
				ls.addLikeCar(vo);
			}else {
				// 찜 목록 삭제
				ls.deleteLikeCar(vo);
			}
			
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 비밀번호 일치 여부
	@PostMapping("upwCheck")
	@ResponseBody
	public boolean upwCheck(
			@RequestParam("uid") String uid, 
			String upw) throws Exception{
		boolean isCheck = ls.checkPW(uid, upw);
		System.out.println(isCheck);
		return isCheck;
	}
	
	// 회원 정보 변경
	@PostMapping("user/modify")
	public String modify(
			UserVO vo,
			RedirectAttributes rttr
			) throws Exception {
		// upw : 기존 비밀번호, reupw : 수정할 비밀번호, uphone : 바꿀 전화번호
		boolean isCheck = false;
		
		if(vo.getReupw() != null && vo.getUphone() != null) {
			isCheck = ls.updateInfo(vo);
		}
		
		String result = isCheck ? "수정이 완료되었습니다." : "수정 실패했습니다.";
		
		rttr.addFlashAttribute("result", result);
		return "redirect:/user/myPage";
	}
	
}
