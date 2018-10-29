package onet.com.index.handler;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import onet.com.common.dao.CommonDao;

@Repository
public class WebSocketHandler extends TextWebSocketHandler {

	@Autowired
	SqlSession sqlsession;

 	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
 		System.out.println("connetcion closed");
 	}

  	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
  		System.out.println("connect");
	}

  	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
  		System.out.println(session.getId());
	 	CommonDao dao = sqlsession.getMapper(CommonDao.class);
	 	System.out.println("textMessage");
		System.out.println(dao.count_receive_note(message.getPayload()));
		session.sendMessage(new TextMessage(dao.count_receive_note(message.getPayload())));

//현재 수신자에게 몇개의 메세지가 와있는지 디비에서 검색함.

		

	}





}


