<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<%@include file="../head.jsp" %>
</head>
<body>
${userId}
<div class="container-fluid">
	<div class="text-center"><h3>주문 목록 확인</h3></div>
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">구매번호</th>
	      <th scope="col">상품명</th>
	      <th scope="col">수량</th>
	      <th scope="col">단가</th>
	      <th scope="col">가격</th>
	      <th scope="col">총가격</th>
	      <th scope="col">주문일자</th>
	    </tr>
	  </thead>
	  <tbody>	    
	    <c:forEach items="${orderList}" var="i">
	    <tr>
	    	<th>${i.seq}</th>
	    	<td>${i.order_name}</td>
	    	<td>${i.order_count}</td>
	    	<td>${i.order_price}</td>
	    	<td>${i.order_total}</td>
	    	<td>${i.totalprice}</td>
	    	<td>${i.order_date}</td>
		</tr>
	    </c:forEach>
	  </tbody>
	</table>
	<div>
		<button style="margin: 5px 0px;" type="button" class="btn doaction" onclick="location.href='${path}/manager/managerMode.do'">뒤로가기</button>
	</div>
</div>
</body>
</html>