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
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<title>자유게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			CKEDITOR.replace( 'content' );
	        CKEDITOR.config.height = 500;
	        var content = CKEDITOR.instances.content.getData();
			
			
			
			var formObj = $("form[name='updateForm']");
			
			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			})
			
			fn_addFile();
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
 		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		function fn_del(value, name){
 			
 			fileNoArry.push(value);
 			fileNameArry.push(name);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$("#fileNameDel").attr("value", fileNameArry);
 		}
	</script>
	<body>
	<div class="container" style="padding:50px;">
		<div class="card shadow">
		<section id="container">
		<div class="card-body">
	<div id="root" align="center">
		<header>
			<h1 style="color:#2793F2;">자유게시판</h1>
		</header>
		<hr />

		<div align="center";>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update" enctype="multipart/form-data" >
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
              	 <input type="hidden" id="page" name="page" value="${scri.page}"> 
             	  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
               	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
              	 <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
               	<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
               <input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content" class="chk" title="내용을 입력하세요."><c:out value="${update.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
							<%-- <tr>
								<td id="fileIndex">
									<c:forEach var="file" items="${file}" varStatus="var">
									<div>
										<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
										<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
										<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
									</div>
									</c:forEach>
								</td>
							</tr> --%>
						</tbody>			
					</table>
					<div>
				
					
					 	<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
           			    <input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
						<input class="form-control form-control-sm" name="file"		type="file" >
						 </form>
						 </section>
						  <div>
                        <span class="form-control form-control-sm" id="basic-addon1">파일
                           목록</span>
                        <div class="form-group" style="border: 10px solid #dbdbdb;">
                   
                           <c:forEach var="file" items="${file}">
                           <div>
                           
                              <a href="#"
                                 onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
                                 <button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
                           </c:forEach>
                           </div>
                        </div>
                     </div>
						 
					</div>
					<div>
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
								
							</form>
			</section>
			<hr />
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