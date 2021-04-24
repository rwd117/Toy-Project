package kr.co.korea.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.LikeBean;

@Repository
public class LikeDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public int ltlikecount(LikeBean likebean) {
		return sqltemp.selectOne("like.ltlikecount",likebean);
	}
	
	public int ltlikegetinfo(LikeBean likebean) {
		return sqltemp.selectOne("like.ltlikegetinfo",likebean);
	}
	
	public void likeinsert(LikeBean likebean) {
		sqltemp.insert("like.likeinsert",likebean);
	}
	
	public int likeupdate(LikeBean likebean) {
		sqltemp.update("like.likeupdate",likebean);
		return likebean.getAllltlike();
	}
	
}
