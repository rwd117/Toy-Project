package kr.co.korea.handler;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class WebSocketHandler extends TextWebSocketHandler{
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		// TODO Auto-generated method stub
		logger.info("Socket 연결");
		sessions.add(session);
		logger.info(currentUserName(session));//현재 접속한 사람
		userSessionsMap.put(currentUserName(session),session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		// TODO Auto-generated method stub
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg
		
		if(msg != null) {
			String[] msgs = msg.split(",");
			if(msgs != null && msgs.length ==4) {//length가 필요한가?
				String bid = msgs[0];//게시물 번호
				String receiver = msgs[1];//글 작성자
				String count = msgs[2];//0이면 좋아요 취소 1이면 좋아요
				String btitle = msgs[3];//게시물 제목
				String comment = "";
				if(count.equals("0")) {
					comment = "을 좋아합니다.";
				}
				String mid = currentUserName(session);//좋아요 누른 사람
				
				WebSocketSession receiversession = userSessionsMap.get(receiver);//글 작성자가 현재 접속중인가 체크
				
				if(receiversession !=null) {
					TextMessage txtmsg = new TextMessage(mid+"님이" + receiver + "님의" + 
					"<a type='external' href='"+bid+"'>" + btitle + "</a> 게시물을 좋아합니다.");
					receiversession.sendMessage(txtmsg);//작성자에게 알려줍니다
					logger.info("Msg");
				}else {
					TextMessage txtmsg = new TextMessage(mid+"님이" + receiver + "님의" + 
							"<a type='external' href='"+bid+"'>" + btitle + "</a> 게시물을 좋아합니다.");
					session.sendMessage(txtmsg);//보내지는지 체크하기
					logger.info("Msg");
				}
				
			}
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		// TODO Auto-generated method stub
		logger.info("Socket 끊음");
		sessions.remove(session);
		userSessionsMap.remove(currentUserName(session),session);
	}
	

//	유저의 아이디를 가져옴
//	null예외 오류 발생
//	private String currentUserName() { 
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
//		String user = auth.getName();
//		
//		return user; 
//	}
	
	private String currentUserName(WebSocketSession session) {
		String mid = session.getPrincipal().getName();
		return mid;
	}
	
}
