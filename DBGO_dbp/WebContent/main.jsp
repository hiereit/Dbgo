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
<title>DBGO!-main</title>

<style>
.center {
	background-color: #fff;
	text-align: center;
	line-height: 80vh;
	
	margin-top: 40px;
	margin-bottom: 40px;
	margin-left: -100px;
	margin-right: 100px;
	width: 1300px;
}

.menu {
	width: 400px;
	height: 400px;
	border-radius: 50%;
	display: inline-flex;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.26);
	color: white;
	justify-content: center;
	align-items: center;
	font-weight: bold;
	font-size: 30px;
	font: normal normal bold 30px/40px Binggrae !important;
}
</style>
</head>
<body>
	<%@include file="/navbar.jsp"%>
	<div class="container">
		<div class="center">
			<a href="<c:url value='/user/login/form' />"> <span class="menu" style="background-color: #FDB3B1;">개인 일정</span></a>
			<a href="<c:url value='' />"><span class="menu" style="background-color: #FED88C">실시간 랭킹</span></a>
			<a href="<c:url value='' />"><span class="menu" style="background-color: #7EE5D5;">그룹 일정</span></a>
		</div>
	</div>
</body>
</html>