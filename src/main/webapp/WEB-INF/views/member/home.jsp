<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
   contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>Home</title>
<html>
<%@include file="../include/header.jsp"%>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<br />
<script type="text/javascript">
   $(document).ready(function() {
      $("#logoutBtn").on("click", function() {
         location.href = "../member/home";
      })
      $("#registerBtn").on("click", function() {
         location.href = "../member/register";
      })
      $("#memberUpdateBtn").on("click", function() {
         location.href = "../member/memberUpdateView";
      })
      $("#memberDeleteBtn").on("click", function() {
         location.href = "../member/memberDeleteView";
      })
      $("#memberRegister").on("click", function() {
         location.href = "../member/register";
      })
   })
</script>
<body>
<div class="container" style="padding:100px;">
		<div class="card shadow">
		<section id="container">
		<div class="card-body">
	<div id="root" align="center">
		<header>
			<h1 style="color:#2793F2;">로그인</h1>
		</header>
   <form name='homeForm' method="post" action="/member/login">
      <c:if test="${member == null}">
      
         <div>
            <label  for="userId">ID</label> <input type="text" id="userId"
               name="userId">
         </div>
         <div>
            <label for="userPass">PW</label> <input type="password" id="userPass"
               name="userPass">
         </div>
         <div>
            <button type="submit">로그인</button>
            <button id="memberRegister" type="button">회원가입</button>
         </div>
      </c:if>
      <c:if test="${member != null }">
         <div>
            <p>${member.userId}님환영 합니다.</p>
            <button id="memberUpdateBtn" type="button">회원정보수정</button>
            <button id="memberDeleteBtn" type="button">회원탈퇴</button>          
         </div>
      </c:if>
      <c:if test="${msg == false}">
         <p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
      </c:if>
   </form>
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
</body>
</html>