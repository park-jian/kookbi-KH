package kr.or.iei.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.member.model.vo.Member;

public class MemberDAO {

	public Member loginMember(Connection conn, String userId, String userPw) {
		PreparedStatement pstmt = null; //import해
		ResultSet rset = null;
		
		Member m = null;
		
		
		//탈퇴 안한 사람중에 id,pw가 일치하는 사람 찾기
		String query = "select * from member where userid=? and userpw=? and END_YN='N'";
		
		try {
			pstmt = conn.prepareStatement(query); 
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			rset = pstmt.executeQuery(); //쿼리 실행해.
			
			if(rset.next()) {
				m=new Member();
				m.setUserNo(rset.getInt("userno"));
				m.setUserId(rset.getString("userid"));
				m.setUserPw(rset.getString("userpw"));
				m.setUserName(rset.getString("username"));
				m.setAge(rset.getInt("age"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setAddress(rset.getString("address"));
				m.setGender(rset.getString("gender").charAt(0));
				m.setHobby(rset.getString("hobby"));
				m.setEnrollDate(rset.getDate("enrolldate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		//ResultSet은 필요 없음. 결과를 보는 것이 아니니
		String query = "insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?,?,default,'N')"; //모르겠으면 sqldeveloper에 가서 해봐
		
		int result =0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPw());
			pstmt.setString(3, m.getUserName());
			pstmt.setInt(4, m.getAge());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, Character.toString(m.getGender())); //문자1글자를 string으로 바꿔줌. 
			pstmt.setString(9, m.getHobby());
			
			//executeQuery() -> select구문일떄 사용
			//executeUpdate() -> insert, update, delete구문일떄 사용
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, String userId) {
		PreparedStatement pstmt = null; 
		//실제 탈퇴 회원은 그 정보를 삭제하는게 아니라 member테이블에서 END_YN을 Y로 바꾸는 것임
		String query = "UPDATE MEMBER SET END_YN='Y' WHERE userID=?";
		
		int result=0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		//ID를 뺀 7개 업데이트 해야함
		String query = "update member set "
				+ "userPw = ?, "
				+ "age = ?, "
				+ "email = ?, "
				+ "phone =?, "
				+ "address =?, "
				+ "gender =?, "
				+ "hobby = ? where userid=?";
		
		int result =0;
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, m.getUserPw());
			pstmt.setInt(2, m.getAge());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, Character.toString(m.getGender()));
			pstmt.setString(7, m.getHobby());
			pstmt.setString(8, m.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}

}
