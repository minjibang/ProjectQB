package socket;

import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class LoginSocketHandler extends TextWebSocketHandler {

	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		SessionMaps.getAlarmusers().put(session.getId(), session); // SessionMaps.getALarmusrs() => alarmusers를  return ( HashMap )
	
		//super.afterConnectionEstablished(session);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		
		//super.handleMessage(session, message);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		SessionMaps.getAlarmusers().remove(session.getId());
		//super.afterConnectionClosed(session, status);
	}

}
