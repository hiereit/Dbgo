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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css'
	rel='stylesheet'>
<link href="<c:url value='/css/fonts.css' />" rel='stylesheet' />
<link href="<c:url value='/css/navbar.css' />" rel='stylesheet' />
<title>일기 리스트</title>
<style>
table.table-bordered {
	font: normal normal normal 18px JSDongkang-Regular;
	text-align: center;
}

body {
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

#createDiary {
	/* loat: right; */
	
}

.diaryBox { /*일기 조회 메인 Div  */
	/* border: 1px solid black; */
	box-shadow: 0px 3px 50px #CECECE;
	border-radius: 25px;
	width: 40%;
	height: 100%;
	margin: 0px auto;
	margin-top: 30px;
	padding: 20px;
}

#col_index { /*index 칼럼*/
	width: 180px;
	text-align: center;
	font-family: JSDongkang-Regular;
	font-size: 18px;
}

#col_date {
	width: 200px;
	text-align: center;
	font-family: JSDongkang-Bold;
	font-size: 18px;
}

#col_content {
	text-align: center;
	font-family: JSDongkang-Regular;
	font-size: 12px;
}

tr {
	border-bottom: 2px solid #E8E8E8;
}

table { /*테이블의 위치 */
	margin: auto;
}

h3, .btn-warning {
	display: inline;
}

.btn-warning {
	font-family: JSDongkang-Regular;
	font-size: 13px;
	float: right;
}

.form-control-plaintext, .btn-secondary {
	font-family: JSDongkang-Regular;
	font-size: 13px;
	display: inline;
	text-align: center;
}

.dateBox {
	margin-top: 20px;
}
</style>
<script>
	$(function() {
		$("#searchDate").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					showOtherMonths : true,
					showMonthAfterYear : true,
					changeYear : true,
					changeMonth : true,
					yearSuffix : "년",
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ]
				});
	});
</script>
</head>
<body>
	<%@include file="/navbar.jsp"%>
	<div class="diaryBox">
		<div class="titleBox">
			<h3>
				<a href="<c:url value='/diary/list'/>"
					style="text-decoration: none; color: grey;"><b>${u_id}</b>님의
					일기장</a>
			</h3>
			<a href="<c:url value='/diary/register'/>"><button
					class="btn btn-warning">일기 쓰기</button></a>
			<div class="dateBox">
				<form name="form" method="POST"
					action="<c:url value='/diary/list'/>">
					<input type="text" style="width: 100px;"
						class="form-control-plaintext" id="searchDate" placeholder="날짜 선택"
						name="searchDate" readonly>
					<button class="btn btn-secondary"
						style="width: 50px; height: 30px; margin: auto;">검색</button>
				</form>
			</div>
		</div>
		<hr>
		<div class="dairyTable">
			<table>
				<tr>
					<td id="col_index"><b>index</b></td>
					<td id="col_date">날짜</td>
				</tr>
				<c:forEach var="diary" items="${mDiaryList}" varStatus="status">
					<tr>
						<td style="text-align: center">${status.count}</td>
						<td style="text-align: center"><a
							href="<c:url value='/diary/view'>
		      <c:param name='d_id' value='${diary.d_id}'/>
				   </c:url>">${diary.d_date}</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>