package onet.com.vo;

public class ExamInfoDto {
	
	private int exam_info_num;
	private int exam_paper_num;
	private String class_name;         
	private String exam_info_name;
	private String exam_info_desc;
	private String exam_info_member;
	private String exam_info_date;
	private String exam_info_start;
	private String exam_info_end;
	private String exam_info_time;
	private int class_num;
	
	//양회준 11.5
	private String score_chart_comment;
	
	
	
	public String getScore_chart_comment() {
		return score_chart_comment;
	}
	public void setScore_chart_comment(String score_chart_comment) {
		this.score_chart_comment = score_chart_comment;
	}
	public int getExam_info_num() {
		return exam_info_num;
	}
	public void setExam_info_num(int exam_info_num) {
		this.exam_info_num = exam_info_num;
	}
	public int getExam_paper_num() {
		return exam_paper_num;
	}
	public void setExam_paper_num(int exam_paper_num) {
		this.exam_paper_num = exam_paper_num;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getExam_info_name() {
		return exam_info_name;
	}
	public void setExam_info_name(String exam_info_name) {
		this.exam_info_name = exam_info_name;
	}
	public String getExam_info_desc() {
		return exam_info_desc;
	}
	public void setExam_info_desc(String exam_info_desc) {
		this.exam_info_desc = exam_info_desc;
	}
	public String getExam_info_member() {
		return exam_info_member;
	}
	public void setExam_info_member(String exam_info_member) {
		this.exam_info_member = exam_info_member;
	}
	public String getExam_info_date() {
		return exam_info_date;
	}
	public void setExam_info_date(String exam_info_date) {
		this.exam_info_date = exam_info_date;
	}
	public String getExam_info_start() {
		return exam_info_start;
	}
	public void setExam_info_start(String exam_info_start) {
		this.exam_info_start = exam_info_start;
	}
	public String getExam_info_end() {
		return exam_info_end;
	}
	public void setExam_info_end(String exam_info_end) {
		this.exam_info_end = exam_info_end;
	}
	public String getExam_info_time() {
		return exam_info_time;
	}
	public void setExam_info_time(String exam_info_time) {
		this.exam_info_time = exam_info_time;
	}
	public int getClass_num() {
		return class_num;
	}
	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}
	@Override
	public String toString() {
		return "ExamInfoDto [exam_info_num=" + exam_info_num + ", exam_paper_num=" + exam_paper_num + ", class_name="
				+ class_name + ", exam_info_name=" + exam_info_name + ", exam_info_desc=" + exam_info_desc
				+ ", exam_info_member=" + exam_info_member + ", exam_info_date=" + exam_info_date + ", exam_info_start="
				+ exam_info_start + ", exam_info_end=" + exam_info_end + ", exam_info_time=" + exam_info_time
				+ ", class_num=" + class_num + "]";
	}
	
	
	
	
	
	
	
	
}
