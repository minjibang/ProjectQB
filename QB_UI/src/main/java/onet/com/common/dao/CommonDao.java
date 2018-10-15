package onet.com.common.dao;

import java.util.List;

import onet.com.vo.ExamInfoDto;
import onet.com.vo.Exam_infoDto;
import onet.com.vo.NoticeDto;

public interface CommonDao {
	/*한결 - 메인페이지 데이터 뿌리기 10.10*/
	public List<NoticeDto> notice();
	public List<Exam_infoDto> exam_info();
	/* 끝 */
	/*현이 - examInfoDetail 10.15 */ 
	public ExamInfoDto examScheduleDetail(int exam_info_num);
}
