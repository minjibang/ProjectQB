package onet.com.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import onet.com.admin.service.AdminService;
import onet.com.common.service.CommonService;
import onet.com.teacher.service.TeacherService;
import onet.com.vo.CategoryDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.NoticeDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;

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
	public String teacherMain(Model model) {
		List<NoticeDto> notice = commonService.teacher_student_Main();
		model.addAttribute("notice", notice);
		List<Exam_infoDto> exam_info = commonService.exam_info();
		model.addAttribute("exam_info", exam_info);
		
		return "common.teacher.notice.notice";
	}
	
	/*한결 10월 12일 강사 글쓰기 페이지 시작*/
	@RequestMapping("noticeWrite.do")
	public String noticeWrite() {
		
		return "common.teacher.notice.noticeWrite";
	}
	/*한결 10월 12일 강사 글쓰기 페이지 끝*/
	
	/*재훈:10.08 게시판 글 상세보기 페이지 시작*/
	@RequestMapping("noticeDetail.do")
	public String noticeDetail() {
		
		return "common.teacher.notice.noticeDetail";
	}
	/*재훈:10.08 게시판 글 상세보기 페이지 끝*/
	
	@RequestMapping("noticeUpdate.do")
	public String noticeUpdate() {
		
		return "common.teacher.notice.noticeUpdate";
	}

	
	// 강사 시험 관련 
	/*현이:10.09 시험 일정 상세보기 페이지 시작*/
	@RequestMapping("examScheduleDetail.do")
	public String examScheduleDetail() {
		
		return "common.teacher.exam.examScheduleDetail";
	}
	/*현이:10.09 시험 상세보기 페이지 끝*/
	
	/*한결 : 시험일정 > 시험응시 페이지 시작*/
	@RequestMapping("examPaperDo.do")
	public String examPaperDo() {

		return "exam.student.examPaperDo";
	}
	/*한결 : 시험일정 > 시험응시 페이지 끝*/

	/* 현이 18.10.11 선생님 시험관리 시작 */
	@RequestMapping("examManagement.do")
	public String examManagement(){
		
		return "common.teacher.exam.examManagement";
	}
	/* 현이 18.10.11 선생님 시험관리 끝 */
	
	/*회준:10.08 시험 일정등록/수정 페이지 시작 */
	@RequestMapping("examScheduleUpdate.do")
	public String examScheduleUpdate() {

		return "common.teacher.exam.examScheduleUpdate";
	}
	/*회준:10.08 시험 일정등록/수정 페이지 끝 */
	
	
	
	// 강사 시험지 관련 
	/* 영준 18.10.11 시험지 생성 페이지 시작 */
	@RequestMapping("examPaperMake.do")
	public String examPaperMake(Model model){
		/*문제 카테고리*/
		List<CategoryDto> list1;
		list1=adminService.lgCategoryList();
		model.addAttribute("list1",list1);
		
		List<CategoryDto> list2;
		list2=adminService.mdCategoryList();
		model.addAttribute("list2",list2);
		
		List<CategoryDto> list3;
		list3=adminService.smCategoryList();
		model.addAttribute("list3",list3);
		
		/*문제 출력*/
		List<QuestionDto> question = teacherService.question();
		model.addAttribute("question", question);
		List<Question_choiceDto> question_choice = teacherService.question_choice();
		model.addAttribute("question_choice", question_choice);
		
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
	@RequestMapping("examPaperModify.do")
	public String examPaperModify(){
		
		return "common.teacher.exampaper.examPaperModify";
	}
	/* 현이 18.10.11 시험지 수정 페이지 끝 */
	
	/*민지 18.10.10 강사 시험감독 페이지 시작*/
	@RequestMapping("examPaper.do")
	public String examPaper() {

		return "common.teacher.exampaper.examPaper";
	}
	/*민지 18.10.10 강사 시험감독 페이지 끝*/
	
	
	// 강사 문제 관련 
	/*정원 18.10.10 내 문제함 추가 */
	@RequestMapping("questionManagement.do")
	public String questionManagement(){
		
		return "common.teacher.question.questionManagement";
	}
	/*정원 18.10.10 내 문제함 끝 */
	

	
	/*현이 18.10.09 강사 마이페이지 시작*/
	@RequestMapping("myPage.do")
	public String mypage() {

		return "common.teacher.common.myPage";
	}
	/*현이 18.10.09 강사 마이페이지 끝*/
	
	
	/*민지 18.10.10 메시지 페이지 시작*/
	@RequestMapping("myMessage.do")
	public String myMessage() {

		return "common.teacher.common.myMessage";
	}
	/*민지 18.10.10 메시지 페이지 끝*/
	
	
	/*양회준 18.10.11 학생&성적관리 추가 */
	@RequestMapping("studentInfo.do")
	public String studentInfo(){
		
		return "common.teacher.grade.studentInfo";
	}
	/*양회준 18.10.11 학생&성적관리 끝 */
	
	/*양회준 18.10.12 문제 수정 시작*/	
	@RequestMapping("questionUpdate.do")
	public String questionUpdate() {
		
		return "common.teacher.question.questionUpdate";
	}	
	/*양회준 18.10.12 문제 수정 끝*/
	

	
}