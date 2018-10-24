package onet.com.vo;

public class Class_chartDto {		
	
	//	18.10.22 현이 class_chartDto 만듦
	
	private String class_name;
	private int exam_info_num;
	private double class_chart_avg;
	
	// 양회준10.24추가
	private String exam_info_name;

	public String getExam_info_name() {
		return exam_info_name;
	}

	public void setExam_info_name(String exam_info_name) {
		this.exam_info_name = exam_info_name;
	}
	// 추가

	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getExam_info_num() {
		return exam_info_num;
	}
	public void setExam_info_num(int exam_info_num) {
		this.exam_info_num = exam_info_num;
	}
	public double getClass_chart_avg() {
		return class_chart_avg;
	}
	public void setClass_chart_avg(double class_chart_avg) {
		this.class_chart_avg = class_chart_avg;
	}
	
	
	
}
