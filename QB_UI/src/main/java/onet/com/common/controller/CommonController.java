package onet.com.common.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import onet.com.admin.service.AdminService;
import onet.com.common.service.CommonService;
import onet.com.teacher.service.TeacherService;
import onet.com.vo.ClassDto;
import onet.com.vo.MemberDto;

@Controller
@RequestMapping("/common/")

public class CommonController {	
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private CommonService commonService;
	
	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping("memberCheck.do")
	public @ResponseBody List<MemberDto> examScheduleRegist(Principal principal) {
		String member_id = principal.getName();
		List<MemberDto> list = commonService.member(member_id);

		
		return list;
	}
}
