<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 9.      서재원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 9.      서재원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>로그인 페이지</title>
</head>
<body>

	<h3>아이디와 비밀번호를 입력해주세요.</h3>

	<c:url value="/login" var="loginUrl" />
	<form:form name="f" action="${loginUrl}" method="POST">
		<c:if test="${param.error != null}">
			<p>아이디와 비밀번호가 잘못되었습니다.</p>
		</c:if>
		<c:if test="${param.logout != null}">
			<p>로그아웃 하였습니다.</p>
		</c:if>
		<p>
			<label for="username">아이디</label>
			<input type="text" id="id" name="id" />
		</p>
		<p>
			<label for="password">비밀번호</label>
			<input type="password" id="password" name="password"/>
		</p>
		<button type="submit" class="btn">로그인</button>
	</form:form>
</body>
</html>
