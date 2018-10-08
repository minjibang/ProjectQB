package onet.com.index.dao;

import onet.com.vo.MemberDto;

public interface IndexDao {

	public int loginCheck(MemberDto dto);

	public String authCheck(MemberDto dto);

}
