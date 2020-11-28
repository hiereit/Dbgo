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
<title>사용자 정보 조회</title>
<script>
	function userRemove() {
		return confirm("정말 삭제하시겠습니까?");
	}
</script>

<style>
table {
	margin-left: 300px;
}

.centerElement {
	text-align: center;
}
</style>

</head>

<body>
	<%@include file="/navbar.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">
		<table class="table table-hover" style="width: 50%">
			<tr>
				<th><span class="badge badge-primary">아이디</span></th>
				<td>${user.u_id}</td>
			</tr>
			<tr>
				<th><span class="badge badge-primary">이름</span></th>
				<td>${user.name}</td>
			</tr>
			<tr>
				<th><span class="badge badge-primary">이메일</span></th>
				<td>${user.email}</td>
			</tr>
			<tr>
				<th><span class="badge badge-primary">그룹</span></th>
				<td><c:forEach var="group" items='${mGroupList}'>
						<li
							class="list-group-item d-flex justify-content-between align-items-center"
							onClick="<c:url value='/group/view'>
		      <c:param name='g_id' value='${group.g_id}'/>
				   </c:url>">
							${group.g_name} <span class="badge badge-secondary badge-pill">${group.numOfMembers}</span>
						</li>
					</c:forEach></td>
			</tr>
		</table>
		<br>
		<div class="centerElement">
			<a class="btn btn-primary"
				href="<c:url value='/user/update/form' />">수정</a>

			<a class="btn btn-warning"
				href="<c:url value='/user/delete'> <c:param name='u_id' value='${user.u_id}'/></c:url>"
				onclick="return userRemove();">탈퇴</a>

			<!-- 수정 또는 삭제가  실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
			<c:if test="${updateFailed || deleteFailed}">
				<h6 class="text-danger">
					<c:out value="${exception.getMessage()}" />
				</h6>
			</c:if>
		</div>
	</div>
</body>