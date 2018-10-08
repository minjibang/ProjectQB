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
		List<CategoryDto> list;
		list=adminService.lgCategoryList();
		System.out.println(list + "***** 컨트롤러 테스트 *****");
		model.addAttribute("list",list);
		
		
		System.out.println(model + "#### 컨트롤러 테스트 2 ####");
		
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
	
}