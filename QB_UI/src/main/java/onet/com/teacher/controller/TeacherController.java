package onet.com.teacher.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import onet.com.admin.service.AdminService;
import onet.com.common.service.CommonService;
import onet.com.teacher.service.TeacherService;
import onet.com.vo.CategoryDto;
import onet.com.vo.CommentDto;
import onet.com.vo.Class_chartDto;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.NoticeDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;
import onet.com.vo.Score_chartDto;
import onet.com.vo.StudentExamScoreInfo;

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
	   public String teacherMain(Model model, Principal principal) {
	      String member_id = principal.getName();
	      System.out.println(member_id);
	      List<NoticeDto> notice = commonService.teacher_student_Main(member_id);
	      List<MemberDto> boardNull = commonService.boardNull(member_id);
	      String noticeCheck = boardNull.get(0).getClass_name();
	      model.addAttribute("noticeCheck", noticeCheck);
	      model.addAttribute("notice", notice);
		  List<Exam_infoDto> exam_info = commonService.exam_info(member_id);
		  	model.addAttribute("exam_info", exam_info);
	      return "common.teacher.notice.notice";
	   }

		/*민지 18.10.10 메시지 페이지 시작*/
		@RequestMapping("myMessage.do")
		public String myMessage(Model model, Principal principal) {
			String member_id = principal.getName();
			System.out.println("아이디:"+member_id);
			   List<MemberDto> classMemberList = commonService.classMemeberList(member_id);
			   System.out.println("classMemberList >>   " + classMemberList + "   <<<");
			   model.addAttribute("classMemberList", classMemberList);
			return "common.teacher.common.myMessage";
		}
		/*민지 18.10.10 메시지 페이지 끝*/
	/* 한결 10월 12일 강사 글쓰기 페이지 시작 */
	@RequestMapping("noticeWrite.do")
	public String noticeWrite(String class_name, Model model) {
		
		model.addAttribute("class_name",class_name);
		
		return "common.teacher.notice.noticeWrite";
	}
	/* 한결 10월 12일 강사 글쓰기 페이지 끝 */

	/* 10.08 게시판 글 상세보기 페이지 시작 */
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(Model model, String class_name, int notice_num, Principal principal) {
		List<NoticeDto> result = commonService.noticeDetail(class_name, notice_num);
		List<CommentDto> comment = commonService.comment(class_name, notice_num);
		List<CommentDto> commentGroup = commonService.commentGroup(class_name, notice_num);
		if(result.get(0).getNotice_file1() != null && result.get(0).getNotice_file2() != null) {
			String file1 = result.get(0).getNotice_file1();
			int index1 = file1.indexOf("_");
			String originFileName1 = file1.substring(index1+1);
			String file2 = result.get(0).getNotice_file2();
			int index2 = file2.indexOf("_");
			String originFileName2 = file2.substring(index2+1);
			model.addAttribute("originFileName1",originFileName1);
			model.addAttribute("originFileName2",originFileName2);
		}else if(result.get(0).getNotice_file1() != null && result.get(0).getNotice_file2() == null) {
			String file1 = result.get(0).getNotice_file1();
			int index1 = file1.indexOf("_");
			String originFileName1 = file1.substring(index1+1);
			model.addAttribute("originFileName1",originFileName1);
		}else if(result.get(0).getNotice_file1() == null && result.get(0).getNotice_file2() != null) {
			String file2 = result.get(0).getNotice_file2();
			int index2 = file2.indexOf("_");
			String originFileName2 = file2.substring(index2+1);
			model.addAttribute("originFileName2",originFileName2);
		}
		String name = principal.getName();
		model.addAttribute("result", result);
		model.addAttribute("comment", comment);
		model.addAttribute("commentGroup", commentGroup);
		model.addAttribute("name", name);
		return "common.teacher.notice.noticeDetail";
	}
	/* 10.08 게시판 글 상세보기 페이지 끝 */

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

	
	
	/* 민지 18.10.10 강사 시험감독 페이지 시작 */
	@RequestMapping("examPaper.do")
	public String examPaper() {

		return "common.teacher.exampaper.examPaper";
	}
	/* 민지 18.10.10 강사 시험감독 페이지 끝 */

	
	
	
	
	/*%%%%%%%%%%%%%%%%%%%%%%%    재훈 시작      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
	
	//강사 - 내 문제함 페이지 문제분류 셀렉트박스 데이터 출력
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
	
	//강사 - 내 문제함에 본인이 제출한 문제 정보 출력
	@RequestMapping(value="myQuestionView.do")
	public @ResponseBody ModelAndView classListView(@RequestParam("member_id") String member_id) {
		
		List<QuestionDto> question = teacherService.teacherMyQuestion(member_id);
		List<Question_choiceDto> question_choice = teacherService.question_choice();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ajax.common.questionManagement_ajax");
		mv.addObject("question", question);
		mv.addObject("question_choice",question_choice);
		
		return mv;
	}

	//강사 - 문제 검색기능 
	 @RequestMapping(value="myQuestionSearch.do")
	   public @ResponseBody ModelAndView questionSearch(@RequestParam("lgsearchtype") String lgsearchtype, 
	         @RequestParam("mdsearchtype") String mdsearchtype, @RequestParam("smsearchtype") String smsearchtype,
	         @RequestParam("leveltype") String leveltype, @RequestParam("questiontype") String questiontype,
	         @RequestParam("keyword") String keyword, @RequestParam("member_id") String member_id) {
	    
	     List<QuestionDto> question = teacherService.teacherMyQuestionSearch(lgsearchtype,mdsearchtype,smsearchtype,leveltype,questiontype,keyword,member_id);
	     List<Question_choiceDto> question_choice = teacherService.question_choice();
	      
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("ajax.common.questionManagement_ajax");
	     mv.addObject("question", question);
	     mv.addObject("question_choice",question_choice);
	     
	     return mv;
	  }


	
	//강사 - 새 문제 만들기 
		@RequestMapping(value="insertQuestion.do", method=RequestMethod.POST)
		public String insertQuestion(QuestionDto dto2, Question_choiceDto dto, HttpServletRequest request)
			throws IOException, ClassNotFoundException, SQLException{
			if (dto2.getQuestion_type().equals("객관식")) {
				adminService.insertQuestion(dto2, request);
				adminService.insertQuestionChoice(dto2, dto, request);
			} else if(dto2.getQuestion_type().equals("단답형")) {
				adminService.insertQuestion(dto2, request);
			}
			System.out.println("오는가?2");
//			adminService.insertQuestion(dto2, request);
			return "redirect:questionManagement.do";
	}
		
	//강사 - 문제 삭제
		@RequestMapping("singleQuestionDelete.do")
		public @ResponseBody Map<String,Object> singleQuestionDelete(int question_num){
			System.out.println("컨트롤러 진입>>>>>" + question_num);
			Map<String,Object> map = new HashMap <String,Object>();
			int result = commonService.singleQuestionDelete(question_num);
			
			if(result == 0) {
				System.out.println("컨트롤러 if문 >> result 값 0");
				map.put("result", "삭제불가");
			}else {
				System.out.println("컨트롤러 if문 >> result 값 0이 아닐때");
				map.put("result", "삭제가능");
			}
			return map;
		}
		
	//강사 - 문제 수정 버튼 클릭시 확인 창 + 문제가 수정 가능한지 확인하는 기능
		@RequestMapping("singleUpdateCheck.do")
		public @ResponseBody Map<String,Object> singleUpdateCheck(int question_num){
			System.out.println("singleUpdateCheck.do 컨트롤러 진입>>>>>" + question_num);
			Map<String,Object> map = new HashMap <String,Object>();
			int result = commonService.singleUpdateCheck(question_num);
			if(result == 0) {
				System.out.println("컨트롤러 if문 >> result 값 0");
				map.put("result", "삭제불가");
			}else {
				System.out.println("컨트롤러 if문 >> result 값 0이 아닐때");
				map.put("result", "삭제가능");
			}
			return map;
		}
	
	//강사 - 문제 수정 페이지로 이동시 선택한 문제와 보기 정보 데이터를 출력
		@RequestMapping("questionUpdate.do")
		public String questionUpdate(Model model, int question_num) {
			System.out.println("questionUpdate.do 컨트롤러 진입>>> question_num값: " +question_num);
			
			List<QuestionDto> qdto;
			qdto=commonService.questionInfo(question_num);
			model.addAttribute("qdto",qdto);
			
			List<Question_choiceDto> cdto;
			cdto=commonService.questionChoiceInfo(question_num);
			model.addAttribute("cdto",cdto);
			
			List<CategoryDto> qcat;
			qcat=commonService.questionCategoryInfo(question_num);
			model.addAttribute("qcat",qcat);
			
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
			
			return "common.teacher.question.questionUpdate";
			
		}

	/*%%%%%%%%%%%%%%%%%%%%%%%    재훈 끝       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/

	
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
	
	

	
	
	/*양회준 18.10.11 학생&성적관리 추가 */
	//학생정보 불러오기
	@RequestMapping("studentInfo.do")
	public String studentInfo(Model model, Principal principal){
		//양회준 10-24
		String member_id = principal.getName();
		String class_num = null;
		List<MemberDto> studentList = commonService.studentInfo(member_id, class_num);
		String student_id = studentList.get(0).getMember_id();
		String class_name = studentList.get(0).getClass_name();
		//첫번째 학생의 데이터로 차트 가져오기
		Map<String, Object> chart = commonService.studentChartInfo(studentList.get(0).getMember_id(), class_name);
		List<Score_chartDto> studentChart = (List<Score_chartDto>) chart.get("studentName");
		List<Class_chartDto> classChart = (List<Class_chartDto>) chart.get("className");
		model.addAttribute("studentList",studentList);
		model.addAttribute("classChart",classChart);
		model.addAttribute("studentChart",studentChart);
		//학생 개인 성적확인
		List<StudentExamScoreInfo> studentExamScoreInfo = commonService.studentExamScoreInfo(studentList.get(0).getMember_id(), class_name);
		model.addAttribute("studentExamScoreInfo",studentExamScoreInfo);
		//학생 전체 성적확인
		
		return "common.teacher.grade.studentInfo";
	}
	
	@RequestMapping(value="studentChartInfo.do", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> studentChartInfo(@RequestParam("member_id") String member_id,
			@RequestParam("class_name") String class_name){
		//양회준 10-24
		Map<String, Object> chart = commonService.studentChartInfo(member_id, class_name);
		List<Class_chartDto> studentChart = (List<Class_chartDto>) chart.get("className");
		for(Class_chartDto data : studentChart) {
			System.out.println("과연 : "+data.getExam_info_name());
		}
		return chart;
	}
	
	/* 영준 10.25 반 등수 시작 */
	@RequestMapping(value="classRank.do", method=RequestMethod.POST)
	public @ResponseBody List<Score_chartDto> classRank(@RequestParam("exam_info_name") String exam_info_name) {
		List<Score_chartDto> classRank = commonService.classRank(exam_info_name);
		System.out.println("과연 반 등수는? : " + classRank);
		return classRank;
	}
	/* 영준 10.26 반 등수 끝 */
	
	/* 영준 10.26 표준편차 시작 */
	@RequestMapping(value="studentStdChart.do", method=RequestMethod.POST)
	public @ResponseBody List<Score_chartDto> studentStdChart(@RequestParam("exam_info_name") String exam_info_name) {
		List<Score_chartDto> studentStdChart = commonService.studentStdChart(exam_info_name);
		System.out.println("과연 표준편차는? : " + studentStdChart);
		return studentStdChart;
	}
	
	/*양회준 18.10.11 학생&성적관리 끝 */
	
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
	
	/* 정원 10.22 공지사항 글쓰기*/
	
	@RequestMapping(value="noticeView.do", method=RequestMethod.POST)
	public String noticeWrite(NoticeDto dto, Principal principal,MultipartHttpServletRequest request) throws Exception {
		String member_id = principal.getName();
		dto.setMember_id(member_id);
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String str = dayTime.format(new Date(time));
		dto.setNotice_date(str);
		
		MultipartFile file1 = request.getFile("files1");
		MultipartFile file2 = request.getFile("files2");
		System.out.println("file1 : "+ file1);
		String originFileName1 = file1.getOriginalFilename();
		String originFileName2 = file2.getOriginalFilename();
		long fileSize1 = file1.getSize();
		long fileSize2 = file2.getSize();
		String path =  request.getServletContext().getRealPath("/upload/notice/");
		
		UUID uuid = UUID.randomUUID();
		String savaFile1 = uuid.toString()+"_" + originFileName1;
		String saveFile2 = uuid.toString()+"_" + originFileName2;
		
		String safeFile1 = path + savaFile1;
		String safeFile2 = path + saveFile2;
		System.out.println("safeFile : " + safeFile1);
		if(fileSize1 > 0 && fileSize2 > 0) {
			file1.transferTo(new File(safeFile1));
			file2.transferTo(new File(safeFile2));
			dto.setNotice_file1(savaFile1);
			dto.setNotice_file2(saveFile2);
		}else if(fileSize1 > 0 && fileSize2 == 0){
			file1.transferTo(new File(safeFile1));
			dto.setNotice_file1(savaFile1);
		}else if(fileSize2 > 0 && fileSize1 == 0) {
			file2.transferTo(new File(safeFile2));
			dto.setNotice_file2(saveFile2);
		}
		int result = commonService.insertBoardList(dto);
		return "redirect:teacherMain.do";
	}
	
	
	@RequestMapping("commentReply.do")
	public @ResponseBody int commentReply(int notice_num, String class_name, int comment_num, String replyInput, Principal principal){
		String member_id = principal.getName();
		CommentDto dto = new CommentDto();
		dto.setClass_name(class_name);
		dto.setNotice_num(notice_num);
		dto.setComment_num(comment_num);
		dto.setMember_id(member_id);
		dto.setComment_content(replyInput);
		int result = commonService.commentReply(dto);
		return result;
		
	}
	
	@RequestMapping("noticeDetailAjax.do")
	public ModelAndView noticeDetailAjax(Model model, String class_name, int notice_num, Principal principal) {
		List<NoticeDto> result = commonService.noticeDetail(class_name, notice_num);
		List<CommentDto> comment = commonService.comment(class_name, notice_num);
		List<CommentDto> commentGroup = commonService.commentGroup(class_name, notice_num);
		String name = principal.getName();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ajax.teacher.noticeDetail_ajax1");
		mv.addObject("result", result);
		mv.addObject("comment", comment);
		mv.addObject("commentGroup", commentGroup);
		mv.addObject("name", name);
		return mv;
	}
	
	@RequestMapping("commentInsert.do")
	public @ResponseBody int commentInsert(Model model, String class_name, int notice_num, String textarea, Principal principal) {
		String name = principal.getName();
		CommentDto dto = new CommentDto();
		dto.setMember_id(name);
		dto.setClass_name(class_name);
		dto.setNotice_num(notice_num);
		dto.setComment_content(textarea);
		int result = commonService.commentInsert(dto);
		return 0;
	}
	

	@RequestMapping("noticeReplyUpdate.do")
	public @ResponseBody int noticeReplyUpdate(Model model, int comment_num, String comment_content) {
		CommentDto dto = new CommentDto();
		dto.setComment_num(comment_num);
		dto.setComment_content(comment_content);
		int result = commonService.commentUpdate(dto);
		return 0;
	}
	
	@RequestMapping("commentReplyDelete.do")
	public @ResponseBody int commentReplyDelete(Model model,int comment_num) {
		CommentDto dto = new CommentDto();
		dto.setComment_num(comment_num);
		int result = commonService.commentReplyDelete(dto);
		return 0;
	}
	
	@RequestMapping("noticeUpdate.do")
	public String noticeUpdate(Model model,int notice_num, String class_name) {
		NoticeDto dto = new NoticeDto();
		dto.setNotice_num(notice_num);
		dto.setClass_name(class_name);
		List<NoticeDto> result = commonService.noticeUpdateList(dto);
		if(result.get(0).getNotice_file1() != null && result.get(0).getNotice_file2() != null) {
			String file1 = result.get(0).getNotice_file1();
			int index1 = file1.indexOf("_");
			String originFileName1 = file1.substring(index1+1);
			String file2 = result.get(0).getNotice_file2();
			int index2 = file2.indexOf("_");
			String originFileName2 = file2.substring(index2+1);
			model.addAttribute("originFileName1",originFileName1);
			model.addAttribute("originFileName2",originFileName2);
		}else if(result.get(0).getNotice_file1() != null && result.get(0).getNotice_file2() == null) {
			String file1 = result.get(0).getNotice_file1();
			int index1 = file1.indexOf("_");
			String originFileName1 = file1.substring(index1+1);
			model.addAttribute("originFileName1",originFileName1);
		}else if(result.get(0).getNotice_file1() == null && result.get(0).getNotice_file2() != null) {
			String file2 = result.get(0).getNotice_file2();
			int index2 = file2.indexOf("_");
			String originFileName2 = file2.substring(index2+1);
			model.addAttribute("originFileName2",originFileName2);
		}
		
		model.addAttribute("result",result);
		return "common.teacher.notice.noticeUpdate";
	}
	
	@RequestMapping(value="noticeRealUpdate.do", method=RequestMethod.POST)
	public String noticeRealUpdate(NoticeDto dto, Principal principal,MultipartHttpServletRequest request, RedirectAttributes red) throws Exception {
		String member_id = principal.getName();
		dto.setMember_id(member_id);
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String str = dayTime.format(new Date(time));
		dto.setNotice_date(str);
		
		int notice_num = dto.getNotice_num();
		String class_name = dto.getClass_name();
		MultipartFile file1 = request.getFile("files1");
		MultipartFile file2 = request.getFile("files2");
		if(file1 != null && file2 != null) {
			String originFileName1 = file1.getOriginalFilename();
			String originFileName2 = file2.getOriginalFilename();
			long fileSize1 = file1.getSize();
			long fileSize2 = file2.getSize();
			String path =  request.getServletContext().getRealPath("/upload/notice/");
			System.out.println("1" + originFileName1);
			System.out.println("2" + originFileName2);
			UUID uuid = UUID.randomUUID();
			String saveFile1 = uuid.toString()+"_" + originFileName1;
			String saveFile2 = uuid.toString()+"_" + originFileName2;
			
			String safeFile1 = path + saveFile1;
			String safeFile2 = path + saveFile2;
			System.out.println("safeFile : " + safeFile1);
			if(fileSize1 > 0 && fileSize2 > 0) {
				file1.transferTo(new File(safeFile1));
				file2.transferTo(new File(safeFile2));
				dto.setNotice_file1(saveFile1);
				dto.setNotice_file2(saveFile2);
			}else if(fileSize1 > 0 && fileSize2 == 0){
				file1.transferTo(new File(safeFile1));
				dto.setNotice_file1(saveFile1);
			}else if(fileSize2 > 0 && fileSize1 == 0) {
				file2.transferTo(new File(safeFile2));
				dto.setNotice_file2(saveFile2);
			}
		}else if(file1 != null && file2 == null) {
			String originFileName1 = file1.getOriginalFilename();
			long fileSize1 = file1.getSize();
			String path =  request.getServletContext().getRealPath("/upload/notice/");
			UUID uuid = UUID.randomUUID();
			String saveFile1 = uuid.toString()+"_" + originFileName1;
			String safeFile1 = path + saveFile1;
			file1.transferTo(new File(safeFile1));
			dto.setNotice_file1(saveFile1);
		}else if(file1 == null && file2 != null) {
			String originFileName2 = file2.getOriginalFilename();
			long fileSize2 = file2.getSize();
			String path =  request.getServletContext().getRealPath("/upload/notice/");
			UUID uuid = UUID.randomUUID();
			String saveFile2 = uuid.toString()+"_" + originFileName2;
			String safeFile2 = path + saveFile2;
			file1.transferTo(new File(safeFile2));
			dto.setNotice_file2(saveFile2);
		}
		int result = commonService.updateBoardList(dto);
		System.out.println("테스트");
		red.addAttribute("class_name", class_name);
		red.addAttribute("notice_num", notice_num);
		return "redirect:noticeDetail.do";
	}
	
	@RequestMapping("noticeDelete.do")
	public String noticeDelete(Model model,int notice_num, String class_name) {
		NoticeDto dto = new NoticeDto();
		dto.setNotice_num(notice_num);
		dto.setClass_name(class_name);
		int result = commonService.noticeDelete(dto);
		
		return "redirect:teacherMain.do";
	}
	//양회준 10-25 학생&성적관리 학생개인 성적확인
	@RequestMapping(value="studentExamScoreInfo.do", method=RequestMethod.POST)
	public @ResponseBody List<StudentExamScoreInfo> studentExamScoreInfo(@RequestParam("member_id") String member_id,
			@RequestParam("class_name") String class_name){
		//양회준 10-24
		List<StudentExamScoreInfo> result = commonService.studentExamScoreInfo(member_id, class_name);
		return result;
	}
	
}