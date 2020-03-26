<%@page import="com.kb.org.product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductDTO pd = (ProductDTO) request.getAttribute("row");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 수정</title>
<%@ include file="../head.jsp" %>
<script src="../resources/jquery/productmanager.js"></script>
</head>
<body>
<div class="container" style="overflow:auto">
	<form action="" method="get" id="update">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">메뉴 수정</th>
				</tr>
			</thead>					
			<tbody>
				<tr>
					<td>제품코드</td>
					<td><input type="text" class="form-control" id="PK" name="PK" value="${row.PK}" maxlength="50" readonly></td>
				</tr>
				<tr>
					<td>제품명</td>
					<td><input type="text" class="form-control" placeholder="상품이름" id="name" name="name" value="${row.name}" maxlength="50"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" class="form-control" placeholder="가격" id="price" name="price" value="${row.price}" maxlength="50"></td>
				</tr>
				<tr>
					<td>제품설명</td>
					<td><input type="text" class="form-control" placeholder="상품설명" id="pcomment" name="pcomment" value="${row.pcomment}" maxlength="2048" style="height: 350px;"></td>
				</tr>
				<tr>
					<td>제품 이미지</td>
					<td><input type="file" placeholder="사진" id="imagelink" name="imagelink" value="${row.imagelink}" maxlength="50"></td>
				</tr>
			</tbody>
		</table>
		<button type="submit" class="btn btn-primary" onclick="doRun();">수정</button>
		<button type="button" class="btn btn-primary" onclick="doBack();">뒤로가기</button>
		</form>
	</div>
</body>
</html>