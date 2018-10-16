package onet.com.common.dao;

import java.sql.SQLException;
import java.util.List;

import onet.com.vo.Exam_infoDto;
import onet.com.vo.MemberDto;
import onet.com.vo.NoticeDto;

public interface CommonDao {
	/*한결 - 메인페이지 데이터 뿌리기 10.10*/
	public List<NoticeDto> notice();
	public List<Exam_infoDto> exam_info();
	/* 끝 */
	
	/*양회준 - 10.15 내 정보 수정 시작*/
	public MemberDto myPageInfo(String member_id);
	public int myPageUpdate(MemberDto memberDto)  throws ClassNotFoundException, SQLException;
	public int myPageDrop(MemberDto memberDto)  throws ClassNotFoundException, SQLException;
	
	public int memberDrop(String member_id, String member_pwd) throws ClassNotFoundException, SQLException;
	/*양회준 - 10.15 내 정보 수정 끝*/
}
