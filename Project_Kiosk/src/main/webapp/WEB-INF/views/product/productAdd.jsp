<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록</title>
<%@ include file="../head.jsp" %>
<script src="../resources/jquery/productmanager.js"></script>
</head>
<body>
<div class="container" style="overflow:auto">
	<form action="" method="get" id="add">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">메뉴 등록</th>
				</tr>
			</thead>			
			<tbody>
				<tr>
					<td>제품코드</td>
					<td><input type="text" class="form-control" placeholder="번호" id="PK" name="PK" maxlength="50"></td>
				</tr>
				<tr>
					<td>제품명</td>
					<td><input type="text" class="form-control" placeholder="상품이름" id="name" name="name" maxlength="50"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" class="form-control" placeholder="가격" id="price" name="price" maxlength="50"></td>
				</tr>
				<tr>
					<td>제품설명</td>
					<td><textarea class="form-control" placeholder="상품설명" id="pcomment" name="pcomment" maxlength="2048" style="height: 350px;"></textarea></td>
				</tr>
				<tr>
					<td>제품이미지</td>
					<td><input type="file" placeholder="사진" id="imagelink" name="imagelink" maxlength="50"></td>
				</tr>
			</tbody>
		</table>
		<button type="submit" class="btn btn-primary" onclick="doRun();">등록</button>
		<button type="button" class="btn btn-primary" onclick="doBack();">뒤로가기</button>
		</form>
	</div>
</body>
</html>