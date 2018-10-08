package onet.com.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index/")
public class IndexController {

	@RequestMapping("memberjoin.do")
	public String memberjoin() {

		return "home.memberJoin";
	}

	@RequestMapping("idSearch.do")
	public String idSearch() {

		return "home.findId";
	}

	@RequestMapping("pwdSearch.do")
	public String pwdSearch() {

		return "home.findPw";
	}
}
