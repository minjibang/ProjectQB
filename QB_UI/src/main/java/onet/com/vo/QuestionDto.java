package onet.com.vo;

public class QuestionDto {

	private String question_num;
	private String question_type;
	private String question_name;
	private String question_img;
	private String question_answer;
	private String question_correct_ratio;
	private String question_select_count;
	private String sm_category_code;
	private String level_code;
	private String member_id;
	
	/* 문제 뿌려주기 시 코드 아닌 이름 불러오기 */
	private String sm_category_name;
	private String md_category_name;
	private String level_name;
	
	public String getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(String question_num) {
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
	public String getQuestion_correct_ratio() {
		return question_correct_ratio;
	}
	public void setQuestion_correct_ratio(String question_correct_ratio) {
		this.question_correct_ratio = question_correct_ratio;
	}
	public String getQuestion_select_count() {
		return question_select_count;
	}
	public void setQuestion_select_count(String question_select_count) {
		this.question_select_count = question_select_count;
	}
	public String getSm_category_code() {
		return sm_category_code;
	}
	public void setSm_category_code(String sm_category_code) {
		this.sm_category_code = sm_category_code;
	}
	public String getLevel_code() {
		return level_code;
	}
	public void setLevel_code(String level_code) {
		this.level_code = level_code;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	/* 문제 뿌려주기 시 코드 아닌 이름 불러오기 */
	public String getSm_category_name() {
		return sm_category_name;
	}
	public void setSm_category_name(String sm_category_name) {
		this.sm_category_name = sm_category_name;
	}
	public String getMd_category_name() {
		return md_category_name;
	}
	public void setMd_category_name(String md_category_name) {
		this.md_category_name = md_category_name;
	}
	public String getLevel_name() {
		return level_name;
	}
	public void setLevel_name(String level_name) {
		this.level_name = level_name;
	}
}
