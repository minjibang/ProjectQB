package onet.com.vo;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class NoticeDto {
	
	private int class_num;
	private int notice_num;
	private String class_name;
	private String notice_name;
	private String member_id;
	private String notice_content;
	private String notice_file1;
	private String notice_file2;
	private String notice_date;
	private String member_name;
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getClass_num() {
		return class_num;
	}
	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_file1() {
		return notice_file1;
	}
	public void setNotice_file1(String notice_file1) {
		this.notice_file1 = notice_file1;
	}
	public String getNotice_file2() {
		return notice_file2;
	}
	public void setNotice_file2(String notice_file2) {
		this.notice_file2 = notice_file2;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	
	
	
	

}
