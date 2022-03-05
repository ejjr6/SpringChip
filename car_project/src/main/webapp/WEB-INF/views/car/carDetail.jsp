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
<style>
	#pickImg {
		width:50px;
		height:50px;
	}
</style>
</head>
<body>
	<!-- 요청 url과 같은 번호의 차량 사진 출력 -->
	<c:if test="${!empty cno}">
		<img src="${resources}/car/${car.cno}.png">
	</c:if>
	<h3>${car.cname}</h3>
	<br/>
	<c:if test="${!empty userInfo}">
		<c:choose>
			<c:when test="${!empty infoLike}">
				<c:choose>
					<c:when test="${infoLike.contains(car)}">
						<img id="pickImg" src="${resources}/favorite/favorite.png"/>
					</c:when>
					<c:otherwise>
						<img id="pickImg" src="${resources}/favorite/normal.png"/>
					</c:otherwise>
				</c:choose>
			</c:when>
			
			<c:otherwise>
				<img id="pickImg" src="${resources}/favorite/normal.png"/>
			</c:otherwise>
		</c:choose>
	</c:if>
	
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
		
		if(pick == "${resources}/favorite/normal.png"){
			$("#pickImg").attr("src","${resources}/favorite/favorite.png");
			value = 1;
			pick_func(user, car, value);
		}else{
			$("#pickImg").attr("src","${resources}/favorite/normal.png");
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