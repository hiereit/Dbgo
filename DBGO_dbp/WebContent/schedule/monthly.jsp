<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="../static/vendor/jquery/jquery.min.js"></script>
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
      margin-left: 25%;
      padding-top : 10px;
      padding-bottom: 40px;
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
	        top:1148px;right:0;bottom:0;left:0;
	        position:absolute;
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
</style>
<script>
	var isSubSch = false;
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			themeSystem : 'bootstrap',
			
			dateClick: function(info) {
				   //alert('Date: ' + info.dateStr);
				   //alert('Resource ID: ' + info.resource.id);
				    $('#inputScheduleDate').val(info.dateStr);
				   $('#myModal').show(); 
			}
			
		});
		
		calendar.render();
		
		document.getElementById('subBtn').addEventListener('click', function() {
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
			 calendar.addEvent({
	             title: 'dynamic event',
	             start: '2020-11-11'
	             
	           });
			 $('#myModal').hide();
		  });
	});
	function close_pop() {
	     $('#myModal').hide();
	 };
	 
</script>
</head>
<body>
  	<%@include file="/navbar.jsp" %>
    <div id='calendar'></div>
    
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
		<form name="form">
        <fieldset>
          <button id="subBtn" class="btn btn-warning btn-rounded" >등록</button>
          <button data-dismiss="modal" class="btn btn-warning btn-rounded" onClick="close_pop();">취소</button>
          <div class="form-group row" >
            <label for="selectCategory" class="col-md-1 col-form-label"><i class="fa fa-folder" aria-hidden="true"></i></label>
        
              <select class="selectCategory">
                <option selected>카테고리</option>
                <option value="1">기본</option>
                <option value="2">학교</option>
                <option value="3">친구</option>
              </select>
          
          </div>
          <div class="form-group">
            <input type="text" class="form-control-plaintext" id="inputScheduleTitle" placeholder="일정 제목" name="title">
          </div>
          <hr>
          <div class="inputContent">
            <div class="form-group row">
              <label for="inputScheduleDate" class="col-md-1 col-form-label"><i class="far fa-calendar"></i></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputScheduleDate" placeholder="날짜" name="date">
              </div>
            </div>
        <!--     <div class="form-group row">
              <label for="inputAlarm" class="col-md-1 col-form-label"><i class="fa fa-clock-o fa-2x"></i></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputAlarm" placeholder="알람 설정">
              </div>
            </div> -->
            <div class="form-group row">
              <label for="inputUsers" class="col-md-1 col-form-label"><i class="fa fa-users"></i></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputAttens" placeholder="참석자" name="atten">
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