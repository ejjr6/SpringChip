<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
span.text-danger {
	display: block;
	color: red;
	font-size: 10px;
	padding: 5px;
}
</style>
</head>
<body>
	<br />
	<br />
	<br />
	<form action="${path}/user/modify?uid=${userInfo.uid}" id="modify"
		method="POST">
		<!-- 회원정보 출력 -->
		<h2>회원 정보</h2>
		<table border=1>
			<tr>
				<td>아이디</td>
				<td>${userInfo.uid}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${userInfo.uname}</td>
			</tr>
			<tr>
				<td>현재 비밀번호</td>
				<td><input type="password" id="upw" name="upw" /></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" id="nupw" name="nupw" /></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" id="reupw" name="reupw" /></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="uphone" name="uphone"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" id="modifyBtn"
					value="수정하기" /></td>
			</tr>
		</table>
	</form>
	<br />

	<!-- 찜하기 목록 -->
	<h2>찜하기 목록</h2>
	<table border=1>
		<tr>
			<td>타입</td>
			<td>이름</td>
		</tr>
		<c:choose>
			<c:when test="${!empty infoLike}">
				<c:forEach var="infoLike" items="${infoLike}">
					<tr>
						<td>${infoLike.ctype}</td>
						<td>${infoLike.cname}</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>


	<br />

	<!-- 예약 현황 -->
	<h3>예약 현황</h3>
	<table border=1>
		<tr>
			<td>차종</td>
			<td>지점명</td>
			<td>지점 주소</td>
			<td>전화번호</td>
			<td>신청내용</td>
		</tr>
		<c:choose>
			<c:when test="${!empty reserveInfo}">
				<c:forEach var="reserveList" items="${reserveInfo}">
					<tr>
						<td>${reserveList.cname}</td>
						<td>${reserveList.bname}</td>
						<td>${reserveList.baddr}</td>
						<td>${reserveList.bphone}</td>
						<td>${reserveList.utext}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">예약 목록이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>

	</table>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
	<script>
		$.validator.addMethod("regex", function(value, element, regexpr) {
			return regexpr.test(value);
		});
		var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;

		$("#modify").validate({
			rules : {
				upw : {
					required : true,
					remote : {
						type : "POST",
						url : "${path}/upwCheck?uid=${userInfo.uid}"
					}
				},
				nupw : {
					required : "true"
				},
				reupw : {
					required : "true",
					equalTo : "#nupw"
				},
				uphone : {
					required : true,
					regex : regexMobile
				}
			},
			messages : {
				upw : {
					required : "비밀번호를 입력해주세요.",
					remote : "비밀번호가 일치하지 않습니다."
				},
				nupw : {
					required : "새 비밀번호를 입력해주세요."
				},
				reupw : {
					required : "새 비밀번호를 확인해주세요.",
					equalTo : "새 비밀번호가 일치하지 않습니다."
				},
				uphone : {
					required : "전화번호를 입력해주세요.",
					regex : "올바른 전화번호 형식이 아닙니다."
				}
			},
			errorElement : "span",
			errorClass : "text-danger"
		});

		$.validator.setDefaults({
			submitHandler : function() {
				$("#modify").submit();
			}
		});
		
		
		var resultMsg = '${result}';
		if(resultMsg != ''){
			alert(resultMsg);
		}
	</script>
</body>
</html>
<%@ include file="../common/footer.jsp"%>