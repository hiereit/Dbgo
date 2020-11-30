<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.dto.Schedule"%>
<% java.util.List<Schedule> schedules = (java.util.List<Schedule>)request.getAttribute("schedules");%>
<!DOCTYPE html>
<html>
<head>
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
    <script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link href="<c:url value='/css/fullcalendar.css' />" rel='stylesheet' />
<script src="<c:url value='/js/fullcalendar.js' />"></script>
<link href="<c:url value='/css/navbar.css' />" rel='stylesheet' />
<link href="<c:url value='/css/fonts.css' />" rel='stylesheet' />
<meta charset="UTF-8">
<title>Monthly Calendar</title>
<style>
    #calendar {
      width: 50%;
      height: 50%;
      margin: auto;
      margin-top : 30px;
      padding-bottom: 40px;
      font: normal normal normal 20px JSDongkang-Regular;
    }
	::placeholder {
        color: #B8B8B8;
    }
      label[for="selectCategory"] {
        padding-bottom: 0px;
        padding-top: 0px;
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
        border-radius: 40px!important;
        text-align: center;
        font: normal normal bold 15px JSDongkang-Regular!important;
        color: #ffffff;
      }
      hr {
        margin-top: 15px;
    	margin-bottom: 15px;
      }
      .selectCategory {
        border:0px;
        outline:0px;
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
	        position:absolute;
	        margin: auto;
	        -moz-border-radius: 50px;
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
        .fc-time{
   display : none;
}
</style>
<script>
	 var calendar;
	 
	 var HashMap = function(obj) {
		 var mapData = (obj != null) ? cloneObject(obj) : new Object();
		 
		 this.put = function(key, value) {
				mapData[key] = value;
			}
		 this.get = function(key) {
				return mapData[key];
			}
		 this.containsKey = function(key) {
				for (var tKey in mapData) {
					if (tKey == key) {
						return true;
					}
				}
				return false;
			}
	 }	 
	 
	 function getFormatDate(date){
		    var year = date.getFullYear();              //yyyy
		    var month = (1 + date.getMonth());          //M
		    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
		    var day = date.getDate();                   //d
		    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
		    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}
	 
	 var memo = new HashMap();
		var category = new HashMap();
	 <%
		for (int i = 0; i < schedules.size(); i++) {
			Schedule s = schedules.get(i);
		%>
		memo.put('<%= s.getSch_id() %>', '<%= s.getMemo() %>');
		category.put('<%= s.getSch_id() %>', '<%= s.getCategory() %>');
		<%
		}%>
	
	document.addEventListener('DOMContentLoaded', function() {
		var initialLocaleCode = 'ko';
		var calendarEl = document.getElementById('calendar');
		
		calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			themeSystem : 'bootstrap',
			dateClick: function(info) {
				    $('#inputScheduleDate').val(info.dateStr);
				   $('#myModal').show(); 
			},
			editable: true,
			events: [
				<%
				for (int i = 0; i < schedules.size(); i++) {
					Schedule s = schedules.get(i);
				%>
				{
					id: '<%= s.getSch_id() %>',
					title: '<%= s.getTitle() %>',
					start: '<%= s.getStart_date() %>',
					end: '<%= s.getEnd_date() %>'+" 20:00:00"
				},
				<%
				}
				%>
			],
			displayEventTime: false,
			headerToolbar: {
			    left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			locale: initialLocaleCode,
			eventClick: function(info) {
			      var eventObj = info.event;
			      $("#myModal2 option:contains(" + category.get(eventObj.id) +")").prop('selected', true);
			      $('#myModal2 #inputScheduleTitle').val(eventObj.title); 
			      $('#myModal2 #inputScheduleDate[name="startDate"]').val(getFormatDate(eventObj.start)); 
			      if (eventObj.end != null) {
			    	  $('#myModal2 #inputScheduleDate[name="endDate"]').val(getFormatDate(eventObj.end)); 
			      }
			      if (memo.containsKey(eventObj.id)) {
			    	  $('#myModal2 #inputMemo').val(memo.get(eventObj.id));
			      }
			      $('#myModal2 form').append('<input type="hidden" name="sch_id" value="'+  eventObj.id +'" >');
			      $('#myModal2').show(); 
			    }
		});
		
		calendar.render();
		
		document.getElementById('subBtn').addEventListener('click', function() {
			if (form.title.value == "") {
				alert("일정 제목을 입력하십시오.");
				form.title.focus();
				return false;
			}
			if (form.startDate.value == "") {
					alert("시작 날짜를 입력하십시오.");
					form.startDate.focus();
					return false;
			}
			if (form.category.value == "카테고리") {
				 alert("카테고리를 선택하십시오.");
					form.category.focus();
					return false;
			 }
		
			form.submit();
	
		  });
		
		document.getElementById('updateBtn').addEventListener('click', function() {
			if (form.title.value == "") {
				alert("일정 제목을 입력하십시오.");
				form.title.focus();
				return false;
			}
			if (form.startDate.value == "") {
					alert("시작 날짜를 입력하십시오.");
					form.startDate.focus();
					return false;
			}
			if (form.category.value == "카테고리") {
				 alert("카테고리를 선택하십시오.");
					form.category.focus();
					return false;
			 }
		
			form.submit();
	
		  });
		document.getElementById('deleteBtn').addEventListener('click', function() {
			form.submit();
		  });
	});

	
</script>


</head>
<body>
  	<%@include file="/navbar.jsp" %>
    <div id='calendar'></div>
    
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
		<form name="form" method="POST" 
		action="<c:url value='/schedule/create'/>">
        <fieldset>
          <button id="subBtn" class="btn btn-warning btn-rounded" >등록</button>
          <a href="<c:url value='/schedule/monthly' />"><button type="button" class="btn btn-warning btn-rounded">취소</button></a>
          <div class="form-group row" >
            <label for="selectCategory" class="col-md-1 col-form-label"><i class="fa fa-folder" aria-hidden="true"></i></label>
        
              <select name="category" class="selectCategory">
                <option selected>카테고리</option>
                <option>기본</option>
                <option>학교</option>
                <option>친구</option>
                <option>STUDY</option>
                <option>공휴일</option>
              </select>
          
          </div>
          <div class="form-group">
            <input type="text" class="form-control-plaintext" id="inputScheduleTitle" placeholder="일정 제목" name="title">
          </div>
          <hr>
          <div class="inputContent">
            <div class="form-group row">
              <label for="inputScheduleDate" class="col-md-1 col-form-label "><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-calendar-range" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
  <path d="M9 7a1 1 0 0 1 1-1h5v2h-5a1 1 0 0 1-1-1zM1 9h4a1 1 0 0 1 0 2H1V9z"/>
</svg></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputScheduleDate" placeholder="시작 날짜" name="startDate">
                <input type="text" class="form-control-plaintext" id="inputScheduleDate" placeholder="마지막 날짜" name="endDate">
              </div>
            </div>
            <div class="form-group row">
              <label for="inputMemo" class="col-md-1 col-form-label"><i class="fa fa-sticky-note"></i></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputMemo" placeholder="메모" name="memo">
              </div>
            </div>
          </div>
        </fieldset>
      </form>
		</div>
		</div>
		
		
		 <div id="myModal2" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
		<form name="form" method="POST" 
		action="<c:url value='/schedule/update'/>">
        <fieldset>
        <button id="deleteBtn" class="btn btn-warning btn-rounded" value="delete" name="btn">삭제</button>
          <button id="updateBtn" class="btn btn-warning btn-rounded" value="update" name="btn">수정</button>
          <a href="<c:url value='/schedule/monthly' />"><button type="button" class="btn btn-warning btn-rounded">취소</button></a>
          <div class="form-group row" >
            <label for="selectCategory" class="col-md-1 col-form-label"><i class="fa fa-folder" aria-hidden="true"></i></label>
        
              <select name="category" class="selectCategory">
                <option selected>카테고리</option>
                <option>기본</option>
                <option>학교</option>
                <option>친구</option>
                <option>STUDY</option>
                <option>공휴일</option>
              </select>
          
          </div>
          <div class="form-group">
            <input type="text" class="form-control-plaintext" id="inputScheduleTitle" placeholder="일정 제목" name="title">
          </div>
          <hr>
          <div class="inputContent">
            <div class="form-group row">
              <label for="inputScheduleDate" class="col-md-1 col-form-label "><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-calendar-range" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
  <path d="M9 7a1 1 0 0 1 1-1h5v2h-5a1 1 0 0 1-1-1zM1 9h4a1 1 0 0 1 0 2H1V9z"/>
</svg></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputScheduleDate" placeholder="시작 날짜" name="startDate">
                <input type="text" class="form-control-plaintext" id="inputScheduleDate" placeholder="마지막 날짜" name="endDate">
              </div>
            </div>
            <div class="form-group row">
              <label for="inputMemo" class="col-md-1 col-form-label"><i class="fa fa-sticky-note"></i></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputMemo" placeholder="메모" name="memo">
              </div>
            </div>
          </div>
        </fieldset>
      </form>
		</div>
		</div>
</body>
</html>