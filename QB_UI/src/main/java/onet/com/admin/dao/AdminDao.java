package onet.com.admin.dao;

import java.util.List;
import java.util.Map;

import onet.com.vo.CategoryDto;
import onet.com.vo.ClassDto;
import onet.com.vo.MemberDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;


public interface AdminDao {
	/*  재훈 - 10.08  문제분류관리 관련 시작  */
	public List<CategoryDto> lgCategoryList();
	public List<CategoryDto> mdCategoryList();
	public List<CategoryDto> smCategoryList();
	
	/*  재훈 - 10.08 문제분류관리 관련 끝  */
	
	/*  재훈 - 10.15  문제난이도 관련 시작  */
	public List<CategoryDto> questionLevelList();
	/*  재훈 - 10.15  문제난이도 관련 끝  */
	
	/*  재훈 - 10.16 새 문제 만들기 관련 시작 */
	public int insertQuestion(QuestionDto dto);
	public int insertQuestionChoice(int question_num, String question_choice_num, String question_choice_content);
	/*  재훈 - 10.16 새 문제 만들기 관련 끝 */
	
	/* 영준 - 10.10 회원관리 관련 시작 */
	public List<MemberDto> memberList();
	/* 영준 - 10.10 회원관리 관련 끝 */
	

	/*민지 10.12 클래스멤버리스트 관련*/
	public List<MemberDto> classMemberList(MemberDto dto);
	
	public List<ClassDto> classList();
	
	public List<ClassDto> classlist(ClassDto dto);
	
	public int classMemberUpdate(MemberDto dto);
    /*민지 10.12 클래스멤버리스트 관련 끝*/
	
	/*민지 10.13 클래스 멤버 삭제 관련*/

	public int classMemberDelete(MemberDto dto);
	/*민지 10.13 클래스 멤버 삭제 관련 끝*/
	
	/*민지 10.15 클래스 수정 관련*/
	
	public int classUpdate(ClassDto dto);
	
	/*민지 10.15 클래스 수정 관련 끝*/
	

	/* 영준 - 10.12 회원관리 회원정보 수정 시작 */
	public int updateMember(MemberDto dto);
	/* 영준 - 10.12 회원관리 회원정보 수정 끝 */
	


	/* 태용 - 10.15 클래스 생성, 클래스 유효성검사*/
	public int classInsert(ClassDto dto);
	public String classCheck(String class_name);
	public List<ClassDto> classSearch(String searchtype, String keyword);
	public List<ClassDto> adminMainView();
	/* 태용 - 10.15 클래스 생성, 클래스 유효성검사 끝*/


	/* 영준 - 10.15 회원관리 회원정보 삭제(실제 삭제X) 시작 */
	public int deleteMember(MemberDto dto);
	/* 영준 - 10.15 회원관리 회원정보 삭제(실제 삭제X) 끝 */
	
	
	/*민지 - 10.17 클래스 수정시 중복체크 */
	public String joinCheckId(String class_name);

	/*민지 - 10.17 클래스 수정시 중복체크  끝*/
	
	// 정원 문제분류관리 시작  //
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
	
	public List<CategoryDto> lgProblemCategoryList();
	
	public List<CategoryDto> mdProblemCategoryList();
	
	public List<CategoryDto> smProblemCategoryList();

	public int lgUpdate(CategoryDto dto);
	
	public int mdUpdate(CategoryDto dto);
	
	public int smUpdate(CategoryDto dto);
	
	public int lgDelete(CategoryDto dto);

	// 정원 문제분류관리 끝  //

	

}

