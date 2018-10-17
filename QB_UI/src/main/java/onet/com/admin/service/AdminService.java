package onet.com.admin.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import onet.com.admin.dao.AdminDao;
import onet.com.index.dao.IndexDao;
import onet.com.vo.CategoryDto;
import onet.com.vo.ClassDto;
import onet.com.vo.MemberDto;
import onet.com.vo.QuestionDto;

@Service
public class AdminService {
	
	@Autowired
	private SqlSession sqlsession;
	
	HttpServletRequest request;
	
	/*재훈 - 10.08 문제분류관련 시작*/ 
	public List<CategoryDto> lgCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.lgCategoryList();
		return result;
	}
	public List<CategoryDto> mdCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.mdCategoryList();
		return result;
	}
	public List<CategoryDto> smCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.smCategoryList();
		return result;
	}
	/*재훈 - 10.08 문제분류관련 끝*/
	
	/*재훈 - 10.15 문제난이도관련 시작*/
	public List<CategoryDto> questionLevelList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.questionLevelList();
		return result;
	}
	/*재훈 - 10.15 문제난이도관련 끝*/
	
	/*재훈 - 10.16 새 문제 만들기 관련 시작*/
	@Transactional
	public int insertQuestion(QuestionDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.insertQuestion(dto);
		return result;
	}
	/*재훈 - 10.15 새 문제 만들기 관련 끝*/

	/*영준 - 10.10 회원관리 관련 시작 */
	public List<MemberDto> memberList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<MemberDto> result = dao.memberList();
		return result;
	}
	/*영준 - 10.10 회원관리 관련 끝 */

	/*민지 10.12 클래스멤버 리스트, 클래스 리스트  관리*/
	public List<MemberDto> classMemberList(int class_num){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		MemberDto dto = new MemberDto();
		dto.setClass_num(class_num);
		List<MemberDto> result = dao.classMemberList(dto);
		return result;
	}
	
	public List<ClassDto> classList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<ClassDto> result = dao.classList();
		return result;
	}
	
	public List<ClassDto> classlist(int class_num){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		ClassDto dto = new ClassDto();
		dto.setClass_num(class_num);
		List<ClassDto> result = dao.classlist(dto);
		
		
		return result;
	}
	public int classMemberUpdate(MemberDto dto) {
		AdminDao dao=  sqlsession.getMapper(AdminDao.class);
		int result = dao.classMemberUpdate(dto);
		
		return result;
	}
	/*민지 10.12 클래스멤버 리스트 관리 끝*/

	/*민지 10.13 클래스 멤버 삭제 관련*/
	
	public int classMemberDelete(MemberDto dto) {
		AdminDao dao=  sqlsession.getMapper(AdminDao.class);
		int result = dao.classMemberDelete(dto);
		return result;
	}
	/*민지 10.13 클래스 멤버 삭제 관련 끝*/
	
	/*민지 10.15 클래스 수정 관련*/
	public int classUpdate(ClassDto dto) {
		AdminDao dao=  sqlsession.getMapper(AdminDao.class);
		int result = dao.classUpdate(dto);
		
		return result;
	}
	/*민지 10.15 클래스 수정 끝*/
	/* 영준 - 10.12 회원관리 회원정보 수정 시작 */
	public int updateMember(MemberDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.updateMember(dto);
		return result;
	}
	/* 영준 - 10.12 회원관리 회원정보 수정 끝 */


	// 정원 - 10.15 문제분류 insert 
	public String lgCatAdd(String lgCatAdd) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		String result = dao.lgCatAddIdCheck(lgCatAdd);
		if(result == null) {
		int finalRow = dao.lgCatAddCheak();
		String codeH = "H";
		int finalRowCodeAdd = finalRow + 1;
		String codeNum = String.valueOf(finalRowCodeAdd);
		String code = codeH + codeNum;
		dto.setLg_category_code(code);
		dto.setLg_category_name(lgCatAdd);
		dao.lgCatAdd(dto);
		}else {
			result = "중복";
		}
			return result;
		}
	
	public String mdCatAdd(String selectLgCat, String mdCatAdd) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		String result = dao.mdCatAddIdCheck(mdCatAdd);
		if(result == null) {
		String lgCatCode = dao.lgCatCode(selectLgCat);
		int finalRow = dao.mdCatAddCheck();
		String codeM = "M";
		int finalRowCodeAdd = finalRow + 1;
		String codeNum = String.valueOf(finalRowCodeAdd);
		String code = codeM + codeNum;
		dto.setLg_category_code(lgCatCode);
		dto.setMd_category_code(code);
		dto.setMd_category_name(mdCatAdd);
		dao.mdCatAdd(dto);
		}else {
			result = "중복";
		}
		return result;
	}
	
	public String smCatAdd(String selectMdCat, String smCatAdd) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		String result = dao.smCatAddIdCheck(smCatAdd);
		if(result == null) {
		String mdCatCode = dao.mdCatCode(selectMdCat);
		int finalRow = dao.smCatAddCheck();
		String codeS = "S";
		int finalRowCodeAdd = finalRow + 1;
		String codeNum = String.valueOf(finalRowCodeAdd);
		String code = codeS + codeNum;
		dto.setMd_category_code(mdCatCode);
		dto.setSm_category_code(code);
		dto.setSm_category_name(smCatAdd);
		dao.smCatAdd(dto);
		}else {
			result = "중복";
		}
		return result;
	}
	// 정원 - 10.15 문제분류 insert 끝


	
	/* 영준 - 10.15 회원관리 회원정보 삭제(실제 삭제X) 시작 */
	public int deleteMember(MemberDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.deleteMember(dto);
		return result;
	}

	/* 영준 - 10.15 회원관리 회원정보 삭제(실제 삭제X) 끝 */

	/* 영준 - 10.15 강사 시험관지 페이지 끝 */
	
	// 정원 - 10.16  시작
	public List<CategoryDto> lgProblemCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.lgProblemCategoryList();
		return result;
	}
	public List<CategoryDto> mdProblemCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.mdProblemCategoryList();
		return result;
	}
	public List<CategoryDto> smProblemCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.smProblemCategoryList();
		return result;
	}
	
	// 정원 - 10.16 끝
	
	// 정원 - 10.17 시작
	public int lgUpdate(CategoryDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.lgUpdate(dto);
		return result;
	}
	
	public int mdUpdate(CategoryDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.mdUpdate(dto);
		return result;
	}
	
	public int smUpdate(CategoryDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.smUpdate(dto);
		return result;
	}
	
	public String lgCatIdCheck(String lgCatName) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		String result = dao.lgCatAddIdCheck(lgCatName);
		return result;
	}
	
	public String mdCatIdCheck(String mdCatName) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		String result = dao.mdCatAddIdCheck(mdCatName);
		return result;
	}
	
	public String smCatIdCheck(String smCatName) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		String result = dao.smCatAddIdCheck(smCatName);
		return result;
	}
	
	/*민지 - 10.17 클래스 수정 이름 중복체크*/
	
	public String classCheck(String class_name) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		String result = dao.classCheck(class_name);
		return result;
	}
	
	/*민지 - 10.17 클래스 수정 이름 중복체크 끝  */

	
}
