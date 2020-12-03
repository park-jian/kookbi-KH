<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.iei.member.model.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃페이지</title>
</head>
<body>
	<%
	Member m = (Member)session.getAttribute("member");
	
	System.out.println("<"+m.getUserId() + "/" + m.getUserName() + "> 사용자가 로그아웃 하였습니다.");
	//session을 파기 하겠습니다.
	session.invalidate();
	
	//세션 파괴후 , <a>태그 이용해 이동하면 중간에 메인페이지로 이동하는 중간 페이지가 나오니 번거로워서 아래 두가지 방법을 사용함.

	//다른 페이지로 이동시키는 방법
	//1. java코드를 이용하여 이동하는 방법
	//-sendRedirect 메소드는 다른 페이지로 이동시킬때 사용하는 메소드
	//response.sendRedirect("/index.jsp"); //자바코드이용     <--servlet에서 많이 사용
	
	//2. javascript 코드를 이용하여 이동하는 방법
		//아래 <script>태그 내의 방법     //jsp에서 많이 사용함
	%>
	<script>
	location.href="/index.jsp";      
	</script>
</body>
</html>