<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.dto.User"%>
<%@ page import="model.dao.UserDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<title>그룹 회원 추가</title>
<style>
.addGroupMember {
	background: #EFFBEF;
	border-radius: 25px;
	width: 500px;
	margin: auto;
	margin-bottom: 50px;
}

.centerElement {
	text-align: center;
	padding-top: 50px;
}

h1 {
	padding-top: 30px;
	font: normal normal normal 50px JSDongkang-Regular;
}

h6 {
	font: normal normal normal 15px JSDongkang-Regular;
}

.groupName, .groupMem {
	padding-top: 30px;
	text-align: left;
	margin-left: 90px;
}

.groupName h5, .groupMem h5 {
	padding-right: 20px;
	font: normal normal normal 18px JSDongkang-Regular;
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
	font-family: JSDongkang-Bold;
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

.failMessage {
	text-align: center;
	margin-top: 3em;
}

.addMemBtn {
	font-family: JSDongkang-Bold;
	font-size: 18px;
	margin-top: 70px;
	margin-bottom: 50px;
}

input, select {
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
	function update_group_btn_click() {
		if (form.g_id.value == "") {
			alert("추가할 그룹을 선택하십시오.");
			form.name.focus();
			return false;
		}
		if (from.mem.value == "") {
			alert("그룹에 추가할 회원을 입력하십시오.");
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
			<h6 class="text-danger">
				<c:out value="${exception.getMessage()}" />
			</h6>
		</c:if>
	</div>
	<form name="form" method="POST" action="<c:url value='/group/update'/>">
		<div class="centerElement">
			<div class="addGroupMember">
				<h1 class="text-primary">그룹원 추가</h1>
				<div class="centerInput">
					<div class="groupName">
						<div class="form-group">
							<h5>
								<label>그룹 선택</label>
							</h5>
							<select id="groupSelect" name="g_id" class="form-control"
								style="width: 80%; height: 50px;">
								<c:forEach var="group" items="${mGroupList}">
									<option value="${group.g_id}">${group.g_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="groupMem">
						<h5>
							<label for="exampleSelect1">추가할 회원의 ID</label>
						</h5>
						<input type="text" class="form-control" name="mem"
							style="width: 70%; height: 50px;">
						<button type="button" class="btn btn-warning" id="btn"
							onClick="add_btn_click();">추가</button>
					</div>
					<div class="memList">
						<c:if test="${!creationFailed}">
							<c:forEach var="member" items="${group.members}">
								<span class="badge badge-pill badge-secondary">${member}</span>
							</c:forEach>
						</c:if>
					</div>
					<button class="btn btn-primary addMemBtn" id="btn"
						onClick="update_group_btn_click()">그룹원 추가</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>