<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../head.jsp" %>
<script src="../resources/jquery/recommend.js"></script>
<title>추천메뉴 설정</title>
</head>
<style>
	* { box-sizing: border-box; }
	.doaction{
		text-decoration: none;
		font-size: 20px;
		border: 1.5px solid black;
		padding: 10px 30px 10px 30px;
		margin: 0;
		background-color: black;
		color: white;
		display: inline-block;
		width:100%;
	}
	.doaction:hover{
		text-decoration: none;
		color: black;
		border: 1.5px solid black;
		background-color: white;
		text-align: center;
	}
	th { background: Gainsboro;}
	table  { border-collapse: collapse;  }	
	.tableFixHead { overflow-y: auto; height: 800px; }
	.tableFixHead thead th{ position: sticky; top: 0; }
	.tableFixHead2 { overflow-y: auto; height: 650px; position: relative;}
	.tableFixHead2 thead th{position: sticky; top: 0;  }
</style>
<body>

<div class="text-center"><h1>추천메뉴 설정</h1></div>
<form action="" method="get" id="myform">
	<div class="container">
		<div class="row">
			<div class="col-xs-7"><h3>제품목록</h3></div>
			<div class="col-xs-5"><h3>선택목록</h3></div>
		</div>
		<div class="row">
			<div class="col-xs-7 tableFixHead">
				<table class="table">
					<thead>
						<tr>	
							<th class="justify-content-center text-center col-md-1">선택</th>
							<th scope="col" class="text-center col-md-2"></th>
							<th scope="col" class="text-left col-md-6">제품명</th>
							<th scope="col" class="text-left col-md-3">가격</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${RecommendList}" var="i">
							<tr class="productlist">
								<td class="justify-content-center text-center">
									<input class="inputbox" image="${i.imagelink}" checkname="${i.name}" id="check${i.PK}" type="checkbox" name="seq" value="${i.PK}" checked/>
								</td>
								<td><img src="../resources/${i.imagelink}" class="center-block" style="height: 30px"/></td>
								<td>${i.name}</td>
								<td>￦${i.price}</td>
							</tr>
						</c:forEach>
						<c:forEach items="${ProductList}" var="i">
							<tr class="productlist">
								<td class="justify-content-center text-center">
									<input class="inputbox" image="${i.imagelink}" checkname="${i.name}" id="check${i.PK}" type="checkbox" name="seq" value="${i.PK}"/>
								</td>
								<td><img src="../resources/${i.imagelink}" class="center-block" style="height: 30px"/></td>
								<td>${i.name}</td>
								<td>￦${i.price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-xs-5 tableFixHead2">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="text-left col-md-2"></th>
							<th scope="col" class="text-left col-md-8" style="width: 72%;">제품명</th>
							<th scope="col" class="text-left col-md-2">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${RecommendList}" var="k">
							<tr class="${k.PK}">
								<td><img src="../resources/${k.imagelink}" class="center-block" style="height: 30px"/></td>
								<td>${k.name}</td>
								<td class="text-center">
								<button class="btn btn-md" id="${k.PK}" onclick="doRemove(this.id);" style="text-decoration: bold; background-color: white; border: 0; color: red">×</button>
								</td>
							</tr>
						</c:forEach>
						<tr id="hidden">
					</tbody>
				</table>
			</div>
				<div class="col-xs-5">
						<button type="button" class="btn doaction" onclick="doRun();">확인</button>
						<button style="margin: 5px 0px;" type="button" class="btn doaction" onclick="location.href='${path}/manager/managerMode.do'">뒤로가기</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>