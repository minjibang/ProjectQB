package onet.com.teacher.dao;

import java.util.List;

import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDto;
import onet.com.vo.ExamQuestionDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;
import onet.com.vo.Question_levelDto;

public interface TeacherDao {
	/*한결*/
	/*강사 - 새 시험지 만들기 - 문제 리스트 불러오기 시작*/
	public List<QuestionDto> question();
	public List<Question_choiceDto> question_choice();
	public List<Question_levelDto> question_level();
	
	/*10.17 시험지체크 시작*/
	public String examPaperCheck(String exam_paper_name);

	/*10.18 시험지 테이블*/
	public int examPaperInsert(String exam_paper_name,String member_id,String exam_paper_desc);
	public int examPaperUpdate(String exam_paper_name,String member_id,String exam_paper_desc,String exam_paper_num); 
	
	/*10.18 시험지 문제 테이블*/
	public int examQuestionSelect(String exam_paper_num, String question_num);
	public int examQuestionInsert(String exam_paper_num, String question_num, String exam_question_seq, String exam_question_score);
	public int examQuestionUpdate(String exam_paper_num, String question_num, String exam_question_seq, String exam_question_score);
	public int examQuestionDelete(String exam_paper_num);
	/*한결 끝*/

	/*재훈 10.19:강사 - 내 문제함 */
	
	public List<QuestionDto> teacherMyQuestion(String member_id);
	
	/*재훈 10.19:강사 - 내 문제함 끝 */
	
	/* 영준 - 10.16 시험관리 관련 시작 */
	public List<ExamPaperDto> examPaperList(ExamPaperDto dto);
	/* 영준 - 10.16 시험관리 관련 끝 */

	/* 영준 - 10.17 내 시험지 삭제 시작 */
	public int examPaperDelete(int exam_paper_num);
	/* 영준 - 10.17 내 시험지 삭제 끝 */
	
	/* 영준 - 10.16 시험일정 리스트 불러오기 시작 */
	public List<ExamInfoDto> examScheduleList(ExamInfoDto dto);
	/* 영준 - 10.16 시험일정 리스트 불러오기 끝 */

	
	/*민지 - 10.18 시험등록*/
	public int examInfoInsert(ExamInfoDto dto);
	/*민지 - 10.18 시험등록 끝*/


	/*--성태용 시작--*/
	public List<QuestionDto> questionSearch(String lgsearchtype, String mdsearchtype, String smsearchtype, String leveltype, String questiontype, String keyword);
	
	/*--성태용 끝--*/
	
	/* 영준 - 10.18 시험일정 삭제 시작 */
	public int examScheduleDelete(int exam_info_num);
	/* 영준 - 10.18 시험일정 삭제 끝 */

}
