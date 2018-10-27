package onet.com.admin.controller;

import java.security.Principal;
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
import onet.com.teacher.service.TeacherService;
import onet.com.vo.ClassDto;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;

@Controller
@RequestMapping(value="/admin/")
public class MainPageController {
	//양회준-10.26-추가 teacherService
	@Autowired
	private TeacherService teacherService;
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
	
	/*양회준 추가수정-10.26-시험지 리스트 뿌려주기*/
	@RequestMapping("examManagement.do")
	public String examManagement(Model model, Principal principal) {
		String member_id = principal.getName();
		
		List<ExamPaperDto> myexamPaperList;
		List<ExamPaperDto> myTempExamList;
		List<ExamInfoDto> examScheduleList;
		
		myexamPaperList = adminMainPageService.myExamPaperList(member_id);			
		myTempExamList = adminMainPageService.myTempExamList(member_id);			
		examScheduleList = adminMainPageService.examScheduleList(member_id);
		
		model.addAttribute("myexamPaperList", myexamPaperList);
		model.addAttribute("myTempExamList", myTempExamList);
		model.addAttribute("examScheduleList", examScheduleList);
		
		return "common.teacher.exam.examManagement";
	}
}