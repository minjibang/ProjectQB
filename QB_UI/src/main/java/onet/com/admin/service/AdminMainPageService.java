package onet.com.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.admin.dao.AdminDao;
import onet.com.vo.CategoryDto;
import onet.com.vo.ClassDto;
import onet.com.vo.MemberDto;

@Service
public class AdminMainPageService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int classInsert(ClassDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.classInsert(dto);
		return result;
	}

}
