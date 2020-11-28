<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>사용자 정보 수정</title>
<script>
function userModify() {
	if (form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.password.focus();
		return false;
	}
	if (form.password.value != form.password2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.name.focus();
		return false;
	}
	form.submit();
}
</script>

<style>
.signUp {
	font: normal normal bold 15px/15px Binggrae !important;
	top: 15%;
	left: 50%;
	background: #EFFBEF;
	border-radius: 25px;
	width: 700px;
	margin-top: 5em;
	margin-bottom: 5em;
	margin-left: 25em;
	margin-right: 20em;
	padding: 30px;
}

.centerElement {
	text-align: center;
}

table {
	margin-left: 50px;
}

td {
	width: 83%;
	padding-left: 50px;
}

.failMessage {
	text-align: center;
	margin-top: 3em;
}
</style>
</head>
<body style="overflow: scroll">
	<%@include file="/navbar.jsp"%>
	<form name="form" method="POST" action="<c:url value='/user/update' />">
		<input type="hidden" name="userId" value="${user.userId}" />
		<div class="form-group row">
			<label class="col-lg-2 col-form-label">사용자 ID</label>
			<div class="col-lg-10">
				<p class="form-control-static">${user.userId}</p>
			</div>
		</div>
		<div class="form-group row">
			<label for="password" class="col-lg-2 col-form-label">비밀번호</label>
			<div class="col-lg-10">
				<input type="password" name="password" class="form-control"
					value="${user.password}">
			</div>
		</div>
		<div class="form-group row">
			<label for="password2" class="col-lg-2 col-form-label">비밀번호
				확인</label>
			<div class="col-lg-10">
				<input type="password" name="password2" class="form-control"
					value="${user.password}">
			</div>
		</div>
		<div class="form-group row">
			<label for="name" class="col-lg-2 col-form-label">이름</label>
			<div class="col-lg-10">
				<input type="text" name="name" class="form-control"
					value="${user.name}">
			</div>
		</div>
		<div class="form-group row">
			<label for="email" class="col-lg-2 col-form-label">이메일 주소</label>
			<div class="col-lg-10">
				<input type="text" name="email" class="form-control"
					value="${user.email}">
			</div>
		</div>
		
		<br>
		<div class="form-group">
			<input type="button" class="btn btn-primary" value="수정"
				onClick="userModify()"> <a
				href="<c:url value='/user/list' />" class="btn btn-link">사용자 목록
			</a>
		</div>
	</form>
</body>
</html>
</body>
</html>