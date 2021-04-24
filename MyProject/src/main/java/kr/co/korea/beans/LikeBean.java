package kr.co.korea.beans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LikeBean {
	
	private String ltmid;
	private int ltbid;
	private int ltlike;
	private int count;//좋아요가 눌린 상태인가 아닌가.
	private int allltlike;
}
