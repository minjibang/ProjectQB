package socket;



import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
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
	 // SessionMaps.getALarmusrs() => alarmusers를  return ( HashMap )
	System.out.println("연결됐다");
		//super.afterConnectionEstablished(session);
	System.out.println("연결된 사용자 id>>"+session.getPrincipal().getName());
	System.out.println("연결된 사용자의 세션값 >> " + session.getId());

	
	
	}


	

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("메시지 보냈다.");
		TeacherDao dao = sqlsession.getMapper(TeacherDao.class);
		/*this.logger.info(message.getPayload());*/

		System.out.println("핸들러로 넘어간값>>"+message.getPayload());
		
		String data=message.getPayload();

		
		
		if(data.contains(",")) {
			String[] data2 = data.split(",");
			MessageDto dto = new MessageDto();
			System.out.println("data2[0]>>>>"+ data2[0]);
			System.out.println("data2[1]>>>>"+ data2[1]);
			System.out.println("data2[2]>>>>"+ data2[2]);
			if(data2.length>3) {
				for(int i =2; i <= data2.length-1; i++) {
					dto.setSend_member_id(data2[0]);
					dto.setMessage_content(data2[1]);
					dto.setReceive_member_id(data2[i]);
					StudentDao sdao = sqlsession.getMapper(StudentDao.class);
					int result = sdao.sendTeacherMessage(dto);
					
					
					if(result>0) {
					System.out.println("핸들러에서 쪽지보냈따");
					session.sendMessage(new TextMessage(dao.count_receive_note(data2[i])));
					
					}
				}
			}else {
			dto.setSend_member_id(data2[0]);
			dto.setMessage_content(data2[1]);
			dto.setReceive_member_id(data2[2]);
			StudentDao sdao = sqlsession.getMapper(StudentDao.class);
			int result = sdao.sendTeacherMessage(dto);
			
			
			if(result>0) {
			System.out.println("핸들러에서 쪽지보냈따");
			session.sendMessage(new TextMessage(dao.count_receive_note(data2[0])));
			
			
			
			}
			}
			
		}
		else {
			System.out.println("처음에 불러왔따");
			session.sendMessage(new TextMessage(dao.count_receive_note(session.getPrincipal().getName()))); 
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
