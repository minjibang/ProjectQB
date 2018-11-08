package onet.com.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.admin.dao.AdminDao;
import onet.com.teacher.dao.TeacherDao;
import onet.com.vo.ClassDto;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.ExamPaperDto;
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
	public List<ClassDto> adminMainView(String searchType,String keyword,int begin){
		// System.out.println("service로 들어옴 : " + begin);
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<ClassDto> result = dao.adminMainView(searchType, keyword, begin);
		
		return result;
	}
	
	//양회준 리스트 3개 추가
	//내시험지 리스트
	public List<ExamPaperDto> myExamPaperList(String member_id){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<ExamPaperDto> result = dao.myExamPaperList(member_id);
		return result;	
	}
	//내임시시험지 리스트
	public List<ExamPaperDto> myTempExamList(String member_id){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<ExamPaperDto> result = dao.myTempExamList(member_id);
		return result;	
	}
	
	//시험등록 일정리스트
	public List<ExamInfoDto> examScheduleList(String member_id){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<ExamInfoDto> result = dao.examScheduleList(member_id);
		return result;
	}
	
	// 현이 11.02 adminMain 클래스 삭제 
	public int deleteClass(String class_name) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.deleteClass(class_name);
		return result;
	}
	
	// 현이 11.03 adminMain 클래스 수정 
	public int classUpdate(ClassDto dto) {
		AdminDao dao=  sqlsession.getMapper(AdminDao.class);
		int result = dao.classUpdate(dto);
		
		return result;
	}
	
}
