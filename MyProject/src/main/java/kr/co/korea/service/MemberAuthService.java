package kr.co.korea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.co.korea.beans.MemberAuthBean;
import kr.co.korea.dao.MemberAuthDao;

public class MemberAuthService implements UserDetailsService{
	
	@Autowired
	private MemberAuthDao memberdao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		MemberAuthBean member = memberdao.getMeminfo(username);
		
		if(member==null) {
			throw new UsernameNotFoundException(username);
		}
		
		if(member.getMdrop()!=0) {
			member.setENABLED(false);
		}else {
			member.setENABLED(true);
		}
		
		if(member.getMlevel()==0) {
			member.setAUTHORITY("ROLE_MEMBER");
		}else {
			member.setAUTHORITY("ROLE_ADMIN");
		}
		
		return member;
	}

	
	
}
