<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath }" /> --%>
<footer>
            
		<div id="in_footer">

			<div id="f_logo">
				<a href="#">
					<img src="${path}/resources/img/f_logo.png" alt="로고"/>
				</a>
			</div>

			<div id="f_box1">
				<ul id="f_menu">
					<li><a href="#">공지사항</a></li>
					<li><a href="#">자주 묻는 질문(FAQ)</a></li>
					<li><a href="#">1:1문의</a></li>
					<li><a href="#">개인정보</a></li>
					<li><a href="#">처리방침</a></li>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">저작권 안내</a></li>
					<li><a href="#">사이트맵</a></li>
				</ul>

				<ul id="f_menu2">
					<li><a href="#">고객센터(상용) 080-200-6000</a></li>
					<li><a href="#">상용 블루링크 센터 1899-8884</a></li>
				</ul>
			</div>

			<div id="f_box2">
				<ul id="f_icon">
					<li><a href="#"><img src="${path}/resources/img/icon_1.png" alt="유튜브"/></a></li>
					<li><a href="#"><img src="${path}/resources/img/icon_2.png" alt="카카오페이지"/></a></li>
					<li><a href="#"><img src="${path}/resources/img/icon_3.png" alt="페이스북"/></a></li>
					<li><a href="#"><img src="${path}/resources/img/icon_4.png" alt="트위터"/></a></li>
				</ul>

				<ul id="f_menu3">
					<a href="#">
						<li>계열사</li>
						<li><img src="${path}/resources/img/f_icon.png" alt="화살표"/></li>
					</a>
				</ul>
			</div>

			<div id="f_txt">
				<p>ⓒ Hyundai Motor Company. All rights reserved.</p>    
			</div>

		</div>

	</footer>
</body>
</html>
