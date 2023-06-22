<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<%@include file="../include/header.jsp"%>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<title>자유게시판</title>
</head>
<body>
	<div id="root">
		<header>
			<!-- 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			</style> -->
		</header>

		<div class="container" style="padding: 50px;">
			<div class="card shadow">
				<section id="container">
					<div class="card-body">
						<h1 style="color: #2793F2;">자유게시판</h1>
						<form role="form" method="get">
							<table class="table table=hover">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회수</th>
								</tr>

								<c:forEach items="${list}" var="list">
									<tr>
										<td><c:out value="${list.bno}" /></td>
										<td><a
											href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out
													value="${list.title}" /></a></td>
										<td><c:out value="${list.writer}" /></td>
										<td><fmt:formatDate value="${list.regdate}"
												pattern="yyyy-MM-dd" /></td>
										<td><c:out value="${list.hit}" /></td>
									</tr>
								</c:forEach>

							</table>
							<div class="search" align="center">
								<select name="searchType">
									<option value="n"
										<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
									<option value="t"
										<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
									<option value="c"
										<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
									<option value="w"
										<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
									<option value="tc"
										<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
								</select> <input type="text" name="keyword" id="keywordInput"
									value="${scri.keyword}" />

								<button id="searchBtn" type="button" class="btn text-white"
									style="background-color: #77B9F2;">검색</button>
								<script>
									$(function() {
										$('#searchBtn')
												.click(
														function() {
															self.location = "list"
																	+ '${pageMaker.makeQuery(1)}'
																	+ "&searchType="
																	+ $(
																			"select option:selected")
																			.val()
																	+ "&keyword="
																	+ encodeURIComponent($(
																			'#keywordInput')
																			.val());
														});
									});
								</script>
							</div>
							<div>
								<ul>
									<c:if test="${pageMaker.prev}">
										<li><a
											href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
									</c:if>
								</ul>
							</div>
							<div align="right">
								<%@include file="nav.jsp"%>
							</div>
						</form>
					</div>
				</section>
			</div>

		</div>
		<hr />
	</div>
	<div class="container-fluid text-white"
		style="background-color: #77B9F2; margin-top: 50px; padding-top: 30px; padding-bottom: 10px">
		<div class="container">
			<h2>HANUNE</h2>
			<p>http://hunune.nett/</p>
			<p>주소: IT 하누네시 한눈에구 알아보동</p>

			<p>사업자번호 : 000-111-222</p>
		</div>
	</div>
</body>
</html>