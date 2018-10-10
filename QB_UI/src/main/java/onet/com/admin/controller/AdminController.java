package onet.com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import onet.com.admin.service.AdminService;
import onet.com.vo.CategoryDto;

@Controller
@RequestMapping(value="/admin/")
public class AdminController {
	
	/*재훈 10.08 문제분류관련 start*/
	@Autowired
	private AdminService adminService;

	@RequestMapping("adminCategory.do")
	public String adminCategory(Model model) throws Exception {
		List<CategoryDto> list1;
		
		list1=adminService.lgCategoryList();
		model.addAttribute("list1",list1);
		
		List<CategoryDto> list2;
		list2=adminService.mdCategoryList();
		model.addAttribute("list2",list2);
		
		List<CategoryDto> list3;
		list3=adminService.smCategoryList();
		model.addAttribute("list3",list3);
		
		
		return "admin.adminCategory";
	}
	/*재훈 10.08 문제분류관련 end*/
	
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
	
	/*誘쇱�*/
	@RequestMapping("adminMyPage.do")
	public String adminMyPage() {
	
	return "admin.adminMyPage";
	
	}
	
	@RequestMapping("adminMessage.do")
	public String adminMessage() {
	
	return "admin.adminMessage";

	/*誘쇱� 異붽� �걹*/
	}
	
	/*현이 18.10.09 관리자 마이페이지 시작*/
	@RequestMapping("myPage.do")
	public String mypage() {

		return "common.admin.myPage";
	}
	/*현이 18.10.09 관리자 마이페이지 끝*/
	
}