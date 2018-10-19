package onet.com.teacher.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import onet.com.admin.service.AdminService;
import onet.com.common.service.CommonService;
import onet.com.teacher.service.TeacherService;
import onet.com.vo.CategoryDto;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.NoticeDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;
import onet.com.vo.Question_levelDto;

@Controller
@RequestMapping("/teacher/")
public class TeacherController {

	@Autowired
	private CommonService commonService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private TeacherService teacherService;

	// 강사 notice 관련
	/* 민지:10.08 강사 메인추가 */
	@RequestMapping("teacherMain.do")
	public String teacherMain(Model model, String class_name) {
	
		List<NoticeDto> notice = commonService.teacher_student_Main(class_name);
		model.addAttribute("notice", notice);
		List<ExamInfoDto> exam_info = commonService.exam_info(class_name);
		model.addAttribute("exam_info", exam_info);
		
		for(int i=0; i<exam_info.size();i++) {
			System.out.println(exam_info.get(i).getExam_info_name());
		}
		return "common.teacher.notice.notice";
	}

	/* 한결 10월 12일 강사 글쓰기 페이지 시작 */
	@RequestMapping("noticeWrite.do")
	public String noticeWrite() {

		return "common.teacher.notice.noticeWrite";
	}
	/* 한결 10월 12일 강사 글쓰기 페이지 끝 */

	/* 재훈:10.08 게시판 글 상세보기 페이지 시작 */
	@RequestMapping("noticeDetail.do")
	public String noticeDetail() {

		return "common.teacher.notice.noticeDetail";
	}
	/* 재훈:10.08 게시판 글 상세보기 페이지 끝 */

	@RequestMapping("noticeUpdate.do")
	public String noticeUpdate() {

		return "common.teacher.notice.noticeUpdate";
	}

	// 강사 시험 관련
	/* 현이:10.09 시험 일정 상세보기 페이지 시작 */
	@RequestMapping("examScheduleDetail.do")
	public String examScheduleDetail(Model model, int exam_info_num) {
		
		ExamInfoDto dto = commonService.examScheduleDetail(exam_info_num);
		model.addAttribute("dto", dto);

		return "common.teacher.exam.examScheduleDetail";
	}

	/* 현이:10.09 시험 상세보기 페이지 끝 */

	/* 한결 : 시험일정 > 시험응시 페이지 시작 */
	@RequestMapping("examPaperDo.do")
	public String examPaperDo() {

		return "exam.student.examPaperDo";
	}
	/* 한결 : 시험일정 > 시험응시 페이지 끝 */

	/* 현이 18.10.11 선생님 시험관리 시작 */
	@RequestMapping("examManagement.do")
	public String examManagement(Model model, int class_num) {
		List<ExamPaperDto> examPaperList;
		examPaperList = teacherService.examPaperList(class_num);
		model.addAttribute("examPaperList", examPaperList);
	
	/* 영준 18.10.16 선생님 시험일정 시작 */
		List<ExamInfoDto> examScheduleList;
		examScheduleList = teacherService.examScheduleList(class_num);
		model.addAttribute("examScheduleList", examScheduleList);
	/* 영준 18.10.16 선생님 시험일정 끝 */	
		
		return "common.teacher.exam.examManagement";
	}
	
	/* 영준 - 18.10.17 내 시험지 삭제 시작 */
	@RequestMapping(value="teacherMyExamDelete.do", method = RequestMethod.POST)
	public @ResponseBody String teacherMyExamDelete(@RequestBody ExamPaperDto dto, String exam_paper_name)
	{
		int result = teacherService.examPaperDelete(exam_paper_name);
		String result2 = String.valueOf(result);
		return result2;
	}
	/* 영준 - 18.10.17 내 시험지 삭제 끝 */
	
	/* 영준 - 18.10.18 시험 일정 삭제 시작 */
	@RequestMapping(value="teacherExamSchedultDelete.do", method = RequestMethod.POST)
	public @ResponseBody String teacherExamSchedultDelete(@RequestBody ExamInfoDto dto, String exam_info_name)
	{
		int result = teacherService.examScheduleDelete(exam_info_name);
		String result2 = String.valueOf(result);
		return result2;
	}
	/* 영준 - 18.10.18 시험 일정 삭제 끝 */
	
	/* 현이 18.10.11 선생님 시험관리 끝 */

	// 강사 시험지 관련
	/* 영준 18.10.11 시험지 생성 페이지 시작 */
	@RequestMapping("examPaperMake.do")
	public String examPaperMake(Model model, Principal principal) {
		/* 문제 카테고리 */
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

		
		String member_id = principal.getName();
		MemberDto memberDto = commonService.myPageInfo(member_id);
		model.addAttribute("memberDto", memberDto);


		return "common.teacher.exampaper.examPaperMake";
	}
	
	@RequestMapping("examPaperMake_questionContent.do")
	public @ResponseBody String question_content(String num) {
		System.out.println(num);
		List<Question_choiceDto> question_choice;
		
		return null;
	}
	/* 영준 18.10.11 시험지 생성 페이지 끝 */

	/* 현이 18.10.11 시험지 수정 페이지 시작 */
	/* 영준 18.10.18 시험지 수정 시작 */
	@RequestMapping("examPaperModify.do")
	public String examPaperModify(Model model, int class_num) {
		List<ExamPaperDto> examPaperList;
		examPaperList = teacherService.examPaperList(class_num);
		model.addAttribute("examPaperList", examPaperList);
		System.out.println("examPaperList 값은>>>>>>>>>>>>>>>>>>>>>"+examPaperList);
		return "common.teacher.exampaper.examPaperModify";
	}
	/* 현이 18.10.11 시험지 수정 페이지 끝 */
	/* 영준 18.10.18 시험지 수정 끝 */
	
	/* 영준 18.10.18 내 시험지 - 시험등록 페이지 추가 시작 */
	@RequestMapping("examScheduleRegist.do")
	public String examScheduleRegist() {
		
		return "common.teacher.exam.examScheduleRegist";
	}
	/* 영준 18.10.18 내 시험지 - 시험등록 페이지 추가 끝 */
	
	/* 민지 18.10.10 강사 시험감독 페이지 시작 */
	@RequestMapping("examPaper.do")
	public String examPaper() {

		return "common.teacher.exampaper.examPaper";
	}
	/* 민지 18.10.10 강사 시험감독 페이지 끝 */

	
	
	
	// 강사 문제 관련 
	/*재훈 18.10.15 내 문제함 관련 시작 */
	@RequestMapping("questionManagement.do")
	public String questionManagement(Model model, Principal principal) throws Exception{
		List<CategoryDto> lgCatList;
		
		lgCatList=adminService.lgCategoryList();
		model.addAttribute("lgCatList",lgCatList);
		
		List<CategoryDto> mdCatList;
		mdCatList=adminService.mdCategoryList();
		model.addAttribute("mdCatList",mdCatList);
		
		List<CategoryDto> smCatList;
		smCatList=adminService.smCategoryList();
		model.addAttribute("smCatList",smCatList);
		
		List<CategoryDto> quesLevelList;
		quesLevelList=adminService.questionLevelList();
		model.addAttribute("quesLevelList",quesLevelList);
		
		String member_id = principal.getName();
		MemberDto memberDto = commonService.myPageInfo(member_id);
		model.addAttribute("memberDto", memberDto);
		
		return "common.teacher.question.questionManagement";
	}
	/*재훈 18.10.15 내 문제함 관련 끝 */
	/*재훈 18.10.18 새 문제 만들기 시작 */
	@RequestMapping(value="insertQuestion.do", method=RequestMethod.POST)
	public String insertQuestion(QuestionDto dto2, Question_choiceDto dto) throws ClassNotFoundException, SQLException {
	
		if (dto2.getQuestion_type().equals("객관식")) {
		adminService.insertQuestion(dto2);
		adminService.insertQuestionChoice(dto2, dto);
		} else {
		adminService.insertQuestion(dto2);
		}
		return "common.teacher.question.questionManagement";
	}
	/*재훈 18.10.18 새 문제 만들기 끝 */

	
	/*현이 18.10.09 강사 마이페이지 시작*/
	@RequestMapping(value = "myPage.do", method = RequestMethod.GET)
	public String myPageInfo(Model model, Principal principal) throws ClassNotFoundException, SQLException {
		//회준 10.15
		String member_id = principal.getName();
		System.out.println("아이디 : " +member_id);
		MemberDto memberDto = commonService.myPageInfo(member_id);
		model.addAttribute("memberDto", memberDto);
		
		return "common.teacher.common.myPage";
	}
	/* 현이 18.10.09 학생 마이페이지 끝 */
	
	@RequestMapping(value = "myPage.do", method = RequestMethod.POST)
	public String myPageUpdate(MemberDto memberDto)
			throws IOException, ClassNotFoundException, SQLException {
			commonService.myPageUpdate(memberDto);
		
		// 예외 발생에 상관없이 목록페이지 요청 처리
		return "common.teacher.common.myPage";
	}
	/*현이 18.10.09 강사 마이페이지 끝*/
	
	/* 양회준 10.15 내정보 탈퇴 시작*/
	@RequestMapping("myPageDrop.do")
	public String myPageDrop(MemberDto memberDto)
			throws IOException, ClassNotFoundException, SQLException {
			memberDto.setMember_enable("0");
			System.out.println(memberDto.getMember_enable());
			commonService.myPageDrop(memberDto);
		
		// 예외 발생에 상관없이 목록페이지 요청 처리
		return "redirect:/login.jsp";
	}
	/* 양회준 10.15 내정보 탈퇴 끝*/	
	
	
	/*민지 18.10.10 메시지 페이지 시작*/
	@RequestMapping("myMessage.do")
	public String myMessage() {

		return "common.teacher.common.myMessage";
	}
	/*민지 18.10.10 메시지 페이지 끝*/
	
	/*회준:10.08 시험 일정등록/수정 페이지 시작 */
	@RequestMapping("examScheduleUpdate.do")
	public String examScheduleUpdate() {
		return "common.teacher.exam.examScheduleUpdate";
	}
	/*회준:10.08 시험 일정등록/수정 페이지 끝 */
	
	/*양회준 18.10.11 학생&성적관리 추가 */
	@RequestMapping("studentInfo.do")
	public String studentInfo(){		
		return "common.teacher.grade.studentInfo";
	}
	/*양회준 18.10.11 학생&성적관리 끝 */
	
	/*양회준 18.10.12 문제 수정 시작	*/
	@RequestMapping("questionUpdate.do")
	public String questionUpdate() {		
		return "common.teacher.question.questionUpdate";

	}
	/* 양회준 18.10.12 문제 수정 끝 */
	
	/* 양회준 10.16 내정보 비밀번호 확인 시작*/
	@RequestMapping(value="memberDrop.do", method=RequestMethod.POST)
	public @ResponseBody int memberDrop(@RequestParam("member_id") String member_id, 
			@RequestParam("member_pwd") String member_pwd) throws IOException, ClassNotFoundException, SQLException {
		System.out.println("intoAjax");
		System.out.println(member_id);
		System.out.println(member_pwd);
		int result = commonService.memberDrop(member_id, member_pwd);		
		return result;
	}
	/* 양회준 10.16 내정보 비밀번호 확인 끝*/
	


}