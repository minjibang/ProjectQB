package onet.com.admin.dao;

import java.util.List;

import onet.com.vo.CategoryDto;
import onet.com.vo.MemberDto;

public interface AdminDao {
	/*���� - 10.08 �����з����� ����*/
	public List<CategoryDto> lgCategoryList();
	public List<CategoryDto> mdCategoryList();
	public List<CategoryDto> smCategoryList();
	
	/*���� - 10.08 �����з����� ����*/
	
	/* 영준 - 10.10 회원관리 관련 시작 */
	public List<MemberDto> memberList();
	public void getMember(MemberDto member);
	public void insertMember(MemberDto member);
	public void updateMember(MemberDto member);
	public void deleteMember(String member_id);
	/* 영준 - 10.10 회원관리 관련 끝 */
}

