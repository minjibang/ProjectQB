package onet.com.common.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.common.dao.CommonDao;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDoDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.NoticeDto;

@Service
public class CommonService {
	
	@Autowired
	private SqlSession sqlsession;
	/*한결 - 10.10 강사 메인페이지 백그라운드 시작*/
	public List<NoticeDto> teacher_student_Main(String member_id) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		NoticeDto dto = new NoticeDto();
		List<NoticeDto> result = dao.notice(member_id);
		return result;
	}
	
	public List<Exam_infoDto> exam_info(String member_id) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);		
		Exam_infoDto dto = new Exam_infoDto();		
		List<Exam_infoDto> result = dao.exam_info(member_id);
		return result;
	}
	/*한결 - 10.10 강사 메인페이지 백그라운드  끝*/
	
	/*현이 - 10.15 examScheduleDetail 시작*/
	public ExamInfoDto examScheduleDetail(int exam_info_num) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		ExamInfoDto result = dao.examScheduleDetail(exam_info_num);
		return result;
	}
	/*현이 - 10.15 examScheduleDetail 끝*/
	
	

	
	

	/*양회준 - 10.15 내정보 시작 */
	//내정보 보기
	public MemberDto myPageInfo(String member_id) {
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		MemberDto memberDto = commonDao.myPageInfo(member_id);
		return memberDto;
	}	
	//내정보 수정
	public String myPageUpdate(MemberDto memberDto)
			throws ClassNotFoundException, SQLException, IOException {
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		commonDao.myPageUpdate(memberDto);
		System.out.println("test");
		return "redirect:myPage.do";
	}
	//내정보 탈퇴
	public String myPageDrop(MemberDto memberDto)
			throws ClassNotFoundException, SQLException, IOException {
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		commonDao.myPageDrop(memberDto);
		System.out.println("droptest");
		return "redirect:myPage.do";
	}
	/*양회준 - 10.15 내정보 끝 */

	public int memberDrop(String member_id, String member_pwd)
			throws ClassNotFoundException, SQLException, IOException {
		System.out.println("droptestAjax");
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		int result = commonDao.memberDrop(member_id, member_pwd);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	/*현이 - ExamPaperDo 10.17 시작 */ 
	public List<ExamPaperDoDto> searchExamPaperDo(int exam_info_num) throws ClassNotFoundException, SQLException, IOException {
		
		//System.out.println("searchExamPaperDo service에 들어옴");
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		List<ExamPaperDoDto> examPaperDoDto = commonDao.searchExamPaperDo(exam_info_num);
		//System.out.println("서비스에서 list의 사이즈 : "+examPaperDoDto.size());
		
		return examPaperDoDto;
	}
	/*현이 - ExamPaperDo 10.17 끝 */ 
	
}




