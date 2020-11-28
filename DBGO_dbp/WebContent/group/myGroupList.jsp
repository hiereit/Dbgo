<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>My Group List</title>
    <style>
      i {
        padding-right: 10px;
      }
      .list {
        margin:auto;
        width: 40%;
        padding-top: 100px;
        font: normal normal normal 15px JSDongkang-Regular;
      }
      h2 {
      	padding-left: 5px;
        font: normal normal normal 40px JSDongkang-Regular;
      }
      button {
      	padding-top: 5px;
      	float: right;
        border-radius: 10px!important;
        text-align: left;
        font: normal normal bold 16px JSDongkang-Regular!important;
        color: #000000;
      }
      .title button, .title h2 { display: inline; }
    </style>
  </head>
  <body>
  <%@include file="/navbar.jsp" %>
    <div class="list">
    	<div class="title">
	    	<h2>나의 그룹</h2>
	      	<button type="button" class="btn btn-warning">그룹 추가</button>
    	</div>
      <ul class="list-group" style=" padding-top: 30px;">
        <li class="list-group-item d-flex justify-content-between align-items-center" onClick="alert('그룹명 1')">
          그룹명 1
          <span class="badge badge-secondary badge-pill">14</span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
          그룹명 2
          <span class="badge badge-secondary badge-pill">2</span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
          그룹명 3
          <span class="badge badge-secondary badge-pill">1</span>
        </li>
      </ul>
    </div>
  </body>
</html>