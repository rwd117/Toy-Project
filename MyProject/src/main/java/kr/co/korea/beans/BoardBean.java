package kr.co.korea.beans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardBean {
	
	private int bid;
	private String btitle;
	private String bcontent;
	private String bdate;
	private String bwriter;
	
}
