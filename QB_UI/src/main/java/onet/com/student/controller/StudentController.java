package onet.com.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import onet.com.common.service.CommonService;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.NoticeDto;

@Controller
@RequestMapping("/student/")
public class StudentController {

	@Autowired
	private CommonService commonService;

	// 학생 시험 관련
	/* 현이:10.09 시험 일정 상세보기 페이지 시작 */
	@RequestMapping("examScheduleDetail.do")
	public String examScheduleDetail() {

		return "common.student.exam.examScheduleDetail";
	}
	/* 현이:10.09 시험 상세보기 페이지 끝 */

	// 학생 시험지 관련
	@RequestMapping("examPaper.do")
	public String examPaper() {

		return "common.student.exampaper.examPaper";
	}

	
	// 학생 notice 관련
	/*한결 10월 12일 학생메인페이지 시작*/
	@RequestMapping("studentMain.do")
	public String studentMain(Model model, int class_num) {
		List<NoticeDto> notice = commonService.teacher_student_Main(class_num);
		model.addAttribute("notice", notice);
		List<Exam_infoDto> exam_info = commonService.exam_info(class_num);
		model.addAttribute("exam_info", exam_info);
		
		return "common.student.notice.notice";
	}
	/*한결 10월 12일 학생메인페이지 끝*/

	/* 재훈:10.08 게시판 글 상세보기 페이지 시작 */
	@RequestMapping("noticeDetail.do")
	public String noticeDetail() {

		return "common.student.notice.noticeDetail";
	}
	/* 재훈:10.08 게시판 글 상세보기 페이지 끝 */
	
	
	
	// 학생 성적 관련 
	/* 지난 시험보기 */
	/*한결 10.12 지난 시험보기 페이지 로드 시작*/
	@RequestMapping("pastExam.do")
	public String pastExam() {

		return "student.pastExam";
	}

	@RequestMapping("pastExamPaper.do")
	public String pastExamPaper() {

		return "exam.student.pastExamPaper";
	}
	
	/*시험일정 > 시험응시 활성화*/
	@RequestMapping("examPaperDo.do")
	public String examPaperDo() {

		return "exam.student.examPaperDo";
	}
	/* 한결 10.12 지난 시험보기 및 시험응시 페이지 로드 끝 */

	/* 양회준 18.10.11 학생 성적관리 시작 */
	@RequestMapping("gradeManage.do")
	public String gradeManage() {

		return "student.gradeManage";
	}
	/* 양회준 18.10.11 학생 성적관리 끝 */
	
	
	

	/* 현이 18.10.09 학생 마이페이지 시작 */
	@RequestMapping("myPage.do")
	public String mypage() {

		return "common.student.common.myPage";
	}
	/* 현이 18.10.09 학생 마이페이지 끝 */
	
	
	@RequestMapping("myMessage.do")
	public String myMessage() {

		return "common.admin.common.myPage";
	}
	
	
	
	/* 현이 18.10.15 학생 시험응시 페이지 테스트 시작 */
	@RequestMapping("examPaperDo2.do")
	public String examPaperDo2() {

		return "exam.student.examPaperDo2";
	}
	/* 현이 18.10.15 학생 시험응시 페이지 테스트 끝 */




}
