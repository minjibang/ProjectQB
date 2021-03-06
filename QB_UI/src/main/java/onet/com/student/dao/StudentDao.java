package onet.com.student.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDoQuestionDto;
import onet.com.vo.MessageDto;
import onet.com.vo.Question_choiceDto;
import onet.com.vo.Score_chartDto;
import onet.com.vo.Student_answerDto;
import onet.com.vo.Student_answerQuesDto;

public interface StudentDao {
	
	/* 10.19 현이 학생 답안지 제출 시작 */ 
	// 학생 답안지 insert 
	public int examAnswerInsert(Student_answerDto answerDto);
	public String searchAnswer(int question_num);
	
	// 학생 성적 테이블 insert 
	public int score_chartInsert(String member_id, int exam_info_num);
	public List<Score_chartDto> selectRank(int exam_info_num);
	public int updateRank(List<Score_chartDto> chartList, int exam_info_num);
	
	// 문제 테이블 정답률 update 
	public List<Integer> selectQuestion(int exam_info_num);		
	public int updateCorrectRatio(int question_num);	
	
	// 클래스 성적 테이블 insert, update 
	// public int countClassChart(int exam_info_num);
	// public int class_chartInsert(String member_id, int exam_info_num);
	public int class_chartUpdate(String member_id, int exam_info_num);
	/* 10.19 현이 학생 답안지 제출 끝 */
	
	/* 10.23 현이 학생 지난 시험보기 시작 */
	public List<ExamInfoDto> searchPastExam(String member_id);
	public List<Score_chartDto> searchStudentName(String member_id);
	public List<ExamInfoDto> searchPastExamKeyword(String member_id, String keyword);
	/* 10.23 현이 학생 지난 시험보기 끝 */
	
	/*10.24 현이 학생 지난 시험지 보기 시작*/
	public List<ExamPaperDoQuestionDto> examPaperDoQuestion(@Param("exam_info_num") int exam_info_num, @Param("begin") int begin, @Param("rowPerPage") int rowPerPage) throws ClassNotFoundException, SQLException;
	public List<Question_choiceDto> examPaperDoQuestion_choice(int exam_info_num) throws ClassNotFoundException, SQLException;
	
	public List<Student_answerQuesDto> selectStudentAnswer(String member_id, int exam_info_num);
	public List<Student_answerQuesDto> selectStudentWrongAnswer(String member_id, int exam_info_num);
	public List<ExamPaperDoQuestionDto> examPaperDoWrongQuestion(@Param("member_id") String member_id, @Param("exam_info_num") int exam_info_num, @Param("begin") int begin, @Param("rowPerPage") int rowPerPage);
	public List<Question_choiceDto> examPaperDoWrongQuestion_choice(int exam_info_num);
	
	public int wrongQuestionCount(String member_id, int exam_info_num);
	/*10.24 현이 학생 지난 시험지 보기 끝*/
	

	/*10.29 민지 학생이 쪽지보내기*/
	public int sendTeacherMessage(MessageDto dto);
	

	/*10.29 재훈 학생 자기 등수 확인 시작*/
	public List<Score_chartDto> myRank(String member_id, String exam_info_num);
	/*10.29 재훈 학생 자기 등수 확인 시작*/
	
	//양회준 11.2 시험 응시 목록 체크
	public int checkExamMember(String member_id, int exam_info_num);
	
	// 현이 11.8 오늘 시험 체크 
	public List<ExamInfoDto> selectTodayExam(String member_id);

}

