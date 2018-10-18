package onet.com.vo;

public class ExamPaperDoQuestionDto {

	/* 현이 10.17 시험보기 페이지 문제 dto 만듦 */

	// 문제 테이블
	private int question_num;
	private String question_type;
	private String question_name;
	private String question_img;
	private String question_answer;

	// 시험지 문제 테이블
	private int exam_question_seq;
	private int exam_question_score;
	

	public int getQuestion_num() {
		return question_num;
	}

	public void setQuestion_num(int question_num) {
		this.question_num = question_num;
	}

	public String getQuestion_type() {
		return question_type;
	}

	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}

	public String getQuestion_name() {
		return question_name;
	}

	public void setQuestion_name(String question_name) {
		this.question_name = question_name;
	}

	public String getQuestion_img() {
		return question_img;
	}

	public void setQuestion_img(String question_img) {
		this.question_img = question_img;
	}

	public String getQuestion_answer() {
		return question_answer;
	}

	public void setQuestion_answer(String question_answer) {
		this.question_answer = question_answer;
	}

	public int getExam_question_seq() {
		return exam_question_seq;
	}

	public void setExam_question_seq(int exam_question_seq) {
		this.exam_question_seq = exam_question_seq;
	}

	public int getExam_question_score() {
		return exam_question_score;
	}

	public void setExam_question_score(int exam_question_score) {
		this.exam_question_score = exam_question_score;
	}

}
