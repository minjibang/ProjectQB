package onet.com.admin.dao;

import java.util.List;

import onet.com.vo.CategoryDto;
import onet.com.vo.ClassDto;
import onet.com.vo.MemberDto;

public interface AdminDao {
	/*  재훈 - 10.08  문제분류관리 관련 시작  */
	public List<CategoryDto> lgCategoryList();
	public List<CategoryDto> mdCategoryList();
	public List<CategoryDto> smCategoryList();
	
	/*  재훈 - 10.08 문제분류관리 관련 끝  */
	
	/*  재훈 - 10.15  문제난이도 관련 시작  */
	public List<CategoryDto> questionLevelList();
	/*  재훈 - 10.15  문제난이도 관련 끝  */
	
	
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
	
	/* 태용 - 10.15 클래스 생성, 클래스 유효성검사*/
	public int classInsert(ClassDto dto);
	public String classCheck(String class_name);
	/* 태용 - 10.15 클래스 생성, 클래스 유효성검사 끝*/

}

