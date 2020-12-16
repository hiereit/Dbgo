<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>My Diary View</title>
<style>

table.table-bordered {
	font: normal normal normal 18px JSDongkang-Regular;
	text-align: center;
}
body{
	font-family: JSDongkang-Regular;
}

.tdiv {
	border: 1px solid #cccccc;
	float: left;
	margin: auto;
	width: 300px;
	height: 550px;
}

.list-group {
	margin: auto;
	width: 305px;
	margin-left: 13px;
	margin-top: 13px;
}

.card {
	width: 300px;
	font: normal normal normal 18px JSDongkang-Regular;
}

.mb-1 {
	font: normal normal normal 18px JSDongkang-Regular;
}

::placeholder {
	color: #B8B8B8;
}
#createDiary  {
	/* loat: right; */
}
.diaryBox{/*일기 조회 메인 Div  */
	/* border: 1px solid black; */
	box-shadow: 0px 3px 50px #CECECE;
	border-radius: 25px;
	width: 50%;
	height: 100%;
	margin: 0px auto;
	margin-top : 30px;
	padding : 20px;
}
#col_index{ /*index 칼럼*/
	width: 80px;
	text-align: center;
	font-family: JSDongkang-Regular;
	font-size: 15px;
	
}
#col_date{
	width: 120px;
	text-align: center;
	font-family: JSDongkang-Regular;
	font-size: 15px;
}
#col_content{
	text-align: center;
	font-family: JSDongkang-Regular;
	font-size: 12px;
}
#createDiary {
	font-family: JSDongkang-Regular;
	font-size: 18px;
	color: #ffffff;
	margin-left: 5px;
	float: right;
	background-color: #ffce67;
	border: 0px;
	border-radius: 12px;
}
h3, button{
	display: inline;
}
tr{
	 border-bottom: 2px solid #E8E8E8;
}
table{ /*테이블의 위치 */
	margin:auto;	
}
</style>

</head>
<body>
	<%@include file="/navbar.jsp"%>
	
	<div class="diaryBox">
		<div class="titleBox">
			<div>
				<h3>${u_id}<b>세라</b>님의 일기장</h3>
				<button id="createDiary" onClick="createDiary">일기 쓰기</button>
			</div>
		</div>
		<hr><!-- ------------------------------------------------------------ -->
		<div class="dairyTable">
				<table>
					<tr>
						<td id="col_index"><b>index</b></td> 	<!-- 갯수 counter '1'부터 시작 -->
						<td id="col_date"><b>날짜</b></td>		<!--날짜-->
					</tr>
					<c:forEach var="diary" items="${mDiaryList}" varStatus="status">
						<tr>
							<td>${status.count}</td> 	
							<td>${diary.d_date}</td>		
						</tr>
					</c:forEach>
				<%-- 	<tr>
						<td id="col_index">01</td> 	<!-- 갯수 counter '1'부터 시작 -->
						<td id="col_date"><a href="<c:url value='/diary/viewDetail'/>">2020-06-09</a></td>		<!--날짜-->
					</tr>
					<tr>
						<td id="col_index">02</td> 	<!-- 갯수 counter '1'부터 시작 -->
						<td id="col_date">2020-12-10</td>		<!--날짜-->
					</tr>
					<tr>
						<td id="col_index">03</td> 	<!-- 갯수 counter '1'부터 시작 -->
						<td id="col_date">2020-12-18</td>		<!--날짜-->
					</tr>
					<tr>
						<td id="col_index">04</td> 	<!-- 갯수 counter '1'부터 시작 -->
						<td id="col_date">2021-01-10</td>		<!--날짜-->
					</tr> --%>	
			</table>	
		</div>	
	</div>
</body>
</html>