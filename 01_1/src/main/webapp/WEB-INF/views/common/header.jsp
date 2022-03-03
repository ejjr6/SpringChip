<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:choose>	
		<c:when test="${!empty userInfo}">
			<div><span>${userInfo.uname }님</span></div>			
			<div><a href="${path }/user/logOut">로그아웃</a></div>
		</c:when>
		<c:otherwise>
		<div class="login">
			<a href="${path}/user/login">로그인</a>
		</div>
		
		</c:otherwise>
	</c:choose>

	<br/>
	<hr/>
