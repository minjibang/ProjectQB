package onet.com.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import onet.com.admin.service.AdminMainPageService;
import onet.com.vo.ClassDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;

@Controller
@RequestMapping(value="/admin/")
public class MainPageController {
	
	@Autowired
	private AdminMainPageService adminMainPageService;
	/*태용 시작*/
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

	@RequestMapping(value="classCheck.do")
	public @ResponseBody Map<String, Object> idCheck(@RequestParam("class_name") String class_name) {
		String classname = adminMainPageService.classCheck(class_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", classname == null);
		map.get("result");
		return map;
	}
	@RequestMapping(value="adminMainView.do")
	public @ResponseBody ModelAndView adminMainView() {
		
		List<ClassDto> classList = adminMainPageService.adminMainView();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ajax.admin.adminMain_ajax");
		mv.addObject("classList", classList);
	
		return mv;
	}
	
	@RequestMapping(value="classSearch.do")
	public @ResponseBody ModelAndView classSearch(@RequestParam("searchtype") String searchtype, @RequestParam("keyword") String keyword){
		
		List<ClassDto> classList = adminMainPageService.classSearch(searchtype,keyword);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ajax.admin.adminMain_ajax");
		mv.addObject("classList", classList);
	
		return mv;
	}
	/*태용 끝*/
}