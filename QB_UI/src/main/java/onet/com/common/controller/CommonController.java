package onet.com.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common/")
public class CommonController {

	@RequestMapping("mypage.do")
	public String mypage() {
		// 파라미터로 권한을 받아서 3번째로 리턴을 해서 tiles.xml에서 받음 
		// 권한을 받을 수 있을까? --> 로그인 시 세션에 권한을 저장하면 된다 
		return "common.myPage";
	}
	
	@RequestMapping("noticeView.do")
	public String noticeView() {

		return "common.noticeView";
	}
	
}
