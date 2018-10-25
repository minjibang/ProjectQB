package onet.com.vo;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Question_choiceDto {

	private int question_num;
	private String question_choice_num;
	private String question_choice_content;
	private String question_choice_image;  	// 10.22 추가
	
	/*임시 파일받기용*/
	private List<CommonsMultipartFile> question_choice_files;
	public List<CommonsMultipartFile> getQuestion_choice_files() {
		return question_choice_files;
	}
	public void setQuestion_choice_files(List<CommonsMultipartFile> question_choice_files) {
		this.question_choice_files = question_choice_files;
	}
	/*임시 파일받기용*/	
	
	public int getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(int question_num) {
		this.question_num = question_num;
	}
	public String getQuestion_choice_num() {
		return question_choice_num;
	}
	public void setQuestion_choice_num(String question_choice_num) {
		this.question_choice_num = question_choice_num;
	}
	public String getQuestion_choice_content() {
		return question_choice_content;
	}
	public void setQuestion_choice_content(String question_choice_content) {
		this.question_choice_content = question_choice_content;
	}
	public String getQuestion_choice_image() {
		return question_choice_image;
	}
	public void setQuestion_choice_image(String question_choice_image) {
		this.question_choice_image = question_choice_image;
	}
	

	
	

}
