<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"
	scope="session" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.2/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.2/jquery.modal.min.css" />

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>


<!-- Bootstrap Core CSS -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">

<link href="${path}/resources/css/main.css" rel="stylesheet"
	type="text/css" />
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

<!-- Custom Fonts -->
<link
	href="${path}/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<style>
/* test */
#myModal.modal.fade.in {
	height: 100%;
	min-width: 100%;
}

#myModal.modal.fade {
	height: 100%;
	min-width: 100%;
	background: rgba(0, 0, 0, 0.8);
}

/* test */
</style>

</head>

<body>

	<div class="wrap">
		<header>
			<div class="in_header">
				<!-- 로고 -->
				<div class="logo">
					<a href="${path}"> <img src="${path}/resources/img/logo.png"
						alt="로고" />
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

						<li class="top_menu"><a href="${path}/board/askmain">공지사항</a>
							<ul class="sub_menu">
								<li><a href="">FAQ</a></li>
								<li><a href="/board/asklist">온라인상담</a></li>

								<!-- 	<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li> -->
							</ul></li>
						<!-- 
						<li class="top_menu"><a href="">브랜드</a>
							<ul class="sub_menu">
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
							</ul></li> -->

						<li class="top_menu"><c:choose>
								<c:when test="${!empty userInfo}">
									<a href="${path}/user/myPage">${userInfo.uname}님</a>
									<ul class="sub_menu">
										<li><a href="${path}/user/myPage">마이페이지</a></li>
										<li><a href="${path}/user/logOut">로그아웃</a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<a href="${path}/user/login">로그인</a>
								</c:otherwise>
							</c:choose></li>
					</ul>
				</nav>
			</div>
		</header>
	</div>
	<!-- /.navbar-static-side -->

	<!--  <div id="page-wrapper"> -->