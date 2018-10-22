package onet.com.common.controller;

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
import onet.com.teacher.service.TeacherService;
import onet.com.vo.ExamPaperDto;

@Controller
@RequestMapping("/common/")

public class CommonController {	
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private CommonService commonService;
	
	@Autowired
	private TeacherService teacherService;
	
	/* 재훈 10.20 문제삭제 관련 start */
	@RequestMapping("singleQuestionDelete.do")
	public @ResponseBody Map<String,Object> singleQuestionDelete(int question_num){
		System.out.println("컨트롤러 진입>>>>> question_num: " + question_num);
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
	
}
