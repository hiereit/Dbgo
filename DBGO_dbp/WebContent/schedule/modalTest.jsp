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
<script src="../static/vendor/jquery/jquery.min.js"></script>
<link href="<c:url value='/css/fullcalendar.css' />" rel='stylesheet' />
<script src="<c:url value='/js/fullcalendar.js' />"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			themeSystem : 'bootstrap'		
		});
		
		calendar.render();
	});
	

</script>
<meta charset="UTF-8">
<title>ModalTest Calendar</title>
<style>
.navbar-brand {
            text-align: left;
            font: normal normal bold 30px/60px Binggrae;
            letter-spacing: 0px;
            color: #FCC416;
            opacity: 0.6;
    }
    .nav-link {
          font: normal normal normal 12px/15px Binggrae;
    }
    #calendar {
      width: 50%;
      height: 50%;
      margin-left: 25%;
      padding-top : 10px;
      padding-bottom: 40px;
    }
    html{
      	overflow-y: scroll;
        /* height:100%; */
      }
      body{
      	/* position: fixed; */
      	/* width: 100%; */
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
        font: normal normal normal 30px/40px Binggrae;
        letter-spacing: 0px;
        color: #000000;
        opacity: 1;
      }
      #inputScheduleTitle {
        text-align: left;
        font: normal normal bold 41px/55px Binggrae;
        letter-spacing: 0px;
        color: #000000;
        opacity: 1;
      }
      #form-div {
        background: #FFFFFF 0% 0% no-repeat padding-box;
        box-shadow: 0px 3px 50px #CECECE;
        opacity: 1;
       	position:absolute;
        top : 20%; left:20%; 
        /*padding-top : 30px; */

        -moz-border-radius: 50px;
        -webkit-border-radius: 50px;
        
      	width: 50%;
    	margin:auto;
      }
      
      fieldset{
       padding: 60px 70px;
      }
      /* #inputFile {
        display: inline-block;
        padding: .3em;
        color: #b8b8b8;
        font-size: inherit;
        line-height: normal;
        vertical-align: middle;
        cursor: pointer;
      } */
      .btn-rounded {
        width: 100px;
        height: 50px;
        float: right;
        border-radius: 40px!important;
        text-align: center;
        font: normal normal bold 30px/40px JSDongkang-Regular!important;
        color: #FFFFFF;
      }
      hr {
        margin-top: 35px;
        margin-bottom: 35px;
      }
      .selectCategory {
        border:0px;
        outline:0px;
        text-align: left;
        font: normal normal 600 24px/32px JSDongkang-Regular;
        letter-spacing: 0px;
        color: #B8B8B8;
        opacity: 1;
      }
      .row {
        text-align: center;
      }

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <a class="navbar-brand" href="#">DBGO!</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto">
            <a class="nav-link active" href="#" data-toggle="modal" data-target="#form-div">&nbsp;&nbsp;&nbsp;빠른 일정 추가</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"></a>
          </li>
        </ul>
        <button class="btn"><i class="fa fa-bell fa-2x" aria-hidden="true" style="color:white;"></i></button>
        <button class="btn"><i class="fa fa-address-book fa-2x" aria-hidden="true" style="color:white;"></i></button>
        <button class="btn"><i class="fa fa-sign-out fa-2x" aria-hidden="true" style="color:white;"></i></button>
      </div>
    </nav>
    
	<div id="form-div" align="center"  role="dialog">
      <form>
        <fieldset>
          <button type="submit" class="btn btn-warning btn-rounded">등록</button>
          <div class="form-group row" >
            <label for="selectCategory" class="col-md-1 col-form-label"><i class="fa fa-folder fa-2x" aria-hidden="true"></i></label>
            
            <div>
              <select class="selectCategory">
                <option selected>카테고리</option>
                <option value="1">기본</option>
                <option value="2">학교</option>
                <option value="3">친구</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <input type="text" class="form-control-plaintext" id="inputScheduleTitle" placeholder="일정 제목">
          </div>
          <hr>
          <div class="inputContent">
            <div class="form-group row">
              <label for="inputScheduleDate" class="col-md-1 col-form-label"><i class="fa fa-calendar-o fa-2x" aria-hidden="true"></i></label>
              <div class="col-md-11">
                <input type="date" class="form-control-plaintext" id="inputScheduleDate" placeholder="날짜">
              </div>
            </div>
            <div class="form-group row">
              <label for="inputAlarm" class="col-md-1 col-form-label"><i class="fa fa-clock-o fa-2x" aria-hidden="true"></i></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputAlarm" placeholder="알람 설정">
              </div>
            </div>
            <!-- <div class="form-group row">
              <label for="inputFile" class="col-md-1 col-form-label"><i class="fa fa-paperclip fa-2x" aria-hidden="true"></i></label>
              <div class="col-md-11">
                <input type="file" class="form-control-file" id="inputFile" aria-describedby="fileHelp">
              </div>
            </div> -->
            <div class="form-group row">
              <label for="inputUsers" class="col-md-1 col-form-label"><i class="fa fa-users fa-2x" aria-hidden="true"></i></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputUsers" placeholder="참석자">
              </div>
            </div>
            <div class="form-group row">
              <label for="inputMemo" class="col-md-1 col-form-label"><i class="fa fa-sticky-note fa-2x" aria-hidden="true"></i></label>
              <div class="col-md-11">
                <input type="text" class="form-control-plaintext" id="inputMemo" placeholder="메모">
              </div>
            </div>
          </div>
        </fieldset>
      </form>
    </div>

</body>
</html>