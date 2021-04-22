package kr.co.korea.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.LikeBean;

@Repository
public class LikeDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public String likeCheck(LikeBean likebean) {
		return sqltemp.selectOne("like.likecheck",likebean);
	}
	
	public int ltlikeCheck(LikeBean likebean) {
		return sqltemp.selectOne("like.ltlikecheck",likebean);
	}
	
}
