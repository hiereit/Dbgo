<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="controller.user.UserSessionUtils"%>
<% boolean isLogined = UserSessionUtils.hasLogined(request.getSession());
	request.setAttribute("isLogined", isLogined); %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="<c:url value='/main' />">DBGO!</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarColor01" aria-controls="navbarColor01"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="<c:url value='/schedule/monthly'/>" id="navbardrop"
				data-toggle="dropdown">ê°ì¸ì¼ì </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="<c:url value='/schedule/monthly'/>">ì¼ì  íì¸</a> <a
						class="dropdown-item" href="#">ì¼ì  ì¶ê°</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="<c:url value='/group/list'/>" id="navbardrop"
				data-toggle="dropdown">ê·¸ë£¹ì¼ì </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="<c:url value='/group/list'/>">ì¼ì  íì¸</a> <a
						class="dropdown-item" href="#">ì¼ì  ì¶ê°</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown">ì¼ê¸°</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">ì¼ê¸° íì¸</a> <a
						class="dropdown-item" href="#">ì¼ê¸° ì°ê¸°</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="#">ë­í¹ë³´ê¸°</a></li>
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
				<i class="fas fa-sign-out-alt fa-2x" aria-hidden="true"
					style="color: white;"></i>
			</button>
			</a>
		</c:when>
		<c:otherwise>
			<a href="<c:url value='/user/login/form' />">
			<button class="btn">
				<i class="fas fa-sign-in-alt fa-2x" aria-hidden="true"
					style="color: white;"></i>
			</button>
			</a>
		</c:otherwise>
		</c:choose> 
	</div>
</nav>