package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.AlarmBean;

@Repository
public class AlarmDao {

	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public List<AlarmBean> alarmlist(){
		return sqltemp.selectList("alarm.alarmlist");
	}
	
	public void alarminsert(AlarmBean alarmbean) {
		sqltemp.insert("alarm.alarminsert",alarmbean);
	}
	
	public void alarmupdate(int aid) {
		sqltemp.update("alarm.alarmupdate",aid);
	}
	
}
