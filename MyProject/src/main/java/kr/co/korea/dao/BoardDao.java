package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.BoardBean;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public int writeboard(BoardBean boardbean) {
		sqltemp.insert("board.writeboard",boardbean);
		return boardbean.getBid();
	}
	
	public BoardBean readboard(int bid) {
		return sqltemp.selectOne("board.readboard",bid);
	}
	
	public List<BoardBean> getboardlist(){
		return sqltemp.selectList("board.getboardlist");
	}
	
}
