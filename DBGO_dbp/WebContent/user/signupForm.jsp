<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>회원가입</title>
<style>
.signUp {
	font: normal normal bold 15px/15px Binggrae !important;
	position: absolute;
	top: 50%;
	left: 50%;
	background: #EFFBEF;
	border-radius: 25px;
	width: 700px;
	height: 670px;
	margin-left: -380px;
	margin-top: -300px;
}
.centerElement {
       text-align: center;
       
}
</style>
</head>
<body>
	<%@include file="/navbar.jsp"%>
	<form>
		<div class="centerElement">
			<div class="signUp">
				<br> <br>
				<h1 class="text-primary">Sign up</h1><br>
				 이메일<input type="text" class="form-control" id="InputEmail"
					style="width: 200px; height: 40px;">@
				<div class="mail-group">
					<select class="custom-select" style="width: 170px; height: 40px;">
						<option selected="selected">naver.com</option>
						<option value="1">gmail.com</option>
						<option value="2">daum.com</option>
						<option value="3">hanmail.com</option>
					</select>
				</div>
				비밀번호<input type="password" class="form-control" id="InputPassword"
					style="width: 200px; height: 40px; margin-bottom: 10px;">
				비밀번호 확인<input type="password" class="form-control"
					id="InputPassword"
					style="width: 200px; height: 40px; margin-bottom: 10px;">
				전화번호
				<div class="phone-group">
					<select class="custom-select" style="width: 100px; height: 40px;">
						<option selected="selected">010</option>
						<option value="1">011</option>
						<option value="2">012</option>
						<option value="3">013</option>
					</select>
				</div>
				- <input type='text' class="form-control"
					style="text-align: center; width: 100px; height: 40px; margin-right: 5px;">-
				<input type='text' class="form-control"
					style="text-align: center; width: 100px; height: 40px; margin-right: 5px;"><br>
				인증번호<input type="text" class="form-control"
					style="text-align: center; width: 150px; height: 40px; margin-right: 5px;">
				<button type="button" class="btn btn-primary"
					style="margin-bottom: 15px; height: 40px;">확인</button>
				<br>
				<button type="submit" class="btn btn-primary"
					style="width: 150px; height: 40px;">회원가입</button>
			</div>
		</div>
	</form>
</body>
</html>
