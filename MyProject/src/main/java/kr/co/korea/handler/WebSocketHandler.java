package kr.co.korea.handler;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.server.WebSession;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class WebSocketHandler extends TextWebSocketHandler{
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		// TODO Auto-generated method stub
		
		logger.info("Socket 연결");
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		// TODO Auto-generated method stub
		
		session.sendMessage(new TextMessage(currentUserName()+"님이 로그인 하셨습니다."));
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		// TODO Auto-generated method stub
		logger.info("Socket 끊음");
	}
	
	//유저의 아이디를 가져옴
	private String currentUserName() { 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		String user = auth.getName(); 
		return user; 
	}
	
}
