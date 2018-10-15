package onet.com.common.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.common.dao.CommonDao;
import onet.com.teacher.dao.TeacherDao;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.NoticeDto;

@Service
public class CommonService {
	
	@Autowired
	private SqlSession sqlsession;
	/*한결 - 10.10 강사 메인페이지 백그라운드 시작*/
	public List<NoticeDto> teacher_student_Main() {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		List<NoticeDto> result = dao.notice();
		return result;
	}
	
	public List<Exam_infoDto> exam_info() {
		CommonDao dao = sqlsession.getMapper(CommonDao.class);
		List<Exam_infoDto> result = dao.exam_info();
		return result;
	}
	/*한결 - 10.10 강사 메인페이지 백그라운드  끝*/
}
