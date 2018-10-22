package onet.com.student.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import onet.com.common.service.CommonService;
import onet.com.student.service.StudentService;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDoQuestionDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.NoticeDto;
import onet.com.vo.Question_choiceDto;
import onet.com.vo.Student_answerDto;
import onet.com.vo.Student_answerDtoList;

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
	      List<NoticeDto> notice = commonService.teacher_student_Main(member_id);
	      model.addAttribute("notice", notice);
	      List<Exam_infoDto> exam_info = commonService.exam_info(member_id);
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
	public String myMessage() {

		return "common.admin.common.myPage";
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
	/* 현이 18.10.15 학생 시험응시 페이지 끝 */
	/* 양회준 18.10.19 학생 시험응시 페이지 테스트 시간제한 끝 */
	
	
	/* 현이 18.10.19 학생 답안지 insert 시작 */
	@RequestMapping(value="examPaperDo2.do", method=RequestMethod.POST)
	public String examAnswerInsert(Student_answerDtoList answerList) throws ClassNotFoundException, SQLException, IOException {
		
		//System.out.println("controller에 들어옴");
		
		List<Student_answerDto> items = answerList.getStudent_answer();	
		for(Student_answerDto item : items) {
			//System.out.println(item.getExam_question_seq() + " : " +  item.getStudent_answer_choice());
		}
		
		int result = studentService.examAnswerInsert(answerList);
		
		return "student.pastExam";
		
	}
	/* 현이 18.10.19 학생 답안지 insert 끝 */


}
