<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.or.iei.member.model.vo.Member" %>
    <%@ page import="kr.or.iei.member.controller.MemberController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정페이지</title>
	<style>
		fieldset{
			width :300px;
			height : 400px;
			margin : 0 auto;
		}
		legend{
			text-align: center;
		}
	
	
	</style>



</head>
<body>

	<%
	 //session에서 데이터를 가져와서 보여주기
	 Member m = (Member)session.getAttribute("member");
	
	
	//이 과정을 진행하면 갱신된 데이터를 m에 덮어 씌움
	m = new MemberController().loginMember(m.getUserId(), m.getUserPw()); //로그인 하는 메소드
	//현재 로직은 갱신 필요성을 설명하기 위해서 loginMember메소드를 활용했지만
	//실제 구현시에는 갱신용 별도 메소드를 구현하기를 바랍니다. (ex. renewalMember())
	//이유는 loginMember메소드는 id와 pw를 활용하는데, 만약 중간에 변경된 데이터가 비밀번호가 변경되었다면
	//session에 저장되어 있는 비밀번호로는 loginMember메소드가 정상작동할 수 없기 떄문에
	//userNo나 userId만 가지고 갱신하는 메소드가 별도로 있는게 정상 처리 될 수 있음.
	
	session.setAttribute("member", m);  //세션에도 갱신된 데이터 넣어주긴
	
	 
	 %>






<!-- form안에서 버튼태그 만들고, 클릭하면 버튼태그는 기본적으로 submit 동작한다. 그떄에는 버튼태그의 type에 button이라 주면 submit 동작 안함 -->

<script>
//	$(function(){
	//	$('#ageBtn').click(function(){
		//	$('input[name=age]').removeAttr('readOnly');
	//	});
//	});  //근데 작동 안한다..왜..? ㅠㅠ


</script>


	<!-- 아래 form은 memberJoin.jsp의 회원가입 폼을 그대로 사용할 것임 -->

<form action="/views/member/memberUpdate.jsp" method="post">
	<fieldset>
		<legend>나의 정보</legend>
		회원ID :<%=m.getUserId() %><br>
<!--<input type="text" name="userId" value="<%=m.getUserId() %>" readOnly="true"/><br>  -->
		<!-- 회원ID는 수정 하면 안되니 보여주기만 해야 함. readOnly="true"로.... -->
		비밀번호 : <input type="password" name="userPw" value="<%=m.getUserPw() %>"/><br>
		비밀번호(re) : <input type="password" name="userPw_re" value="<%=m.getUserPw() %>"/><br>
		이름 :  <%=m.getUserName() %><br> <!--ID같이 못바꾸게 하거나 이름처럼 표현 하기도 함 -->
		나이 :  <input type="text" name="age" size="3" value="<%=m.getAge() %>" readOnly="true"/>
			<button type="button" id="ageBtn">변경</button>
		<br>
		이메일 :  <input type="email" name="email" value="<%=m.getEmail() %>"/><br>
		휴대폰 :  <input type="text" name="phone" value="<%=m.getPhone() %>"/><br>
		 주소 : <input type="text" name="address" value="<%=m.getAddress() %>"/><br>
		 성별 :  
		 <%if(m.getGender()=='M'){ %>
		 	 <input type="radio" name="gender" value="M" checked/>남
		 	 <input type="radio" name="gender" value="F" />여<br>
		 <%}else{ %>
		  	 <input type="radio" name="gender" value="M"/>남
		 	 <input type="radio" name="gender" value="F" checked/>여<br>
		 <%} %>
		 
	<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	
	
	<!-- hobby취미를 처리하기 위한 javaScript(jQuery) 코드 -->	 
		 <script>
			<%	
			//자바코드
		 		String [] hobbyValues = m.getHobby().split(", "); //ex)등산, 독서가 선택되어 있다 하더라도 우리는 각각 따로 값을 받아와야함. 컴마띄어쓰기 한칸 구분자로 잘라 배열에저장!
		 	%>
		 	$(function(){
		 		var js_hobbyValues = new Array();   
		 		
		 	//	js_hobbyValues.push('운동');이렇게 짜기 위해 아래 자바코드 짠것임.
		 		<%
		 		//자바코드
		 		
		 			for(int i=0; i<hobbyValues.length;i++){
		 		%>
		 			js_hobbyValues.push('<%=hobbyValues[i]%>');
		 		<%
		 			}
		 			
		 		%>
		 		
		 		
		 		//가져온 취미값을 js에서 해당 태그를 찾아서 checked부여하기
		 		var $boxs = $('input[name=hobby]');  //6개 checkbox 타입인 input 태그를 가져옴
		 		
		 		//찾은 6개의 input 태그들을 각각 function처리 하여라. (filter메소드)
		 		
		 		$boxs.filter(function(){
		 			
		 			//js_hobbyValues에 저장된 취미 만큼 반복문을 동작 시켜라
		 			for(var i =0; i<js_hobbyValues.length;i++){
		
		 				//만약 js_hobbyValues의 i번에 있는 정보(ex.운동)와 현재 input 태그의 value가 같아면
		 				//checked하고 아니면 checked를 하지 말아라.
		 				if(js_hobbyValues[i]==$(this).val()){
		 					$(this).prop('checked',true);
		 				}
		 			}
		 			
		 			
		 		});
		 	});
 	
		 </script>

		 	 취미 : <br>
		 	  <input type="checkbox" name="hobby" value="운동"/>운동
		 	  <input type="checkbox" name="hobby" value="등산"/>등산
		 	  <input type="checkbox" name="hobby" value="독서"/>독서<br>
		 	  <input type="checkbox" name="hobby" value="노래"/>노래
		 	  <input type="checkbox" name="hobby" value="댄스"/>댄스
		 	  <input type="checkbox" name="hobby" value="기타"/>기타<br><br><br><br>
		 	  <input type="submit" value="정보수정"/>
		 	  <input type="reset" value="취소"/>
		 	  <a href="/index.jsp">메인페이지로 돌아가기</a>
	</fieldset>



</form>



</body>
</html>