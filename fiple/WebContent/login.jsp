<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // 입력폼에 대한 인코딩 처리
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 로그인</title>
<link rel="icon" href="imgs/FIPLE파비콘.ico">
<link rel="stylesheet" href="fontAwesome/css/font-awesome.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/sub.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/index.js"></script>
<script>
	function loginCheck( ) {
		if(document.loginFrm.id.value == "") {
			// document(html문서), loginFrm(form 태그의 이름), id(input 태그의 이름), value(값) > 만약 아이디 입력폼(document.loginFrm.id)에 사용자가 값을 입력하지 않았으면
			alert("아이디를 입력해 주세요."); // 경고창을 띄운다.
			document.loginFrm.id.focus( ); // 아이디 입력폼에 커서를 위치시킨다.
			return;
		}
		if(document.loginFrm.pwd.value == "") {			
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.pwd.focus( );
			return;
		}
		
		document.loginFrm.submit( ); // 서브밋 버튼 기능 실행
	}
	
</script>
</head>
<body>
	<div class="log-wrap">
		<h2>Members Log-In</h2>
<%
	if(id != null) { // 세션 객체에 id 값이 있을 때(로그인 했을 때)
		if(id.equals("admin")){
%>
		<p class="welcome">
			<strong><span class="glyphicon glyphicon-user"></span>&nbsp; 관리자</strong>님 환영합니다.
		</p>
		<button><a href="logout.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-log-out"></span>&nbsp; 로그아웃</a></button>
<%
		}}else {
%>
		<form name="loginFrm" method="post" action="loginPro.jsp" class="logFrm">
			<ul>
				<li><input type="text" name="id" placeholder="아이디"  class="form-control" autofocus></li>
				<li><input type="password" name="pwd" placeholder="비밀번호" class="form-control"></li>
				<li>
					<button onclick="loginCheck( )"> 로그인</button>
				</li>
			</ul>		
		</form>
<%
	}
%>
	</div>
</body>
</html>











