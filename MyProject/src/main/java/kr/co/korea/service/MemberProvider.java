package kr.co.korea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;

import kr.co.korea.beans.MemberAuthBean;

public class MemberProvider implements AuthenticationProvider{
	
	@Autowired
	private UserDetailsService userdservice;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		
			String username = (String) authentication.getPrincipal();//입력받은 아이디
	        String password = (String) authentication.getCredentials();//입력받은 비밀번호
	        
	        MemberAuthBean user = (MemberAuthBean) userdservice.loadUserByUsername(username);
	        
	        if(!matchPassword(password, user.getPassword())) {
	            throw new BadCredentialsException(username);
	        }
	 
	        if(!user.isEnabled()) {
	            throw new BadCredentialsException(username);
	        }
	        //토큰으로 ㄱ
	        return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
	}

	@Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
    
    private boolean matchPassword(String loginPwd, String password) {
        return loginPwd.equals(password);
    }

	
	
}
