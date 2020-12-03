<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.or.iei.member.model.vo.Member" %>
    <%@ page import="kr.or.iei.member.controller.MemberController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴 로직을 진행할 공간</title>
</head>
<body>
<% //회원탈퇴를 진행할 로직
    // 회원탈퇴를 위한 userId값을 session에서 꺼내는 작업(유니크 속성인 userNo로도 활용가능. 유니크한 것 어떤것이든 활용 가능)
    //회원에 대한 정보는 session에 들어있음. session ID를 받아와 서버에서 그 사람이 누구인지 알 수 있다.
    Member m = (Member)session.getAttribute("member"); //다운캐스팅인지 아닌지 마우스 가져다 놓으면 알려줌.
	String userId = m.getUserId();   //세션에서 꺼내옴
	
	//비즈니스 로직 진행
	int result = new MemberController().deleteMember(userId);

%>
<%if(result>0){ %>
		<%
			session.invalidate();
		%>
	<script>
		alert("정상적으로 탈퇴 처리 되었습니다.");
		
		location.href="/index.jsp";
		//location.replace("/index.jsp"); 사용자가 실수로 뒤로가기 해서 탈퇴전으로 돌아가는걸 막기 위해서 히스토리를 삭제하여 지금페이지로 다시 못오게 할수 있음.
	</script>
<%}else{ %>
	<script>
		alert("탈퇴가 정상 처리 되지 않았습니다. \n 지속적인 문제 발생시 관리자에게 문의해주세요.");
		location.href="/index.jsp";
	</script>
<%} %>

</body>
</html>