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
	
	/*현이:10.09 시험 일정 상세보기 페이지 시작*/
	@RequestMapping("examScheduleDetail.do")
	public String examDetailView() {
		
		return "common.student.examScheduleDetail";
	}  
	/*현이:10.09 시험 상세보기 페이지 끝*/
	
	/*현이 18.10.09 학생 마이페이지 시작*/
	@RequestMapping("myPage.do")
	public String mypage() {

		return "common.student.myPage";
	}
	/*현이 18.10.09 학생 마이페이지 끝*/
	
	/* 한결 18.10.10 메인페이지 시작 */
	@RequestMapping("studentMain.do")
	public String studentMain(Model model) {
		List<NoticeDto> notice = commonService.teacher_student_Main();
		model.addAttribute("notice", notice);
		List<Exam_infoDto> exam_info = commonService.exam_info();
		model.addAttribute("exam_info", exam_info);
		return "common.student.teacher_student_Main";
	}
	
	@RequestMapping("noticeView.do")
	public String noticeView() {
		
		return "common.student.noticeView";
	}  
	/* 한결 18.10.10 메인페이지 끝 */

}
