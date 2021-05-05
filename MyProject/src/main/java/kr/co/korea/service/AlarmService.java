package kr.co.korea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.AlarmBean;
import kr.co.korea.dao.AlarmDao;

@Service
public class AlarmService {

	@Autowired
	private AlarmDao alarmdao;
	
	public List<AlarmBean> alarmlist(String mid){
		return alarmdao.alarmlist(mid);
	}
	
	public void alarminsert(AlarmBean alarmbean) {
		alarmdao.alarminsert(alarmbean);;
	}
	
	public void alarmupdate(int aid) {
		alarmdao.alarmupdate(aid);
	}
	
	public int alarmcount(String mid) {
		return alarmdao.alarmcount(mid);
	}
	
}
