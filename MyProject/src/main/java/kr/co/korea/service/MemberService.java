package kr.co.korea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.MemberBean;
import kr.co.korea.dao.MemberDao;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberdao;
	
	public void inserMember(MemberBean memberbean) {
		memberdao.inserMember(memberbean);
	}
}
