package kr.or.iei.member.model.service;

import java.sql.Connection;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.member.model.dao.MemberDAO;
import kr.or.iei.member.model.vo.Member;

public class MemberService {
	//Service 역할
	//Connection 객체 생성 + DAO 연결
	//여기서는 템플릿을 사용함.
	
	MemberDAO mDAO = new MemberDAO(); //객체생성, import필요
	public Member loginMember(String userId, String userPw) {
		Connection conn=JDBCTemplate.getConnection(); //import필요
		Member m = mDAO.loginMember(conn, userId, userPw);
		JDBCTemplate.close(conn);
		return m;
	}
	public int insertMember(Member m) {
		Connection conn=JDBCTemplate.getConnection();
		int result= mDAO.insertMember(conn, m);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int deleteMember(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.deleteMember(conn, userId);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int updateMember(Member m) {
		Connection conn=JDBCTemplate.getConnection();
		int result = mDAO.updateMember(conn, m);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
