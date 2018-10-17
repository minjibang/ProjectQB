package onet.com.teacher.dao;

import java.util.List;

import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;

public interface TeacherDao {
	
	/*한결 : 강사 - 새 시험지 만들기 - 문제 리스트 불러오기 시작*/
	public List<QuestionDto> question();
	public List<Question_choiceDto> question_choice();
	/*한결 : 강사 - 새 시험지 만들기 - 문제 리스트 불러오기 끝*/
	

	/* 영준 - 10.16 시험관리 관련 시작 */
	public List<ExamPaperDto> examPaperList(ExamPaperDto dto);
	/* 영준 - 10.16 시험관리 관련 끝 */
	
	/* 영준 - 10.17 내 시험지 삭제 시작 */
	public int examPaperDelete(ExamPaperDto dto);
	/* 영준 - 10.17 내 시험지 삭제 끝 */
	
	/* 영준 - 10.16 시험일정 리스트 불러오기 시작 */
	public List<ExamInfoDto> examScheduleList();
	/* 영준 - 10.16 시험일정 리스트 불러오기 끝 */
	
	/*--성태용 시작--*/
	public List<QuestionDto> questionSearch(String lgsearchtype, String mdsearchtype, String smsearchtype, String leveltype, String questiontype);
	
	/*--성태용 끝--*/
}
