package onet.com.vo;

public class ExamPaperDto {
	private int exam_paper_num;
	private String exam_paper_name;
	private String member_id;
	private String exam_paper_desc;
	private int exam_paper_status;
	private int exam_paper_enable;
	private int class_num;
	private String class_name;
	
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getClass_num() {
		return class_num;
	}
	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}
	public int getExam_paper_num() {
		return exam_paper_num;
	}
	public void setExam_paper_num(int exam_paper_num) {
		this.exam_paper_num = exam_paper_num;
	}
	public String getExam_paper_name() {
		return exam_paper_name;
	}
	public void setExam_paper_name(String exam_paper_name) {
		this.exam_paper_name = exam_paper_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getExam_paper_desc() {
		return exam_paper_desc;
	}
	public void setExam_paper_desc(String exam_paper_desc) {
		this.exam_paper_desc = exam_paper_desc;
	}
	public int getExam_paper_status() {
		return exam_paper_status;
	}
	public void setExam_paper_status(int exam_paper_status) {
		this.exam_paper_status = exam_paper_status;
	}
	public int getExam_paper_enable() {
		return exam_paper_enable;
	}
	public void setExam_paper_enable(int exam_paper_enable) {
		this.exam_paper_enable = exam_paper_enable;
	}
	
	
}

