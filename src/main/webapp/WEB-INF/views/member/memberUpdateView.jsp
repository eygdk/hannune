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
<title>회원정보수정</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/";

		})
		$("#submit").on("click", function() {
			if ($("#PNUM").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#PNUM").focus();
				return false;
			}
			if ($("#ADDRESS").val() == "") {
				alert("우편번호를 입력해주세요.");
				$("#ADDRESS").focus();
				return false;
			}
			if ($("#ADDRESS2").val() == "") {
				alert("주소를 입력해주세요.");
				$("#ADDRESS").focus();
				return false;
			}
			if ($("#ADDRESS3").val() == "") {
				alert("상세주소를 입력해주세요.");
				$("#ADDRESS").focus();
				return false;
			}
			if ($("#ADDRESS4").val() == "") {
				alert("우편번호 선택시 자동으로 입력됩니다.");
				$("#ADDRESS").focus();
				return false;
			}
			if ($("#NNAME").val() == "") {
				alert("닉네임을 입력해주세요.");
				$("#NNAME").focus();
				return false;
			}
			if ($("#EMAIL").val() == "") {
				alert("이메일 입력해주세요.");
				$("#EMAIL").focus();
				return false;
			}
			if ($("#userPass").val() == "") {
				alert("비밀번호 입력해주세요.");
				$("#userPass").focus();
				return false;
			}
			if ($("#userName").val() == "") {
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
		});

	})
</script>
<body>
	<div class="container" style="padding: 50px;">
		<div class="card shadow">
			<section id="container">
				<div class="card-body">
					<section id="container">
						<form action="/member/memberUpdate" method="post">
							<div class="form-group has-feedback">
								<label class="control-label" for="userId">아이디</label> <input
									class="form-control" type="text" id="userId" name="userId"
									value="${member.userId}" readonly="readonly" />
							</div>
							<div class="form-group has-feedback">
								<label class="control-label" for="userPass">패스워드</label> <input
									class="form-control" type="password" id="userPass"
									name="userPass" />
							</div>
							<div class="form-group has-feedback">
								<label class="control-label" for="userName">성명</label> <input
									class="form-control" type="text" id="userName" name="userName"
									value="${member.userName}" readonly="readonly" />
							</div>
							<div class="form-group has-feedback">
								<label class="control-label" for="NNAME">닉네임</label> <input
									class="form-control" type="text" id="NNAME" name="NNAME"
									value="${member.NNAME}" />
							</div>
							<div class="form-group has-feedback">
								<label class="control-label" for="EMAIL">이메일</label> <input
									class="form-control" type="email" id="EMAIL" name="EMAIL"
									value="${member.EMAIL}" />
							</div>
							<div class="form-group has-feedback">
								<label class="control-label" for="PNUM">핸드폰번호</label> <input
									class="form-control" type="NUMBER" id="PNUM" name="PNUM"
									value="${member.PNUM}" />
							</div>
							<div class="form-group has-feedback">
								<label class="control-label" for="ADDRESS">우편번호</label> <input
									class="form-control" type="text" id="ADDRESS" name="ADDRESS"
									placeholder="우편번호"> <input type="button"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<!-- 버튼  -->
							</div>
							<div class="form-group has-feedback">
								<label class="control-label" for="ADDRESS2">주소</label> <input
									class="form-control" type="text" id="ADDRESS2" name="ADDRESS2"
									placeholder="주소"><br>
							</div>
							<div class="form-group has-feedback">
								<label class="control-label" for="ADDRESS3">상세주소</label> <input
									class="form-control" type="text" id="ADDRESS3" name="ADDRESS3"
									placeholder="상세주소">
							</div>
							<div class="form-group has-feedback">
								<label class="control-label" for="ADDRESS4">동</label> <input
									class="form-control" type="text" id="ADDRESS4" name="ADDRESS4"
									placeholder="참고항목" >
							</div>
							<div class="form-group has-feedback">
								<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
								<button class="cencle btn btn-danger" type="button">취소</button>
							</div>
						</form>
					</section>
				</div>
			</section>
		</div>
	</div>
</body>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("ADDRESS4").value = extraAddr;

				} else {
					document.getElementById("ADDRESS4").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('ADDRESS').value = data.zonecode;
				document.getElementById("ADDRESS2").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("ADDRESS3").focus();
			}
		}).open();
	}
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>