package kr.co.korea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.BoardBean;
import kr.co.korea.dao.BoardDao;

@Service
public class BoardService {

	@Autowired
	private BoardDao boarddao;
	
	public void writeboard(BoardBean boardbean,String username) {
		boardbean.setBwriter(username);
		boarddao.writeboard(boardbean);
	}
	
	public BoardBean readboard(int bid) {
		return boarddao.readboard(bid);
	}
	
	public List<BoardBean> getboardlist(){
		return boarddao.getboardlist();
	}
	
	public void updateBoard(BoardBean boardbean) {
		boarddao.updateBoard(boardbean);
	}
	
	public void deleteBoard(int bid) {
		boarddao.deleteBoard(bid);
	}
	
}
