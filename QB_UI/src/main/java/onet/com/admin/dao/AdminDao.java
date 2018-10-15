package onet.com.admin.dao;

import java.util.List;

import onet.com.vo.CategoryDto;
import onet.com.vo.ClassDto;
import onet.com.vo.MemberDto;

public interface AdminDao {
	/*���� - 10.08 �����з����� ����*/
	public List<CategoryDto> lgCategoryList();
	public List<CategoryDto> mdCategoryList();
	public List<CategoryDto> smCategoryList();
	
	/*���� - 10.08 �����з����� ����*/
	
	/* 영준 - 10.10 회원관리 관련 시작 */
	public List<MemberDto> memberList();
	/* 영준 - 10.10 회원관리 관련 끝 */
	

	/*민지 10.12 클래스멤버리스트 관련*/
	public List<MemberDto> classMemberList();
	
	public List<ClassDto> classList();
	
	public int classMemberUpdate(MemberDto dto);
    /*민지 10.12 클래스멤버리스트 관련 끝*/
	
	/*민지 10.13 클래스 멤버 삭제 관련*/

	public int classMemberDelete(MemberDto dto);
	/*민지 10.13 클래스 멤버 삭제 관련 끝*/
	

	/* 영준 - 10.12 회원관리 회원정보 수정 시작 */
	public String updateMember(MemberDto member);
	/* 영준 - 10.12 회원관리 회원정보 수정 끝 */

	public int lgCatAddCheak();
	
	public int lgCatAdd(CategoryDto dto);
	
	public int mdCatAddCheck();
	
	public String lgCatCode(String selectLgCat);
	
	public int mdCatAdd(CategoryDto dto);
	
	public String mdCatCode(String selectMdCat);

	public int smCatAddCheck();
	
	public int smCatAdd(CategoryDto dto);
	
	public String lgCatAddIdCheck(String lgCatAdd);
	
	public String mdCatAddIdCheck(String mdCatAdd);
	
	public String smCatAddIdCheck(String smCatAdd);
}

