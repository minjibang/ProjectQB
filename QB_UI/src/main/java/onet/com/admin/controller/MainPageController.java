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
import onet.com.admin.service.AdminService;
import onet.com.teacher.service.TeacherService;
import onet.com.vo.CategoryDto;
import onet.com.vo.ClassDto;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamMemberDto;
import onet.com.vo.ExamPaperDto;
import onet.com.vo.MemberDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;

@Controller
@RequestMapping(value="/admin/")
public class MainPageController {
	//양회준-10.26-추가 teacherService
	@Autowired
	private TeacherService teacherService;	
	//양회준-10.29-추가 adminService
	@Autowired
	private AdminService adminService;
	
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
	
	//양회준 - 추가수정부분은 다른 컨트롤러에서 옮겨온 부분입니다.
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
		
		return "common.admin.exam.examManagement";
	}
	
	/*양회준 10.29 admin 시험등록 추가 수정*/
	@RequestMapping("examScheduleRegist.do")
	public String examScheduleRegist(Model model, int exam_paper_num, String exam_paper_name) {
		
		List<MemberDto> classMemberList;
		classMemberList= teacherService.classMemberList(exam_paper_num);
		model.addAttribute("classMemberList", classMemberList);

		ClassDto classInfo;
		classInfo = teacherService.classInfo(exam_paper_num);
		
		String class_name = classInfo.getClass_name();
		int class_num = classInfo.getClass_num();
		model.addAttribute("class_name", class_name);
		model.addAttribute("class_num", class_num);
		
		return "common.admin.exam.examScheduleRegist";
	}
	/*양회준 10.29 admin 시험지수정 추가 수정*/
	@RequestMapping("updateExamView.do")
	public String updateExamView(Model model, int exam_paper_num) {
		
		List<CategoryDto> list1;
		list1 = adminService.lgCategoryList();
		model.addAttribute("list1", list1);

		List<CategoryDto> list2;
		list2 = adminService.mdCategoryList();
		model.addAttribute("list2", list2);

		List<CategoryDto> list3;
		list3=adminService.smCategoryList();
		model.addAttribute("list3",list3);
		
		List<CategoryDto> levellist;
		levellist = adminService.questionLevelList();
		model.addAttribute("levellist",levellist);
		
		List<QuestionDto> question = teacherService.updateExamView(exam_paper_num);
		model.addAttribute("examquestion", question);
		List<Question_choiceDto> question_choice = teacherService.question_choice();
		model.addAttribute("examquestion_choice", question_choice);
		
		ExamPaperDto namedesc = teacherService.examNameDesc(exam_paper_num);
		
		String exam_paper_name = namedesc.getExam_paper_name();
		String exam_paper_desc = namedesc.getExam_paper_desc();
		
		model.addAttribute("exam_paper_name", exam_paper_name);
		model.addAttribute("exam_paper_desc", exam_paper_desc);
		
		return "common.teacher.exampaper.examPaperUpdate";
	}
	//양회준 10.29 admin 시험지 삭제 추가수정
	@RequestMapping("deleteExam.do")
	public @ResponseBody int deleteExam(@RequestParam("exam_paper_num") int exam_paper_num) {
		
		int result = teacherService.deleteExam(exam_paper_num);
		
		return result;
	}
	//양회준 10.29 admin 임시시험지 삭제 추가수정
	@RequestMapping("deleteTempExam.do")
	public @ResponseBody int deleteTempExam(@RequestParam("exam_paper_num") int exam_paper_num) {
		
		int result = teacherService.deleteTempExam(exam_paper_num);
		
		return result;
	}
	//양회준 10.29 admin 시험일정 추가수정
	@RequestMapping("examScheduleUpdate.do")
	public String examScheduleUpdate(Model model, int exam_info_num) {


		List<MemberDto> classMemberListUpdate;
		classMemberListUpdate= teacherService.classMemberListUpdate(exam_info_num);
		model.addAttribute("classMemberListUpdate", classMemberListUpdate);
		
		List<ExamInfoDto> classExamList;
		classExamList= teacherService.classExamList(exam_info_num);
		model.addAttribute("classExamList", classExamList);
		
		/*체크한 학생 제외한 클래스 멤버 리스트*/
		List<MemberDto> examNotcheckMemberList;
		examNotcheckMemberList=teacherService.examNotcheckMemberList(exam_info_num);
		model.addAttribute("examNotcheckMemberList", examNotcheckMemberList);		
		
		List<ExamMemberDto> classExamMemberList;
		 
		classExamMemberList= teacherService.classExamMemberList(exam_info_num);
		System.out.println(classExamMemberList);
		String [] iarray = new String[classExamMemberList.size()];
		for(int i = 0 ; i<= classExamMemberList.size()-1 ; i++) {
			iarray[i]=classExamMemberList.get(i).getMember_id();
			System.out.println(iarray[i]);
		}
		
		model.addAttribute("classExamMemberList", iarray);
		
		/*System.out.println("iarray>>   " + iarray[0] + "   <<");
		
		List<ExamPaperDto> examPaperList;
		examPaperList = teacherService.examPaperList(class_num);
		model.addAttribute("examPaperList", examPaperList);
		System.out.println("examPaperList 값은>>>>>>>>>>>>>>>>>>>>>"+examPaperList);
		*/
		
		
		return "common.admin.exam.examScheduleUpdate";
	}
	// 양회준 
	@RequestMapping(value="questionListView.do")
	public @ResponseBody ModelAndView classListView(Model model) {
		
		List<QuestionDto> question = teacherService.question();
		
		List<Question_choiceDto> question_choice = teacherService.question_choice();
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ajax.common.examPaperMake_ajax");
		mv.addObject("question", question);
		mv.addObject("question_choice",question_choice);
		
		System.out.println(mv);
		
		return mv;
	}
	//양회준 10.29시험지 수정 유효성 추가수정
	@RequestMapping("updateExamCheck.do")
	public @ResponseBody int updateExamCheck(@RequestParam("exam_paper_num") int exam_paper_num) {
		
		int result = teacherService.updateExamCheck(exam_paper_num);
		
		return result;
	}
	
	// 현이 11.02 adminMain 클래스 삭제 
	@RequestMapping("deleteClass.do")
	public String deleteClass(@RequestParam("class_name") String class_name) {
		
		int result = adminMainPageService.deleteClass(class_name);
		
		return "admin.adminMain";
	}
	
}