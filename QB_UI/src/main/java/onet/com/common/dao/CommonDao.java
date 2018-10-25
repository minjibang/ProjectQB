package onet.com.common.dao;

import java.sql.SQLException;
import java.util.List;


import onet.com.vo.CommentDto;

import onet.com.vo.CategoryDto;

import onet.com.vo.Class_chartDto;

import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDoQuestionDto;
import onet.com.vo.ExamQuestionDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.NoticeDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;
import onet.com.vo.Score_chartDto;

public interface CommonDao {
	   /*한결 - 메인페이지 데이터 뿌리기 10.10*/
	   public List<NoticeDto> notice(String member_id);
	   public List<Exam_infoDto> exam_info(String member_id);
	   /* 끝 */
	
	/*민지 - 관리자메인페이지 데이터 뿌리기 10.19*/
	public List<NoticeDto> adminnotice(NoticeDto dto);
	public List<ExamInfoDto> adminexam_info(ExamInfoDto dto);
	/* 끝 */
	
	
	/*현이 - examInfoDetail 10.15 시작 */ 
	public ExamInfoDto examScheduleDetail(int exam_info_num);
	/*현이 - examInfoDetail 10.15 끝 */ 

	/*양회준 - 10.15 내 정보 수정 시작*/
	public MemberDto myPageInfo(String member_id);
	public int myPageUpdate(MemberDto memberDto)  throws ClassNotFoundException, SQLException;
	public int myPageDrop(MemberDto memberDto)  throws ClassNotFoundException, SQLException;
	
	public int memberDrop(String member_id, String member_pwd) throws ClassNotFoundException, SQLException;
	
	/*양회준 - 10.15 내 정보 수정 끝*/

	
	/*현이 - ExamPaperDo 10.18 시작 */ 
	public List<ExamPaperDoQuestionDto> examPaperDoQuestion(int exam_info_num) throws ClassNotFoundException, SQLException;
	public List<Question_choiceDto> examPaperDoQuestion_choice(int exam_info_num) throws ClassNotFoundException, SQLException;
	public int questionCount(int exam_info_num) throws ClassNotFoundException, SQLException;
	/*현이 - ExamPaperDo 10.18 끝 */
	

	/*############        재훈 시작             ###########*/
	public List<ExamQuestionDto> singleQuestionDeleteSearch(int question_num);
	public List<QuestionDto> questionInfo(QuestionDto qdto);
	public List<Question_choiceDto> questionChoiceInfo(Question_choiceDto qdto);
	public List<CategoryDto> questionCategoryInfo(int question_num);
	public int singleQuestionDelete(QuestionDto qdto);
	public int singleQuestionChoiceDelete(Question_choiceDto cdto);
	/*############         재훈 끝              ###########*/

	/* 정원 10.22*/
	public int insertBoardList(NoticeDto dto);
	
	public List<NoticeDto> noticeDetail(NoticeDto dto);
	

	public String noticeNumFind(NoticeDto dto);
	
	public List<MemberDto> noticeNullCheck(String member_id);
	
	public List<CommentDto> comment(CommentDto dto);
	
	public List<CommentDto> commentGroup(CommentDto dto);
	
	public int commentReply(CommentDto dto);
	
	public int commentInsert(CommentDto dto);
		
	
	//양회준 10-24 관리자, 강사-학생&성적관리 페이지
	public List<MemberDto> studentInfo(String member_id);
	public List<MemberDto> adminStudentInfo(String class_num);
	//양회준 10-24 관리자, 강사-학생&성적관리 페이지-학생정보 chart
	public List<Score_chartDto> studentChartInfo(String member_id);
	public List<Class_chartDto> classChartInfo(String class_name);

}
