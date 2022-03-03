package net.koreate.common.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import net.koreate.user.service.UserService;
import net.koreate.vo.UserVO;

public class CheckCookieInterceptor extends HandlerInterceptorAdapter{

	@Inject
	UserService us;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("CheckCookie 시작");
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") != null){
			System.out.println("사용자 정보 세션에 이미 존재");
			return true;
		}
		
		Cookie cookie = WebUtils.getCookie(request, "loginCookie");
		if(cookie != null) {
			UserVO vo = us.getUserById(cookie.getValue());
			System.out.println("Cookie User : " + vo);
			if(vo != null) {
				session.setAttribute("userInfo", vo);
			}
		}
		return true;
	}
	
	
	
}
