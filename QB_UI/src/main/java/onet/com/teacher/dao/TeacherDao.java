package onet.com.teacher.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import onet.com.vo.ClassDto;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamMemberDto;
import onet.com.vo.ExamPaperDto;
import onet.com.vo.ExamQuestionListDto;
import onet.com.vo.MemberDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;
import onet.com.vo.Question_levelDto;

public interface TeacherDao {
	/*한결*/
	/*강사 - 새 시험지 만들기 - 문제 리스트 불러오기 시작*/
	public List<QuestionDto> question();
	public List<Question_choiceDto> question_choice();
	public List<Question_levelDto> question_level();
	/*10.18 시험지 테이블*/
	public int examPaperInsert(ExamPaperDto dto);
	public int examPaperUpdate(int exam_paper_num,String exam_paper_name,String member_id,String exam_paper_desc,String exam_paper_status); 
	/*10.18 시험지 문제 테이블*/
	public int examQuestionInsert(int exam_paper_num, String question_num, String exam_question_seq, String exam_question_score);
	public int examQuestionDelete(String exam_paper_num);

	/*한결 끝*/

	/*재훈 10.19:강사 - 내 문제함 */
	
	public List<QuestionDto> teacherMyQuestion(String member_id);
	public List<QuestionDto> teacherMyQuestionSearch(String lgsearchtype, String mdsearchtype, String smsearchtype, String leveltype, String questiontype, String keyword, String member_id);
	/*재훈 10.19:강사 - 내 문제함 끝 */
	
	/* 영준 - 10.16 시험관리 관련 시작 */
	public List<ExamPaperDto> examPaperList(int class_num);
	/* 영준 - 10.16 시험관리 관련 끝 */
	
	/*민지 - 10.18 시험등록*/
	public int examInfoInsert(ExamInfoDto dto);
	public List<MemberDto> classMemberList(int exam_paper_num);
	public List<MemberDto> classMemberListUpdate(int exam_info_num);
	public ClassDto classInfo(int exam_paper_num);
	
	public int examMemberInsert(ExamMemberDto dto);
	
	/*민지 - 10.18 시험등록 끝*/


	/*--성태용 시작--*/
	public List<QuestionDto> questionSearch(String lgsearchtype, String mdsearchtype, String smsearchtype, String leveltype, String questiontype, String keyword);
	public List<ExamPaperDto> myExamPaperList(String member_id);
	public List<ExamPaperDto> myTempExamList(@Param("member_id") String member_id, @Param("begin") int begin);
	public List<ExamInfoDto> examScheduleList(String member_id);
	public List<ExamInfoDto> examScheduleList2(int exam_paper_num);
	public int deleteExam(int exam_paper_num);
	public int updateExam(int exam_paper_num);
	public int newExaminsert(ExamPaperDto dto);
	public int checkDate(int exam_paper_num);
	public int checkExamInfo(int exam_paper_num);
	public List<QuestionDto> updateExamView(int exam_paper_num);
	public int examquestionsdelete(int exam_paper_num);
	public int examNameUpdate(int exam_paper_num, String exam_name, String exam_desc);
	public int examquestionsinsert(int exam_paper_num,int question_num,int exam_question_seq,int exam_question_score);
	public ExamPaperDto examNameDesc(int exam_paper_num);
	public List<ExamQuestionListDto> examQuestionList(int exam_paper_num);
	public List<ExamInfoDto> examinfoSearch(@Param("searchType2") String searchType2, @Param("keyword") String keyword, @Param("begin") int begin, @Param("member_id") String member_id);
	
	/*--성태용 끝--*/
	
	/* 영준 - 10.18 시험일정 삭제 시작 */
	public int teacherExamSchedultDelete(ExamInfoDto dto);
	/* 영준 - 10.18 시험일정 삭제 끝 */
	
	/*민지 -10.22 시험일정  수정시작*/
	public List<ExamInfoDto>classExamList(ExamInfoDto dto);
	
	public int examInfoIUpdate(ExamInfoDto dto);
	
	public List<ExamMemberDto>classExamMemberList(ExamMemberDto dto);
	
	public int teacherExamMemberDelete(int exam_info_num);
	
	public List<MemberDto> examNotcheckMemberList(int exam_info_num);
	
	/*민지 - 10.22 시험일정 수정 끝*/
	
	/*민지 - 10.29 받은쪽지 */
	public CharSequence count_receive_note(String user_name);
	/*쪽지 보내기*/
	public String sendMessage(String user_name);
	
	/*민지 - 10.29 받은쪽지  끝*/
	
	public List<ExamPaperDto> exampaperSearch(@Param("searchType") String searchType, @Param("keyword") String keyword, @Param("begin") int begin, @Param("member_id") String member_id);
	
	
	
}
