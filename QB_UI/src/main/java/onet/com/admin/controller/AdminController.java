package onet.com.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/")
public class AdminController {

	@RequestMapping("adminCategory.do")
	public String adminCategory() {

		return "admin.adminCategory";
	}
	@RequestMapping("adminClassInfo.do")
	public String adminClassInfo() {

		return "admin.adminClassInfo";
	}
	@RequestMapping("adminMain.do")
	public String adminMain() {

		return "admin.adminMain";
	}
	@RequestMapping("adminMember.do")
	public String adminMember() {

		return "admin.adminMember";
	}	
	
	/*민지*/
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