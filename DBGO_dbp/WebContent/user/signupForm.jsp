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
</style>
</head>

<body style="overflow: scroll">
	<%@include file="/navbar.jsp"%>

	<form>
		<div class="centerElement">
			<div class="signUp">
				<h1 class="text-primary">Sign up</h1>
				<br><br>
				<table>
					<tr>
						<th><label for="exampleInputEmail1">아이디</label></th>
						<td><input type="text" class="form-control" id="InputId" style="width: 300px; height: 40px; margin-bottom: 10px;"></td>
					</tr>
					<tr>
						<th><label for="exampleInputEmail1">이메일</label></th>
						<td><input type="email" class="form-control" id="InputEmail1"
							aria-describedby="emailHelp" placeholder="Enter email"
							style="width: 300px; height: 40px; margin-bottom: 10px;"></td>
					</tr>

					<tr>
						<th>비밀번호</th>
						<td><input type="password" class="form-control"
							id="InputPassword"
							style="width: 300px; height: 40px; margin-bottom: 10px;"></td>
					</tr>

					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" class="form-control"
							id="InputPassword"
							style="width: 300px; height: 40px; margin-bottom: 10px;"></td>
					</tr>
				</table>
				<br>
				<br>
				<button type="submit" class="btn btn-primary"
					style="margin-bottom: 15px; height: 40px;">확인</button>
				<br>
			</div>
		</div>
	</form>
</body>
</html>
