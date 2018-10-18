package onet.com.vo;

public class ExamQuestionDto {
	private int exam_paper_num;
	private int question_num;
	private int exam_question_seq;
	private int exam_question_score;
	
	public int getExam_paper_num() {
		return exam_paper_num;
	}
	public void setExam_paper_num(int exam_paper_num) {
		this.exam_paper_num = exam_paper_num;
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
	public int getExam_question_score() {
		return exam_question_score;
	}
	public void setExam_question_score(int exam_question_score) {
		this.exam_question_score = exam_question_score;
	}

}

