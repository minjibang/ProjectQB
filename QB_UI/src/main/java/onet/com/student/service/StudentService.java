package onet.com.student.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.student.dao.StudentDao;
import onet.com.vo.Student_answerDto;
import onet.com.vo.Student_answerDtoList;

@Service
public class StudentService {
	
	@Autowired
	private SqlSession sqlsession;
	
	/* 10.19 현이 학생 답안지 제출 시작 */ 
	public int examAnswerInsert(Student_answerDtoList answerList) {
		
		StudentDao dao = sqlsession.getMapper(StudentDao.class);
		int result = 0;
		
		List<Student_answerDto> items = answerList.getStudent_answer();
		for(Student_answerDto item : items) {
			
			int question_num = item.getQuestion_num();
			String answer = dao.searchAnswer(question_num);
			
			if(item.getStudent_answer_choice().equals(answer)) {	//	정답
				item.setStudent_answer_status(1);
			} else {	//	오답
				item.setStudent_answer_status(0);
			}
			result += dao.examAnswerInsert(item);
		}
		return result;
	}
	/* 10.19 현이 학생 답안지 제출 끝 */ 
	
	
	
	
	
}
