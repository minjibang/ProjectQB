package kr.or.qb;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping("afterLogin_main.do")
	public String afterLogin_main() {

		return "common.teacherMain";
	}

	@RequestMapping("noAuth.do")
	public String noAuth() {

		return "noAuth.noAuth";
	}

}