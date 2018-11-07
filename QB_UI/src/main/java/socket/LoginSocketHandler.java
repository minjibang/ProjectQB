package socket;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	 private Logger logger = LoggerFactory.getLogger(LoginSocketHandler.class);
	
	 private List<WebSocketSession> users = new ArrayList<>();
	 Map<String, WebSocketSession> userSessions = new HashMap<>();
	
   @Autowired
   SqlSession sqlsession;
   
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
  
   System.out.println("연결됐다");
   
   System.out.println("연결된 사용자 id>>"+session.getPrincipal().getName());
   System.out.println("연결된 사용자의 세션값 >> " + session.getId());
   users.add(session);
  
   userSessions.put(session.getPrincipal().getName(), session);
   }




	

   @Override
   public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      
      System.out.println("메시지 보냈다.");
      TeacherDao dao = sqlsession.getMapper(TeacherDao.class);
      String senderId = session.getPrincipal().getName();

      System.out.println("핸들러로 넘어간값>>"+message.getPayload());
      
      String data=message.getPayload();
      System.out.println("_________________________" + data);
      
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
            	WebSocketSession receiveSession = userSessions.get(data2[i]);  
            	
               System.out.println("핸들러에서 쪽지보냈따");
               receiveSession.sendMessage(new TextMessage(dao.count_receive_note(data2[i])));
               
               }
            }
         }else {
         dto.setSend_member_id(data2[0]);
         dto.setMessage_content(data2[1]);
         dto.setReceive_member_id(data2[2]);
         StudentDao sdao = sqlsession.getMapper(StudentDao.class);
         int result = sdao.sendTeacherMessage(dto);
         
         
         if(result>0) {
         WebSocketSession receiveSession = userSessions.get(data2[2]);  
         System.out.println("핸들러에서 쪽지보냈따");
         receiveSession.sendMessage(new TextMessage(dao.count_receive_note(data2[2])));
         
         
         
         }
         }
         
      }
      else {
    	  WebSocketSession receiveSession = userSessions.get(senderId);
    	  receiveSession.sendMessage(new TextMessage(dao.count_receive_note(senderId)));
         System.out.println("처음에 불러왔따");
      }
      
      
      /*
   
      
      System.out.println(dao.count_receive_note(message.getPayload()));
      */
      
      

   }

   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      
      System.out.println("연결끊었다.");
   }

}