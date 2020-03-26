<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@ include file="../head.jsp" %>
<c:if test="${not empty cookie.cookieId.value}">
	<c:set var="chk" value="checked"/>
</c:if> 
</head>
<body>
	<div class="container" style="width:500px;">
		<div class="row">
			<form action="loginProc.do" method="post">
					<div class="text-center"><h3><strong>관리자 모드</strong></h3></div><hr>
				<div class="form-group">
					<label>ID</label> <input type="text" class="form-control" placeholder="ID" name="id" value="${cookie.cookieId.value}">
				</div>
				<div class="form-group">
					<label>PASSWORD</label> <input type="password" class="form-control" placeholder="Password" name="pw">
				</div>
				<div class="form-group form-check">
					<input type="checkbox" class="form-check-input" name="idsave" value="true" ${chk}/>
					<label class="form-check-label" for="exampleCheck1">Remember me</label>
				</div>
				<div class="text-right">
					<button type="submit" class="btn btn-default btn-block">LOGIN</button>&nbsp;&nbsp;
				</div>
			</form>
		</div>
	</div>
</body>
</html>