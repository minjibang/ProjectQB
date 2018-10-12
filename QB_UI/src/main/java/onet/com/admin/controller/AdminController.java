package onet.com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import onet.com.admin.service.AdminService;
import onet.com.vo.CategoryDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.NoticeDto;

@Controller
@RequestMapping(value="/admin/")
public class AdminController {
	
	/*재훈 10.08 문제분류관련 start*/
	@Autowired
	private AdminService adminService;

	
	@RequestMapping("adminMain.do")
	public String adminMain() {

		return "admin.adminMain";
	}
	
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
	
	
	@RequestMapping("adminMember.do")
	public String adminMember(Model model) throws Exception {
		List<MemberDto> memberList;
		memberList=adminService.memberList();
		model.addAttribute("memberList", memberList);
		
		return "admin.adminMember";
	}	
	
	
	

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
	
	
	
	@RequestMapping("adminClassInfo.do")
	public String adminClassInfo() {

		return "common.adminClass.admin.admin.adminClassInfo";
	}
	
	
	
	
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
	
	
	// 관리자 클래스 상세보기 - 시험 
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
		
		return "common.adminClass.admin.examPaperModify";
	}

	


}