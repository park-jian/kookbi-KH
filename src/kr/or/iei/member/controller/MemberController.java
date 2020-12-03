package kr.or.iei.member.controller;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

public class MemberController {
	MemberService mService = new MemberService(); //계속 쓰니 객체 만들고, import필요
 public Member loginMember(String userId, String userPw) {
	 Member m= mService.loginMember(userId, userPw);
	 
	 //만약 정상적으로 가져왔다면 객체 정보가 있을것.
	 //정상적으로 가져오지 못했다면 (id,pw틀리거나 로직 잘못된경우) null값이 들어 있을것.
	// System.out.println(m);
	 return m;
 }
 public int insertMember(Member m) {
	 	int result = mService.insertMember(m);
	 	return result;
 }
 public int deleteMember(String userId) {
	 	
	 int result = mService.deleteMember(userId);
	 return result;
 }
 public int updateMember(Member m) {
	 int result = mService.updateMember(m);
	 return result;
	
 }
}
