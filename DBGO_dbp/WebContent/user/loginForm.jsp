<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<c:url value='/css/fonts.css' />" rel='stylesheet' />
<link href="<c:url value='/css/navbar.css' />" rel='stylesheet' />

<title>로그인</title>
<script>
function login() {
	if (form.u_id.value == "") {
		alert("사용자 ID를 입력하십시오.");
		form.userId.focus();
		return false;
	} 
	if (form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.password.focus();
		return false;
	}		
	form.submit();
}
</script>

<style>
.signIn {
	font-family: JSDongkang-Bold;
	font-size: 15px;
	top: 15%;
	left: 50%;
	background: #EFFBEF;
	border-radius: 25px;
	width: 400px;
	height: 400px;

	margin-bottom: 5em;
	margin-left: 35em;
	margin-right: 20em;
	padding: 30px;;
}

.centerElement {
       text-align: center;
       padding: 30px
}

.centerInput{
	padding-left:20px;
	padding-right:50px;
}
.failMessage{
	text-align: center;
	margin-top: 3em;
}
</style>
</head>

<body>
	 <%@include file="/navbar.jsp" %>
	<!-- 로그인이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
	<div class="failMessage">
		<c:if test="${loginFailed}">
			<h6 class="text-danger"><c:out value="${exception.getMessage()}"/></h6>
		</c:if>
	</div>	  
	
	<form name="form" method="POST" action="<c:url value='/user/login' />">
		<div class="centerElement">
			<div class="signIn">
				<h1 class="text-primary">Sign up</h1>
				<div class="centerInput">
				<input type="text" class="form-control" name="u_id" placeholder="id" style="width: 300px; height: 50px; margin-bottom: 5px;"> 
				<input type="password" class="form-control" name="password" placeholder="Password" style="width: 300px; height: 50px;">
				</div>
				<input type="button" class="btn btn-primary" value="로그인" onClick="login()" style="width: 150px;">
				<a href="<c:url value='/user/register/form' />"><button type="button" class="btn btn-link">회원가입</button></a>
				<button type="button" class="btn btn-link">비밀번호 찾기</button>
			</div>
		</div>
	</form>
</body>
</html>
