package onet.com.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student/")
public class StudentController {
	
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


}
