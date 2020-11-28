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
</style>
</head>

<body>
	<!-- navbar 수정 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#">DBGO!</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">AddPlan</a></li>
			</ul>
			<button class="btn">
				<i class="fa fa-bell" aria-hidden="true" style="color: white;"></i>
			</button>
			<button class="btn">
				<i class="fa fa-address-book" aria-hidden="true"
					style="color: white;"></i>
			</button>
			<button class="btn">
				<i class="fa fa-sign-out" aria-hidden="true" style="color: white;"></i>
			</button>
			&nbsp;&nbsp;
		</div>
	</nav>
	<!-- navbar 수정 -->
	<br>
	<br>
	<br>
	<form>
		<div class="centerElement">
			<div class="signIn">
				<br> <br>
				<h1 class="text-primary">Sign up</h1>
				<br> <input type="email" class="form-control" id="InputEmail" placeholder="Email" style="width: 300px; height: 50px; margin-bottom: 5px;"> 
					<input type="password" class="form-control" id="InputPassword" placeholder="Password" style="width: 300px; height: 50px;">
				<br>
				<button type="submit" class="btn btn-primary" style="width: 150px;">로그인</button>
				<br>
				<br>
				<button type="button" class="btn btn-link">회원가입</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-link">비밀번호 찾기</button>
			</div>
		</div>
	</form>
</body>
</html>
