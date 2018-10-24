package onet.com.student.dao;

import java.util.List;
import java.util.Map;

import onet.com.vo.ExamInfoDto;
import onet.com.vo.Score_chartDto;
import onet.com.vo.Student_answerDto;

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
	public int countClassChart(int exam_info_num);
	public int class_chartInsert(String member_id, int exam_info_num);
	public int class_chartUpdate(String member_id, int exam_info_num);
	/* 10.19 현이 학생 답안지 제출 끝 */
	
	/* 10.23 현이 학생 지난 시험보기 시작 */
	public List<ExamInfoDto> searchPastExam(String member_id);
	public String searchStudentName(String member_id);
	public List<ExamInfoDto> searchPastExamKeyword(String member_id, String keyword);
	/* 10.23 현이 학생 지난 시험보기 끝 */
}

