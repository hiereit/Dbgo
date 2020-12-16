<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="controller.user.UserSessionUtils"%>
<% boolean isLogined = UserSessionUtils.hasLogined(request.getSession());
   request.setAttribute("isLogined", isLogined); %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
   <a class="navbar-brand" href="<c:url value='/main' />">DBGO!</a>
   <button class="navbar-toggler" type="button" data-toggle="collapse"
      data-target="#navbarColor01" aria-controls="navbarColor01"
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
   </button>

   <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav mr-auto">
      
         <li class="nav-item"><a class="nav-link" href="<c:url value='/schedule/monthly'/>">개인일정</a></li>
         
         <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="<c:url value='/group/list'/>" id="navbardrop"
            data-toggle="dropdown">그룹일정</a>
            <div class="dropdown-menu">
               <a class="dropdown-item" href="<c:url value='/group/list'/>">일정 확인</a> 
               <a class="dropdown-item" href="<c:url value='/group/create/form'/>">그룹 생성</a>
               <a class="dropdown-item" href="<c:url value='/group/update'/>">그룹원 추가</a>
            </div></li>
         <li class="nav-item dropdown"><a
            class="nav-link dropdown-toggle" href="#" id="navbardrop"
            data-toggle="dropdown">일기</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="<c:url value='/diary/list'/>">일기 보기</a>
              <a class="dropdown-item" href="<c:url value='/diary/register'/>">일기 쓰기</a>
            </div></li>
      </ul>
      <button class="btn">
         <i class="fa fa-bell fa-2x" aria-hidden="true" style="color: white;"></i>
      </button>
      
      <a href="<c:url value='/user/view' />">
      <button class="btn">
         <i class="fa fa-address-book fa-2x" aria-hidden="true"
            style="color: white;"></i>
      </button>
      </a>
       <c:choose>
      <c:when test="${isLogined==true}">
         <a href="<c:url value='/user/logout' />">
         <button class="btn">
            <i class="fa fa-sign-out"
               style="font-size:36px; color: white;"></i>
         </button>
         </a>
      </c:when>
      <c:otherwise>
         <a href="<c:url value='/user/login/form' />">
         <button class="btn">
            <i class="fa fa-sign-in" 
               style="font-size:36px; color: white;"></i>
         </button>
         </a>
      </c:otherwise>
      </c:choose> 
   </div>
</nav>
</body>