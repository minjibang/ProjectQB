package onet.com.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.admin.dao.AdminDao;
import onet.com.index.dao.IndexDao;
import onet.com.vo.CategoryDto;
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
	
}
