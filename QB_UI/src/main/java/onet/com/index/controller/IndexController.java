package onet.com.index.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String join(MemberDto dto) {
		System.out.println(dto.getMember_id());
		int result = indexService.loginCheck(dto);
		String auth = indexService.authCheck(dto);
		System.out.println(result);
		System.out.println(auth);
		if (result == 0) {
			return "redirect:/login.jsp";
		}else if(auth.equals("role_teacher")) {
			return "teacher.teacherMain";
		}else if(auth.equals("role_student")){
			return "";
		}else if(auth.equals("role_admin")) {
			return "admin.adminMain";
		}
			return "noAuth.noAuth";
	}
	
	
	
	
}
