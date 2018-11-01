package onet.com.teacher.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import onet.com.admin.service.AdminService;
import onet.com.teacher.service.TeacherService;
import onet.com.vo.CategoryDto;
import onet.com.vo.ClassDto;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamMemberDto;
import onet.com.vo.ExamPaperDto;
import onet.com.vo.ExamQuestionListDto;
import onet.com.vo.MemberDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;

@Controller
@RequestMapping("/teacher/")
public class TestManageController {

	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private AdminService adminService;
	
	

	/*성태용 시작*/
	/*문제리스트 뿌려주기*/
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
	/*문제 검색*/
	@RequestMapping(value="questionSearch.do")
	public @ResponseBody ModelAndView questionSearch(@RequestParam("lgsearchtype") String lgsearchtype, 
			@RequestParam("mdsearchtype") String mdsearchtype, @RequestParam("smsearchtype") String smsearchtype,
			@RequestParam("leveltype") String leveltype,@RequestParam("keyword") String keyword,
			@RequestParam("questiontype") String questiontype) {
		
		List<QuestionDto> question = teacherService.questionSearch(lgsearchtype,mdsearchtype,smsearchtype,leveltype,questiontype,keyword);
		List<Question_choiceDto> question_choice = teacherService.question_choice();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ajax.common.examPaperMake_ajax");
		mv.addObject("question", question);
		mv.addObject("question_choice",question_choice);
		
		return mv;
	}
	
	/*시험지 리스트 뿌려주기*/
	@RequestMapping("examManagement.do")
	public String examManagement(Model model, Principal principal) {
		String member_id = principal.getName();
		
		List<ExamPaperDto> myexamPaperList;
		List<ExamPaperDto> myTempExamList;
		List<ExamInfoDto> examScheduleList;
		
		myexamPaperList = teacherService.myExamPaperList(member_id);			
		myTempExamList = teacherService.myTempExamList(member_id);			
		examScheduleList = teacherService.examScheduleList(member_id);
		
		model.addAttribute("myexamPaperList", myexamPaperList);
		model.addAttribute("myTempExamList", myTempExamList);
		model.addAttribute("examScheduleList", examScheduleList);
		
		return "common.teacher.exam.examManagement";
	}
	//시험지 삭제
	@RequestMapping("deleteExam.do")
	public @ResponseBody int deleteExam(@RequestParam("exam_paper_num") int exam_paper_num) {
		
		int result = teacherService.deleteExam(exam_paper_num);
		
		return result;
	}
	//시험지 수정 유효성
	@RequestMapping("updateExamCheck.do")
	public @ResponseBody int updateExamCheck(@RequestParam("exam_paper_num") int exam_paper_num) {
		
		int result = teacherService.updateExamCheck(exam_paper_num);
		
		return result;
	}
	//임시저장 시험지 삭제
	@RequestMapping("deleteTempExam.do")
	public @ResponseBody int deleteTempExam(@RequestParam("exam_paper_num") int exam_paper_num) {
		
		int result = teacherService.deleteTempExam(exam_paper_num);
		
		return result;
	}
	
	//시험지 수정페이지 데이터 뿌려주기
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
	
	//임시시험지 수정페이지 데이터 뿌려주기
		@RequestMapping("tempUpdateExamView.do")
		public String tempUpdateExamView(Model model, int exam_paper_num) {
			
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
			
			return "common.teacher.exampaper.examPaperMake";
		}
	
	//시험지 문제 삭제
	@RequestMapping("examquestionsdelete.do")
	public @ResponseBody int examquestionsdelete(@RequestParam("exam_paper_num") int exam_paper_num,
			@RequestParam("exam_name") String exam_name,@RequestParam("exam_desc") String exam_desc) {
		
		int result = teacherService.examquestionsdelete(exam_paper_num, exam_name, exam_desc);
		
		return result;
	}
	//삭제된 시험지에 문제 넣기
	@RequestMapping("examquestionsinsert.do")
	public @ResponseBody int examquestionsinsert(@RequestParam("exam_paper_num") int exam_paper_num,
			@RequestParam("question_num") int question_num,@RequestParam("exam_question_seq") int exam_question_seq,
			@RequestParam("exam_question_score") int exam_question_score) {
		
		int result = teacherService.examquestionsinsert(exam_paper_num,question_num,exam_question_seq,exam_question_score);
		
		return result;
	}
	//시험지 수정(새로 시험지를 만들고 이전시험지는 enable을 0으로 하기
	@RequestMapping("examPaperUpdateInsert.do")
	public @ResponseBody int newExamPaperInsert(ExamPaperDto dto , Principal principal) {
		String member_id = principal.getName();
		dto.setMember_id(member_id);
		int updateresult = teacherService.examEnableUpdate(dto.getExam_paper_num());
		int exampapernum = teacherService.newExaminsert(dto);
		
		
		return exampapernum;
	}
	
	//내시험지 리스트 미리보기	
	@RequestMapping("examMiri.do")
	public @ResponseBody ModelAndView examMiri(@RequestParam("exam_paper_num") int exam_paper_num) {
		
		List<ExamQuestionListDto> examquestion = teacherService.examQuestionList(exam_paper_num);
		List<Question_choiceDto> question_choice = teacherService.question_choice();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ajax.teacher.examMiriList_ajax");
		mv.addObject("examquestion", examquestion);
		mv.addObject("question_choice", question_choice);
		
		return mv;
	}
	
	/*성태용 끝*/
	
	/*민지 시작*/
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
		
		return "common.teacher.exam.examScheduleRegist";
	}
	/*민지:10.18 시험등록 */
	@RequestMapping(value="examInfoInsert.do", method =  RequestMethod.POST)
	public  String examInfoInsert(ExamInfoDto dto,String memberarray2,int exam_paper_num ,HttpServletResponse response) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
		System.out.println("시험등록컨트롤러들어옴");
		System.out.println("memberarray2값>>"+memberarray2+"<<");
		
		String [] memberchecklist= memberarray2.split(",");
		int checkresult;
		int result = 0;
		String viewpage="";
		
		result=teacherService.examInfoInsert(dto);
		if(result > 0) {
			System.out.println("시험등록성공");
			String class_name = dto.getClass_name();
			System.out.println(class_name);
	
			String url = URLEncoder.encode(class_name, "UTF-8");
			String memberid="";
			for(int i = 0; i<=memberchecklist.length-1;i++) {
				
				 memberid = memberchecklist[i];
				ExamMemberDto exammemberdto = new ExamMemberDto();
				System.out.println("memberid>>>>>"+memberid+" <<<<<<");
				List<ExamInfoDto> examinfolist = teacherService.examScheduleList2(exam_paper_num);
				int infonum = examinfolist.size()-1;
				System.out.println(examinfolist.toString());
				int infonum2 = examinfolist.get(infonum).getExam_info_num();
	
				System.out.println("examinfolist>>>" + infonum2+ "    <<");
				exammemberdto.setExam_info_num(infonum2);
				exammemberdto.setMember_id(memberid);
				checkresult=teacherService.examMemberInsert(exammemberdto);
				
				if(checkresult>0) {
					System.out.println("체크리스트 insert 성공");
				}else {
					System.out.println("체크리스트 insert 실패");
				
			}
			}
			viewpage = "redirect:examManagement.do";

		}else {
			System.out.println("시험등록 실패");
			
		}
		return viewpage;
	}
	
	/*민지 끝*/
	
	/*한결 시작*/
	@RequestMapping("checkExam_paper.do")
	public @ResponseBody String examPaperCheck(@RequestParam("exam_paper_name") String exam_paper_name, 
			@RequestParam("member_id") String member_id) {	
		String result = teacherService.examPaperCheck(exam_paper_name,member_id);
		return result;
	}	
	
	/* 10.17 시험지 테이블 insert and update*/

	@RequestMapping("examPaperInsert.do")
	public @ResponseBody int examPaperInsert(ExamPaperDto dto, Principal principal) {
		
		String member_id = principal.getName();
		dto.setMember_id(member_id);
		teacherService.examPaperInsert(dto);
		int result = dto.getExam_paper_num();
		return result;

	}
	
	@RequestMapping("examPaperUpdate.do")
	public @ResponseBody int examPaperUpdate(@RequestParam("exam_paper_num") int exam_paper_num, 
			@RequestParam("exam_paper_name") String exam_paper_name,
			@RequestParam("exam_paper_desc") String exam_paper_desc, 
			@RequestParam("exam_paper_status") String exam_paper_status,
			Principal principal) {
		String member_id = principal.getName();
		int result = teacherService.examPaperUpdate(exam_paper_num, exam_paper_name,member_id,exam_paper_desc, exam_paper_status);
		return result;
	}
	
	/*10.18 시험지 문제 테이블 select insert update delete*/
	@RequestMapping("examQuestionSelect.do")
	public @ResponseBody int examQuestionSelect(@RequestParam("exam_paper_num") String exam_paper_num,
			@RequestParam("question_num") String question_num) {
		int result = teacherService.examQuestionSelect(exam_paper_num, question_num);
		return result;
	}
	@RequestMapping("examQuestionInsert.do")
	public @ResponseBody int examQuestionInsert(@RequestParam("exam_paper_num") int exam_paper_num, 
			@RequestParam("question_num") String question_num, @RequestParam("exam_question_seq")String exam_question_seq, 
			@RequestParam("exam_question_score") String exam_question_score) {
		int result = teacherService.examQuestionInsert(exam_paper_num,question_num, exam_question_seq, exam_question_score);
		return result;
	}

	@RequestMapping("examQuestionDelete.do")
	public @ResponseBody int examQuestionDelte(@RequestParam("exam_paper_num") String exam_paper_num) {
		int result = teacherService.examQuestionDelete(exam_paper_num);
		return result;
	}

	/*한결 끝*/
	
	
	/*민지 시험일정 수정 시작*/
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
		
		
		return "common.teacher.exam.examScheduleUpdate";
	}
	
	@RequestMapping("examInfoIUpdate.do")
	public String examInfoIUpdate(ExamInfoDto dto,String memberarray2, int exam_info_num) {
		
		System.out.println("시험일정 수정 컨트롤러!!!!!!!!!!!!!!!!!");
		System.out.println("memberarray2값>>"+memberarray2+"<<");
		
		String [] memberchecklist= memberarray2.split(",");
		
		int result = teacherService.examInfoIUpdate(dto);
		
		if(result > 0) {
			System.out.println("exam_info_num>>" + exam_info_num + "   <<");
			int result2 = teacherService.teacherExamMemberDelete(exam_info_num);
			if(result2>0) {
				System.out.println("수정할때 학생 리스트 삭제 성공");
				String memberid="";
				int result3;
				for(int i = 0; i<=memberchecklist.length-1;i++) {
					
					 memberid = memberchecklist[i];
					ExamMemberDto exammemberdto = new ExamMemberDto();
					System.out.println("memberid>>>>>"+memberid+" <<<<<<");
					List<ExamInfoDto> list= teacherService.classExamList(exam_info_num);
					int papernum= list.get(0).getExam_paper_num();
					System.out.println("papernum  >>  "+ papernum + " <<");
					List<ExamInfoDto> examinfolist = teacherService.examScheduleList2(papernum);
					int infonum = examinfolist.size()-1;
					System.out.println(examinfolist.toString());
					int infonum2 = examinfolist.get(infonum).getExam_info_num();
		
					System.out.println("examinfolist>>>" + infonum2+ "    <<");
					exammemberdto.setExam_info_num(infonum2);
					exammemberdto.setMember_id(memberid);
					result3=teacherService.examMemberInsert(exammemberdto);
					
					if(result3>0) {
						System.out.println("수정할때 체크리스트 insert 성공");
					}else {
						System.out.println("체크리스트 insert 실패");
				}
				}
				
			}else {
				System.out.println("수정할때 학생 리스트 삭제 실패");
			}
			
		}else {
			System.out.println("수정실패");
		}
		
		return "redirect:examManagement.do";
	}
		
	/*민지 시험일정 수정 끝*/
	
	/* 민지 - 18.10.23 시험 일정 삭제 시작 */
	@RequestMapping(value = "teacherExamSchedultDelete.do", method = RequestMethod.POST)
	public @ResponseBody String teacherExamSchedultDelete(@RequestParam("exam_info_num") int exam_info_num, @RequestParam("currentDate") int currentDate, @RequestParam("removeData") int removeData) //@RequestBody (비동기: 객체 형태로 받아요) 
	{	
		
		/*deptService.insertDept(dto);
		return dto.toString();*/
		String result2="";
		if(currentDate>removeData) {
			System.out.println("지난시험지울거다");
			result2="n";
		}else {
			int result = teacherService.teacherExamSchedultDelete(exam_info_num);
			result2 = String.valueOf(result);
			
		}
		System.out.println(">>>>>>"+result2);
		return result2;
		
	}
	/* 민지 - 18.10.23 시험 일정 삭제 끝 */
}