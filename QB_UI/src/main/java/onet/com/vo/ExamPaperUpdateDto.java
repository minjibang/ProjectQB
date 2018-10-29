package onet.com.vo;

public class ExamPaperUpdateDto {
	private int question_num;
	private String question_name;
	private String question_img;
	private String question_answer;
	private int question_correct_ratio;
	private int exam_question_score;
	private String level_name;
	private String md_category_name;
	private String sm_category_name;
	private String member_id;
	
	public int getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(int question_num) {
		this.question_num = question_num;
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
	public int getQuestion_correct_ratio() {
		return question_correct_ratio;
	}
	public void setQuestion_correct_ratio(int question_correct_ratio) {
		this.question_correct_ratio = question_correct_ratio;
	}
	public int getExam_question_score() {
		return exam_question_score;
	}
	public void setExam_question_score(int exam_question_score) {
		this.exam_question_score = exam_question_score;
	}
	public String getLevel_name() {
		return level_name;
	}
	public void setLevel_name(String level_name) {
		this.level_name = level_name;
	}
	public String getMd_category_name() {
		return md_category_name;
	}
	public void setMd_category_name(String md_category_name) {
		this.md_category_name = md_category_name;
	}
	public String getSm_category_name() {
		return sm_category_name;
	}
	public void setSm_category_name(String sm_category_name) {
		this.sm_category_name = sm_category_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
