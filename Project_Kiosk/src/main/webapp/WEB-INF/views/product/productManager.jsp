<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 등록/삭제</title>
<%@ include file="../head.jsp" %>
<script src="../resources/jquery/productmanager.js"></script>
<style>
	* { box-sizing: border-box; }
	.doaction{
		text-decoration: none;
		font-size: 20px;
		border: 1.5px solid black;
		padding: 10px 30px 10px 30px;
		margin: 10px;
		background-color: black;
		color: white;
		display: inline-block;
		width: 450px;
		text-align: center;
	}
	.doaction:hover{
		text-decoration: none;
		color: black;
		border: 1.5px solid black;
		background-color: white;
		text-align: center;
	}
	th { background: Gainsboro; text-align: center; }
	table  { border-collapse: collapse;  }	
	.tableFixHead { overflow-y: auto; height: 800px; }
	.tableFixHead thead th{ position: sticky; top: 0; }
	.tableFixHead2 { overflow-y: auto; height: 500px; position: relative;}
	.tableFixHead2 thead th{position: sticky; top: 0;  }
</style>
</head>
<body>
<div class="text-center"><h1>메뉴 등록/삭제</h1></div>
	<form action="" method="get" id="product">
		<div class="container">
			<div class="row">
				<div class="col-xs-7"><h3>메뉴목록</h3></div>
				<div class="col-xs-5"><h3>삭제목록</h3></div>
			</div>
			<div class="row">
				<div class="col-xs-7 tableFixHead">
					<table class="table">
						<thead>
							<tr>
								<th class="justify-content-center text-center col-md-1"></th>
								<th class="col-md-1">번호</th>
								<th class="col-md-1">사진</th>
								<th class="col-md-2">메뉴이름</th>
								<th class="col-md-1">가격</th>
								<th class="col-md-6">메뉴설명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ManagerList}" var="i">
								<tr class="mytr" seq="${i.PK}">
									<td class="justify-content-center text-center;">
									<input class="inputbox" image="${i.imagelink}" checkname="${i.name}"
										id="check${i.PK}" type="checkbox" name="seq" value="${i.PK}" />
									</td>
									<td>${i.PK}</td>
									<td><img src="${path}/resources/${i.imagelink}" class="center-block" width="50px;"></td>
									<td>${i.name}</td>
									<td>￦${i.price}</td>
									<td>${i.pcomment}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-xs-5 tableFixHead2">
					<table class="table" style="text-align: center; border: 1px solid #dddddd;">
						<thead>
							<tr>
								<th scope="col" class="text-left col-md-2"></th>
								<th scope="col" class="text-left col-md-8" style="width: 72%;">제품명</th>
								<th scope="col" class="text-left col-md-2">삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr id="hidden"></tr>
						</tbody>
					</table>
				</div>
				<hr />
				<div class="col-xs-5">
					<button class="btn doaction" onclick="doDelete();">메뉴 삭제</button>
					<button class="btn doaction" onclick="doAdd();">메뉴 추가</button>
					<button class="btn doaction" onclick="doBack();">뒤로가기</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>