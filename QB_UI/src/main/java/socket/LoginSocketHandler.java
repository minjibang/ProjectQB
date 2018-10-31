package socket;



import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import onet.com.student.dao.StudentDao;
import onet.com.teacher.dao.TeacherDao;
import onet.com.vo.MessageDto;

public class LoginSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	SqlSession sqlsession;

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	//SessionMaps.getAlarmusers().put(session, session.getPrincipal().getName()); // SessionMaps.getALarmusrs() => alarmusers를  return ( HashMap )
	System.out.println("연결됐다");
		//super.afterConnectionEstablished(session);
	System.out.println("연결된 사용자 id>>"+session.getPrincipal().getName());
	
	
	}

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("메시지 보냈다.");
		
		TeacherDao dao = sqlsession.getMapper(TeacherDao.class);
		/*this.logger.info(message.getPayload());*/

		System.out.println("핸들러로 넘어간값>>"+message.getPayload());
		
		String data=message.getPayload();
		String[] data2 = data.split(",");
		if(data.contains(",")) {
			MessageDto dto = new MessageDto();
			System.out.println("data2[0]>>>>"+ data2[0]);
			System.out.println("data2[1]>>>>"+ data2[1]);
			System.out.println("data2[2]>>>>"+ data2[2]);
			dto.setSend_member_id(data2[0]);
			dto.setMessage_content(data2[1]);
			dto.setReceive_member_id(data2[2]);
			StudentDao sdao = sqlsession.getMapper(StudentDao.class);
			int result = sdao.sendTeacherMessage(dto);
			
			if(result>0) {
			System.out.println("핸들러에서 쪽지보냈따");
			
			session.sendMessage(new TextMessage(dao.count_receive_note(message.getPayload())));
			
			}
			
		}
		else {
			System.out.println("처음에 불러왔따");
			session.sendMessage(new TextMessage(dao.count_receive_note(message.getPayload()))); 
		}
		
		
		/*
	
		
		System.out.println(dao.count_receive_note(message.getPayload()));
		*/
		
	
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		/*
		SessionMaps.getAlarmusers().remove(session.getId());*/
		System.out.println("연결끊었다.");
		//super.afterConnectionClosed(session, status);
	}

}
