package onet.com.admin.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import onet.com.admin.service.AdminService;
import onet.com.vo.CategoryDto;
import onet.com.vo.ClassDto;
import onet.com.vo.Exam_infoDto;


import onet.com.vo.MemberDto;

@Controller
@RequestMapping(value="/admin/")
public class AdminController {
	
	/*재훈 10.08 문제분류관련 start*/
	@Autowired
	private AdminService adminService;

	/*양회준 10.14 관리자 메인 시작*/
	@RequestMapping("adminMain.do")
	public String adminMain() {

		return "admin.adminMain";
	}
	/*양회준 10.14 관리자 메인 끝*/
	
	@RequestMapping("questionCategory.do")
	public String questionCategory(Model model) throws Exception {
		List<CategoryDto> list1;
		
		list1=adminService.lgCategoryList();
		model.addAttribute("list1",list1);
		
		List<CategoryDto> list2;
		list2=adminService.mdCategoryList();
		model.addAttribute("list2",list2);
		
		List<CategoryDto> list3;
		list3=adminService.smCategoryList();
		model.addAttribute("list3",list3);
		
		return "admin.questionCategory";
	}
	/*재훈 10.08 문제분류관련 end*/
	
	/* 영준 10.08 회원관리관련 시작 */
	@RequestMapping("adminMember.do")
	public String adminMember(Model model) throws Exception {
		List<MemberDto> memberList;
		memberList=adminService.memberList();
		model.addAttribute("memberList", memberList);
		return "admin.adminMember";
	}
	/* 영준 10.08 회원관리관련 끝 */
	

	/*민지 10.12 클래스멤버리스트 , 클래스 리스트 관련 */
	@RequestMapping("adminClassInfo.do")
	public String adminClassInfo(Model model) throws Exception{
		
		

		List<ClassDto> classList;
		classList=adminService.classList();
		model.addAttribute("classList", classList);
		
		
		List<MemberDto> classMemberList;
		classMemberList= adminService.classMemberList();
		model.addAttribute("classMemberList", classMemberList);
		return "admin.adminClassInfo";
	}

	
	@RequestMapping(value = "adminClassMemberUpdate.do", method = RequestMethod.POST)
	public @ResponseBody String adminClassMemberUpdate(@RequestBody MemberDto dto) //@RequestBody (비동기: 객체 형태로 받아요) 
	{	
		/*deptService.insertDept(dto);
		return dto.toString();*/
		int result = adminService.classMemberUpdate(dto);
		String result2 = String.valueOf(result);
		return result2;
		
	}
	/*민지 10.12 클래스멤버리스트 관련 끝*/

	
	
	/*민지 10.13 클래스 멤버 삭제 관련*/
		@RequestMapping(value = "adminClassMemberDelete.do", method = RequestMethod.POST)
		public @ResponseBody String adminClassMemberDelete(@RequestBody MemberDto dto) //@RequestBody (비동기: 객체 형태로 받아요) 
		{	
			/*deptService.insertDept(dto);
			return dto.toString();*/
			int result = adminService.classMemberDelete(dto);
			String result2 = String.valueOf(result);
			return result2;
			
		}
	/*민지 10.13 클래스 멤버 삭제 관련 끝*/


	
	
	
	
	
	
	/*현이 18.10.09 관리자 마이페이지 시작*/
	@RequestMapping("myPage.do")
	public String mypage() {

		return "common.admin.common.myPage";
	}
	/*현이 18.10.09 관리자 마이페이지 끝*/
	
	/*민지 18.10.10 메시지 페이지 시작*/
	@RequestMapping("myMessage.do")
	public String myMessage() {

		return "common.admin.common.myMessage";
	}
	/*민지 18.10.10 메시지 페이지 끝*/
	

	
	
	// 관리자 클래스 상세보기  - 공지사항
	@RequestMapping("adminClassMain.do")
	public String adminClassMain() {
		
		return "common.adminClass.admin.notice.notice";
	}

	@RequestMapping("noticeDetail.do")
	public String noticeDetail() {
		
		return "common.adminClass.admin.notice.noticeDetail";
	}
	
	@RequestMapping("noticeWrite.do")
	public String noticeWrite() {

		return "common.adminClass.admin.notice.noticeWrite";
	}

	@RequestMapping("noticeUpdate.do")
	public String noticeUpdate() {
		
		return "common.adminClass.admin.notice.noticeUpdate";
	}
	
	
	// 관리자 클래스 상세보기 - 시험 관리 
	@RequestMapping("examScheduleDetail.do")
	public String examScheduleDetail() {
		
		return "common.adminClass.admin.exam.examScheduleDetail";
	}  
	
	@RequestMapping("examManagement.do")
	public String examManagement(){
		
		return "common.adminClass.admin.exam.examManagement";
	}
	
	@RequestMapping("examPaperUpdate.do")
	public String examPaperUpdate() {

		return "common.adminClass.admin.exam.examPaperUpdate";
	}
	
	
	
	// 관리자 클래스 상세보기 - 시험지 관련 
	@RequestMapping("examPaperMake.do")
	public String examPaperMake(){
		
		return "common.adminClass.admin.examPaperMake";
	}
	
	@RequestMapping("examPaperModify.do")
	public String examPaperModify(){
		
		return "common.adminClass.admin.exampaper.examPaperModify";
	}
	
	
	
	// 관리자 클래스 상세보기 - 학생 & 성적관리 
	@RequestMapping("studentInfo.do")
	public String studentInfo(){
		
		return "common.adminClass.admin.grade.studentInfo";
	}
	
	
	// 관리자 클래스 상세보기 - 문제 관리 
	@RequestMapping("questionManagement.do")
	public String questionManagement(){
		
		return "common.adminClass.admin.question.questionManagement";
	}
	
	/*양회준 18.10.15 문제 수정 시작	*/
	@RequestMapping("questionUpdate.do")
	public String questionUpdate() {		
		return "common.adminClass.admin.question.questionUpdate";
	}	
	/*양회준 18.10.15 문제 수정 끝*/


}