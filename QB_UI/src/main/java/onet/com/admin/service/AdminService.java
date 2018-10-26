package onet.com.admin.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import onet.com.admin.dao.AdminDao;
import onet.com.teacher.dao.TeacherDao;
import onet.com.vo.CategoryDto;
import onet.com.vo.ClassDto;
import onet.com.vo.MemberDto;
import onet.com.vo.QuestionDto;
import onet.com.vo.Question_choiceDto;
import onet.com.vo.RoleDto;

@Service
public class AdminService {
	
	@Autowired
	private SqlSession sqlsession;
	
	HttpServletRequest request;
	
/*##################        재훈 시작              ##################*/
	//문제분류 페이지 - 문제분류 리스트 시작 
	public List<CategoryDto> lgCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.lgCategoryList();
		return result;
	}
	public List<CategoryDto> mdCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.mdCategoryList();
		return result;
	}
	public List<CategoryDto> smCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.smCategoryList();
		return result;
	}
	
	//문제관리 페이지 - 전체 문제정보 
	public List<QuestionDto> question(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<QuestionDto> result = dao.question();
		return result;
	}
	public List<Question_choiceDto> question_choice(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<Question_choiceDto> result = dao.question_choice();
		return result;
	}
	
	//문제 검색
	public List<QuestionDto> questionSearch(String lgsearchtype, String mdsearchtype, String smsearchtype, String leveltype, String questiontype, String keyword){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<QuestionDto> result = dao.questionSearch(lgsearchtype, mdsearchtype, smsearchtype, leveltype, questiontype, keyword);
		return result;
	}
	
	//문제 난이도 리스트
	public List<CategoryDto> questionLevelList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.questionLevelList();
		return result;
	}
	
	//새 문제 만들기 
	@Transactional
	public int insertQuestion(QuestionDto dto, HttpServletRequest request) 
			throws IOException, ClassNotFoundException, SQLException {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		//문제 이미지 파일 입력
		List<CommonsMultipartFile> files = dto.getQuestion_file();
		List<String> filenames = new ArrayList<>(); //파일명 담아넣기 (DB Insert)
		   
	   if(files != null && files.size() > 0) {
		   for(CommonsMultipartFile multifile : files) {
			    
			    String filename = multifile.getOriginalFilename();
			    String path = request.getServletContext().getRealPath("/upload/question/");
				String fpath = path + "\\" + filename;
		
				if(!filename.equals("")) { //파일 쓰기
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(multifile.getBytes());
					fs.close();
				}
				if(filename.equals("")) {
					filename = null;
				}
				filenames.add(filename); //DB insert 파일명	
		   }
	   }
		dto.setQuestion_img(filenames.get(0));
		System.out.println("일단 문제이름:"+dto.getQuestion_num());
		int result = dao.insertQuestion(dto);
		return result;
	}
	@Transactional
	public int insertQuestionChoice(QuestionDto qDto, Question_choiceDto qcDto, HttpServletRequest request) 
			throws IOException, ClassNotFoundException, SQLException{

		int result = 0;		
		String[] question_choice_num;
		String[] question_choice_content;
		
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		//보기 이미지 파일 입력
		List<CommonsMultipartFile> qcFiles = qcDto.getQuestion_choice_files();
		List<String> qcFilenames = new ArrayList<>(); //파일명 담아넣기 (DB Insert)
		   
		   if(qcFiles != null && qcFiles.size() > 0) {
			   for(CommonsMultipartFile multifile : qcFiles) {
				    
				    String filename = multifile.getOriginalFilename();
				    String path = request.getServletContext().getRealPath("/upload/question/");
					String fpath = path + "\\" + filename;
			
					if(!filename.equals("")) { //파일 쓰기
						FileOutputStream fs = new FileOutputStream(fpath);
						fs.write(multifile.getBytes());
						fs.close();
					}
					if(filename.equals("")) {
						filename = null;
					}
					qcFilenames.add(filename); //DB insert 파일명	
					
			   }
		   }
		
		int question_num=qDto.getQuestion_num();
		question_choice_num=qcDto.getQuestion_choice_num().split(",");
		question_choice_content=qcDto.getQuestion_choice_content().split(",");
		
		int imgCount = qcFilenames.size();
			for(int i=0; i<qcFilenames.size(); i++) {
				result=dao.insertQuestionChoice(question_num, question_choice_num[i], question_choice_content[i], qcFilenames.get(i));
				}
			for(int f = imgCount; f<question_choice_num.length; f++) {
				result=dao.insertQuestionChoiceNoImg(question_num, question_choice_num[f], question_choice_content[f]);
			}
		return result;
	}
	
/*##################        재훈 끝              ##################*/
	
	

	/*영준 - 10.10 회원관리 관련 시작 */
	public List<MemberDto> memberList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<MemberDto> result = dao.memberList();
		return result;
	}
	/* 영준 - 10.20 회원권한 선택 셀렉트메뉴 시작 */
	public List<RoleDto> roleList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<RoleDto> result = dao.roleList();
		return result;
	}
	/* 영준 - 10.20 회원권한 선택 셀렉트메뉴 끝 */
	public List<MemberDto> adminMemberView(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<MemberDto> result = dao.adminMemberView();
		return result;
	}
	
	/* 영준 - 10.12 회원관리 회원정보 수정 시작 */
	public int updateMember(MemberDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.updateMember(dto);
		return result;
	}
	/* 영준 - 10.12 회원관리 회원정보 수정 끝 */
	
	/* 영준 - 10.15 회원관리 회원정보 삭제(실제 삭제X) 시작 */
	public int deleteMember(String member_id) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.deleteMember(member_id);
		return result;
	}

	/* 영준 - 10.15 회원관리 회원정보 삭제(실제 삭제X) 끝 */
	
	//양회준 10-22 admin 회원관리 비동기 검색
		public List<MemberDto> memberSearchAjax(String searchRole, String searchClassName, 
				String searchMemberInfo, String searchBox) {
			System.out.println(searchRole+"/"+ searchClassName+"/"+ searchMemberInfo+"/"+ searchBox);
			AdminDao dao = sqlsession.getMapper(AdminDao.class);
			List<MemberDto> result = dao.memberSearchAjax(searchRole, searchClassName, searchMemberInfo, searchBox);		
			System.out.println(result);
			
			return result;
		}
		//양회준 10-23 admin 회원관리 비동기 일괄등록
		public int updateStudentsAjax(ArrayList<String> updateStudentArr) {
			AdminDao dao = sqlsession.getMapper(AdminDao.class);
			int result=0;
			for(String updateStudent : updateStudentArr) {
				System.out.println("service data="+updateStudent);
				result = dao.updateStudentsAjax(updateStudent);		
			}				
			return result;
		}
		//양회준 10-23 admin 회원관리 비동기 일괄삭제
		public int deleteStudentsAjax(ArrayList<String> deleteStudentArr) {
			AdminDao dao = sqlsession.getMapper(AdminDao.class);
			int result=0;
			for(String deleteStudent : deleteStudentArr) {
				System.out.println("service data="+deleteStudent);
				result = dao.deleteStudentsAjax(deleteStudent);		
			}				
			return result;
		}

	
	/*영준 - 10.10 회원관리 관련 끝 */

	
	
	public List<ClassDto> classList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<ClassDto> result = dao.classList();
		return result;
	}
	
	public List<ClassDto> classlist(int class_num){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		ClassDto dto = new ClassDto();
		dto.setClass_num(class_num);
		List<ClassDto> result = dao.classlist(dto);
		return result;
	}
	public int classMemberUpdate(MemberDto dto) {
		AdminDao dao=  sqlsession.getMapper(AdminDao.class);
		int result = dao.classMemberUpdate(dto);
		
		return result;
	}
	/*민지 10.12 클래스멤버 리스트 관리 끝*/

	/*민지 10.13 클래스 멤버 삭제 관련*/
	
	public int classMemberDelete(MemberDto dto) {
		AdminDao dao=  sqlsession.getMapper(AdminDao.class);
		int result = dao.classMemberDelete(dto);
		return result;
	}
	/*민지 10.13 클래스 멤버 삭제 관련 끝*/
	
	/*민지 10.15 클래스 수정 관련*/
	public int classUpdate(ClassDto dto) {
		AdminDao dao=  sqlsession.getMapper(AdminDao.class);
		int result = dao.classUpdate(dto);
		
		return result;
	}
	/*민지 10.15 클래스 수정 끝*/


	// 정원 - 10.15 문제분류 insert 
	public String lgCatAdd(String lgCatAdd) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		String result = dao.lgCatAddIdCheck(lgCatAdd);
		if(result == null) {
		int finalRow = dao.lgCatAddCheak();
		String codeH = "H";
		int finalRowCodeAdd = finalRow + 1;
		String codeNum = String.valueOf(finalRowCodeAdd);
		String code = codeH + codeNum;
		dto.setLg_category_code(code);
		dto.setLg_category_name(lgCatAdd);
		dao.lgCatAdd(dto);
		}else {
			result = "중복";
		}
			return result;
		}
	
	public String mdCatAdd(String selectLgCat, String mdCatAdd) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		String result = dao.mdCatAddIdCheck(mdCatAdd);
		if(result == null) {
		String lgCatCode = dao.lgCatCode(selectLgCat);
		int finalRow = dao.mdCatAddCheck();
		String codeM = "M";
		int finalRowCodeAdd = finalRow + 1;
		String codeNum = String.valueOf(finalRowCodeAdd);
		String code = codeM + codeNum;
		dto.setLg_category_code(lgCatCode);
		dto.setMd_category_code(code);
		dto.setMd_category_name(mdCatAdd);
		dao.mdCatAdd(dto);
		}else {
			result = "중복";
		}
		return result;
	}
	
	public String smCatAdd(String selectMdCat, String smCatAdd) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		String result = dao.smCatAddIdCheck(smCatAdd);
		if(result == null) {
		String mdCatCode = dao.mdCatCode(selectMdCat);
		int finalRow = dao.smCatAddCheck();
		String codeS = "S";
		int finalRowCodeAdd = finalRow + 1;
		String codeNum = String.valueOf(finalRowCodeAdd);
		String code = codeS + codeNum;
		dto.setMd_category_code(mdCatCode);
		dto.setSm_category_code(code);
		dto.setSm_category_name(smCatAdd);
		dao.smCatAdd(dto);
		}else {
			result = "중복";
		}
		return result;
	}
	// 정원 - 10.15 문제분류 insert 끝

	
	// 정원 - 10.16  시작
	public List<CategoryDto> lgProblemCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.lgProblemCategoryList();
		return result;
	}
	public List<CategoryDto> mdProblemCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.mdProblemCategoryList();
		return result;
	}
	public List<CategoryDto> smProblemCategoryList(){
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		List<CategoryDto> result = dao.smProblemCategoryList();
		return result;
	}
	
	// 정원 - 10.16 끝
	
	// 정원 - 10.17 시작
	public int lgUpdate(CategoryDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.lgUpdate(dto);
		return result;
	}
	
	public int mdUpdate(CategoryDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.mdUpdate(dto);
		return result;
	}
	
	public int smUpdate(CategoryDto dto) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = dao.smUpdate(dto);
		return result;
	}
	
	public String lgCatIdCheck(String lgCatName) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		String result = dao.lgCatAddIdCheck(lgCatName);
		return result;
	}
	
	public String mdCatIdCheck(String mdCatName) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		String result = dao.mdCatAddIdCheck(mdCatName);
		return result;
	}
	
	public String smCatIdCheck(String smCatName) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		String result = dao.smCatAddIdCheck(smCatName);
		return result;
	}
	
	/*민지 - 10.17 클래스 수정 이름 중복체크*/
	
	public String classCheck(String class_name) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		String result = dao.classCheck(class_name);
		return result;
	}
	
	/*민지 - 10.17 클래스 수정 이름 중복체크 끝  */

	/* 정원 - 문제분류관리 삭제 */
	public int lgDelete(String lgDeleteCode) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		int result=0;
		List<CategoryDto> mdSearch = dao.questionDeleteMdSearch(lgDeleteCode);
		if(mdSearch.isEmpty()) {
			dto.setLg_category_code(lgDeleteCode);
			result = dao.lgDelete(dto);
			return result;
		}else {
			return result;
		}
	}
	
	public int mdDelete(String mdDeleteCode) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		int result = 0;
		List<CategoryDto> smSearch = dao.questionDeleteSmSearch(mdDeleteCode);
		if(smSearch.isEmpty()) {
			dto.setMd_category_code(mdDeleteCode);
			result = dao.mdDelete(dto);
			return result;
		}else {
			return result;
		}
	}
	
	public int smDelete(String smDeleteCode) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		int result = 0;
		List<CategoryDto> qSearch = dao.questionDeleteSearch(smDeleteCode);
		System.out.println(qSearch);
		CategoryDto dto = new CategoryDto();
		dto.setSm_category_code(smDeleteCode);
		System.out.println(qSearch);
		if(qSearch.isEmpty()) {
			result = dao.smDelete(dto);
			return result;
		}else {
			return result;	
		}
	}
	
	public List<CategoryDto> selectLgList(String lgCode) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		dto.setLg_category_code(lgCode);
		List<CategoryDto> list = dao.selectLgList(dto);
		return list;
	}
	
	public List<CategoryDto> selectMdList(String lgCode) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		dto.setLg_category_code(lgCode);
		List<CategoryDto> list = dao.selectMdList(dto);
		return list;
	}
	
	public List<CategoryDto> selectSmList(String lgCode) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		dto.setLg_category_code(lgCode);
		List<CategoryDto> list = dao.selectSmList(dto);
		return list;
	}
	
	public List<CategoryDto> selectMdRealList(String mdCode) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		dto.setMd_category_code(mdCode);
		List<CategoryDto> list = dao.selectMdRealList(dto);
		return list;
	}
	
	public List<CategoryDto> selectSmRealList(String mdCode) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		dto.setMd_category_code(mdCode);
		List<CategoryDto> list = dao.selectSmRealList(dto);
		return list;
	}
	
	public List<CategoryDto> selectSmRealList2(String smCode) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		CategoryDto dto = new CategoryDto();
		dto.setSm_category_code(smCode);
		List<CategoryDto> list = dao.selectSmRealList2(dto);
		return list;
	}
	/*정원 문제분류 끝*/
	
}
