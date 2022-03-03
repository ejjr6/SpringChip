package net.koreate.common.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.user.service.UserService;
import net.koreate.user.vo.LoginDTO;
import net.koreate.user.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	UserService us;

	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") != null) {
			session.removeAttribute("userInfo");
		}
		
		return true;
	}



	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("LoginInterceptor postHandle");
		ModelMap map = modelAndView.getModelMap();
		LoginDTO dto = (LoginDTO)map.get("logDTO");
		
		// 아이디와 비밀번호가 일치하는 정보를 가진 사용자 정보 검색
		UserVO vo = us.login(dto);
		HttpSession session = request.getSession();
		if(vo != null) {
			session.setAttribute("userInfo", vo);
	
			if(dto.isUseCookie()) {
				Cookie cookie = new Cookie("loginCookie",dto.getUid());
				cookie.setMaxAge(60*60*24*15);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}
		
	}

	
}
