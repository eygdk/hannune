<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<%@include file="../include/header.jsp"%>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<title>자유게시판</title>
</head>
<body>
		<header>
			<hr />

		<div align="center";>
			<%@include file="nav.jsp"%>
		</div>
		<hr />
			<!-- 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			</style> -->
		</header>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/board/readView?bno=${replyDelete.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
	</script>
	<body>
	<div class="container" style="padding:50px;">
		<div class="card shadow">
		<section id="container">
		<div class="card-body">
		<div id="root" align="center";>
			
				<h1> 댓글 삭제</h1>
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/replyDelete">
					<input type="hidden" name="bno" value="${replyDelete.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
						
					<div>
						<p>댓글을 삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn">예 삭제합니다.</button>
						<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
					</div>
				</form>
			</section>
		</div>
		</div>
		</section>
		</div>
		</div>
		<div class="container-fluid text-white" style="background-color: #77B9F2; margin-top:50px;padding-top:30px;padding-bottom:10px">
	<div class="container">
        <h2>HANUNE</h2>
        <p>http://hunune.nett/</p>
		<p>주소: IT 하누네시 한눈에구 알아보동</p>
		
		<p>사업자번호 : 000-111-222</p>
	</div>
	</div>
	</body>
</html>