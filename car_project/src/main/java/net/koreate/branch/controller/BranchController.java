package net.koreate.branch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.koreate.branch.service.BranchService;
import net.koreate.branch.vo.AreaVO;
import net.koreate.branch.vo.BranchVO;
import net.koreate.common.utils.ReserveCriteria;
import net.koreate.common.utils.ReservePageMaker;

@Controller
public class BranchController {
	
	@Inject
	BranchService bs;
	
	// 영업점 선택 버튼 클릭 시 - 시/도 리스트도 같이 넘어가게 설정
	@GetMapping("branch/branchSelect")
	public String branchSelect(Model model) throws Exception{
		
		// 시/도 리스트 
		List<AreaVO> siDoList = bs.siDoList();
		model.addAttribute("siDoList",siDoList);
		
		return "branch/branchSelect";
	}
	
	// 시/도 selectBox 선택 시
	@GetMapping("/guGun")
	@ResponseBody
	public List<AreaVO> guGunList(String nsi) throws Exception{
		
		// (시/도 선택에 따라 변화하는) 구/군 리스트
		List<AreaVO> guGunList = bs.guGunList(nsi);
		return guGunList;
	}
	
	// 지점 리스트 (페이징 처리 OK)
	@PostMapping("branch/branchSelect")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> branchList(
				ReserveCriteria cri
			) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		
		try {
			Map<String, Object> map = new HashMap<>();
//			ReserveCriteria cri = new ReserveCriteria(page,5);
//			cri = new ReserveCriteria(page,5);
			// 페이징 처리된 리스트
			List<BranchVO> list = bs.branchList(cri);
			map.put("list", list);
			// 현재 페이지의 페이징 블럭 정보
			ReservePageMaker pm = bs.getPageMaker(cri);
			map.put("pm", pm);
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 선택한 지점 - session 저장  (BranchVO type)
	@GetMapping("/branchVal")
	@ResponseBody
	public BranchVO branchVal(
				BranchVO vo, HttpSession session
			) throws Exception{
		
		session.setAttribute("branchVO", vo);
		System.out.println(vo);
		return vo;
	}
	
	// 내용 작성 페이지 go
	@GetMapping("user/userIfm")
	public String userIfm() {
		return "user/userIfm";
	}
	
}
