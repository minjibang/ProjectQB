package onet.com.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import onet.com.common.service.CommonService;
import onet.com.teacher.service.TeacherService;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.NoticeDto;

@Controller
@RequestMapping(value="/teacher/")
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("teacherNoticeWrite.do")
	public String teacherNoticeWrite() {

		return "teacher.teacherNoticeWrite";
	}

	/*한결 10.09 메인페이지 데이터값 뿌리기*/
	/* 민지:10.08 강사 메인추가 */
	@RequestMapping("teacherMain.do")
	public String teacherMain(Model model) throws Exception  {
		List<NoticeDto> notice = commonService.teacher_student_Main();
		model.addAttribute("notice", notice);
		List<Exam_infoDto> exam_info = commonService.exam_info();
		model.addAttribute("exam_info", exam_info);
		
		return "common.teacher.teacher_student_Main";
	}
	/*한결 끝*/

	@RequestMapping("teacherMyPage.do")
	public String teacherMypage() {
	
	return "teacher.teacherMyPage";
	}
	
	/*재훈:10.08 게시판 글 상세보기 페이지 시작*/
	@RequestMapping("noticeView.do")
	public String noticeView() {

		return "common.teacher.noticeView";
	}
	/*재훈:10.08 게시판 글 상세보기 페이지 끝*/
	
	/*영준:10.08 내 시험지 보기 페이지 시작 */
	@RequestMapping("teacherMyExamPaper.do")
	public String teacherMyExamPaper() {

		return "teacher.teacherMyExamPaper";
	}
	/*영준:10.08 내 시험지 보기 페이지 끝 */
	
	/*영준:10.08 임시 저장된 시험지 보기 페이지 시작 */
	@RequestMapping("teacherTempExamPaper.do")
	public String teacherTempExamPaper() {

		return "teacher.teacherTempExamPaper";
	}
	/*영준:10.08 임시 저장된 시험지 보기 페이지 끝 */
	
	/*영준:10.08 시험 일정보기 페이지 시작 */
	@RequestMapping("teacherExamSchedule.do")
	public String teacherExamSchedule() {

		return "teacher.teacherExamSchedule";
	}
	/*영준:10.08 시험 일정보기 페이지 끝 */
	
	/*회준:10.08 시험 일정등록/수정 페이지 시작 */
	@RequestMapping("teacherExamPaperUpdate.do")
	public String teacherExamPaperUpdate() {

		return "teacher.teacherExamPaperUpdate";
	}
	/*회준:10.08 시험 일정등록/수정 페이지 끝 */
	
	/*현이:10.09 시험 일정 상세보기 페이지 시작*/
	@RequestMapping("examScheduleDetail.do")
	public String examDetailView() {
		
		
		return "common.teacher.examScheduleDetail";
	}  
	/*현이:10.09 시험 상세보기 페이지 끝*/
	
	/*현이 18.10.09 관리자 마이페이지 시작*/
	@RequestMapping("myPage.do")
	public String mypage() {

		return "common.teacher.myPage";
	}
	/*현이 18.10.09 관리자 마이페이지 끝*/
	
	/*정원 18.10.10 강사 내 문제함 시작 */
	@RequestMapping("myQuestion.do")
	public String myQuestion() {
		
		return "teacher.teacherMyQuestions";
	}
	/*정원 18.10.10 강사 내 문제함 끝 */
	
}