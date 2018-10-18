package onet.com.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import onet.com.teacher.service.TeacherService;
import onet.com.vo.ExamQuestionDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;

@Controller
@RequestMapping("/teacher/")
public class TestManageController {

	@Autowired
	private TeacherService teacherService;

	/*성태용 시작*/
	@RequestMapping(value="classListView.do")
	public @ResponseBody ModelAndView classListView(Model model) {
		List<QuestionDto> question = teacherService.question();
		model.addAttribute("question", question);
		List<Question_choiceDto> question_choice = teacherService.question_choice();
		model.addAttribute("question_choice", question_choice);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ajax.common.examPaperMake_ajax");
		mv.addObject("question", question);
		mv.addObject("question_choice",question_choice);
		
		return mv;
	}
	
	@RequestMapping(value="questionSearch.do")
	public @ResponseBody ModelAndView questionSearch(@RequestParam("lgsearchtype") String lgsearchtype, 
			@RequestParam("mdsearchtype") String mdsearchtype, @RequestParam("smsearchtype") String smsearchtype,
			@RequestParam("leveltype") String leveltype, @RequestParam("questiontype") String questiontype, Model model) {
		

		List<QuestionDto> question = teacherService.questionSearch(lgsearchtype,mdsearchtype,smsearchtype,leveltype,questiontype);
		model.addAttribute("question", question);
		List<Question_choiceDto> question_choice = teacherService.question_choice();
		model.addAttribute("question_choice", question_choice);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ajax.common.examPaperMake_ajax");
		mv.addObject("question", question);
		mv.addObject("question_choice",question_choice);
		
		return mv;
	}
	/*성태용 끝*/
	
	/*한결 시작*/
	@RequestMapping("checkExam_paper.do")
	public @ResponseBody String checkExam_paper(@RequestParam("exam_paper_name") String exam_paper_name) {	
		String result = teacherService.examPaperCheck(exam_paper_name);
		System.out.println(exam_paper_name);
		return result;
	}	
	
	/* 10.17 시험지 테이블 insert and update*/

	@RequestMapping("examPaperInsert.do")
	public @ResponseBody int examPaperInsert(@RequestParam("exam_paper_name") String exam_paper_name,
			@RequestParam("member_id") String member_id,@RequestParam("exam_paper_desc") String exam_paper_desc) {
		System.out.println(exam_paper_name +"//"+ member_id +"\\"+ exam_paper_desc);
		int result = teacherService.examPaperInsert(exam_paper_name,member_id,exam_paper_desc);
		return result;
	}
	
	@RequestMapping("examPaperUpdate.do")
	public @ResponseBody int examPaperUpdate(@RequestParam("exam_paper_name") String exam_paper_name,
			@RequestParam("member_id") String member_id,@RequestParam("exam_paper_desc") String exam_paper_desc,
			@RequestParam("exam_paper_num") String exam_paper_num) {
		int result = teacherService.examPaperUpdate(exam_paper_name,member_id,exam_paper_desc,exam_paper_num);
		return result;
	}
	
	/*10.18 시험지 문제 테이블 select insert update delete*/
	@RequestMapping("examQuestionSelect.do")
	public @ResponseBody int examQuestionSelect(@RequestParam("exam_paper_num") String exam_paper_num,
			@RequestParam("question_num") String question_num) {
		int result = teacherService.examQuestionSelect(exam_paper_num, question_num);
		return result;
	}
	@RequestMapping("examQuestionInsert.do")
	public @ResponseBody int examQuestionInsert(@RequestParam("exam_paper_num") String exam_paper_num, 
			@RequestParam("question_num") String question_num, @RequestParam("exam_question_seq")String exam_question_seq, 
			@RequestParam("exam_question_score") String exam_question_score) {
		System.out.println(exam_paper_num + question_num+ exam_question_seq+ exam_question_score);
		int result = teacherService.examQuestionInsert(exam_paper_num,question_num, exam_question_seq, exam_question_score);
		return result;
	}
	@RequestMapping("examQuestionUpdate.do")
	public @ResponseBody int examQuestionUpdate(@RequestParam("exam_paper_num") String exam_paper_num, 
			@RequestParam("question_num") String question_num, @RequestParam("exam_question_seq")String exam_question_seq, 
			@RequestParam("exam_question_score") String exam_question_score) {
		int result = teacherService.examPaperUpdate(exam_paper_num,question_num, exam_question_seq, exam_question_score);
		return result;
	}
	@RequestMapping("examQuestionDelete.do")
	public @ResponseBody int examQuestionDelte(@RequestParam("exam_paper_num") String exam_paper_num) {
		int result = teacherService.examQuestionDelete(exam_paper_num);
		return result;
	}
	
	/*한결 끝*/
}