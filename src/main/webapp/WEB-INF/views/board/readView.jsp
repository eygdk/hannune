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
<script src="https://kit.fontawesome.com/69a8f7f7cc.js"
   crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<title>자유게시판</title>
</head>

<script type="text/javascript">
   $(document)
         .ready(
               function() {
            	   CKEDITOR.replace( 'content' );
	                CKEDITOR.config.height = 500;
	                var content = CKEDITOR.instances.content.getData();
                  var formObj = $("form[name='readForm']");

                  // 수정 
                  $(".update_btn").on("click", function() {
                     formObj.attr("action", "/board/updateView");
                     formObj.attr("method", "get");
                     formObj.submit();
                  })

                  // 삭제
                  $(".delete_btn").on("click", function() {

                     var deleteYN = confirm("삭제하시겠습니까?");
                     if (deleteYN == true) {

                        formObj.attr("action", "../board/delete");
                        formObj.attr("method", "post");
                        formObj.submit();

                     }
                  })

                  // 취소
                  $(".list_btn").on("click", function() {

                     location.href = "/board/list";
                  })

                  // 목록
                  $(".list_btn")
                        .on(
                              "click",
                              function() {

                                 location.href = "/board/list?page=${scri.page}"
                                       + "&perPageNum=${scri.perPageNum}"
                                       + "&searchType=${scri.searchType}&keyword=${scri.keyword}";
                              })
                  //댓글
                  $(".replyWriteBtn").on("click", function() {
                     var formObj = $("form[name='replyForm']");
                     formObj.attr("action", "/board/replyWrite");
                     formObj.submit();
                  });

                  //댓글 수정 View
                  $(".replyUpdateBtn")
                        .on(
                              "click",
                              function() {
                                 location.href = "/board/replyUpdateView?bno=${read.bno}"
                                       + "&page=${scri.page}"
                                       + "&perPageNum=${scri.perPageNum}"
                                       + "&searchType=${scri.searchType}"
                                       + "&keyword=${scri.keyword}"
                                       + "&rno="
                                       + $(this).attr("data-rno");
                              });

                  //댓글 삭제 View
                  $(".replyDeleteBtn")
                        .on(
                              "click",
                              function() {
                                 location.href = "/board/replyDeleteView?bno=${read.bno}"
                                       + "&page=${scri.page}"
                                       + "&perPageNum=${scri.perPageNum}"
                                       + "&searchType=${scri.searchType}"
                                       + "&keyword=${scri.keyword}"
                                       + "&rno="
                                       + $(this).attr("data-rno");
                              });

               })
   function fn_fileDown(fileNo) {
      var formObj = $("form[name='readForm']");
      $("#FILE_NO").attr("value", fileNo);
      formObj.attr("action", "/board/fileDown");
      formObj.submit();
   }
</script>

<body>
   <div class="container" style="padding: 50px;">
      <div class="card shadow">
         <section id="container">
            <div class="card-body">
               <div id="root" align="center">
                  <header>
                     <h1 style="color: #2793F2;">자유게시판</h1>
                  </header>
                  <hr />
                  <section id="container">
                     <form name="readForm" role="form" method="post">
                        <input type="hidden" id="bno" name="bno" value="${read.bno}" />
                        <input type="hidden" id="page" name="page" value="${scri.page}">
                        <input type="hidden" id="perPageNum" name="perPageNum"
                           value="${scri.perPageNum}"> <input type="hidden"
                           id="searchType" name="searchType" value="${scri.searchType}">
                        <input type="hidden" id="keyword" name="keyword"
                           value="${scri.keyword}"> <input type="hidden"
                           id="keyword" name="keyword" value="${scri.keyword}"> <input
                           type="hidden" id="FILE_NO" name="FILE_NO" value="">
                     </form>
                     <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">제목</span> <input
                           type="text" id="title" name="title" class="col-md-10 chk"
                           title="제목을 입력해 주세요." aria-describedby="basic-addon1"
                           value="${read.title}" readonly="readonly">
                     </div>
                     <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">내용</span>
                        <textarea id="content" name="content"
                           class="form-control col-md-10 chk bg-white text-dark"
                           title="내용을 입력하세요." readonly="readonly"
                           aria-label="With textarea" rows="15"><c:out
                              value="${read.content}" /></textarea>
                     </div>

                     <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">작성자</span> <input
                           type="text" id="writer" name="writer" class="chk"
                           title="작성자를 입력하세요." aria-describedby="basic-addon1"
                           value="${read.writer}" readonly>
                     </div>
                     <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">작성날짜</span>
                        <fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd " />
                     </div>

                     <div>
                        <span class="form-control form-control-sm" id="basic-addon1">파일
                           목록</span>
                        <div class="form-group" style="border: 10px solid #dbdbdb;">
                           <c:forEach var="file" items="${file}">
                              <a href="#"
                                 onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
                           </c:forEach>
                        </div>
                     </div>
 				
                     <div class="row mb-3 justify-content-md-center">
                    
                        <button class="btn btn-primary update_btn" type="submit">수정</button>
                        <button class="btn btn-danger delete_btn" type="submit">삭제</button>
                        <button class="btn btn-sucess list_btn" type="submit">목록</button>
                     
                     </div>
               </div>
         </section>
         
         
         <!-- 댓글 목록 start -->
         <div class="collapse" id="reply_card${tmp.rno }">
         	<section class="modal=section">
         		<div class="card card-body">
         		<div class="reply-list reply-list${tmp.rno }">

         <!-- 댓글 리스트 -->
         <div id="reply">
         	
         	<div class="card">
    			<div class="card-header bi bi-chat-dots"> Comments</div>
               <c:forEach items="${replyList}" var="replyList">
                  <div class="card-footer py-3 border-0"
            			style="background-color: #f8f9fa;">
                  	<div class="d-flex flex-start w-100">
                  	<i class="fa fa-user-circle-o fa-2x"></i>
                  	<div class="form-outline w-100">
                     <p>
                        ${replyList.writer}
                        
                        
                     </p>
                     <p>${replyList.content}</p>
                     <fmt:formatDate value="${replyList.regdate}"
                           pattern="yyyy.MM.dd HH:mm:ss" />
                        <button type="button" class="replyUpdateBtn badge bi bi-pencil-square"
                           data-rno="${replyList.rno}">수정</button>
                        <button type="button" class="replyDeleteBtn badge bi bi-trash"
                           data-rno="${replyList.rno}">삭제</button>
                     </div>
                     </div>
                  </div>
               </c:forEach>
         	</div>
         	</div>
         
         <!-- 댓글 작성 -->
         <div class="card-footer py-3 border-0"
            style="background-color: #f8f9fa;">
            <div class="d-flex flex-start w-100">
              <i class="fa fa-user-circle-o fa-2x"></i>
               <div class="form-outline w-100">
                  <form name="replyForm" method="post">
                  <c:if test="${not empty sessionScope.nick }">
                  <div class="col-1">
                  
                     <input type="hidden" id="bno" name="bno" value="${read.bno}" />
                     <input type="hidden" id="page" name="page" value="${scri.page}">
                     <input type="hidden" id="perPageNum" name="perPageNum"
                        value="${scri.perPageNum}"> <input type="hidden"
                        id="searchType" name="searchType" value="${scri.searchType}">
                     <input type="hidden" id="keyword" name="keyword"
                        value="${scri.keyword}"> 
                        
                        
                     <input type="text" id="writer" name="writer" value="${member.userId}" readonly="readonly">
   
                     
                     <textarea class="form-control" id="content" name="content" rows="4"
                        style="background: #fff;"></textarea>
               </div>
               </div>
                  <button type="button" class="replyWriteBtn">작성</button>
                  </div>
                  </c:if>
            </div>
            
            </div>
            </div>
            </section>
         </div>
         <!-- 댓글 목록 end -->

         
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