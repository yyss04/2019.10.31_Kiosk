<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="head.jsp" %>
<link href="resources/css/style.css" rel="stylesheet"/>
<link href="resources/css/indexStyle.css" rel="stylesheet"/>
<script src="resources/jquery/index.js"></script>
<title>Home</title>
</head>
<body>
<jsp:include page="bener.jsp"/>
<!-- 	메뉴 네비 -->
<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="540">
	<div class="container-fluid">
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav my-nav" id="myNavbar">
				<li><a href="${path }/" style="color: gold">메인으로</a></li>
				<li class="active" rel="recommend"><a>추천메뉴</a></li>
				<li rel="burger"><a>버거메뉴</a></li>
				<li rel="side"><a>사이드메뉴</a></li>
				<li rel="drink"><a>음료</a></li>
			</ul>
		</div>
	</div>
</nav>
<!-- 	추천메뉴 탭 -->
	<div class="container panel shadow" id="recommend" style="border: 0">
		<c:forEach items="${RecommendList}" var="i">
				<div class="col-sm-4">
					<div class="panel product shadow" seq="${i.PK}" ordername="${i.name}" orderimage="${i.imagelink}" orderprice="${i.price}">
						<div class="panel pcontent shadow">
							<div class="panel-heading shadow"><h4>${i.name}</h4></div>
							<div class="panel-body shadow pbody">
								<img src="${path}/resources/${i.imagelink}" class="img-responsive pimage" alt="Image">
								<div class="textbox">${i.pcomment}</div>
							</div>
							<div class="panel text-center price shadow">￦${i.price}</div>
						</div>
					</div>
				</div>
		</c:forEach>
	</div>
<!-- 	버거 탭 -->
	<div class="container panel shadow" id="burger" style="border: 0">
		<c:forEach items="${BurgerList}" var="i">
				<div class="col-sm-4">
					<div class="panel product shadow" seq="${i.PK}" ordername="${i.name}" orderimage="${i.imagelink}" orderprice="${i.price}">
						<div class="panel pcontent shadow">
							<div class="panel-heading shadow"><h4>${i.name}</h4></div>
							<div class="panel-body shadow pbody">
								<img src="${path}/resources/${i.imagelink}" class="img-responsive pimage" alt="Image">
								<div class="textbox">${i.pcomment}</div>
							</div>
							<div class="panel text-center price shadow">￦${i.price}</div>
						</div>
					</div>
				</div>
		</c:forEach>
	</div>
<!-- 	사이드 탭 -->
	<div class="container panel shadow" id="side" style="border: 0">
		<c:forEach items="${SideList}" var="i">
			<div class="col-sm-4">
				<div class="panel product shadow" seq="${i.PK}" ordername="${i.name}" orderimage="${i.imagelink}" orderprice="${i.price}">
					<div class="panel pcontent shadow">
						<div class="panel-heading shadow"><h4>${i.name}</h4></div>
						<div class="panel-body shadow pbody">
							<img src="${path}/resources/${i.imagelink}" class="img-responsive pimage" alt="Image">
							<div class="textbox">${i.pcomment}</div>
						</div>
						<div class="panel text-center price shadow">￦${i.price}</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
<!-- 	음료 탭 -->
	<div class="container panel shadow" id="drink" style="border: 0">
		<c:forEach items="${DrinkList}" var="i">
				<div class="col-sm-4">
					<div class="panel product shadow" seq="${i.PK}" ordername="${i.name}" orderimage="${i.imagelink}" orderprice="${i.price}">
						<div class="panel pcontent shadow">
							<div class="panel-heading shadow"><h4>${i.name}</h4></div>
							<div class="panel-body shadow pbody">
								<img src="${path}/resources/${i.imagelink}" class="img-responsive pimage" alt="Image">
								<div class="textbox">${i.pcomment}</div>
							</div>
							<div class="panel text-center price shadow">￦${i.price}</div>
						</div>
					</div>
				</div>
		</c:forEach>
	</div>
	<jsp:include page="order.jsp"/>
	<footer class="container-fluid text-center">
		<p>Online Store Copyright</p>
	</footer>
</body>
</html>