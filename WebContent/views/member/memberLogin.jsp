<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="kr.or.iei.member.controller.MemberController" %>
<%@ page import="kr.or.iei.member.model.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jian쇼핑몰</title>
</head>
<body>
	<%
	//여기는 자바코드 부분
	//jsp파일안에서는 request와  response객체를 만들지 않고 사용이 가능함.
	//이러한 객체를 내부에 기본적으로 내장되어 있는 객체라고 표현해서 "내장객체"라고 표현함
	
	//1. 이전 페이지에서 보내온 값 저장 ,파라미터 안의 값은 대소문자 구분 해야 함.
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	
	//이전 페이지에서 보낸값이 정상적으로 가져왔는지 확인하는 코드(System.out은 콘솔에서만 확인.)
	System.out.println(userId + "/" + userPw); 
	
	//2. 비지니스 로직 (jsp -> controller)
	Member m = new MemberController().loginMember(userId, userPw);   //컨트롤러, vo에 대한 import 각 각 필요, 한번 동작하고 끝날거라 변수에 담지 않음.
	//위의 코드는 아까는 메소드가 없어서 오류났고 지금은 만들었는데 여전히 오류 표시 난다. 지우고 저장후 다시 쓰면 오류 안남.

	%>
	<%if(m != null){
		//로그인을 성공했다면
		session.setAttribute("member", m); //세션에 m객체(회원정보)저장해라. "member"이 안의 이름은 개발자 마음대로 정해(대소문자 구분), 그냥 key값이니
		//로그인 성공시 그 화면을 유지하고 싶은건index.jsp임
		System.out.println("<"+m.getUserId()+"/"+m.getUserName()+"> 사용자가 로그인 하였습니다.");
	%>
		<script>location.href="/index.jsp";</script>
		
	<%}else{
	//로그인 실패시
	%>
		<script>alert("로그인실패 \n ID 또는 PW를 확인해주세요!");
		location.href="/index.jsp";
		</script>
	<%}%>
	
	<br>
	<a href="/index.jsp">메인페이지로 이동</a>
</body>
</html>