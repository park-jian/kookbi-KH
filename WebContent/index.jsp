<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.or.iei.member.model.vo.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jian쇼핑몰</title>
</head>
<body>
	<%
	// 자식객체 = 부모객체(Object)  하려면 다운캐스팅 필요 -> 자식 = (자식타입)부모
	//현재 session에 저장된 객체는 Object Type으로 저장되었기 떄문에
	//Member 타입으로 꺼내려면 다운 캐스팅을 해주어야 정상 처리 될 수 있음.
	Member m = (Member)session.getAttribute("member");
	
	//꺼내온 m 레퍼런스 안에는 둘 중 1개가 들어 있을 것임
	//정상적인 객체(로그인 성공 유저)가 들어 있거나 혹은 null(로그인 실패유저) 이 들어 있을 것임

	%>
	<% if(m!=null){ %>
	[<a href="views/member/memberMyPage.jsp"><%=m.getUserName() %></a>]님 환영합니다.<br>
	<a href="/views/member/memberLogout.jsp">로그아웃</a><br>
	
	<!-- 로그인 한 회원만 탈퇴할 수  있어야 함. -->
	<a href="/views/member/memberWithdraw.jsp" id="withdraw">회원탈퇴</a><br>
	
	<!-- 회원정보 수정은 마이페이지를 누르거나 사용자 이름을 누르면 이동하게 2가지로 제작하겠음 -->
	<a href="views/member/memberMyPage.jsp">마이페이지</a>
	
	<!-- jQuery CDN 라이브러리 -->
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	
	
	<!-- 탈퇴 버튼 클릭했을떄 확인하는 로직(정말 탈퇴 할 것인가?) -->
	<script>
		$(function(){
			$('#withdraw').click(function(){  //클릭이벤트 할때 잘되는지 알럿으로 확인해보는 습관!!
				var result = window.confirm("정말 탈퇴를 진행하시겠습니까?");
				//confirm은 확인버튼을 누르면 true, 취소 버튼을 누르면 false가 들어온다. so result는 boolean이 들어있음.
				
				if(result ==true){
					return true;//a 태그의 href 경로로 이동하는 로직 진행
				} else 
				{
					return false; //a 태그의 href 경로로 이동하는 로직을 진행하지 말아라.
				}

			});

		});

	</script>

	<%}else{ %>
	<H1>로그인</H1>
	<form action="/views/member/memberLogin.jsp" method="post">
		ID : <input type="text" name="userId" placeholder="ID를 입력하세요"/><br>
		PW : <input type="password" name="userPw" placeholder="PW를 입력하세요"/><br>
		<input type="submit" value="로그인"/> <input type="reset" value="취소"/>
			<a href="/views/member/memberJoin.jsp">회원가입</a>
	</form>

	<%} %>
</body>
</html>