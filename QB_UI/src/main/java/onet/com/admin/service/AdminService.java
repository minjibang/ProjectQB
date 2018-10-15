package onet.com.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.admin.dao.AdminDao;
import onet.com.vo.CategoryDto;
import onet.com.vo.ClassDto;
import onet.com.vo.MemberDto;

@Service
public class AdminService {
	
	@Autowired
	private SqlSession sqlsession;
	
	/*���� - 10.08 �����з����� ����*/ 
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
	/*���� - 10.08 �����з����� ��*/

	/*영준 - 10.10 회원관리 관련 시작 */
	public List<MemberDto> memberList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<MemberDto> result = dao.memberList();
		return result;
	}
	/*영준 - 10.10 회원관리 관련 끝 */

	/*민지 10.12 클래스멤버 리스트, 클래스 리스트  관리*/
	public List<MemberDto> classMemberList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<MemberDto> result = dao.classMemberList();
		return result;
	}
	
	public List<ClassDto> classList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<ClassDto> result = dao.classList();
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

	/* 영준 - 10.12 회원관리 회원정보 수정 시작 */
	public String updateMember(MemberDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		String result = dao.updateMember(dto);
		return result;
	}
	/* 영준 - 10.12 회원관리 회원정보 수정 끝 */

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
	
	
}
