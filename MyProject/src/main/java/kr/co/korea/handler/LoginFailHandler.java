package kr.co.korea.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailHandler implements AuthenticationFailureHandler {
	
	private String loginidname;
	private String loginpwdname;
	private String defaultFailurl;
	
	

	public String getLoginidname() {
		return loginidname;
	}

	public void setLoginidname(String loginidname) {
		this.loginidname = loginidname;
	}

	public String getLoginpwdname() {
		return loginpwdname;
	}

	public void setLoginpwdname(String loginpwdname) {
		this.loginpwdname = loginpwdname;
	}

	public String getDefaultFailurl() {
		return defaultFailurl;
	}

	public void setDefaultFailurl(String defaultFailurl) {
		this.defaultFailurl = defaultFailurl;
	}




	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String username=request.getParameter(loginidname);
		String password=request.getParameter(loginpwdname);
		
		request.setAttribute(loginidname, username);
		request.setAttribute(loginpwdname, password);
		
		request.getRequestDispatcher(defaultFailurl).forward(request, response);
		
		
		
	}

	
	
}
