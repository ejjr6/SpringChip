package net.koreate.like.interceptor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.like.service.LikeService;
import net.koreate.vo.CarVO;
import net.koreate.vo.UserVO;

public class LikeInterceptor extends HandlerInterceptorAdapter {

	@Inject
	LikeService ls;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") != null) {
			System.out.println("찜한 자동차 정보 조회");
			UserVO vo = (UserVO) session.getAttribute("userInfo");
			List<CarVO> infoLike = ls.infoCar(vo.getUno());
			session.setAttribute("infoLike", infoLike);
		}
		
		return true;
	}

	
}
