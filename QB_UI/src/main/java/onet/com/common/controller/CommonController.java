package onet.com.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common/")
public class CommonController {

	@RequestMapping("examDetailView.do")
	public String examDetailView() {
		System.out.println("Common controller를 탄다");
		return "common.examDetailView";
	}

}
