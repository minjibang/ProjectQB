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
	private TeacherService teacherService;
	
	@RequestMapping("teacherNoticeWrite.do")
	public String teacherNoticeWrite() {

		return "teacher.teacherNoticeWrite";
	}

	/* 민지:10.08 강사 메인추가 */
	@RequestMapping("teacherMain.do")
	public String teacherMain(Model model, NoticeDto dto) {
		List<NoticeDto> str = teacherService.teacherMain(dto);
		return "teacher.teacherMain";
	}

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
	
	/*회준:10.08 시험 일정등록/수정 페이지 시작 */
	@RequestMapping("teacherExamPaperUpdate.do")
	public String teacherExamPaperUpdate() {

		return "teacher.teacherExamPaperUpdate";
	}
	/*회준:10.08 시험 일정등록/수정 페이지 끝 */
}