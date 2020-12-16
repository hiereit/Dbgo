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
<title>Insert title here</title>
<style>
.centerElement {
	width: fit-content;
	padding-top: 30px;
	margin: auto;
}

.diaryDetail {
	font-family: JSDongkang-Bold!important;
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
 #form-div {
      	padding: 61px 69px;
        background: #FFFFFF 0% 0% no-repeat padding-box;
        box-shadow: 0px 3px 50px #CECECE;
        opacity: 1;
        position:absolute;
        -webkit-border-radius: 50px;
        width: 50%;
      }
</style>
</head>
<body>
	<%@include file="/navbar.jsp"%>
	<br>
	<div class="centerElement diaryDetail">
		<div class="card border-success mb-3" style="max-width: 80rem;">
			<div class="card-header">날짜: ${diary.diaryDate}</div>
			<div class="card-body">
				<p class="card-text">${diary.content}</p>
			</div>
		</div>
	</div>
</body>
</html>