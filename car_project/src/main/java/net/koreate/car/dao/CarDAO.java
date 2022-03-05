package net.koreate.car.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import net.koreate.car.vo.CarVO;

public interface CarDAO {

	@Select("SELECT * FROM tbl_car")
	List<CarVO> carAllList()throws Exception;

	@Select("SELECT * FROM tbl_car WHERE ctype = #{ctype}")
	List<CarVO> eachList(String ctype)throws Exception;

}
