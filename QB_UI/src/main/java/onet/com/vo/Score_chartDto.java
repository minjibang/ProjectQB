package onet.com.vo;

public class Score_chartDto {

	// 18.10.22 현이 score_chartDto 만듦

	private String member_id;
	private int exam_info_num;
	private int score_chart_score;
	private int score_chart_rank;
	private String class_name;
	// 양회준10.24추가 
	private String exam_info_name;

	public String getExam_info_name() {
		return exam_info_name;
	}

	public void setExam_info_name(String exam_info_name) {
		this.exam_info_name = exam_info_name;
	}
	// 추가
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

	public int getScore_chart_score() {
		return score_chart_score;
	}

	public void setScore_chart_score(int score_chart_score) {
		this.score_chart_score = score_chart_score;
	}

	public int getScore_chart_rank() {
		return score_chart_rank;
	}

	public void setScore_chart_rank(int score_chart_rank) {
		this.score_chart_rank = score_chart_rank;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

}
