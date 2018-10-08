package onet.com.teacher.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import onet.com.teacher.dao.TeacherDao;
import onet.com.vo.NoticeDto;

public class TeacherService {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	public List<NoticeDto> teacherMain(NoticeDto dto) {
		
		TeacherDao dao = sqlsession.getMapper(TeacherDao.class);
		List<NoticeDto> list = dao.list(dto);
		
		
		
		return list;
	}
}
