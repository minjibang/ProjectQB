package socket;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import onet.com.teacher.dao.TeacherDao;

public class LoginSocketHandler extends TextWebSocketHandler {

	@Autowired
	SqlSession sqlsession;

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	SessionMaps.getAlarmusers().put(session.getId(), session); // SessionMaps.getALarmusrs() => alarmusers를  return ( HashMap )
	System.out.println("연결됐다");
		//super.afterConnectionEstablished(session);
	}

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("메시지 보냈다.");
		TeacherDao dao = sqlsession.getMapper(TeacherDao.class);
		/*this.logger.info(message.getPayload());*/
		System.out.println("아이디값>>"+message.getPayload());
		System.out.println(dao.count_receive_note(message.getPayload()));
		
		session.sendMessage(new TextMessage(dao.count_receive_note(message.getPayload()))); 
		

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		/*
		SessionMaps.getAlarmusers().remove(session.getId());*/
		System.out.println("연결끊었다.");
		//super.afterConnectionClosed(session, status);
	}

}
