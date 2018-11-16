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
  
   users.add(session);
   userSessions.put(session.getPrincipal().getName(), session);
  }




   

   @Override
   public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

      TeacherDao dao = sqlsession.getMapper(TeacherDao.class);
      String senderId = session.getPrincipal().getName();

      
      String data=message.getPayload();
      
      if(data.contains(",")) {
         String[] data2 = data.split(",");
         MessageDto dto = new MessageDto();
         if(data2.length>3) {

            
            for(int i =2; i <= data2.length-1; i++) {
               dto.setSend_member_id(data2[0]);
               dto.setMessage_content(data2[1]);
               dto.setReceive_member_id(data2[i]);
               StudentDao sdao = sqlsession.getMapper(StudentDao.class);
               int result = sdao.sendTeacherMessage(dto);
               WebSocketSession receiveSession = userSessions.get(data2[i]);
               if(result>0 && receiveSession!=null) {
               receiveSession = userSessions.get(data2[i]);
               

               receiveSession.sendMessage(new TextMessage(dao.count_receive_note(data2[i])));
               
               }
            }
         }else {
         StudentDao sdao = sqlsession.getMapper(StudentDao.class);
         dto.setSend_member_id(data2[0]);
         dto.setMessage_content(data2[1]);
         dto.setReceive_member_id(data2[2]);
         int result = sdao.sendTeacherMessage(dto);
         
         WebSocketSession receiveSession = userSessions.get(data2[2]);
         if(result>0 && receiveSession!=null) {

         receiveSession.sendMessage(new TextMessage(dao.count_receive_note(data2[2])));
         
         }
         }
         
      }
      else {
    	  WebSocketSession receiveSession = userSessions.get(senderId);
         receiveSession.sendMessage(new TextMessage(dao.count_receive_note(senderId)));

         
      }
   }

   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      
      
   }

}