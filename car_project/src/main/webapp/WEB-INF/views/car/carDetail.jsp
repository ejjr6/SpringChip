<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">

<style>
/* #pickImg {
	width: 50px;
	height: 50px;
} */

* {
	margin: 0;
	padding: 0;
}

ul, li {
	list-style: none;
}

a {
	text-decoration: none;
	color: #222;
}

img {
	border: 0;
	display: block;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

.wrap {
	min-width: 1200px;
	/* background-color: gray; */
	overflow: hidden;
}

header {
	width: 100%;
	height: 80px;
	background-color: rgba(255, 255, 255, 0);
	position: fixed;
	top: 0;
	z-index: 99;
	overflow: hidden;
}

.in_header {
	width: 1500px;
	height: 100%;
	/* background-color: purple; */
	margin: 0 auto;
}

.logo {
	width: 204px;
	height: 80px;
	/* background-color: coral; */
	float: left;
	display: flex;
	align-items: center;
}

.logo img {
	width: 204px;
	height: 30px;
}

nav {
	width: 900px;
	/* background-color: yellow; */
	float: left;
}

.menu_wrap {
	width: 800px;
	/* background: blue; */
	margin: 0 auto;
}

.top_menu {
	width: 160px;
	height: 350px;
	/* background-color: skyblue; */
	float: left;
	padding: 0 20px;
	box-sizing: border-box;
	position: relative;
	line-height: 80px;
	font-size: 15px;
	font-weight: 700;
}

.sub_menu {
	/* background-color: palevioletred; */
	line-height: 20px;
	position: absolute;
	font-size: 12px;
	font-weight: 500;
}

.in_sub:first-child {
	margin-bottom: 10px;
}

.top_menu:hover {
	background-color: #004282;
}

.top_menu:hover a {
	color: #fff;
}

.top_menu:hover .model {
	color: #fff;
}

.login {
	width: 100px;
	height: 100%;
	/* background-color: red; */
	float: left;
	line-height: 80px;
	font-size: 15px;
	font-weight: 700;
}

/* d_sec1 start */
.d_sec1 {
	width: 100%;
	height: 480px;
}

.d_sec1_img {
	width: 100%;
	height: 100%;
	background: url('${resources}/img/detail.jpg') no-repeat center;
	background-size: cover;
}

/* d_sec2 start */
.d_sec2 {
	width: 100%;
	background-color: #fff;
}

.d_sec2>.container {
	width: 1200px;
	height: 620px;
	background-color: #f8f8f8;
	margin: 0 auto;
	padding: 50px 0;
	box-sizing: border-box;
}

.d_title {
	width: 1140px;
	/* background-color: pink; */
	border-bottom: 2px solid #004282;
	padding-bottom: 30px;
	box-sizing: border-box;
	text-align: center;
	margin: 0 auto 30px auto;
}

.d_title>h1 {
	font-size: 40px;
	margin-bottom: 10px;
}

.d_img {
	width: 603px;
	height: 351px;
	background-color: #fff;
	float: left;
	margin: 0 30px;
}

.d_img>img {
	width: 100%;
	height: 100%;
}

.r_box {
	width: 507px;
	height: 351px;
	/* background-color: pink;  */
	float: left;
	position: relative;
}

.d_txt {
	/* background-color: yellow; */
	float: left;
}

.txt {
	/* background-color: blue; */
	margin-bottom: 20px;
}

#txt_p {
	margin-bottom: 10px;
	padding-bottom: 5px;
	box-sizing: border-box;
	font-size: 20px;
	font-weight: 600;
	border-bottom: 2px solid #0041826e;
}

.txt_p1 {
	width: 130px;
}

.txt_p2 {
	width: 120px;
}

.txt_p3 {
	width: 75px;
}

.btn {
	width: 100%;
	height: 60px;
	float: left;
	position: absolute;
	bottom: 0;
	cursor: pointer;
}

.btn>img {
	width: 507px;
	height: 60px;
}
</style>
</head>
<body>
	<section class="d_sec1">
		<div class="d_sec1_img"></div>
	</section>

	<section class="d_sec2">
		<div class="container">

			<div class="d_title">
				<h1>${car.cname}</h1>
				<p>${car.cexpl}</p>
			</div>

			<div class="d_img">
				<c:if test="${!empty cno}">
					<img src="${resources}/car/${car.cno}.png">
				</c:if>
			</div>

			<div class="r_box">
				<div class="d_txt">
					<div class="txt">
						<p class="txt_p1" id="txt_p">Performance</p>
						<span class="txt_s">${car.performance}</span>
					</div>
					<div class="txt">
						<p class="txt_p2" id="txt_p">Technology</p>
						<span class="txt_s">${car.technology}</span>
					</div>
					<div class="txt">
						<p class="txt_p3" id="txt_p">Design</p>
						<span class="txt_s">${car.design}</span>
					</div>
				</div>
				<div class="btn">
					<c:if test="${!empty userInfo}">
						<c:choose>
							<c:when test="${!empty infoLike}">
								<c:choose>
									<c:when test="${infoLike.contains(car)}">
										<img id="pickImg" src="${resources}/img/btn2.png" />
									</c:when>
									<c:otherwise>
										<img id="pickImg" src="${resources}/img/btn.png" />
									</c:otherwise>
								</c:choose>
							</c:when>

							<c:otherwise>
								<img id="pickImg" src="${resources}/img/btn.png" />
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
			</div>

		</div>
	</section>
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>	
<script>
	
	var user = ${userInfo.uno};
	console.log('회원 번호 : '+user);
	var car = ${car.cno};
	console.log('차 번호 : '+car);
	
	$("#pickImg").click(function(){
		var pick = $("#pickImg").attr("src");
		console.log(pick);
		
		var value;
		
		if (pick == "${resources}/img/btn.png") {
			$("#pickImg").attr("src","${resources}/img/btn2.png");
			value = 1;
			pick_func(user, car, value);
		}else{
			$("#pickImg").attr("src","${resources}/img/btn.png");
			value = 0;
			pick_func(user, car, value);
		}
	});
	
	// 찜하기
	function pick_func(user, car, value){
		$.ajax({
			type : "POST",
			url : "${path}/likeCar",
			data : {
				uno : user,
				cno : car,
				favorite : value
			},
			dataType : "text",
			success : function(data){
				console.log(data);
			},
			error : function(result){
				console.log(result)
			}
		});
	}
</script>
</body>
</html>
<%@ include file="../common/footer.jsp" %>