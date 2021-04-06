package kr.co.korea.beans;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class MemberAuthBean implements UserDetails{
	
	private String mid;
    private String mpwd;
    private String AUTHORITY;
    private boolean ENABLED;//사용여부
    private String mname;//이름
    private int mlevel;
    private int mdrop;
	
	public void setAUTHORITY(String aUTHORITY) {
		AUTHORITY = aUTHORITY;
	}

	public int getMlevel() {
		return mlevel;
	}

	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}

	public int getMdrop() {
		return mdrop;
	}

	public void setMdrop(int mdrop) {
		this.mdrop = mdrop;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(AUTHORITY));
        return auth;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return mpwd;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return mid;
	}
	
	public String getNAME() {
		return mname;
	}

	public void setNAME(String nAME) {
		mname = nAME;
	}
	
	
	

	public void setENABLED(boolean eNABLED) {
		ENABLED = eNABLED;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return ENABLED;
	}
	
	
	
}
