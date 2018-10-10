package onet.com.teacher.dao;

import java.util.List;

import onet.com.vo.NoticeDto;

public interface TeacherDao {
	

	public List<NoticeDto> notice();
	public List<NoticeDto> list(NoticeDto dto);
}
