package onet.com.index.handler;

import java.security.Principal;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import onet.com.common.dao.CommonDao;
import onet.com.student.dao.StudentDao;
import onet.com.teacher.dao.TeacherDao;
import onet.com.vo.MessageDto;

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
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
       System.out.println("메시지 보냈다.");
       TeacherDao dao = sqlsession.getMapper(TeacherDao.class);
       /*this.logger.info(message.getPayload());*/
       
       System.out.println("핸들러로 넘어간값>>"+message.getPayload());
       
       String data=message.getPayload();
       System.out.println("data : " + data);
       if(data.contains(",")) {
          
          String[] data2 = data.split(",");
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
          session.sendMessage(new TextMessage(dao.count_receive_note(data2[2]))); 
          }
          
       }
       else {
          System.out.println("처음에 불러왔따");
          
       }

		
//현재 수신자에게 몇개의 메세지가 와있는지 디비에서 검색함.

		

	}





}


