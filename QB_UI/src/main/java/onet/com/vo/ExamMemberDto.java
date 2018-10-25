package onet.com.vo;

public class ExamMemberDto {

	private int exam_info_num;
	private String member_id;
	
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
	
	@Override
	public String toString() {
		return "ExamMemberDto [exam_info_num=" + exam_info_num + ", member_id=" + member_id + "]";
	}

	
	
	
}
