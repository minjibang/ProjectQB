package onet.com.common.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.admin.dao.AdminDao;
import onet.com.common.dao.CommonDao;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.NoticeDto;

@Service
public class CommonService {
	
	@Autowired
	private SqlSession sqlsession;
	/*한결 - 10.10 강사 메인페이지 백그라운드 시작*/
	public List<NoticeDto> teacher_student_Main(int class_num) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		NoticeDto dto = new NoticeDto();
		dto.setClass_num(class_num);
		List<NoticeDto> result = dao.notice(dto);
		return result;
	}
	
	public List<Exam_infoDto> exam_info(int class_num) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		
		Exam_infoDto dto = new Exam_infoDto();
		dto.setClass_num(class_num);
		
		List<Exam_infoDto> result = dao.exam_info(dto);
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
	


	/* 영준 - 10.15 강사 시험관지 페이지 시작 */
	public List<ExamPaperDto> examPaperList(){
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		List<ExamPaperDto> result = dao.examPaperList();
		return result;	
	}
	
	public int examPaperDelete(ExamPaperDto dto) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		int result = dao.examPaperDelete(dto);
		return result;
	}
	/* 영준 - 10.15 강사 시험관지 페이지 끝 */
}
