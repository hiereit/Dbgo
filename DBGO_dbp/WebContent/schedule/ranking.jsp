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
<title>랭킹확인</title>

<style>
.centerElement {
	margin: auto;
	width: 500px;
	text-align: center;
	padding: 30px
}

table {
	font-family: JSDongkang-Regular;
	
	border: 3px solid white;
	border-radius: 8px;
}

#rankNumCol {
	width: 20%;
	background-color: #ffe38a;
}
#userIdCol{
	background-color: #fff4d1;
}

/**/
tbody>tr {
	counter-increment: aaa;
}

tbody>tr>td:first-child:before {
	content: counter(aaa) " ";
}
/**/
</style>

</head>
<body>
	<%@include file="/navbar.jsp"%>

	<br>
	<table class="table table-hover centerElement">
		<thead>
			<tr class="table-warning">
				<th scope="col">순위</th>
				<th scope="col">아이디</th>
			</tr>
		</thead>
		<tbody>
			<!-- 
			<c:forEach var="user" items="${userList}">
				<tr>
					<td id="rankNum"></td>
					<td>${user.u_id}</td>
				</tr>
			</c:forEach> -->
			
			<!-- 예시: 이건 나중에 지우고 위에 있는 forEach문 사용-->
			<tr>
				<td id="rankNumCol"></td>
				<td id="userIdCol">seonho__kim</td>
			</tr>
			<tr>
				<td id="rankNumCol"></td>
				<td id="userIdCol">go_jisuk</td>
			</tr>
			<!--  -->
		</tbody>
	</table>

</body>
</html>