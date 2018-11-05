package onet.com.index.service;



import java.io.StringWriter;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import onet.com.index.dao.IndexDao;
import onet.com.vo.ClassDto;
import onet.com.vo.Mail;
import onet.com.vo.MemberDto;

@Service
public class IndexService {

		@Autowired
		private SqlSession sqlsession;
		
		@Autowired
		private JavaMailSenderImpl mailSender;
		
		@Autowired
		private VelocityEngine velocityEngine;
		
		HttpServletRequest request;

		public List<ClassDto> classList(){
			IndexDao dao = sqlsession.getMapper(IndexDao.class);
			List<ClassDto> result = dao.classList();
			return result;
		}
		public int insertMember(MemberDto dto) {
			IndexDao dao = sqlsession.getMapper(IndexDao.class);
			int result = dao.insertMember(dto);
			return result;
		}
		
		public String joinCheckId(String member_id) {
			IndexDao dao = sqlsession.getMapper(IndexDao.class);
			String result = dao.joinCheckId(member_id);
			return result;
		}
		
		/******************************** velocity service start**********************************************/
		public void setMailSender(JavaMailSenderImpl mailSender) {
			this.mailSender = mailSender;
		}

		public void setVelocityEngine(VelocityEngine velocityEngine) {
			this.velocityEngine = velocityEngine;
		}

		public String sendMail(String mailto,String command, String member_id) {
			
			Mail mail = new Mail();
			mail.setCompany("QBQB");// 회사명
			mail.setMailFrom("bitcamp109");// 송신메일
			mail.setMailTo(mailto);// 수신메일
			String randomNum = this.randomNum();
			String randomPwd = this.randomPwd(); 
			if (command == "join") {
				mail.setMailSubject("[QB]이메일 인증 안내 메일입니다.");// 메일제목
				mail.setTemplateName("jointemplate.vm");// 메일내용
			} else {
				mail.setMailSubject("[QB]임시 비밀번호를 안내해드립니다.");// 메일제목
				mail.setTemplateName("logintemplate.vm");// 메일내용
			}

			// SimpleMailMessage message = new SimpleMailMessage();
			MimeMessage message = mailSender.createMimeMessage();
			
			MimeMessageHelper helper;
			try {
				// 멀티파트 메시지가 필요하다는 의미로 true 플래그를 사용한다
				helper = new MimeMessageHelper(message, true, "utf-8");
				helper.getEncoding();
				helper.setFrom(mail.getMailFrom());
				helper.setTo(mail.getMailTo());
				helper.setSubject(mail.getMailSubject());
				

				
				VelocityContext velocityContext = new VelocityContext();
				
					
				velocityContext.put("firstName", member_id);
				

				
				velocityContext.put("company", mail.getCompany());
				velocityContext.put("mailFrom", mail.getMailFrom());
				velocityContext.put("randomNum", randomNum);
				velocityContext.put("randomPwd", randomPwd);
				System.out.println("2");
				
			
			//"./src/main/resources/templates/"
				System.out.println(mail.getTemplateName());
				Template template = velocityEngine.getTemplate(mail.getTemplateName());
				System.out.println("3");
				StringWriter stringWriter = new StringWriter();
				template.merge(velocityContext, stringWriter);
				
				helper.setText(stringWriter.toString(), true);
				
				
			/*	String text =VelocityEngineUtils.mergeTemplateIntoString(
						velocityEngine, "resources/templates/"+ mail.getTemplateName(), (Map) velocityContext);
						message.setContent(text, "text/html;charset=utf-8;");*/
			} catch (MessagingException e) {

			}

			mailSender.send(message);
			if (command == "join") {
				return randomNum;
			}else {
				return randomPwd;
			}
			
		}

		public  String randomNum() {
			StringBuffer buffer = new StringBuffer();
			for (int i = 0; i <= 5; i++) {
				int n = (int) (Math.random() * 10);
				buffer.append(n);
			}
			return buffer.toString();
		}

		
		public  String randomPwd() { 
			char[] charSet = new char[] { 
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C',
					'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
					'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
					'!','@','#','$','%','^','&','*','(',')'};
			
			int idx = 0; 
			StringBuffer buffer = new StringBuffer(); 		
			for (int i = 0; i < 10; i++) { 
			idx = (int) (charSet.length * Math.random());
			// 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			buffer.append(charSet[idx]); 
			
			} 
			return buffer.toString(); 
		}
		
		/******************************** velocity service end**********************************************/
		
		public String idSearch(MemberDto dto) {
			IndexDao dao = sqlsession.getMapper(IndexDao.class);
			
			String result = dao.idSearch(dto);
			return result;
		}
		
		public int pwdSearch(MemberDto dto) {
			IndexDao dao = sqlsession.getMapper(IndexDao.class);
			int result = dao.pwdSearch(dto);
			return result;
		}
		
}

