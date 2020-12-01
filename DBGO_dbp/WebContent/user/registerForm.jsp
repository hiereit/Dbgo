<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>회원가입</title>

<script>
function userCreate() {//주석
	if (form.u_id.value == "") {
		alert("사용자 ID를 입력하십시오.");
		form.u_id.focus();
		return false;
	} 
	if (form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.password.focus();
		return false;
	}
	if (form.password.value != form.passwordConfirm.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.name.focus();
		return false;
	}
	if (form.name.value == "") {
		alert("이름을 입력하십시오.");
		form.name.focus();
		return false;
	}
	var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(emailExp.test(form.email.value)==false) {
		alert("이메일 형식이 올바르지 않습니다.");
		form.email.focus();
		return false;
	}

	form.submit();
}
</script>


<style>
.signUp {
	font-family: JSDongkang-Bold!important;
	font-size: 15px;
	top: 15%;
	background: #EFFBEF;
	border-radius: 25px;
	width: 650px;
	margin-bottom: 5em;
	text-align: center;
	padding: 30px;
}

.centerElement {
		width: fit-content;
       padding-top: 30px;
		margin: auto;
}

table {
	margin: auto;
	}

td {
	width: 83%;
	padding-left: 50px;
}

.failMessage{
	text-align: center;
	margin-top: 3em;
}

.btn-primary {
font-family: JSDongkang-Regular;
	font-size: 16px;
}

h1 {
font-family: JSDongkang-Bold!important;
}

</style>
</head>

<body style="overflow: scroll">
	<%@include file="/navbar.jsp"%>

	<!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
	<div class="failMessage">
		<c:if test="${registerFailed}">
			<h6 class="text-danger"><c:out value="${exception.getMessage()}"/></h6>
		</c:if>
	</div>	  

	<div class="centerElement">
		<form name="form" method="POST" action="<c:url value='/user/register' />">
			<div class="signUp">
				<h1 class="text-primary">Sign up</h1>
				<table style="margin-top: 50px;">
					<tr>
						<th><label for="u_id">아이디</label></th>
						<td><input type="text" class="form-control" name="u_id" style="width: 300px; height: 40px; margin-bottom: 10px;"></td>
					</tr>
					
					<tr>
						<th><label for="name">이름</label></th>
						<td><input type="text" class="form-control" name="name"
							style="width: 300px; height: 40px; margin-bottom: 10px;"
							<c:if test="${registerFailed}">value="${user.name}"</c:if> >  </td>
					</tr>
					
					<tr>
						<th><label for="email">이메일</label></th>
						<td><input type="email" class="form-control" name="email"
							aria-describedby="emailHelp" placeholder="example@dongduk.ac.kr"
							style="width: 300px; height: 40px; margin-bottom: 10px;"
							<c:if test="${registerFailed}">value="${user.email}"</c:if> > </td>
					</tr>

					<tr>
						<th><label for="password">비밀번호</label></th>
						<td><input type="password" class="form-control" name="password"
							style="width: 300px; height: 40px; margin-bottom: 10px; font-family:san-serif;"> </td>
					</tr>

					<tr>
						<th><label for="passwordConfirm">비밀번호 확인</label></th>
						<td><input type="password" class="form-control" name="passwordConfirm"
							style="width: 300px; height: 40px; margin-bottom: 10px; font-family:san-serif;">
						</td>
					</tr>
				</table>
				<input type="button" class="btn btn-primary" value="가입" onClick="userCreate()"
					style="margin: 20px; height: 40px;">
			</div>
		</form>
	</div>
</body>
</html>
