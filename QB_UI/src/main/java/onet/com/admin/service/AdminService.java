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
	
	/*재훈 - 10.08 문제분류관련 시작*/ 
	public List<CategoryDto> lgCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.lgCategoryList();
		return result;
	}
	/*재훈 - 10.08 문제분류관련 끝*/
	
}
