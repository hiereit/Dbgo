<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.dto.User"%>
<%@ page import="model.dao.UserDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="controller.group.CreateGroupController" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<link
	href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css'
	rel='stylesheet'>
<link href="<c:url value='/css/fonts.css' />" rel='stylesheet' />
<link href="<c:url value='/css/navbar.css' />" rel='stylesheet' />

<title>그룹 생성</title>
<style>
.signIn {
	background: #EFFBEF;
	border-radius: 25px;
	width: 500px;
	margin: auto;
}

.centerElement {
	text-align: center;
	padding-top: 80px;
}

h1 {
	padding-top: 50px;
	font-family: JSDongkang-Regular;
	font-size: 50px;
}

h6 {
	font-family: JSDongkang-Regular;
	font-size: 15px;
}

.groupName, .groupMem {
	padding-top: 50px;
	text-align: left;
	margin-left: 90px;
}

.groupName h5, .groupMem h5 {
	padding-right: 20px;
	font-family: JSDongkang-Regular;
	font-size: 18px;
}

#btnSub {
	margin-top: 70px;
	margin-bottom: 50px;
	font-family: JSDongkang-Bold;
	font-size: 18px;
}

.btn-warning {
	margin-bottom: 5px;
	margin-left: 5px;
}

.btn-primary {
	margin-top: 70px;
	margin-bottom: 50px;
}

#btn {
	font-family: JSDongkang-Regular;
	font-size: 18px;
}


.memList {
	margin-left: 80px;
	padding-top: 20px;
	width: 350px;
}

span {
	font-family: JSDongkang-Regular;
	font-size: 12px;
	margin-right: 5px;
}

.groupName h5, .groupName input {
	display: inline;
}

.groupMem h5, .groupMem input[type="text"], .groupMem input[type="button"]
	{
	display: inline;
	text-align: center;
}

.failMessage{
	text-align: center;
	margin-top: 30px;
}

form {
	margin-bottom: 30px;
}

input {
font-family: JSDongkang-Regular;
	font-size: 15px;
}

</style>

<script>
	function add_btn_click() {
		
		if (form.mem.value == "") {
			form.mem.focus();
			return false;
		}
		
		var $div = $('<span class="badge badge-pill badge-secondary">'
				+ form.mem.value
				+ '</span><input type="hidden" name ="members" value = "' + form.mem.value + '">');
		$('.memList').append($div);
		form.mem.value = "";
	}
	function create_group_btn_click() {
		if (form.name.value == "") {
			alert("그룹명을 입력하십시오.");
			form.name.focus();
			return false;
		}
		form.submit();
	}
</script>
</head>

<body>
	
	<%@include file="/navbar.jsp"%>
	<div class="failMessage">
		<c:if test="${addMemberFailed || creationFailed}">
			<h6 class="text-danger"><c:out value="${exception}"/></h6>
		</c:if>
	</div>

	<form name="form" method="POST" id="f"
		action="<c:url value='/group/create'/>">
		<c:if test="${addMemberFailed}">
			<input type="hidden" name="isFailed" value="true">
			<input type="hidden" name="g_id" value="${group.g_id}">
		</c:if>
		<div class="centerElement">
			<div class="signIn">
				<h1 class="text-primary">그룹 생성</h1>
				<div class="centerInput">
					<div class="groupName">
						<h5>그룹명</h5>
						<input type="text" class="form-control" name="name" placeholder="" id="groupName"
							style="width: 230px; height: 50px;"
							<c:if test="${creationFailed || addMemberFailed}">value="${group.g_name}" readonly</c:if>>
					</div>
					<div class="groupMem">
						<h5>구성원</h5>
							<input type="text" class="form-control" name="mem"
								style="width: 160px; height: 50px;">
							<button type="button"  class="btn btn-warning" id="btn" onClick="add_btn_click()">추가</button>
					</div>
					<div class="memList">
						<c:if test="${!creationFailed}">
							<c:forEach var="member" items="${group.members}">
								<span class="badge badge-pill badge-secondary">${member}</span>
							</c:forEach>
						</c:if>
					</div>
					<button type="button"  class="btn btn-primary" id="btn" onClick="create_group_btn_click()">그룹 생성</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
