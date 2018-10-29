package onet.com.vo;

public class MessageDto {

	
	private int message_num;
	private String send_member_id;
	private String receive_member_id;
	private String message_content;
	private String message_date;
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}
	public String getSend_member_id() {
		return send_member_id;
	}
	public void setSend_member_id(String send_member_id) {
		this.send_member_id = send_member_id;
	}
	public String getReceive_member_id() {
		return receive_member_id;
	}
	public void setReceive_member_id(String receive_member_id) {
		this.receive_member_id = receive_member_id;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getMessage_date() {
		return message_date;
	}
	public void setMessage_date(String message_date) {
		this.message_date = message_date;
	}
	
	
	
	
}
