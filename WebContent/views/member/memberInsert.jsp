<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import=" kr.or.iei.member.model.vo.Member" %>
    <%@ page import="kr.or.iei.member.controller.MemberController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 로직 처리</title>
</head>
<body>
	<%
	//이전 페이지에서 보내온 값 안에 한글이 들어있을 경우에는 인코딩 작업을 해주어야 함.
	request.setCharacterEncoding("utf-8");
	
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userName = request.getParameter("userName");
	int age = Integer.parseInt(request.getParameter("age"));
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	char gender = request.getParameter("gender").charAt(0);
	String [] hobbyValues=request.getParameterValues("hobby");     //여러개 값 가져올때 getParametervalues, 취미는 데이터가 여러개 일 수 있음.
	String hobby = hobbyValues[0];
	
	for(int i=1; i<hobbyValues.length; i++){
		hobby = hobby + "," + hobbyValues[i];
	}
	
	
	
	
	//System.out.println(hobby);
	// System.out.println(userId); 잘 넘어오는지 확인해보자.. 다른것들도...
	//System.out.println(hobbyValues[0]); 취미는 값이 여러개일때 배열로 저장되니 인덱스로 하나씩 꺼내와야 함.
	Member m = new Member();
	m.setUserId(userId);
	m.setUserPw(userPw);
	m.setUserName(userName);
	m.setAge(age);
	m.setEmail(email);
	m.setPhone(phone);
	m.setAddress(address);
	m.setGender(gender);
	m.setHobby(hobby);
	
	int result = new MemberController().insertMember(m);
	
	%>
	<%if(result>0){ %>
		<script>
		alert("회원가입이 정상적으로 처리 되었습니다.");
		</script>
	<%}else{ %>
		<script>
		alert("회원가입이 실패하였습니다. \n 지속된 문제 발생시 관리자에게 문의하세요.!");
		</script>
	<%} %>
	
	<script>
		location.href="/index.jsp";    
	</script>
</body>
</html>