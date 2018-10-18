package onet.com.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.admin.dao.AdminDao;
import onet.com.teacher.dao.TeacherDao;
import onet.com.vo.ClassDto;
import onet.com.vo.QuestionDto;

@Service
public class AdminMainPageService {
	
	@Autowired
	private SqlSession sqlsession;
	 
	public int classInsert(ClassDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.classInsert(dto);
		return result;
	}
	
	public String classCheck(String class_name) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		String result = dao.classCheck(class_name);
		return result;
	}
	public List<ClassDto> adminMainView(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<ClassDto> result = dao.adminMainView();
		return result;
	}
	public List<ClassDto> classSearch(String searchtype, String keyword){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<ClassDto> result = dao.classSearch(searchtype, keyword);
		return result;
	}

}
