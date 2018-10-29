package onet.com.vo;

import java.util.ArrayList;

public class StudentExamScoreInfo {
	int exam_info_num;
	String exam_info_name;
	String exam_info_date;
	String exam_info_start;
	String exam_info_end;
	String exam_info_time;
	String exam_paper_name;
	String exam_paper_desc;
	int exam_paper_num;
	int question_num;
	String sm_category_code;
	String sm_category_name;
	ArrayList<String> smCtgrName;
	
	
	public ArrayList<String> getSmCtgrName() {
		return smCtgrName;
	}
	public void setSmCtgrName(ArrayList<String> smCtgrName) {
		this.smCtgrName = smCtgrName;
	}
	
	public int getExam_info_num() {
		return exam_info_num;
	}
	public void setExam_info_num(int exam_info_num) {
		this.exam_info_num = exam_info_num;
	}
	public String getExam_info_name() {
		return exam_info_name;
	}
	public void setExam_info_name(String exam_info_name) {
		this.exam_info_name = exam_info_name;
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
	public String getExam_paper_name() {
		return exam_paper_name;
	}
	public void setExam_paper_name(String exam_paper_name) {
		this.exam_paper_name = exam_paper_name;
	}
	public String getExam_paper_desc() {
		return exam_paper_desc;
	}
	public void setExam_paper_desc(String exam_paper_desc) {
		this.exam_paper_desc = exam_paper_desc;
	}
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
	public String getSm_category_code() {
		return sm_category_code;
	}
	public void setSm_category_code(String sm_category_code) {
		this.sm_category_code = sm_category_code;
	}
	public String getSm_category_name() {
		return sm_category_name;
	}
	public void setSm_category_name(String sm_category_name) {
		this.sm_category_name = sm_category_name;
	}
	
	
}
