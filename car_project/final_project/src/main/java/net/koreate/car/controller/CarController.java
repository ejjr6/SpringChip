package net.koreate.car.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.koreate.car.service.CarService;
import net.koreate.car.vo.CarVO;

@Controller
@RequestMapping("/car/*")
public class CarController {
	
	@Inject 
	CarService cs;
	
	
	@GetMapping("carSelect")
	public String carSelect() {
		return "car/carSelect";
	}
	
	@PostMapping("carSelect")
	@ResponseBody
	public CarVO carSelect(CarVO vo,HttpSession session) throws Exception{
		System.out.println(vo);
		session.setAttribute("carVO", vo);
		return vo;
	} 
	
	
	@GetMapping("carAllList")
	@ResponseBody
	public ResponseEntity<Object> carAllList() throws Exception{
		ResponseEntity<Object> entity = null;
		
		try {
			List<CarVO> carAllList = cs.carAllList();
			entity = new ResponseEntity<>(carAllList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("eachList")
	@ResponseBody
	public ResponseEntity<Object> eachList(CarVO vo) throws Exception{
		ResponseEntity<Object> entity = null;
		
		System.out.println(vo);
		
		List<CarVO> eachList = cs.eachList(vo.getCtype());
		
		try {
			entity = new ResponseEntity<>(eachList,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
