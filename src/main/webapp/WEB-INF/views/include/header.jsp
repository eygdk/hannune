<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
   contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	
			<!-- 상단 메뉴 부분 -->
<nav class="navbar navbar-expand-md  navbar-dark" style="background-color: #77B9F2;">
	<a class="navbar-brand" href="/">HUNUNE</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
	        data-target="#navMenu">
		<span class="navbar-toggler-icon"></span>        
	</button>
	<div class="collapse navbar-collapse" id="navMenu">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a href="/board/list" class="nav-link">ABOUT</a>
			</li>
			<li class="nav-item">
				<a href="/board/list" class="nav-link">금융소식</a>
			</li>
			<li class="nav-item">
				<a href="/board/list" class="nav-link">자유게시판</a>
			</li>
			<li class="nav-item">
				<a href="/board/list" class="nav-link">문의</a>
			</li>
		</ul>
		
		<ul  class="navbar-nav ml-auto">
			<li class="nav-item">
				<c:if test="${member != null}">
				<a href="../member/memberUpdateView" class="nav-link">마이페이지</a></c:if>
			</li>
			<li class="nav-item">
				<c:if test="${member == null}"> <a href="/member/login" class="nav-link">로그인</a></c:if>
			</li>
			<li class="nav-item">
				<c:if test="${member != null}"> <a href="/member/logout" class="nav-link">로그아웃</a></c:if>
		<li  class="nav-item">
		<c:if test="${member != null}">
			<h2 style=" color:white"  align="right" ></h2> <!--오른쪽 위 로그인 시 확인  -->
			
		</c:if>
		</li>
	<style>
.navbar-nav ml-auto_ul {
    list-style: none;
    padding-left: 0px;
}
</style>
		</ul>
</div>
		</nav>
</body>
</html>
   