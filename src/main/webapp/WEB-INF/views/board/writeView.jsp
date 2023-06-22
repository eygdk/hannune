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
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<title>자유게시판 글쓰기</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		CKEDITOR.replace( 'content' );
        CKEDITOR.config.height = 500;
        var content = CKEDITOR.instances.content.getData();
		
		
		
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "../board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
	function fn_addFile() {
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn")
				.on(
						"click",
						function() {
							$("#fileIndex")
									.append(
											"<div><input type='file' style='float:left;' name='file_"
													+ (fileIndex++)
													+ "'>"
													+ "</button>"
													+ "<button type='button' style='float:right;' id='fileDelBtn'>"
													+ "삭제" + "</button></div>");
						});
		$(document).on("click", "#fileDelBtn", function() {
			$(this).parent().remove();

		});
	}
</script>

<body>
	<div class="container" style="padding: 50px;">
		<div class="card shadow">
			<div class="card-body">

				<div id="root" align="center">

					<h1 style="color: #2793F2;">자유게시판 글쓰기</h1>
					<hr />
					<form name="writeForm" method="post" action="/board/write"
						enctype="multipart/form-data">

						<c:if test="${member.userId != null}">

							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1">제목</span> <input
									type="text" id="title" name="title" class="col-md-10 chk"
									title="제목을 입력해 주세요." placeholder="제목을 입력해 주세요."
									aria-describedby="basic-addon1">
							</div>

							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1">내용</span>
								<textarea id="content" name="content"
									name="content" id="content" rows="10" cols="80">${boardView.content}</textarea>
							</div>

							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1">작성자</span> <input
									type="text" id="writer" name="writer" class="chk"
									title="작성자를 입력하세요." aria-describedby="basic-addon1"
									value="${member.userId}" readonly>
							</div>

							<div>
								<input class="form-control form-control-sm" name="file"
									type="file">
							</div>

							<div class="row mb-3 justify-content-md-center">
								<button class="btn btn-primary write_btn" type="submit">등록</button>
							</div>
						</c:if>
						<c:if test="${member.userId == null}">
							<p>로그인 후에 작성하실 수 있습니다.</p>
						</c:if>
				</div>
			</div>
		</div>
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