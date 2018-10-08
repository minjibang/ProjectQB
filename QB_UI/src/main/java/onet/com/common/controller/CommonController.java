package onet.com.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common/")
public class CommonController {

	@RequestMapping("mypage.do")
	public String mypage() {

		return "common.myPage";
	}
}
