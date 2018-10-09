package kr.or.qb;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@RequestMapping("index.do")
	   public String login() {
	     
	      return "join.login";
	   }
	
	@RequestMapping("adminCategory.do")
	   public String adminCategory() {
	     
	      return "admin.adminCategory";
	   }
	

	//10.05 ���� �߰�
	@RequestMapping("adminClassInfo.do")
	   public String adminClassInfo() {
	     
	      return "admin.adminClassInfo";
	   }

	//���� �߰� ��

	@RequestMapping("memberjoin.do")
	   public String memberjoin() {
	     
	      return "home.memberJoin";
	   }

	@RequestMapping("adminMain.do")
	   public String adminMain() {
	     
	      return "admin.adminMain";
	   }
	
	@RequestMapping("afterLogin_main.do")
	   public String afterLogin_main() {
	     
	      return "common.teacherMain";
	   }
	

	@RequestMapping("adminMember.do")
	   public String adminMember() {
	     
	      return "admin.adminMember";
	   }
	

	@RequestMapping("mypage.do")
		public String mypage() {
		
		return "common.myPage";
	}


	@RequestMapping("idSearch.do")
	   public String idSearch() {
	     
		return "home.findId";
	   }
	
	@RequestMapping("pwdSearch.do")
	   public String pwdSearch() {
	     
		return "home.findPw";
	   }
	
	@RequestMapping("noAuth.do")
	   public String noAuth() {
	     
		return "noAuth.noAuth";
	   }

	@RequestMapping("teacherNoticeWrite.do")
	   public String teacherNoticeWrite() {
	     
	      return "teacher.teacherNoticeWrite";
	   }

	
	/*민지:10.08 강사 메인추가*/
	@RequestMapping("teacherMain.do")
	   public String teacherMain() {
	     
	      return "teacher.teacherMain";
	   }
	@RequestMapping("teacherMyPage.do")
	public String teacherMypage() {
	
	return "teacher.teacherMyPage";
}
	@RequestMapping("adminMyPage.do")
	public String adminMyPage() {
	
	return "admin.adminMyPage";
	}
	
	@RequestMapping("adminMessage.do")
	public String adminMessage() {
	
	return "admin.adminMessage";

	
	/*민지 추가 끝*/
}

}