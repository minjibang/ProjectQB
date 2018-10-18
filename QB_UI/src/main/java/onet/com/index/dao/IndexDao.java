package onet.com.index.dao;

import java.util.List;

import onet.com.vo.ClassDto;
import onet.com.vo.MemberDto;

public interface IndexDao {

	public int insertMember(MemberDto dto);
	
	public String joinCheckId(String memeberid);

	public String idSearch(MemberDto dto);
	
	public int pwdSearch(MemberDto dto);
	
	public List<ClassDto> classList();
}
