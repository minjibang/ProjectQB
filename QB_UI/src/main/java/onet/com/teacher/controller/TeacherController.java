package onet.com.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import onet.com.teacher.service.TeacherService;
import onet.com.vo.NoticeDto;

@Controller
@RequestMapping("/teacher/")
public class TeacherController {
	
	@Autowired
	TeacherService teacherService;
	
	@RequestMapping("teacherNoticeWrite.do")
	public String teacherNoticeWrite() {

		return "teacher.teacherNoticeWrite";
	}

	/*한결 10.09 공지사항 데이터값 뿌리기*/
	/* 민지:10.08 강사 메인추가 */
	@RequestMapping("teacherMain.do")
	public String teacherMain(Model model) {
		List<NoticeDto> list;
		return "teacher.teacherMain";
	}
	/*한결 끝*/

	@RequestMapping("teacherMyPage.do")
	public String teacherMypage() {
	
	return "teacher.teacherMyPage";
	}
	
	
	/*재훈:10.08 게시판 글 상세보기 페이지 시작*/
	@RequestMapping("noticeView.do")
	public String noticeView() {

		return "common.noticeView";
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
}