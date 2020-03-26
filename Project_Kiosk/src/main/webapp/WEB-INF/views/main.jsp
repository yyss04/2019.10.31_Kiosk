<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<%@ include file="head.jsp" %>
<link href="${path }/resources/css/main.css" rel="stylesheet"/>
</head>
<body>
	<div class="row">
		<div class="col text-center" style="padding: 150px 0 0 0">
			<h4>매장을 방문해주셔서 감사합니다.</h4>
			<h4>주문하기 버튼을 누르면 메뉴를 고르실 수 있습니다.</h4><br/><hr/>
			<a href="index.do">주문하기</a><br/>
			<a href="${path}/manager/managerMode.do">관리자</a><br/>
		</div>
	</div>
</body>
</html>