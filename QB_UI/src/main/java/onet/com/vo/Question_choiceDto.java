package onet.com.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Question_choiceDto {

	private int question_num;
	private String[] question_choice_num;
	private String[] question_choice_content;
	
	public int getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(int question_num) {
		this.question_num = question_num;
	}
	public String[] getQuestion_choice_num() {
		return question_choice_num;
	}
	public void setQuestion_choice_num(String[] question_choice_num) {
		this.question_choice_num = question_choice_num;
	}
	public String[] getQuestion_choice_content() {
		return question_choice_content;
	}
	public void setQuestion_choice_content(String[] question_choice_content) {
		this.question_choice_content = question_choice_content;
	}
	
}
