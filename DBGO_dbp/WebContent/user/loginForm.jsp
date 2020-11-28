<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>
.signIn {
	font: normal normal bold 15px/15px Binggrae !important;
	position: absolute;
	top: 50%;
	left: 50%;
	background: #EFFBEF;
	border-radius: 25px;
	width: 400px;
	height: 400px;
	margin-left: -240px;
	margin-top: -230px;
}

.centerElement {
       text-align: center;
       
}

.centerInput{
	padding-left:50px;
	padding-right:50px;
}
</style>
</head>

<body>
	 <%@include file="/navbar.jsp" %>
	
	<form>
		<div class="centerElement">
			<div class="signIn">
				<br> <br>
				<h1 class="text-primary">Sign up</h1>
				<br>
				<div class="centerInput">
				<input type="email" class="form-control" id="InputEmail" placeholder="id" style="width: 300px; height: 50px; margin-bottom: 5px;"> 
				<input type="password" class="form-control" id="InputPassword" placeholder="Password" style="width: 300px; height: 50px;">
				</div>
				<br><br><br>
				<button type="submit" class="btn btn-primary" style="width: 150px;">로그인</button>
				<br>
				<br><br><br>
				<button type="button" class="btn btn-link">회원가입</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-link">비밀번호 찾기</button>
			</div>
		</div>
	</form>
</body>
</html>
