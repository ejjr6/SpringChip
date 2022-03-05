package net.koreate.car.service;

import java.util.List;

import net.koreate.car.vo.CarVO;

public interface CarService {
	
	// 차종 전체 리스트
	List<CarVO> carAllList() throws Exception;

	// 각각 트럭, 버스 리스트
	List<CarVO> eachList(String carType) throws Exception;

}
