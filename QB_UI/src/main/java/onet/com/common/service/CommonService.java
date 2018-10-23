package onet.com.common.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.common.dao.CommonDao;
import onet.com.vo.CategoryDto;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDoQuestionDto;
import onet.com.vo.ExamQuestionDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.NoticeDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;

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
	/*민지 - 10.10 관리자 메인페이지 백그라운드 시작*/
	public List<NoticeDto> admin_Main(String class_name) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		NoticeDto dto = new NoticeDto();
		dto.setClass_name(class_name);
		List<NoticeDto> result = dao.adminnotice(dto);
		return result;
	}
	
	public List<ExamInfoDto> admin_exam_info(String class_name) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);		
		ExamInfoDto dto = new ExamInfoDto();		
		dto.setClass_name(class_name);
		List<ExamInfoDto> result = dao.adminexam_info(dto);
		return result;
	}
	/*민지 - 10.10 관리자 메인페이지 백그라운드 끝*/
	
	
	
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
	
	
	/*현이 - ExamPaperDo 10.18 시작 */ 
	public List<ExamPaperDoQuestionDto> examPaperDoQuestion(int exam_info_num) throws ClassNotFoundException, SQLException, IOException {
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		List<ExamPaperDoQuestionDto> questionList = commonDao.examPaperDoQuestion(exam_info_num);
		return questionList;
	}
	
	public List<Question_choiceDto> examPaperDoQuestion_choice(int exam_info_num) throws ClassNotFoundException, SQLException, IOException {
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		List<Question_choiceDto> questionChoiceList = commonDao.examPaperDoQuestion_choice(exam_info_num);
		return questionChoiceList;
	}
	
	public int questionCount(int exam_info_num) throws ClassNotFoundException, SQLException, IOException {
		
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		int questionCount = commonDao.questionCount(exam_info_num);
		return questionCount;
	}
	/*현이 - ExamPaperDo 10.18 끝 */ 
	
/*######################      재훈 시작             ######################*/

//문제관리 - 문제삭제 전 삭제가능여부 판단
	public int singleQuestionDelete(int question_num) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		QuestionDto qdto = new QuestionDto();
		Question_choiceDto cdto = new Question_choiceDto();
		int result = 0;
		
		List<ExamQuestionDto> qSearch = dao.singleQuestionDeleteSearch(question_num);
		if(qSearch.isEmpty()) {
			
			cdto.setQuestion_num(question_num);
			qdto.setQuestion_num(question_num);
			dao.singleQuestionChoiceDelete(cdto);
			result = dao.singleQuestionDelete(qdto);
			return result;
		}else {
			return result;
		}
	}
//문제관리 - 문제 수정 전 수정가능여부 판단
	public int singleUpdateCheck(int question_num) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		int result = 0;
		
		List<ExamQuestionDto> qSearch = dao.singleQuestionDeleteSearch(question_num);
		if(qSearch.isEmpty()) {
			result = 1;
			return result;
		}else {
			return result;
		}
	}
//문제 수정 페이지 - 문제 정보 가져오기
	public List<QuestionDto> questionInfo(int question_num) {
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		QuestionDto qdto = new QuestionDto();
		qdto.setQuestion_num(question_num);
		List<QuestionDto> result = commonDao.questionInfo(qdto);
			
		return result;
	}	
//문제 수정 페이지 - 문제 보기정보 가져오기
	public List<Question_choiceDto> questionChoiceInfo(int question_num) {
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		Question_choiceDto cdto = new Question_choiceDto();
		cdto.setQuestion_num(question_num);
		List<Question_choiceDto> result = commonDao.questionChoiceInfo(cdto);
			
		return result;
	}	
//문제 수정 페이지 - 문제카테고리 가져오기
	public List<CategoryDto> questionCategoryInfo(int question_num) {
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		List<CategoryDto> result = commonDao.questionCategoryInfo(question_num);
			
		return result;
	}
	
/*######################      재훈 끝             ######################*/
	

	public int insertBoardList(NoticeDto dto) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		int notice_num = dao.noticeNumFind(dto);
		System.out.println(notice_num);
		dto.setNotice_num(notice_num+1);
		int result = dao.insertBoardList(dto);
		return result;
	}
	
	public List<NoticeDto> noticeDetail(String class_name, int notice_num){
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		NoticeDto dto = new NoticeDto();
		dto.setClass_name(class_name);
		dto.setNotice_num(notice_num);
		List<NoticeDto> result = dao.noticeDetail(dto);
		return result;
	}

	
}




