<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	fieldset{
	width:500px;
	height:400px;
	margin:0 auto;
	}
	legend{
	text-align: center;
	}




</style>
</head>
<body>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>



	<script>
	$(function(){
		$('form').submit(function(){
			var $userId = $('input[name=userId]');
			//Id 정규표현식 사용해봄.
			//소문자 시작, 소문자+숫자 포함하여 5 ~ 10글자
			if(!(/^[a-z][a-z0-9]{4,9}$/.test($userId.val()))){
				alert("ID 입력을 재확인 해주세요!");
				return false;
			}	
			
			return true;
			
			
		});
		$('input[name]').focusin(function(){
			//입력창 클릭하면 하늘색
			$(this).css('background-color','skyblue');
			switch($(this).attr('name')){
			case "userId" : $(this).next().text("소문자+숫자 포함하여 5~10글자 가능");
			console.log($(this)); break;
			case "userPw" : $(this).next().text("으악");
			console.log($(this)); break;
			case "userPw_re" : $(this).next().text("왜 안나와");
			console.log($(this)); break;
			case "userName" : $(this).next().text("흥");
			console.log($(this)); break;
			case "age" : $(this).next().text("어쩔");
			console.log($(this)); break;
			}
		});
		$('input[name]').focusout(function(){
			//다른곳 클릭하면 하얀색(벗어나면)
			$(this).css('background-color','white');
			$(this).next().text("");
		});
	});
</script>


<form action="/views/member/memberInsert.jsp" method="post">
	<fieldset>
		<legend>회원가입</legend>
		회원ID : <input type="text" name="userId" placeholder="ID를 입력하세요"/><span></span><br>
		비밀번호 : <input type="password" name="userPw" placeholder="PW를 입력하세요"/><br>
		비밀번호(re) : <input type="password" name="userPw_re" placeholder="PW를 재입력하세요"/><br>
		이름 :  <input type="text" name="userName" placeholder="이름을 입력하세요"/><br>
		나이 :  <input type="text" name="age" size="3" placeholder="나이를 입력하세요"/><br>
		이메일 :  <input type="email" name="email" placeholder="이메일을 입력하세요"/><br>
		휴대폰 :  <input type="text" name="phone" placeholder="폰번호를 입력하세요"/><br>
		 주소 : <input type="text" name="address" placeholder="주소를 입력하세요"/><br>
		 성별 :  <input type="radio" name="gender" value="M"/>남
		 	 <input type="radio" name="gender" value="F" checked/>여<br>
		 	 취미 : <br>
		 	  <input type="checkbox" name="hobby" value="운동"/>운동
		 	  <input type="checkbox" name="hobby" value="등산"/>등산
		 	  <input type="checkbox" name="hobby" value="독서"/>독서<br>
		 	  <input type="checkbox" name="hobby" value="노래"/>노래
		 	  <input type="checkbox" name="hobby" value="댄스"/>댄스
		 	  <input type="checkbox" name="hobby" value="기타"/>기타<br><br><br><br>
		 	  <input type="submit" value="회원가입"/>
		 	  <input type="reset" value="취소"/>
		 	  <a href="/index.jsp">메인페이지로 돌아가기</a>
	</fieldset>



</form>
</body>
</html>