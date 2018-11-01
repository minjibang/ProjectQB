package onet.com.student.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import onet.com.common.service.CommonService;
import onet.com.student.service.StudentService;
import onet.com.vo.Class_chartDto;
import onet.com.vo.CommentDto;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDoQuestionDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.MessageDto;
import onet.com.vo.NoticeDto;
import onet.com.vo.Question_choiceDto;
import onet.com.vo.Score_chartDto;
import onet.com.vo.StudentExamScoreInfo;
import onet.com.vo.Student_answerDto;
import onet.com.vo.Student_answerDtoList;
import onet.com.vo.Student_answerQuesDto;

@Controller
@RequestMapping("/student/")
public class StudentController {

	@Autowired
	private CommonService commonService;
	
	@Autowired
	private StudentService studentService;

	// 학생 시험 관련
	/* 현이:10.09 시험 일정 상세보기 페이지 시작 */
	@RequestMapping("examScheduleDetail.do")
	public String examScheduleDetail(Model model, int exam_info_num) {
		
		ExamInfoDto dto = commonService.examScheduleDetail(exam_info_num);
		model.addAttribute("dto", dto);
		
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
	   public String studentMain(Model model, Principal principal) {
		   String member_id = principal.getName();
		      System.out.println(member_id);
		      List<NoticeDto> notice = commonService.teacher_student_Main(member_id);
		      List<MemberDto> boardNull = commonService.boardNull(member_id);
		      System.out.println(boardNull);
		    	model.addAttribute("boardNull", boardNull);
		        model.addAttribute("notice", notice);
			  List<Exam_infoDto> exam_info = commonService.exam_info(member_id);
			  	model.addAttribute("exam_info", exam_info);
	      
	      return "common.student.notice.notice";
	   }
	   /*한결 10월 12일 학생메인페이지 끝*/

	/* 재훈:10.08 게시판 글 상세보기 페이지 시작 */
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
		return "common.student.notice.noticeDetail";
	}
	/* 재훈:10.08 게시판 글 상세보기 페이지 끝 */
	
	
	
	// 학생 성적 관련 
	/* 지난 시험보기 */
	/*한결 10.12 지난 시험보기 페이지 로드 시작*/
	@RequestMapping("pastExam.do")
	public String pastExam(Model model, Principal principal) {
		
		// 10.23 현이 추가 
		String member_id = principal.getName();
		List<ExamInfoDto> examInfoList = studentService.searchPastExam(member_id);
		String member_name = studentService.searchStudentName(member_id);
		model.addAttribute("examInfoList", examInfoList);
		model.addAttribute("member_name", member_name);

		return "student.pastExam";
	}
	
	// 10.24 현이 
	// keyword 검색 ajax
	@RequestMapping("searchPastExamKeyword.do")
	public @ResponseBody List<ExamInfoDto> searchPastExamKeyword(
			@RequestParam("keyword") String keyword, Principal principal){
		
		String member_id = principal.getName();
		List<ExamInfoDto> examInfoList = studentService.searchPastExamKeyword(member_id, keyword);
		
		return examInfoList;
	}
	
	
	// 10.24 현이 지난 시험지 보기
	@RequestMapping("pastExamPaper.do")
	public String pastExamPaper(Model model, int exam_info_num, Principal principal) throws ClassNotFoundException, SQLException, IOException {
		
		ExamInfoDto exam_info = commonService.examScheduleDetail(exam_info_num);
		model.addAttribute("exam_info", exam_info);
		
		int questionCount = commonService.questionCount(exam_info_num);
		int wrongQuestionCount = studentService.wrongQuestionCount(principal.getName(), exam_info_num);
		model.addAttribute("questionCount", questionCount);
		model.addAttribute("wrongQuestionCount", wrongQuestionCount);
				
		return "exam.student.pastExamPaper";
	}
	
	
	// 10.24 현이 ajax로 시험지의 문제들 불러오기 
	
	
	// 10.24 현이 ajax로 학생 답안지 리스트 가져오기 
	@RequestMapping("searchStudentAnswer.do")
	public @ResponseBody List<Student_answerQuesDto> selectStudentAnswer(
			@RequestParam("exam_info_num") int exam_info_num, @RequestParam("student_answer_status") String student_answer_status, Principal principal){
		
		List<Student_answerQuesDto> studentAnswerList = studentService.selectStudentAnswer(principal.getName(), exam_info_num, student_answer_status);
		return studentAnswerList;
	}
	
	/*시험일정 > 시험응시 활성화*/
	@RequestMapping("examPaperDo.do")
	public String examPaperDo() {			//	현재 examPaperDo2 로 매핑 중
		
		return "exam.student.examPaperDo";
	}
	/* 한결 10.12 지난 시험보기 및 시험응시 페이지 로드 끝 */


	/*%%%%%%%%%%%%%%%%%%%%%     재훈 학생 성적관리 backend 시작             %%%%%%%%%%%%%%%%%%%%%%*/
	/* 양회준 18.10.11 학생 성적관리 시작 */
	@RequestMapping("gradeManage.do")
	public String gradeManage(Model model, Principal principal, HttpServletRequest request) {
		String member_id = principal.getName();
		String class_num=null;
		String class_name;
		List<MemberDto> studentList = commonService.studentInfo(member_id, class_num);
		String student_id = principal.getName();
		try {
			class_name = studentList.get(0).getClass_name();
		}catch(Exception e) {
			class_name="임시";
		}
		//클래스 번호로 차트 가져오기
		Map<String, Object> chart = commonService.studentChartInfo(student_id, class_name);
		List<Score_chartDto> studentChart = (List<Score_chartDto>) chart.get("studentName");
		List<Class_chartDto> classChart = (List<Class_chartDto>) chart.get("className");
		model.addAttribute("studentList",studentList);
		model.addAttribute("classChart",classChart);
		model.addAttribute("studentChart",studentChart);
		model.addAttribute("studentId", student_id);
		
		//학생 개인 성적확인
		List<StudentExamScoreInfo> studentExamScoreInfo = commonService.studentExamScoreInfo(student_id, class_name);
		model.addAttribute("studentExamScoreInfo",studentExamScoreInfo);
		
		return "student.gradeManage";
	}
	
		// 학생 & 성적관리 - 개별차트부르기
		@RequestMapping(value="studentChartInfo.do", method=RequestMethod.POST)
		public @ResponseBody Map<String, Object> studentChartInfo(@RequestParam("member_id") String member_id,
			@RequestParam("class_name") String class_name){
		//양회준 10-24
		Map<String, Object> chart = commonService.studentChartInfo(member_id, class_name);
		List<Class_chartDto> studentChart = (List<Class_chartDto>) chart.get("className");
		for(Class_chartDto data : studentChart) {
			System.out.println("과연"+data.getExam_info_name());
		}
		return chart;
		}
	
	/* 영준 10.25 반 등수 시작 */
	@RequestMapping(value="myRank.do", method=RequestMethod.POST)
	public @ResponseBody List<Score_chartDto> myRank(@RequestParam("member_id") String member_id, 
			@RequestParam("exam_info_num") String exam_info_num) {
		System.out.println("학생컨트롤러 진입 : " + member_id + exam_info_num);		
		List<Score_chartDto> myRank = studentService.myRank(member_id, exam_info_num);
		System.out.println("과연 반 등수는? : " + myRank);
		return myRank;
	}
	/* 영준 10.26 반 등수 끝 */
	
		//학생 성적관리 학생개인 성적확인
		@RequestMapping(value="studentExamScoreInfo.do", method=RequestMethod.POST)
		public @ResponseBody List<StudentExamScoreInfo> studentExamScoreInfo(@RequestParam("member_id") String member_id,
				@RequestParam("class_name") String class_name){
			//양회준 10-24
			List<StudentExamScoreInfo> result = commonService.studentExamScoreInfo(member_id, class_name);
			return result;
		}
	
	/* 양회준 18.10.11 학생 성적관리 끝 */
	/*%%%%%%%%%%%%%%%%%%%%%     재훈 학생 성적관리 backend 끝             %%%%%%%%%%%%%%%%%%%%%%*/
	
	

	/* 현이 18.10.09 학생 마이페이지 시작 */
	@RequestMapping(value = "myPage.do", method = RequestMethod.GET)
	public String myPageInfo(Model model, Principal principal) throws ClassNotFoundException, SQLException {
		//회준 10.15
		String member_id = principal.getName();
		System.out.println("아이디 : " +member_id);
		MemberDto memberDto = commonService.myPageInfo(member_id);
		model.addAttribute("memberDto", memberDto);
		
		return "common.student.common.myPage";
	}
	/* 현이 18.10.09 학생 마이페이지 끝 */
	
	@RequestMapping(value = "myPage.do", method = RequestMethod.POST)
	public String myPageUpdate(MemberDto memberDto)
			throws IOException, ClassNotFoundException, SQLException {
			commonService.myPageUpdate(memberDto);
		
		// 예외 발생에 상관없이 목록페이지 요청 처리
		return "common.student.common.myPage";
	}
	
	@RequestMapping("myMessage.do")
    public String myMessage(Model model, Principal principal) {
       String member_id = principal.getName();
       System.out.println("아이디:"+member_id);
          List<MemberDto> classMemberList = commonService.classMemeberList(member_id);
          List<MessageDto> receiveMessage = commonService.receiveMessage(member_id);
          List<MessageDto> sendMessage = commonService.sendMessage(member_id);
          model.addAttribute("classMemberList", classMemberList);
          model.addAttribute("receiveMessage", receiveMessage);
          model.addAttribute("sendMessage", sendMessage);
          model.addAttribute("member_id", member_id);
       return "common.teacher.common.myMessage";
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

	/* 현이 18.10.15 학생 시험응시 페이지 테스트 시작 */
	/* 양회준 18.10.19 학생 시험응시 페이지 테스트 시간제한 설정 */
	@RequestMapping("examPaperDo2.do")
	public String examPaperDo2(Model model, int exam_info_num) throws ClassNotFoundException, SQLException, IOException, ParseException {
		
		ExamInfoDto exam_info = commonService.examScheduleDetail(exam_info_num);
		String url = null;
		//현재 날짜 및 시간 추출
		java.util.Date today = new java.util.Date();	        
	    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss");
	    String nowdate = date.format(today);
	    String nowTime = time.format(today);
	    //시험일, 시험시작시간, 시험종료시간 선언 및 초기화
		String exam_info_date = exam_info.getExam_info_date();
		String exam_info_start=exam_info.getExam_info_start();		
		String exam_info_end =exam_info.getExam_info_end();		
		
		//시험시작시각-현시각, 시험종료시각-현시각 정수로 변환
		java.util.Date eis = time.parse(exam_info_start);
		java.util.Date eie = time.parse(exam_info_end);
		java.util.Date nowdt = time.parse(nowTime);
				
		long examIn = eis.getTime()-nowdt.getTime();
		long examOut = eie.getTime()-nowdt.getTime();
		
		//시험일 비교		
		if(nowdate.equals(exam_info_date)) {
			System.out.println("현재 날짜와 시험 날짜가 동일합니다.");
			//시험시간 확인
			if(examIn<0 & 0<examOut) {
				System.out.println("시험시간 중입니다.");
				model.addAttribute("exam_info", exam_info);
				
				// 현이 10.17 추가
				// 문제, 문제보기 리스트 뽑아옴
				List<ExamPaperDoQuestionDto> questionList = commonService.examPaperDoQuestion(exam_info_num);
				List<Question_choiceDto> questionChoiceList = commonService.examPaperDoQuestion_choice(exam_info_num);
				int questionCount = commonService.questionCount(exam_info_num);
				
				model.addAttribute("questionList", questionList);
				model.addAttribute("questionChoiceList", questionChoiceList);
				model.addAttribute("questionCount", questionCount);
				
				url = "exam.student.examPaperDo2";
			}else {
				System.out.println("시험시간이 끝났습니다.");
				url = "exam.error.error403";
			}
		}else {
			System.out.println("시험시간이 아닙니다.");
			url = "exam.error.error403";
		}		
		
		return url;
	}
	
	// examPaperDo 페이지, 문제 ajax로 페이징 처리
	@RequestMapping("examPaperDoQuestion.do")
	public ModelAndView examPaperDoQuestion(Model model, int exam_info_num, int begin, int rowPerPage) throws ClassNotFoundException, SQLException, IOException, ParseException {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ajax.student.examPaperDo_ajax");
		
		int begin2 = begin - 1;
		
		List<ExamPaperDoQuestionDto> questionList = studentService.examPaperDoQuestion(exam_info_num, begin2, rowPerPage);	
		List<Question_choiceDto> questionChoiceList = studentService.examPaperDoQuestion_choice(exam_info_num);
		
		mav.addObject("questionList", questionList);
		mav.addObject("questionChoiceList", questionChoiceList);
		
		return mav;
	}
	/* 현이 18.10.15 학생 시험응시 페이지 끝 */
	/* 양회준 18.10.19 학생 시험응시 페이지 테스트 시간제한 끝 */
	
	
	/* 현이 18.10.19 학생 답안지 insert 시작 */
	@RequestMapping(value="examPaperDo2.do", method=RequestMethod.POST)
	public String examAnswerInsert(Student_answerDtoList answerList) throws ClassNotFoundException, SQLException, IOException {
		
		//List<Student_answerDto> items = answerList.getStudent_answer();		
		int result = studentService.examAnswerInsert(answerList);
		
		return "redirect:pastExam.do";
		
	}
	/* 현이 18.10.19 학생 답안지 insert 끝 */

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
		return "redirect:studentMain.do";
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
	
/*10.29 학생이 쪽지 보내기 */
		@RequestMapping(value="sendTeacherMessage.do", method=RequestMethod.POST)
		public @ResponseBody int sendTeacherMessage(Principal principal,String teacher_id,String message_content)  {
			
			  String send_member_id = principal.getName();	
			  System.out.println("send_member_id:"+send_member_id+"teacher_id:"+teacher_id+"message_content:"+message_content);
			int result = studentService.sendTeacherMessage(teacher_id,message_content,send_member_id);
			if(result > 0) {
				System.out.println("쪽지 보내기 성공!");
			}
			else {
				System.out.println("쪽지 보내기 실패~!");
			}
			
			return result;
		}
		
		// 10.24 현이 ajax로 시험지의 문제들 불러오기 
		   @RequestMapping("pastExamPaperView.do")
		   public @ResponseBody ModelAndView pastExamPaperView(int exam_info_num, @RequestParam("student_answer_status") String student_answer_status, @RequestParam("question_answerSheet") String question_answerSheet, 
		         int begin, int rowPerPage, Principal principal) throws ClassNotFoundException, SQLException, IOException {
		      
		      //System.out.println("student_answer_status : " + student_answer_status);
		      //System.out.println("question_answerSheet : " + question_answerSheet);
		      
		      ModelAndView mav = new ModelAndView();
		      
		      List<ExamPaperDoQuestionDto> questionList = null;
		      List<Question_choiceDto> questionChoiceList = null;
		      
		      int begin2 = begin - 1;
		      
		      if(question_answerSheet.equals("question")) {      //   문제 리턴(페이징 처리 필요) 
		         
		         mav.setViewName("ajax.student.pastExamPaper_ajax");
		         if(student_answer_status.equals("all")) {
		            questionList = studentService.examPaperDoQuestion(exam_info_num, begin2, rowPerPage);   
		            questionChoiceList = studentService.examPaperDoQuestion_choice(exam_info_num);
		         } else if (student_answer_status.equals("wrong")){
		            questionList = studentService.examPaperDoWrongQuestion(principal.getName(), exam_info_num, begin2, rowPerPage);
		            questionChoiceList = studentService.examPaperDoWrongQuestion_choice(exam_info_num);
		         }
		         
		      } else if (question_answerSheet.equals("answerSheet")) {   //   답안지 리턴(페이징 필요 없음, 전체 보여주기) 
		         
		         mav.setViewName("ajax.student.pastExamPaperAnswer_ajax");
		         if(student_answer_status.equals("all")) {
		            questionList = studentService.examPaperDoQuestion(exam_info_num, 0, 0);   //   begin, rowPerPage0 추가했음
		            questionChoiceList = studentService.examPaperDoQuestion_choice(exam_info_num);
		         } else if (student_answer_status.equals("wrong")){
		            questionList = studentService.examPaperDoWrongQuestion(principal.getName(), exam_info_num, 0, 0);
		            questionChoiceList = studentService.examPaperDoWrongQuestion_choice(exam_info_num);
		         }
		         
		      }
		            
		      mav.addObject("questionList", questionList);
		      mav.addObject("questionChoiceList", questionChoiceList);
		            
		      return mav;
		   }

		
		
}
