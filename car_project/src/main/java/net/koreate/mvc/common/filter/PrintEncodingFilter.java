package net.koreate.mvc.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class PrintEncodingFilter implements Filter {

	String filterParam;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("PrintEncoding Filter init() 시작 -------");
		filterParam = filterConfig.getInitParameter("filterParam");
		System.out.println("filterParam : " + filterParam);
		System.out.println("PrintEncoding Filter init() 종료 -------");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("PrintEncodingFilter doFilter() 시작 ------");
		HttpServletRequest req = (HttpServletRequest) request;
		System.out.println("요청 URI : " + req.getRequestURI());
		String method = req.getMethod();
		System.out.println("전송방식 : " + method);
		if (method.equalsIgnoreCase("POST")) {
			req.setCharacterEncoding(filterParam);
		}
		chain.doFilter(request, response);
		System.out.println("PrintEncodingFilter doFilter() 종료 ------");

	}

	@Override
	public void destroy() {
		System.out.println("PrintEncodingFilter destroy() 호출 ------");
	}

}
