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
	
	
	@RequestMapping("index.do")
	   public String login() {
	     
	      return "join.login";
	   }
	
	@RequestMapping("adminCategory.do")
	   public String adminCategory() {
	     
	      return "admin.adminCategory";
	   }
	

	//10.05 ¹ÎÁö Ãß°¡
	@RequestMapping("adminClassInfo.do")
	   public String adminClassInfo() {
	     
	      return "admin.adminClassInfo";
	   }
	//¹ÎÁö Ãß°¡ ³¡
	
}
