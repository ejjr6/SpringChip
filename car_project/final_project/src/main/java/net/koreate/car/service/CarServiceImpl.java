package net.koreate.car.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.car.dao.CarDAO;
import net.koreate.car.vo.CarVO;

@Service
public class CarServiceImpl implements CarService {
	
	@Inject
	CarDAO cd;
	
	@Override
	public List<CarVO> carAllList() throws Exception {
		return cd.carAllList();
	}

	@Override
	public List<CarVO> eachList(String ctype) throws Exception {
		return cd.eachList(ctype);
	}

}
