<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="#">DBGO!</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarColor01" aria-controls="navbarColor01"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown">개인일정</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">일정 확인</a> <a
						class="dropdown-item" href="#">일정 추가</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown">그룹일정</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">일정 확인</a> <a
						class="dropdown-item" href="#">일정 추가</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown">일기</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">일기 확인</a> <a
						class="dropdown-item" href="#">일기 쓰기</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="#">랭킹보기</a></li>
		</ul>
		<button class="btn">
			<i class="fa fa-bell fa-2x" aria-hidden="true" style="color: white;"></i>
		</button>
		<button class="btn">
			<i class="fa fa-address-book fa-2x" aria-hidden="true"
				style="color: white;"></i>
		</button>
		<button class="btn">
			<i class="fas fa-sign-out-alt fa-2x" aria-hidden="true"
				style="color: white;"></i>
		</button>
	</div>
</nav>