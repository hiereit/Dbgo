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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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

.inputContent i {
	font-size: 30px;
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
	font-family: JSDongkang-Bold;
	font-size: 20px;
	letter-spacing: 0px;
	color: #000000;
	opacity: 1;
}

.btn-warning, .btn-secondary {
	font-family: JSDongkang-Regular;
	font-size: 18px;
	margin-left: 5px;
}

hr {
	margin-top: 15px;
	margin-bottom: 15px;
}
.row {
	text-align: center;
	font-family: JSDongkang-Regular;
	font-size: 18px;
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
	font-family: JSDongkang-Regular;
}

h3, #addBtn, #updateBtn {
	display: inline;
}

#addBtn, #updateBtn {
	float: right;
}

.cards {
	float: right;
	padding-left: 15px;
}

.homework {
	min-height: 120px;
}

.memo {
	min-height: 415px;
}

.wrap {
	padding-top: 50px;
	width: fit-content;
	margin: auto;
}

.titleNBtn {
	margin-bottom: 15px;
}
</style>
<script>
	$( function(){
	    $("#inputScheduleDate, #updateScheduleDate").datepicker({
	    	dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	    });
	  } );
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
			update.title.focus();
			return false;
		}
		if (update.updateDate.value == "") {
			alert("날짜를 입력하십시오.");
			update.date.focus();
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

	<div class="wrap">
		<div class="titleNBtn">
			<h3>${g_name}</h3>
			<c:if test="${detail}">
				<button id="updateBtn" class="btn btn-secondary"
					onClick="updatenDel();">수정/삭제</button>
			</c:if>
			<button id="addBtn" class="btn btn-warning" id="btn"
				onClick="show_pop()">일정 추가</button>
		</div>
		<div class="sch">
			<div class="tdiv">
				<table class="table table-bordered">
					<c:forEach var="grpsch" items="${grpschList}">
						<tr>
							<c:choose>
								<c:when test="${fgsch.groupsch_id==grpsch.groupsch_id}">
									<th scope="row" style="background-color: #ffe4e1">${grpsch.groupsch_date}</th>
									<td style="background-color: #ffe4e1"><a
										href="<c:url value='/group/schedule/view'>
						      <c:param name='groupsch_id' value='${grpsch.groupsch_id}'/>
						      <c:param name='g_id' value='${g_id}'/></c:url>"
										class="text-muted"> ${grpsch.title}</a></td>
								</c:when>
								<c:otherwise>
									<th scope="row">${grpsch.groupsch_date}</th>
									<td><a
										href="<c:url value='/group/schedule/view'>
						      <c:param name='groupsch_id' value='${grpsch.groupsch_id}'/>
						      <c:param name='g_id' value='${g_id}'/></c:url>"
										class="text-muted"> ${grpsch.title}</a></td>
								</c:otherwise>
							</c:choose>

						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="cards">
				<div class="card border-warning mb-3 homework">
					<div class="card-header">과제</div>
					<div class="card-body">
						<p class="card-text">${fgsch.homework}</p>
					</div>
				</div>
				<div class="card border-warning mb-3 memo">
					<div class="card-header">기록</div>
					<div class="card-body">
						<p class="card-text">${fgsch.memo}</p>
					</div>
				</div>
			</div>
		</div>
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
								<input type="text" class="form-control-plaintext" id="inputScheduleDate" name="date" placeholder="날짜" readonly>
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
								<input type="text" class="form-control-plaintext" id="inputMemo"
									placeholder="기록" name="memo">
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
								<input type="text" class="form-control-plaintext" id="updateScheduleDate" name="updateDate" value="${fgsch.groupsch_date}" readonly>
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
								<input type="text" class="form-control-plaintext" id="inputMemo"
									placeholder="기록" name="updateMemo" value="${fgsch.memo}">
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>