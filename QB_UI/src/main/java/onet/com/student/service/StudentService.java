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
		
		//System.out.println("service에 들어옴");
		
		StudentDao dao = sqlsession.getMapper(StudentDao.class);
		int result = 0;
		
		List<Student_answerDto> items = answerList.getStudent_answer();
		for(Student_answerDto item : items) {
			
			int question_num = item.getQuestion_num();
			String answer = dao.searchAnswer(question_num);

			//System.out.println("학생이 작성한 답 : "+item.getStudent_answer_choice());
			
			if((item.getStudent_answer_choice() == null) || (!(item.getStudent_answer_choice().equals(answer)))) {   //   오답
	            //System.out.println("오답");
	            item.setStudent_answer_status(0);
	            if(item.getStudent_answer_choice() == "") {
	            	item.setStudent_answer_choice(null);
	            }
	         } else {
	            //System.out.println("정답");
	            item.setStudent_answer_status(1);
	         }
			
			result += dao.examAnswerInsert(item);
		}
		
		//System.out.println("insert의 결과값 : "+result);
		
		return result;
	}
	/* 10.19 현이 학생 답안지 제출 끝 */ 
	
	
	
	
	
}
