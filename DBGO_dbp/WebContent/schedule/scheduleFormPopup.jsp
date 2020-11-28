<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
    <link href="<c:url value='/css/fonts.css' />" rel='stylesheet' />
    <link href="<c:url value='/css/navbar.css' />" rel='stylesheet' />
    
<title>Schedule Form</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>  
  <style>
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
	<%@include file="/navbar.jsp" %>
	<div id="form-div" align="center">
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