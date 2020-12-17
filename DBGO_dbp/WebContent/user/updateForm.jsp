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
<title>회원 정보 수정</title>
<script>
	function userModify() {
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
		form.submit();
	}
</script>
<style>
.signUp {
	font-family: JSDongkang-Bold !important;
	font-size: 15px;
	top: 15%;
	left: 50%;
	background: #EFFBEF;
	border-radius: 25px;
	width: 700px;
	margin-top: 5em;
	margin-bottom: 5em;
	padding: 30px;
}

.centerElement {
	width: fit-content;
	padding-top: 30px;
	margin: auto;
	text-align: center;
}

table {
	margin: 40px auto;
}

td {
	width: 83%;
	padding-left: 50px;
}

.failMessage {
	text-align: center;
	margin-top: 3em;
}

h1 {
	font-family: JSDongkang-Bold !important;
}

.btn-primary {
	font-family: JSDongkang-Regular !important;
}
</style>
</head>
<body style="overflow: scroll">
	<%@include file="/navbar.jsp"%>
	<div class="centerElement">
		<form name="form" method="POST"
			action="<c:url value='/user/update' />">
			<div class="signUp">
				<h1 class="text-primary">회원정보 수정</h1>
				<table>
					<tr>
						<th><label>ID</label></th>
						<td><input class="form-control" id="readOnlyInput"
							name="u_id" type="text" value="${user.u_id}" readonly
							style="width: 300px; height: 40px; margin-bottom: 10px;">
						</td>
					</tr>
					<tr>
						<th><label for="name">이름</label></th>
						<td><input class="form-control" id="readOnlyInput"
							name="name" type="text" placeholder="${user.name}" readonly
							style="width: 300px; height: 40px; margin-bottom: 10px;">
						</td>
					</tr>
					<tr>
						<th><label for="email">이메일</label></th>
						<td><input class="form-control" id="readOnlyInput"
							name="email" type="text" placeholder="${user.email}" readonly
							style="width: 300px; height: 40px; margin-bottom: 10px;">
						</td>
					</tr>
					<tr>
						<th><label for="password">비밀번호</label></th>
						<td><input type="password" name="password"
							class="form-control" value="${user.password}"
							style="width: 300px; height: 40px; margin-bottom: 10px; font-family: san-serif;">
						</td>
					</tr>
					<tr>
						<th><label for="passwordConfirm">비밀번호 확인</label></th>
						<td><input type="password" name="passwordConfirm"
							class="form-control" value="${user.password}"
							style="width: 300px; height: 40px; margin-bottom: 10px; font-family: san-serif;">
						</td>
					</tr>
				</table>
				<div class="form-group">
					<input type="button" class="btn btn-primary" value="수정"
						onClick="userModify()" style="height: 40px;">
				</div>
			</div>
		</form>
	</div>
</body>
</html>