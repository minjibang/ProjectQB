package onet.com.vo;

import java.util.List;

/* 10.19 현이
 * 학생 답안지를 다중행으로 한 번에 Controller로 넘기기 위해 만든 dto*/

public class Student_answerDtoList {
	
	private List<Student_answerDto> student_answer;

	public List<Student_answerDto> getStudent_answer() {
		return student_answer;
	}

	public void setStudent_answer(List<Student_answerDto> student_answer) {
		this.student_answer = student_answer;
	}


	
}
