<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.or.iei.member.model.vo.Member" %>
    <%@ page import="kr.or.iei.member.controller.MemberController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//회원정보 수정 로직을 진행하기 위하여 이전 페이지에서 보내온 정보를 저장
	//누구의 정보를 바꿀지에 대한 회원 구분 데이터가 필요함 - 유니크 속성을 가진 데이터야함(userNo 또는 userId)
//userId를 받아와야 하는데  마이페이지에서 <input type="hidden" 으로 해서 value를 넘겨주면..그걸 악용해 해킹 당할 수 있으니 중요 데이터는 그렇게 하지마. 세션에서 꺼내와


//Member m= ((Member)session.getAttribute("member");
//String userId = m.getUserId();   이 두 코드를 아래처럼 한줄로 표현 가능.
String userId = ((Member)session.getAttribute("member")).getUserId();

//꺼내줄때 한글 코딩 있을수 있어서 인코딩 작업 필요.. memberInsert 에 있는거 가져옴.
request.setCharacterEncoding("utf-8");

//이름이랑 id는 바꾸지 않았으니..지워요.
String userPw = request.getParameter("userPw");
int age = Integer.parseInt(request.getParameter("age"));
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
char gender = request.getParameter("gender").charAt(0);
String [] hobbyValues=request.getParameterValues("hobby");     //여러개 값 가져올때 getParametervalues, 취미는 데이터가 여러개 일 수 있음.
String hobby = hobbyValues[0];

for(int i=1; i<hobbyValues.length; i++){
	hobby = hobby + ", " + hobbyValues[i];
}

Member m = new Member();
m.setUserId(userId); //id는 담아야함.
m.setUserPw(userPw);
//m.setUserName(userName); 이름은 안바꾸니 필요없어.
m.setAge(age);
m.setEmail(email);
m.setPhone(phone);
m.setAddress(address);
m.setGender(gender);
m.setHobby(hobby);

int result = new MemberController().updateMember(m);

%>

<%if(result>0){ %>
	<script>
		alert("회원정보 수정완료!");
		location.replace("/views/member/memberMyPage.jsp");
	
	</script>
<%}else{ %>
	<script>
		alert("회원정보 변경실패 \n 지속적인 문제 발생시 관리자에게 문의 바랍니다.!");
		location.replace("/views/member/memberMyPage.jsp");
	</script>
<%} %>


</body>
</html>