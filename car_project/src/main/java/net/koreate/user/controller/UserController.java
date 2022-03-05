package net.koreate.user.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.user.service.UserService;
import net.koreate.vo.LoginDTO;
import net.koreate.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Inject
	UserService us;

	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}
	
	
	@RequestMapping("/join")
	public String join() {
		return "user/join";
	}
	
	@PostMapping("/joinPost")
	public String joinPost(UserVO vo, RedirectAttributes rttr) throws Exception{
		us.join(vo);
		rttr.addFlashAttribute("message","회원가입 성공");
		return "redirect:/user/login";
	}
	
	@PostMapping("/loginPost")
	public ModelAndView loginPost(LoginDTO dto, ModelAndView mav) {
		System.out.println(dto);
		mav.addObject("logDTO",dto);
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@GetMapping("/logOut")
	public String logOut(HttpSession session, 
			HttpServletResponse response, 
			@CookieValue(name="loginCookie", required=false)Cookie loginCookie) {
		if(session.getAttribute("userInfo") != null) {
			session.removeAttribute("userInfo");
			if(loginCookie != null) {
				System.out.println("cookie key : " + loginCookie.getName());
				System.out.println("cookie value : " + loginCookie.getValue());
				loginCookie.setMaxAge(0);
				loginCookie.setPath("/");
				response.addCookie(loginCookie);
			}
		}
		
		return "redirect:/";
	}
}
