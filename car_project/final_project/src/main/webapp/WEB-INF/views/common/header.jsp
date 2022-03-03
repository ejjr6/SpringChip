<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">

<link href="${path}/resources/css/main.css" rel="stylesheet" type="text/css" />


<!-- 
<style>
	.sec1_img{
		width: 100%;
		height: 100%;
		background: url('${path}/resources/img/sec1_1.jpg') no-repeat center;
		background-size: cover;
	}
	
	.sec4_box{
        width: 100%;
        height: 800px;
        background:url('${path}/resources/img/sec4.jpg') no-repeat right;
        background-size: cover;
    }
</style>

 -->
<%--  
<link href="${path}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
 --%>
<!-- MetisMenu CSS -->
<link href="${path}/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="${path}/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="${path}/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="${path}/resources/dist/css/sb-admin-2.css" rel="stylesheet">


<!-- <!-- Custom Fonts -->
<link href="${path}/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css"> 


</head>
<body>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
	<script>
		$(function() {
			var $topMenu = $('.top_menu'), $header = $('header');

			$topMenu.mouseenter(function() {
				$header.stop().animate({
					height : 350
				}, 300);
				$header.css({
					backgroundColor : 'rgba(255, 255, 255, 1)'
				});
			}).mouseleave(function() {
				$header.stop().animate({
					height : 80
				}, 300, function() {
					$header.css({
						backgroundColor : 'rgba(255, 255, 255, 0)'
					});
				});

			});

		});
	</script>

	<div class="wrap">
		<header>
			<div class="in_header">
				<!-- 로고 -->
				<div class="logo">
					<a href="${path}"> <img src="${path}/resources/img/logo.png" alt="로고" />
					</a>
				</div>

				<!-- 메뉴 -->
				<nav>
					<ul class="menu_wrap">
						<li class="top_menu"><a href="">브랜드</a>
							<ul class="sub_menu">
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">디자인</a></li>
								<li><a href="">품질/안전</a></li>
								<li><a href="">친환경/미래기술</a></li>
								<li><a href="">회사 소개</a></li>
							</ul></li>

						<li class="top_menu"><a href="">전체모델</a>
							<ul class="sub_menu">
								<li class="in_sub">
									<ul class="model">
										트럭
										<li><a href="${path}/car/carDetail/1">뉴파워트럭</a></li>
										<li><a href="${path}/car/carDetail/2">엑시언트</a></li>
										<li><a href="${path}/car/carDetail/3">엑시언트 수소전기트럭</a></li>
									</ul>
								</li>
								<li class="in_sub">
									<ul class="model">
										버스
										<li><a href="${path}/car/carDetail/4">쏠라티</a></li>
										<li><a href="${path}/car/carDetail/5">유니버스 모바일 오피스</a></li>
										<li><a href="${path}/car/carDetail/6">일렉시티 수소전기버스</a></li>
									</ul>
								</li>
							</ul></li>

						<li class="top_menu"><a href="">고객서비스</a>
							<ul class="sub_menu">
								<li><a href="">FAQ</a></li>
								<li><a href="${path}/board/asklist">온라인 상담</a></li>
							</ul></li>
<!-- 
						<li class="top_menu"><a href="">브랜드</a>
							<ul class="sub_menu">
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
							</ul></li>
 -->

						<li class="top_menu">
							<c:choose>
								<c:when test="${!empty userInfo}">
									<a href="">${userInfo.uname}님</a>
									<ul class="sub_menu">
										<li><a href="${path}/user/myPage">마이페이지</a></li>
										<li><a href="${path}/car/carSelect">예약하기</a></li>
										<li><a href="${path}/user/logOut">로그아웃</a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<a href="${path}/user/login">로그인</a>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</nav>
			</div>
		</header>
	</div>
	<!-- <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->