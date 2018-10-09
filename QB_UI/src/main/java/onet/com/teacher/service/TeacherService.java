package onet.com.teacher.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import onet.com.vo.NoticeDto;

public class TeacherService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<NoticeDto> teacherMain() {
		
		return null;
	}
}
