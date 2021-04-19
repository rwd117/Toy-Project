package kr.co.korea.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.korea.beans.BoardBean;
import kr.co.korea.service.BoardService;

public class WriterInterceptor implements HandlerInterceptor{
	
	@Autowired
	private BoardService boardservice;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		String user = auth.getName(); 
		
		String uri = request.getRequestURI();//현재 uri값 
		String temp = uri.substring(uri.lastIndexOf("/")+1);//마지막 /를 기준으로 값을 가져옴
		int bid = Integer.valueOf(temp);//bid 값
		
		BoardBean boardbean = boardservice.readboard(bid);
		
		if(user != boardbean.getBwriter()) {
			String rootPath = request.getContextPath();
			response.sendRedirect(rootPath+"/boards/notwriter");
			return false;
		}
		
		return true;
	}
}
