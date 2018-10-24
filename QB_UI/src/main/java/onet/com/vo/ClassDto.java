package onet.com.vo;

import java.util.Date;

/*민지 10.12-클래스 테이블 DTO 작성*/

public class ClassDto {
	private int class_num;
	private String class_name;
	private String teacher_name;
	private String class_start_date;
	private String class_end_date;
	private int class_enable;
	
	//반인원수
	private int class_student_count;
	
	
	
	
	
	public int getClass_student_count() {
		return class_student_count;
	}
	public void setClass_student_count(int class_student_count) {
		this.class_student_count = class_student_count;
	}
	public int getClass_num() {
		return class_num;
	}
	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getClass_start_date() {
		return class_start_date;
	}
	public void setClass_start_date(String class_start_date) {
		this.class_start_date = class_start_date;
	}
	public String getClass_end_date() {
		return class_end_date;
	}
	public void setClass_end_date(String class_end_date) {
		this.class_end_date = class_end_date;
	}
	public int getClass_enable() {
		return class_enable;
	}
	public void setClass_enable(int class_enable) {
		this.class_enable = class_enable;
	}
}
