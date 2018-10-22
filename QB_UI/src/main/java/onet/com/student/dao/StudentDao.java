package onet.com.student.dao;

import java.util.List;

import onet.com.vo.Score_chartDto;
import onet.com.vo.Student_answerDto;

public interface StudentDao {
	
	/* 10.19 현이 학생 답안지 제출 시작 */ 
	public int examAnswerInsert(Student_answerDto answerDto);
	public String searchAnswer(int question_num);
	public int score_chartInsert(String member_id, int exam_info_num);
	public List<Score_chartDto> selectRank(int exam_info_num);
	public int updateRank(List<Score_chartDto> chartList, int exam_info_num);
	
	public int countClassChart(int exam_info_num);
	public int class_chartInsert(String member_id, int exam_info_num);
	public int class_chartUpdate(String member_id, int exam_info_num);
	/* 10.19 현이 학생 답안지 제출 끝 */
	
	
	
	
	
}

