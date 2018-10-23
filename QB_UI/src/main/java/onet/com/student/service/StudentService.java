package onet.com.student.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onet.com.student.dao.StudentDao;
import onet.com.vo.ExamInfoDto;
import onet.com.vo.Score_chartDto;
import onet.com.vo.Student_answerDto;
import onet.com.vo.Student_answerDtoList;

@Service
public class StudentService {
	
	@Autowired
	private SqlSession sqlsession;
	
	/* 10.19 현이 학생 답안지 제출 시작 */ 
	public int examAnswerInsert(Student_answerDtoList answerList) {
		
		StudentDao dao = sqlsession.getMapper(StudentDao.class);
		int result = 0;
		
		List<Student_answerDto> items = answerList.getStudent_answer();
		for(Student_answerDto item : items) {
			int question_num = item.getQuestion_num();
			String answer = dao.searchAnswer(question_num);		//	정답 찾아와서 answer_status 비교 후 입력 
			
			if((item.getStudent_answer_choice() == null) || (!(item.getStudent_answer_choice().equals(answer)))) {   //   오답
	            item.setStudent_answer_status(0);
	            if(item.getStudent_answer_choice() == "") {
	            	item.setStudent_answer_choice(null);
	            }
	         } else {
	            item.setStudent_answer_status(1);
	         }
			result += dao.examAnswerInsert(item);	//	student_answer 테이블 insert 
		}
		
		
		String member_id = answerList.getStudent_answer().get(0).getMember_id();
		int exam_info_num= answerList.getStudent_answer().get(0).getExam_info_num();
		
		
		// 문제 정답률 insert
		List<Integer> selectQuestion = dao.selectQuestion(exam_info_num);
		int correctRatioResult = 0;
		for(Integer aQuestion : selectQuestion) {
			int question_num = aQuestion.intValue();
			correctRatioResult += dao.updateCorrectRatio(question_num);
		} 
		// System.out.println("correctRatioResult 의 결과값(정답률) : "+correctRatioResult);
		
		
		// 학생 - 성적 차트 테이블 insert
		int scoreResult = dao.score_chartInsert(member_id, exam_info_num);	//	랭크  학생 성제외한적 입력 
		
		List<Score_chartDto> chartList = dao.selectRank(exam_info_num);		//	rank 함수로 rank를 구해서 dto 리스트에 넣어줌
		int updateScoreResult = dao.updateRank(chartList, exam_info_num);	//  위의 함수로 구한 rank 리스트를 다중행 업데이트함
		//System.out.println("updateScoreResult : " + updateScoreResult);
		
		// 클래스 성적 차트 테이블 insert 
		if(dao.countClassChart(exam_info_num) > 0 ) {	// 클래스 차트가 있다면 update, 없다면 insert 
			int classScoreResult = dao.class_chartUpdate(member_id, exam_info_num);
		} else {
			int classScoreResult = dao.class_chartInsert(member_id, exam_info_num);
		}
		
		return result;
	}
	/* 10.19 현이 학생 답안지 제출 끝 */ 
	
	/*10.23 현이 지난 시험 보기 시작 */
	public List<ExamInfoDto> searchPastExam(String member_id){
		
		StudentDao dao = sqlsession.getMapper(StudentDao.class);
		List<ExamInfoDto> examInfoList = dao.searchPastExam(member_id);
		
		return examInfoList;
	}
	
	public String searchStudentName(String member_id) {
		
		StudentDao dao = sqlsession.getMapper(StudentDao.class);
		String member_name = dao.searchStudentName(member_id);
		
		return member_name;
	}
	
	/*10.23 현이 지난 시험 보기 끝 */
	
	
	
	
	
}
