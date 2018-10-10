package onet.com.index.controller;


import java.sql.SQLException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import onet.com.index.service.IndexService;
import onet.com.vo.MemberDto;

@Controller
@RequestMapping("/index/")
public class IndexController {

	@Autowired
	private IndexService indexService;

	@RequestMapping("memberjoin.do")
	public String memberjoin() {

		return "home.memberJoin";
	}

	@RequestMapping("idSearch.do")
	public String idSearch() {

		return "home.findId";
	}

	@RequestMapping("pwdSearch.do")
	public String pwdSearch() {

		return "home.findPw";
	}

	@RequestMapping("login.do")
	public String join(MemberDto dto){
		int result = indexService.loginCheck(dto);
		String auth = indexService.authCheck(dto);
		
		if (result == 0) {
			return "redirect:/login.jsp?result=0";
		} else if (auth.equals("ROLE_TAECHER")) {
			return "teacher.teacherMain";
		} else if (auth.equals("ROLE_STUDENT")) {
			return "";
		} else if (auth.equals("ROLE_ADMIN")) {
			return "admin.adminMain";
		} else {
		return "noAuth.noAuth";
		}
	}

	@RequestMapping(value="insertmember.do", method=RequestMethod.POST)
	public String  memberInsert(MemberDto dto) throws ClassNotFoundException, SQLException {
		
		int result = 0;
		String viewpage="";
		
		result = indexService.insertMember(dto);
		
		if(result > 0) {
			System.out.println("가입성공");
			viewpage = "redirect:/login.jsp";
		}else {
			System.out.println("가입실패");
			 viewpage = "memberjoin.do";
		}
		return viewpage;
	}

}
