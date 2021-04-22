package kr.co.korea.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.LikeBean;
import kr.co.korea.dao.LikeDao;

@Service
public class LikeService {
	
	@Autowired
	private LikeDao likedao;
	
	public String likeCheck(LikeBean likebean) {
		return likedao.likeCheck(likebean);
	}
	
	public int ltlikeCheck(LikeBean likebean) {
		return likedao.ltlikeCheck(likebean);
	}
	
}
