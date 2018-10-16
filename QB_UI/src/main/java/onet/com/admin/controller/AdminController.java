package onet.com.admin.controller;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import onet.com.admin.service.AdminService;
import onet.com.common.service.CommonService;
import onet.com.vo.CategoryDto;
import onet.com.vo.ClassDto;
import onet.com.vo.ExamPaperDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.NoticeDto;

@Controller
@RequestMapping(value="/admin/")
public class AdminController {
	
	/*재훈 10.08 문제분류관련 start*/
	@Autowired
	private AdminService adminService;

	@Autowired
	private CommonService commonService;
	
	/*양회준 10.14 관리자 메인 시작*/
	@RequestMapping("adminMain.do")
	public String adminMain(Model model) {
		List<ClassDto> classList;
		
		classList = adminService.classList();
		model.addAttribute("classList",classList);
		
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
	
	
	@RequestMapping(value="adminMemberUpdate.do", method = RequestMethod.POST)
	public @ResponseBody String adminMemberUpdate(@RequestBody MemberDto dto) //@RequestBody (비동기: 객체 형태로 받아요) 
	{	
		int result = adminService.updateMember(dto);
		String result2 = String.valueOf(result);
		return result2;
		
	}
	
	@RequestMapping(value="adminMemberDelete.do", method = RequestMethod.POST)
	public @ResponseBody String adminMemberDelete(@RequestBody MemberDto dto)
	{
		int result = adminService.deleteMember(dto);
		String result2 = String.valueOf(result);
		return result2;
	}
	/* 영준 10. 회원관리관련 끝 */
	
	/*민지 10.12 클래스멤버리스트 , 클래스 리스트 관련 */
	@RequestMapping("adminClassInfo.do")
	public String adminClassInfo(Model model, int class_num) throws Exception{
		
		
//전체 클래스 데이터
		List<ClassDto> classList;
		classList=adminService.classList();
		model.addAttribute("classList", classList);
// 해당 클래스 데이터
		List<ClassDto> classlist;
		classlist=adminService.classlist(class_num);
		model.addAttribute("classlist", classlist);
		
		List<MemberDto> classMemberList;
		classMemberList= adminService.classMemberList(class_num);
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
	//10.15민지
	@RequestMapping("adminClassMain.do")
	public String adminClassMain(Model model, int class_num) {
		List<NoticeDto> notice;
		notice=commonService.teacher_student_Main(class_num);
		model.addAttribute("notice", notice);
		
		List<Exam_infoDto> exam_info = commonService.exam_info(class_num);
		
		model.addAttribute("exam_info", exam_info);
		return "common.adminClass.admin.notice.notice";
	}
	//10.15민지 클래스 수정
	@RequestMapping(value = "adminClassUpdate.do", method = RequestMethod.POST)
		public @ResponseBody String adminClassUpdate(@RequestBody ClassDto dto) //@RequestBody (비동기: 객체 형태로 받아요) 
		{	
			/*deptService.insertDept(dto);
			return dto.toString();*/
			int result = adminService.classUpdate(dto);
			String result2 = String.valueOf(result);
			return result2;
			
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
	/* 영준 10.16 시험 관리 페이지 시작 */
	@RequestMapping("examManagement.do")
	public String examManagement(Model model) throws Exception{
		List<ExamPaperDto> examPaperList;
		examPaperList = commonService.examPaperList();
		model.addAttribute("examPaperList", examPaperList);
		
		return "common.adminClass.admin.exam.examManagement";
	}
	/* 영준 10.16 시험 관리 페이지 끝 */
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
	/* 재훈 10.15 문제 관리 페이지 관련 start */
	@RequestMapping("questionManagement.do")
	public String questionManagement(Model model) throws Exception {
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
		
		return "common.adminClass.admin.question.questionManagement";
	}
	/* 재훈 10.15 문제 관리 페이지 관련 end */
	
	/*양회준 18.10.15 문제 수정 시작	*/
	@RequestMapping("questionUpdate.do")
	public String questionUpdate() {		
		return "common.adminClass.admin.question.questionUpdate";
	}	
	/*양회준 18.10.15 문제 수정 끝*/

	/*@RequestMapping("questionCategory.do")
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
	}*/
	

	/*현이 18.10.09 관리자 마이페이지 시작*/
	/*양회준 10.15 내 정보 수정 시작*/
	@RequestMapping(value = "myPage.do", method = RequestMethod.GET)
	public String myPageInfo(Model model, Principal principal) throws ClassNotFoundException, SQLException {
		String member_id = principal.getName();
		System.out.println("아이디 : " +member_id);
		MemberDto memberDto = commonService.myPageInfo(member_id);
		model.addAttribute("memberDto", memberDto);
		return "common.admin.common.myPage";
	}
	/*양회준 10.15 내 정보 수정 끝*/
	/*현이 18.10.09 관리자 마이페이지 끝*/
	
	@RequestMapping(value = "myPage.do", method = RequestMethod.POST)
	public String myPageUpdate(MemberDto memberDto)
			throws IOException, ClassNotFoundException, SQLException {
		String url = "redirect:myPage.do";
		try {
			url = commonService.myPageUpdate(memberDto);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		// 예외 발생에 상관없이 목록페이지 요청 처리
		return url;
	}
	
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
	// 정원 - 문제분류관리 - insert
	@RequestMapping("lgCatAdd.do")
	public @ResponseBody Map<String, Object> lgCatAdd(String lgCatAdd) {
		Map<String, Object> map = new HashMap<String, Object>();
		String result = adminService.lgCatAdd(lgCatAdd);
		System.out.println(result);
		map.put("result", result);
		return map;
	}

	@RequestMapping("mdCatAdd.do")
	public @ResponseBody Map<String, Object> mdCatAdd(String selectLgCat, String mdCatAdd) {
		Map<String, Object> map = new HashMap<String, Object>();
		String result = adminService.mdCatAdd(selectLgCat, mdCatAdd);
		System.out.println(result);
		map.put("result", result);
		return map;
	}
	
	@RequestMapping("smCatAdd.do")
	public @ResponseBody Map<String, Object> smCatAdd(String selectMdCat, String smCatAdd) {
		Map<String, Object> map = new HashMap<String, Object>();
		String result = adminService.smCatAdd(selectMdCat, smCatAdd);
		System.out.println(result);
		map.put("result", result);
		return map;
	}
	// 정원 - 문제분류관리 끝

}