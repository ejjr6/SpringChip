<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"/> --%>
<%@ include file="../common/header.jsp" %>

<br/>
<br/>
<br/>
<br/>
<form action="loginPost" method="post">
	<table>
		<tr>
			<th colspan="2">로그인</th>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uid" required/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="upw" required/></td>
		</tr>
		<tr>
			<td colspan="2">
				<label>
					<input type="checkbox" name="useCookie"/>
					로그인 정보 저장
				</label>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" onclick="location.href='join;'" value="회원가입"/>
				<input type="submit" value="로그인"/>
			</td>
		</tr>
	</table>
</form>


<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>
<%@ include file="../common/footer.jsp" %>