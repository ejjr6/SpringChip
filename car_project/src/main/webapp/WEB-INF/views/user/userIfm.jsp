<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="../common/header.jsp"/>
<style>
	.car_img img{
		width: 480px;
	}

	.box{
	
		margin: 60px;
		height: 700px;
	}
	
	footer{
		bottom : 0px;
	}

</style>
</head>
<body>
<div class="box">
	<div class="car_viewer">
		<div class="car_preview">
			<div class="car_img">
				<img src="${path}/resources/car/${carVO.cno}.png"/>
			</div>
			<div class="car_name">
				<span class="name">▶${carVO.cname}</span>
			</div>
			<div class="car_branch01">
				<span class="branch">[${branchVO.bname}]</span>
				<span class="tel">☎${branchVO.bphone}</span>
			</div>
			<div class="car_branch02">
				<span class="addr">${branchVO.baddr}</span>
			</div>
		</div>
	</div>
	
	
	<!-- session에 저장된 로그인한 user 정보 불러오자! -->
	
	<!-- 내용 입력 -->
<%--	
 	<div class="con_box">
		<form action="userPost" method="post">
			<h5>▶내용입력</h5>
			<ul class="info_tbl">
				<li class="info_tr">
					<div class="info_th">이름</div>
					<div class="info_td">
						<span class="form_name">
							<input type="text" class="input_box" value="${userInfo.name}" title="이름" readonly />
						</span>
					</div>
				</li>
				<li class="info_tr">
					<div class="info_th">휴대폰</div>
					<div class="info_td">
						<span class="form_phone">
							<input type="text" class="input_box" value="${userInfo.phone}" title="전화번호" readonly />
						</span>
					</div>
				</li>
			 	
				<li class="info_tr">
					<div class="info_th">이메일</div>
					<div class="info_td">
						<span class="form_email">
							<input type="text" class="input_box" value="${userInfo.email}" title="이메일" readonly />
						</span>
					</div>
				</li>
			 
				<li class="info_tr">
					<div class="info_th">신청내용</div>
					<div class="info_td">
						<div class="form_text">
							<textarea rows="5" cols="100" class="input_text" title="신청내용 " ></textarea>						
						</div>
					</div>
				</li>
			</ul>
		</form>
	</div>
 --%>
 	<!-- 통합 과정 - 회원정보 테이블 변경.. 여기 회원 테이블이랑 다름 -->
 	
 	<form action="${path}/userPost" method="post" id="userSub">
 		<h4>▶내용입력</h4>
 		<table>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" class="input_box" name="uname"value="${userInfo.uname}" title="이름" disabled />
				</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td>
					<input type="text" class="input_box" name="uphone" value="${userInfo.uphone}" title="전화번호" disabled/>
				</td>
			</tr>
			<tr>
				<td>신청내용</td>
				<td>
					<textarea rows="5" cols="50" class="input_text" name="utext" title="신청내용 " ></textarea>
				</td>
			</tr>
 		</table>
 		<input type="hidden" name="uno" value="${userInfo.uno}"/>
 		<input type="hidden" name="uname" value="${userInfo.uname}"/>
 		<input type="hidden" name="uphone" value="${userInfo.uphone}"/>
 		<input type="hidden" name="cname" value="${carVO.cname}"/>
 		<input type="hidden" name="bname" value="${branchVO.bname}"/>
 		<input type="hidden" name="baddr" value="${branchVO.baddr}"/>
 		<input type="hidden" name="bphone" value="${branchVO.bphone}"/>
 	</form>
 
	<!-- form / submit해서 controller에서 예약 Insert하고 -->
	<!-- 예약완료 confirm창 이용해서  마이페이지 or home으로 이동 /////설정 -->
	<div class="btn_area">
		<a href="#">
			<span class="userWBtn">
				완료
			</span>
		</a>
	</div>
	
</div>
<script>

	$(".btn_area").click(function(){
		$("#userSub").submit();
	});

</script>
<jsp:include page="../common/footer.jsp"/>