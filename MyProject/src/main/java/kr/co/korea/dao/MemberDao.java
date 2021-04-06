package kr.co.korea.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.MemberBean;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public void inserMember(MemberBean memberbean) {
		sqltemp.insert("member.joinMember",memberbean);
	}
}
