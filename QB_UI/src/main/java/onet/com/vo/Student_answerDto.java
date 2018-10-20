package onet.com.vo;

/* 10.19 현이
 * 학생 답안지 데이터 한 행에 대한 dto*/

public class Student_answerDto {

	private String member_id;
	private int exam_info_num;
	private int question_num;
	private int exam_question_seq;
	private String student_answer_choice;
	private int student_answer_status;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getExam_info_num() {
		return exam_info_num;
	}
	public void setExam_info_num(int exam_info_num) {
		this.exam_info_num = exam_info_num;
	}
	public int getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(int question_num) {
		this.question_num = question_num;
	}
	public int getExam_question_seq() {
		return exam_question_seq;
	}
	public void setExam_question_seq(int exam_question_seq) {
		this.exam_question_seq = exam_question_seq;
	}
	public String getStudent_answer_choice() {
		return student_answer_choice;
	}
	public void setStudent_answer_choice(String student_answer_choice) {
		this.student_answer_choice = student_answer_choice;
	}
	public int getStudent_answer_status() {
		return student_answer_status;
	}
	public void setStudent_answer_status(int student_answer_status) {
		this.student_answer_status = student_answer_status;
	}
	
	
	
}
