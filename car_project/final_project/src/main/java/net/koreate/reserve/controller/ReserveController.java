package net.koreate.reserve.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import net.koreate.reserve.service.ReserveService;
import net.koreate.reserve.vo.UserIfmVO;

@Controller
public class ReserveController {
	
	@Inject
	ReserveService rs;
	
	// 예약 정보 저장 
	@PostMapping("userPost")
	public String userPost(
			UserIfmVO vo,
			Model model)throws Exception{
		System.out.println(vo);
		
		// 예약 정보 insert
		// 결과에 따라 confirm 창 - 마이페이지 / main
		boolean result = rs.insertRe(vo);
		System.out.println(result);
		
		model.addAttribute("result", result);
		return "user/userIfm";
	}
}
