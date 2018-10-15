package onet.com.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import onet.com.admin.service.AdminMainPageService;
import onet.com.vo.ClassDto;

@Controller
@RequestMapping(value="/admin/")
public class MainPageController {
	
	@Autowired
	private AdminMainPageService adminMainPageService;

	@RequestMapping(value="classInsert.do",method=RequestMethod.POST)
	public String classInert(ClassDto dto) {
		
		int result = 0;
		String viewpage="";
		
		result = adminMainPageService.classInsert(dto);
		if(result > 0) {
			viewpage = "redirect:adminMain.do";
		}
		return viewpage;
	}

}