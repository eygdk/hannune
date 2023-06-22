<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://kit.fontawesome.com/69a8f7f7cc.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script>
	$(function() {
		$(".headC").click(function() {
			$(".headB").slideToggle();
		});
	});
</script>
</head>

<body>
	<header>
		<div class="container">
			<div class="container-small">
				<a href="/" class="headA">HUNUNE</a>

				<button type="button" class="headC">
					<span class="fa fa-bars" title="MENU"></span>
				</button>
			</div>

			<nav class="headB">
				<ul>
					<li><a href="board/list">ABOUT</a></li>
					<li><a href="contents.html">금융소식</a></li>
					<li><a href="board/list">자유게시판</a></li>
					<li><a href="board/list">문의</a></li>
					<li><c:if test="${member != null}">
							<a href="member/memberUpdateView">마이페이지</a>
						</c:if> <c:if test="${member == null}">
							<a href="/member/login">로그인</a>
						</c:if></li>
						<li><c:if test="${member != null}">
						<a href="/member/logout">로그아웃</a>
						</c:if></li>
					<li><c:if test="${member != null}">
							<p align="center"><strong>${member.userId}님 </strong></p>
						</c:if></li>
				</ul>
			</nav>
		</div>
	</header>

	<section class="conA">
		<div class="container">
			<h1>HANUNE</h1>
			<p>보다 쉽고 빠르게</p>
			<P>대출상품을 한눈에</P>
			<a href="member/register">HANUNE 시작하기</a>
		</div>
	</section>


	<section class="conB">
		<div class="container">
			<div class="text">
				<span class="fa-solid fa-magnifying-glass icon"></span>
				<h2>대출비교</h2>
				<p>다양한 금융사에서</p>
				<p>가장 좋은 조건 비교</p>
				<a href="#">MORE... <span class="fa fa-chevron-right"></span>
				</a>
			</div>

			<div class="text">
				<span class="fa-regular fa-eye icon"></span>
				<h2>한눈에</h2>
				<p>금리순,한도순으로 나에게 가장 유리한</p>
				<p>대출을 찾아보세요</p>
				<a href="#">MORE... <span class="fa fa-chevron-right"></span>
				</a>
			</div>

			<div class="text">
				<span class="fa-solid fa-shield-dog icon"></span>
				<h2>스팸걱정은 NO!</h2>
				<p>소중한 개인정보</p>
				<p>안전하게 지키세요</p>
				<a href="#">MORE... <span class="fa fa-chevron-right"></span>
				</a>
			</div>
		</div>
	</section>

	<footer>
		<div class="container">

			<div class="footA">
				<h2>HANUNE</h2>
				<p>
					주소: IT 하누네시 한눈에구 알아보동<br> <a href="http://logger.nett/">http://logger.nett/</a>
				</p>

				<nav class="footD">
					<ul>
						<li><a href="#"> <span class="fa fa-twitter"></span> <span
								class="sr-only">Twitter</span>
						</a></li>

						<li><a href="#"> <span class="fa fa-facebook"></span> <span
								class="sr-only">Facebook</span>
						</a></li>

						<li><a href="#"> <span class="fa fa-google-plus"></span>
								<span class="sr-only">Google Plus</span>
						</a></li>

						<li><a href="#"> <span class="fa fa-instagram"></span> <span
								class="sr-only">Instagram</span>
						</a></li>

						<li><a href="#"> <span class="fa fa-youtube"></span> <span
								class="sr-only">YouTube</span>
						</a></li>
					</ul>
				</nav>
			</div>

			<nav class="footB">


				<div>
					<h3>SUPPORT</h3>
					<ul>
						<li><a href="#">주소</a></li>
						<li><a href="#">매뉴얼</a></li>
						<li><a href="#">자주 묻는 질문</a></li>
						<li><a href="#">문의</a></li>
					</ul>
				</div>
			</nav>

			<div class="footC">© HUNUNE corp. All rights reserved.</div>

		</div>
	</footer>


</body>
</html>



