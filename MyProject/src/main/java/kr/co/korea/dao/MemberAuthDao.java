package kr.co.korea.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.MemberAuthBean;

@Repository
public class MemberAuthDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public MemberAuthBean getMeminfo(String username) {
		return sqltemp.selectOne("member.getUserbyid",username);
	}
	
}
