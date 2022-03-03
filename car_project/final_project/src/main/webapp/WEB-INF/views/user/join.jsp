<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"/> --%>
<%@ include file="../common/header.jsp" %>

<br/>
<br/>
<br/>
<br/>
<form action="joinPost" method="post">
	<table>
		<tr>
			<th colspan="2">회원가입</th>
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
			<td>비밀번호 확인</td>
			<td><input type="password" name="reupw" required/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="uname" required/></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="uphone" required/></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="회원가입"/>
			</td>
		</tr>
	</table>
</form>


<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>
<%@ include file="../common/footer.jsp" %>