package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.BoardBean;
import kr.co.korea.beans.Criteria;

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
	
	public List<BoardBean> getboardlist(Criteria cri){
		return sqltemp.selectList("board.getboardlist",cri);
	}
	
	public void updateBoard(BoardBean boardbean) {
		sqltemp.update("board.updateboard",boardbean);
	}
	
	public void deleteBoard(int bid) {
		sqltemp.delete("board.deletebaord",bid);
	}
	
	public int countBoard() {
		return sqltemp.selectOne("board.countboard");
	}
	
	
}
