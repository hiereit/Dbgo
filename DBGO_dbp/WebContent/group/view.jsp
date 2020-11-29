<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
<title>My Group View</title>
<style>
table.table-bordered {
	font: normal normal normal 18px JSDongkang-Regular;
	text-align: center;
}

.tdiv {
	border: 2px solid #CCCCCC;
	float: left;
	margin: auto;
	width: 300px;
	height: 510px;
	margin: 10px;
}

.list-group {
	margin: auto;
	width: 305px;
	margin-left: 13px;
	margin-top: 13px;
}

.card {
	position: absolute;
	width: 300px;
	height: 390px;
	left: 51%;
	top: 20%;
	font: normal normal normal 18px JSDongkang-Regular;
}

.wrap {
	position: absolute;
	left: 30%;
	top: 25%;
}

.mb-1 {
	font: normal normal normal 18px JSDongkang-Regular;
}

::placeholder {
	color: #B8B8B8;
}

.inputContent i {
	font-size: 30px/40px;
	color: #B8B8B8;
	padding-bottom: 0px;
	padding-top: 6px;
}

.inputContent input {
	text-align: left;
	font: normal normal normal 18px JSDongkang-Regular;
	letter-spacing: 0px;
	color: #000000;
	opacity: 1;
}

#inputScheduleTitle {
	text-align: left;
	font: normal normal bold 20px JSDongkang-Regular;
	letter-spacing: 0px;
	color: #000000;
	opacity: 1;
}

.btn-rounded {
	width: 60px;
	height: 30px;
	float: right;
	margin-left: 10px;
	border-radius: 40px !important;
	text-align: center;
	font: normal normal bold 15px JSDongkang-Regular !important;
	color: #ffffff;
}

hr {
	margin-top: 15px;
	margin-bottom: 15px;
}

.selectCategory {
	border: 0px;
	outline: 0px;
	padding-left: 20px;
	text-align: left;
	font: normal normal 600 20px JSDongkang-Regular;
	letter-spacing: 0px;
	color: #B8B8B8;
	opacity: 1;
}

.row {
	text-align: center;
}

.modal {
	padding: 61px 69px;
	background: #FFFFFF 0% 0% no-repeat padding-box;
	box-shadow: 0px 3px 50px #CECECE;
	opacity: 1;
	top: 1148px;
	right: 0;
	bottom: 0;
	left: 0;
	position: absolute;
	margin: auto;
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}

h3 {
	position: absolute;
	left: 32%;
	top: 20%;
	font: normal normal 600 20px JSDongkang-Regular;
}

#addBtn {
	position: absolute;
	left: 60%;
	top: 20%;
	font: normal normal 600 15px JSDongkang-Regular;
}

#updateBtn {
	position: absolute;
	left: 67%;
	top: 20%;
	font: normal normal 600 15px JSDongkang-Regular;
}
</style>
<script>
	/* document.getElementById('subBtn').addEventListener('click', function() {
		if (form.title.value == "") {
			alert("일정 제목을 입력하십시오.");
			form.title.focus();
			return false;
		}
		 if (form.date.value == "") {
				alert("날짜를 입력하십시오.");
				form.date.focus();
				return false;
		}
		 $('#myModal').hide();
	  }); */
	function addSchedule() {
		if (form.title.value == "") {
			alert("일정 제목을 입력하십시오.");
			form.title.focus();
			return false;
		}
		if (form.date.value == "") {
			alert("날짜를 입력하십시오.");
			form.date.focus();
			return false;
		}
		form.submit();
	}
	function updateSchedule() {
		if (update.updateTitle.value == "") {
			alert("일정 제목을 입력하십시오.");
			form.title.focus();
			return false;
		}
		if (update.updateDate.value == "") {
			alert("날짜를 입력하십시오.");
			form.date.focus();
			return false;
		}
		update.submit();
	}
	function show_pop() {
		$('#myModal').show();
	}
	function updatenDel() {
		$('#updelModal').show();
	}
</script>
</head>
<body>
	<%@include file="/navbar.jsp"%>
	<h3>${g_name}</h3>
	<button id="addBtn" class="btn btn-warning" onClick="show_pop();">일정
		추가</button>
	<c:if test="${detail}">
		<button id="updateBtn" class="btn btn-secondary"
			onClick="updatenDel();">수정/삭제</button>
	</c:if>
	<div class="wrap">
		<div class="tdiv">
			<table class="table table-bordered">
				<c:forEach var="grpsch" items="${grpschList}">
					<tr>
						<c:choose>
						<c:when test="${fgsch.groupsch_id==grpsch.groupsch_id}">
						<th scope="row" style="background-color:#ffe4e1">${grpsch.groupsch_date}</th>
						<td style="background-color:#ffe4e1">
						</c:when>
						<c:otherwise>
						<th scope="row">${grpsch.groupsch_date}</th>
						<td>
						</c:otherwise>
						</c:choose>
						<a
							href="<c:url value='/group/schedule/view'>
						      <c:param name='groupsch_id' value='${grpsch.groupsch_id}'/>
						      <c:param name='g_id' value='${g_id}'/>
						 </c:url>" class="text-muted">
								${grpsch.title}</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="myModal" class="modal">
			<div class="modal-content">
				<form name="form" method="POST"
					action="<c:url value='/group/schedule/add'/>">
					<fieldset>
						<button type="button" id="subBtn"
							class="btn btn-warning btn-rounded" onClick="addSchedule()">추가</button>
						<a
							href="<c:url value='/group/view'>
						      <c:param name='g_id' value='${g_id}'/>
						 </c:url>">
							<button type="button" class="btn btn-warning btn-rounded">취소</button>
						</a>
						<div class="form-group">
							<input type="hidden" id="g_id" name="g_id" value="${g_id}">
						</div>
						<div class="form-group">
							<input type="text" class="form-control-plaintext"
								id="inputScheduleTitle" placeholder="제목" name="title">
						</div>
						<hr>
						<div class="inputContent">
							<div class="form-group row">
								<label for="inputScheduleDate" class="col-md-1 col-form-label"><i
									class="far fa-calendar"></i></label>
								<div class="col-md-11">
									<input type="text" class="form-control-plaintext"
										id="inputScheduleDate" placeholder="날짜" name="date">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputUsers" class="col-md-1 col-form-label"><i
									class="fas fa-tasks"></i></label>
								<div class="col-md-11">
									<input type="text" class="form-control-plaintext"
										id="inputAttens" placeholder="과제" name="homework">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputMemo" class="col-md-1 col-form-label"><i
									class="fa fa-sticky-note"></i></label>
								<div class="col-md-11">
									<input type="text" class="form-control-plaintext"
										id="inputMemo" placeholder="기록" name="memo">
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<div id="updelModal" class="modal">
			<div class="modal-content">
				<form name="update" method="POST"
					action="<c:url value='/group/schedule/update'/>">
					<fieldset>
						<a
							href="<c:url value='/group/schedule/view'>
						      <c:param name='groupsch_id' value='${groupsch_id}'/>
						      <c:param name='g_id' value='${g_id}'/>
						 </c:url>">
							<button type="button" class="btn btn-warning btn-rounded">취소</button>
						</a>
						<button type="button" id="subBtn"
							class="btn btn-warning btn-rounded" onClick="updateSchedule()">수정</button>
						<a
							href="<c:url value='/group/schedule/delete'>
						      <c:param name='groupsch_id' value='${groupsch_id}'/>
						      <c:param name='g_id' value='${g_id}'/>
						 </c:url>">
							<button type="button" class="btn btn-warning btn-rounded">삭제</button>
						</a>
						<div class="form-group">
							<input type="hidden" id="g_id" name="updateG_id"
								value="${fgsch.g_id}"> <input type="hidden"
								id="groupsch_id" name="updateGroupsch_id"
								value="${fgsch.groupsch_id}">
						</div>
						<div class="form-group">
							<input type="text" class="form-control-plaintext"
								id="inputScheduleTitle" placeholder="제목" name="updateTitle"
								value="${fgsch.title}">
						</div>
						<hr>
						<div class="inputContent">
							<div class="form-group row">
								<label for="inputScheduleDate" class="col-md-1 col-form-label"><i
									class="far fa-calendar"></i></label>
								<div class="col-md-11">
									<input type="text" class="form-control-plaintext"
										id="inputScheduleDate" placeholder="날짜" name="updateDate"
										value="${fgsch.groupsch_date}">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputUsers" class="col-md-1 col-form-label"><i
									class="fas fa-tasks"></i></label>
								<div class="col-md-11">
									<input type="text" class="form-control-plaintext"
										id="inputAttens" placeholder="과제" name="updateHomework"
										value="${fgsch.homework}">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputMemo" class="col-md-1 col-form-label"><i
									class="fa fa-sticky-note"></i></label>
								<div class="col-md-11">
									<input type="text" class="form-control-plaintext"
										id="inputMemo" placeholder="기록" name="updateMemo"
										value="${fgsch.memo}">
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<ul class="list-group">
			<li class="list-group-item list-group-item-warning"
				style="padding-top: 20px; padding-bottom: 20px; text-align: center;">
				<h5 class="mb-1">${fgsch.homework}</h5>
			</li>
		</ul>
		<div class="card border-warning mb-3">
			<div class="card-header">기록</div>
			<div class="card-body">
				<p class="card-text">${fgsch.memo}</p>
			</div>
		</div>
	</div>
</body>
</html>