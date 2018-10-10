package onet.com.teacher.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.teacher.dao.TeacherDao;
import onet.com.vo.NoticeDto;

@Service
public class TeacherService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<NoticeDto> teacherMain(NoticeDto dto) {
		TeacherDao dao = sqlsession.getMapper(TeacherDao.class);
		List<NoticeDto> notice = dao.notice();
		return notice;
	}
}
