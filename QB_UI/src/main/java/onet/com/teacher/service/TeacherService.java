package onet.com.teacher.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.teacher.dao.TeacherDao;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.NoticeDto;

@Service
public class TeacherService {
	
	@Autowired
	private SqlSession sqlsession;
	/*한결 - 강사 메인페이지 백그라운드 10.10*/
	public List<NoticeDto> teacherMain() {
		TeacherDao dao = sqlsession.getMapper(TeacherDao.class);
		List<NoticeDto> result = dao.notice();
		return result;
	}
	
	public List<Exam_infoDto> exam_info() {
		TeacherDao dao = sqlsession.getMapper(TeacherDao.class);
		List<Exam_infoDto> result = dao.exam_info();
		return result;
	}
	/*끝*/
}
