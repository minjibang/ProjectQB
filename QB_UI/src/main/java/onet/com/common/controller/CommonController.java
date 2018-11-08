package onet.com.common.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import onet.com.admin.service.AdminService;
import onet.com.common.service.CommonService;
import onet.com.teacher.service.TeacherService;
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
	
	@RequestMapping("apiInfo.do")
	public String apiInfo(Principal principal, Model model) {
		String member_id = principal.getName();
		System.out.println(member_id + " > > ㅇ");
		BufferedReader br;
		try {
			String urlstr = "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getEList?serviceKey=YUdXCAiwaMvkv1DqJCw9aO5Zg9YoqRqY4DpL93w7pdgUSS8sE%2Fq6UVEISQdEQEsS7QrToM9y2s3y5mVVaivCHA%3D%3D&_type=json";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection =(HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			String result = "";
			String line;
			while((line = br.readLine()) != null) {
				result = result + line +"\n";
			}
			System.out.println(result);
			model.addAttribute("result",result);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "common.admin.common.apiInfo";
	}
}
