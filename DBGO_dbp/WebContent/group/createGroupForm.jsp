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
    

<title>그룹 생성</title>
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
				<h1 class="text-primary">그룹 생성</h1>
				<br><br><br><br>
				<div class="centerInput">
				그룹명  <input type="text" class="form-control" id="InputGroupName" placeholder="" style="width: 300px; height: 50px; margin-bottom: 5px;"> 
				</div>
				<br><br><br><br><br><br><br><br><br>
				<button type="submit" class="btn btn-primary" style="width: 150px;">그룹 생성</button>
				<br>
				<br><br><br>
			</div>
		</div>
	</form>
</body>
</html>
