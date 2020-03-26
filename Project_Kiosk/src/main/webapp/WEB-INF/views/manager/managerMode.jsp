<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메뉴</title>
<%@ include file="../head.jsp" %>
<script type="text/javascript">
var message = '${msg}'; 

if( message != '' ) {
	alert(message);
}
</script>
</head>
<style>
	a{
		text-decoration: none;
		font-size: 35px;
		border: 3px solid black;
		padding: 10px 30px 10px 30px;
		margin: 10px;
		background-color: black;
		color: white;
		display: inline-block;
		width: 380px;
	}
	a:hover{
		-moz-transition: 0.4s;-o-transition: 0.4s;-webkit-transition: 0.4s;transition: 0.4s;
		text-decoration: none;
		color: black;
		border: 3px solid black;
		background-color: white;
	}
</style>
<body>
<div class="row">
		<div class="col text-center" style="padding: 150px 0 0 0">
			<h2>관리자 메뉴</h2><br/><hr/>
			${sessionId}님 환영합니다. <button class="btn btn-link" onclick="location.href='${path}/manager/logOut.do'">로그아웃</button><br/><hr/>
			<a href="${path}/order/orderList.do">주문목록</a><br/>
			<a href="${path}/product/recommend.do">추천메뉴 등록/삭제</a><br/>
			<a href="${path}/product/productManager.do">상품 등록/삭제</a><br/>
			<a href="${path}/">메인으로</a><br/>
		</div>
	</div>
</body>
</html>