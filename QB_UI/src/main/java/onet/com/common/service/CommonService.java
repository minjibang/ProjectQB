package onet.com.common.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.common.dao.CommonDao;
import onet.com.vo.CommentDto;
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
	
	/*재훈 - 문제관리 관련 10.21 시작 */
	
	public int singleQuestionDelete(int question_num) {
		System.out.println("서비스 진입>>>>>> question_num: " + question_num);
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		QuestionDto qdto = new QuestionDto();
		Question_choiceDto cdto = new Question_choiceDto();
		ExamQuestionDto edto = new ExamQuestionDto();
		int result = 0;
		
		List<ExamQuestionDto> qSearch = dao.singleQuestionDeleteSearch(question_num);
		if(qSearch.isEmpty()) {
			System.out.println("qSearch결과 문제를 사용한 시험지 데이터가 없음 >>>> " + question_num);
			cdto.setQuestion_num(question_num);
			System.out.println("cdto에 세팅된 question_num값:" + cdto.getQuestion_num());
			qdto.setQuestion_num(question_num);
			System.out.println("qdto에 세팅된 question_num값:" + qdto.getQuestion_num());
			dao.singleQuestionChoiceDelete(cdto);
			result = dao.singleQuestionDelete(qdto);
			System.out.println("singleQuestionDelete함수 실행 결과>>>" + result);
			return result;
		}else {
			System.out.println("qSearch결과 문제를 사용한 시험지 데이터 존재 >>>> question_num: " + question_num);
			System.out.println("result 값은 0 이어야함 >>>" + result);
			return result;
		}
	}
	

	

	public int insertBoardList(NoticeDto dto) {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		String notice_num = dao.noticeNumFind(dto);
		System.out.println(notice_num);
		if(notice_num != null) {
			int notice_number = Integer.parseInt(notice_num);
			dto.setNotice_num(notice_number+1);
			int result = dao.insertBoardList(dto);
			return result;
		}else {
			dto.setNotice_num(1);
			int result = dao.insertBoardList(dto);
			return result;
		}
			
		
	}
	
	public List<NoticeDto> noticeDetail(String class_name, int notice_num){
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		NoticeDto dto = new NoticeDto();
		dto.setClass_name(class_name);
		dto.setNotice_num(notice_num);
		List<NoticeDto> result = dao.noticeDetail(dto);
		return result;
	}

	public int singleUpdateCheck(int question_num) {
		System.out.println("문제수정체크 서비스 진입>>>>>> question_num: " + question_num);
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		ExamQuestionDto edto = new ExamQuestionDto();
		int result = 0;
		
		List<ExamQuestionDto> qSearch = dao.singleQuestionDeleteSearch(question_num);
		if(qSearch.isEmpty()) {
			System.out.println("qSearch결과 문제를 사용한 시험지 데이터가 없음 >>>> " + question_num);
			result = 1;
			System.out.println("result 값은 1 이어야함 >>>" + result);
			return result;
		}else {
			System.out.println("qSearch결과 문제를 사용한 시험지 데이터 존재 >>>> question_num: " + question_num);
			System.out.println("result 값은 0 이어야함 >>>" + result);
			return result;
		}
	}
	
	//문제정보 가져오기
	public List<QuestionDto> questionInfo(int question_num) {
		System.out.println("문제정보 가져오기 서비스 진입 >>> question_num: " + question_num);
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		QuestionDto qdto = new QuestionDto();
		qdto.setQuestion_num(question_num);
		List<QuestionDto> result = commonDao.questionInfo(qdto);
		
		return result;
	}	
	//문제보기 가져오기
	public List<Question_choiceDto> questionChoiceInfo(int question_num) {
		System.out.println("문제보기 정보 가져오기 서비스 진입 >>> question_num: " + question_num);
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		Question_choiceDto cdto = new Question_choiceDto();
		cdto.setQuestion_num(question_num);
		List<Question_choiceDto> result = commonDao.questionChoiceInfo(cdto);
		
		return result;
	}	
	
	//문제 수정
/*	public String myPageUpdate(MemberDto memberDto)
			throws ClassNotFoundException, SQLException, IOException {
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		commonDao.myPageUpdate(memberDto);
		System.out.println("test");
		return "redirect:myPage.do";
	}*/
	
	public List<MemberDto> boardNull(String member_id){
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		List<MemberDto> boardNull = commonDao.noticeNullCheck(member_id);
		return boardNull;
	}
	
	public List<CommentDto> comment(String class_name, int notice_num){
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		CommentDto dto = new CommentDto();
		dto.setClass_name(class_name);
		dto.setNotice_num(notice_num);
		List<CommentDto> comment = commonDao.comment(dto);
		return comment;
	}
	
	public List<CommentDto> commentGroup(String class_name, int notice_num){
		CommonDao commonDao = sqlsession.getMapper(CommonDao.class);
		CommentDto dto = new CommentDto();
		dto.setClass_name(class_name);
		dto.setNotice_num(notice_num);
		List<CommentDto> commentGroup = commonDao.commentGroup(dto);
		return commentGroup;
	}
	
	
}




