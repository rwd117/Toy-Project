package kr.co.korea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.LikeBean;
import kr.co.korea.dao.LikeDao;

@Service
public class LikeService {
	
	@Autowired
	private LikeDao likedao;
	
	public int ltlikecount(LikeBean likebean) {
		return likedao.ltlikecount(likebean);
	}
	
	public int ltlikegetinfo(LikeBean likebean) {
		return likedao.ltlikegetinfo(likebean);
	}
	
	public void likeinsert(LikeBean likebean) {
		likedao.likeinsert(likebean);
	}
	
	public int likeupdate(LikeBean likebean) {
		likedao.likeupdate(likebean);
		return likebean.getAllltlike();
	}
	
}
