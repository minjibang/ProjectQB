package onet.com.student.dao;

import onet.com.vo.Student_answerDto;

public interface StudentDao {
	
	/* 10.19 현이 학생 답안지 제출 시작 */ 
	public int examAnswerInsert(Student_answerDto answerDto);
	public String searchAnswer(int question_num);
	/* 10.19 현이 학생 답안지 제출 끝 */
	
	
	
}

