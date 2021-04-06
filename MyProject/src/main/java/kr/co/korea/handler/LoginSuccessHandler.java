package kr.co.korea.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	
	private String loginidname;
    private String defaultUrl;
    private RequestCache requestcache = new HttpSessionRequestCache();
    private RedirectStrategy redirectstrategy = new DefaultRedirectStrategy();
    
    
	public String getLoginidname() {
		return loginidname;
	}

	public void setLoginidname(String loginidname) {
		this.loginidname = loginidname;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}
	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		resultRedirectStrategy(request, response, authentication);
		
		clearAuthenticationAttributes(request);
		
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
        SavedRequest savedRequest = requestcache.getRequest(request, response);//로그인 전의 화면을 가져옴
        
        if(savedRequest!=null) {
            String targetUrl = savedRequest.getRedirectUrl();
            redirectstrategy.sendRedirect(request, response, targetUrl);
        } else {
        	redirectstrategy.sendRedirect(request, response, defaultUrl);//직접 로그인 눌렀을 때
        }
        
    }
	
	  protected void clearAuthenticationAttributes(HttpServletRequest request) {//로그인 실패하면 세션에 남는 것을 성공시 지움
	        HttpSession session = request.getSession(false);
	        if(session==null) return;
	        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	    }



}
