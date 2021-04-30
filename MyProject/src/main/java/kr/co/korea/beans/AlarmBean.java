package kr.co.korea.beans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AlarmBean {
	
	private int aid;//기본키
	private int abid;//게시물 번호
	private int acheck;//읽음 표시
	private String amid;//좋아요 누른 사람
	private String areceiver;//게시물 작성자
	private String acontent;//알림 타입(좋아요를 눌러서 알림)
	
	
}
