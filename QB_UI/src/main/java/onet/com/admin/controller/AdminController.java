package onet.com.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

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
	
}