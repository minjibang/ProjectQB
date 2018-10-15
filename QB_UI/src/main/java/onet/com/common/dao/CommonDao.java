package onet.com.common.dao;

import java.util.List;

import onet.com.vo.Exam_infoDto;
import onet.com.vo.NoticeDto;

public interface CommonDao {
	/*한결 - 메인페이지 데이터 뿌리기 10.10*/
	public List<NoticeDto> notice(NoticeDto dto);
	public List<Exam_infoDto> exam_info(Exam_infoDto dto);
	/* 끝 */
}
