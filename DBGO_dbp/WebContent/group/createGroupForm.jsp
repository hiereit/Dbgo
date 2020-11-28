<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.dto.User"%>
<%@ page import="model.dao.UserDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
    <link href="<c:url value='/css/fonts.css' />" rel='stylesheet' />
    <link href="<c:url value='/css/navbar.css' />" rel='stylesheet' />
    <script>
function addMembers() {
	// var $ul_id = $("#"+list_area_id).children();
	// var newList = $(" <li>" + list_area_id + "_" + li_list_last_idx + "> </li>");
	//findUser(input);
	//public void findUser(String userId) throws SQLException, UserNotFoundException {
		//User user = UserDAO.findUserInfo(userId);
		//if (user == null) {
			//throw new UserNotFoundException(userId + "는 존재하지 않는 아이디입니다.");
		//}
		//var input = document.getElementById("InputMemberName").value;
		//members.add(input);
		System.out.println(members.size());
	//}
		//document.getElementById("list").innerHTML="";
		 // for (i = 0; i < members.size(); i++) {
		  //  document.getElementById("list").innerHTML+="<h5>" + members.get(i) + "</h5>";
		 // }
}
	</script>
<title>그룹 생성</title>
<style>
.signIn {
	position: absolute;
	top: 60%;
	left: 50%;
	background: #EFFBEF;
	border-radius: 25px;
	width: 500px;
	height: 500px;
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
.groupName {
	position: absolute;
	top: 33%;
	left: 10%;
}
.members {
	position: absolute;
	top: 51%;
	left: 10%;
}
#InputGroupName {
	font: normal normal normal 18px JSDongkang-Regular;
	position: absolute;
	top: 30%;
	left: 30%;
}
#InputMemberName {
	font: normal normal normal 18px JSDongkang-Regular;
	position: absolute;
	top: 48%;
	left: 30%;
}
.list{
	position: absolute;
	top: 67%;
	left: 10%
}
</style>
</head>

<body>
	 <%@include file="/navbar.jsp" %>
	 <%
   		ArrayList<String> members = new ArrayList<String>();
   	 %>
	<form>
		<div class="centerElement">
			<div class="signIn">
				<h1 class="text-primary" style="margin-top:30px;font: normal normal normal 50px JSDongkang-Regular;">그룹 생성</h1>
				<div class="centerInput">
				<h5 class="groupName" style="font: normal normal normal 18px JSDongkang-Regular;">그룹명</h5><input type="text" class="form-control" id="InputGroupName" placeholder="" style="width: 230px; height: 50px; margin-bottom: 5px;"> 
				<h5 class="members" style="font: normal normal normal 18px JSDongkang-Regular;">구성원</h5><input type="text" class="form-control" id="InputMemberName" placeholder="" style="width: 180px; height: 50px; margin-bottom: 5px;">
				<input type="button" class="btn btn-warning" style="width: 75px; height:40px;position: absolute; top: 49%; left: 70%; font: normal normal normal 18px JSDongkang-Regular;" value="추가" onClick="addMembers()">
				</div>
				<div id="list">
				
				</div>
				<button type="submit" class="btn btn-primary" style="width: 150px; height:50px;position: absolute; top: 85%; left: 33%; font: normal normal normal 18px JSDongkang-Regular;">그룹 생성</button>
			</div>
		</div>
	</form>
</body>
</html>
