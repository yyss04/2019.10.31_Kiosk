<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록</title>
<!-- 스마트에디터 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/se2/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<%@ include file="../head.jsp" %>
<script src="../resources/jquery/productmanager.js"></script>
</head>
<body>
<div class="container" style="overflow:auto">
	<form action="" enctype="multipart/form-data" method="post" id="add">
	
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
					<td><textarea name="pcomment" id="pcomment" rows="10" cols="100"></textarea></td>
				</tr>
				<tr>
					<td>제품이미지</td>
					<td class="select_img"><img src="" />
					<input type="file" id="imagelink" name="imagelink">
					<script>
						$("#imagelink").change(function(){
							if(this.files && this.files[0]) {
								var reader = new FileReader;
									reader.onload = function(data) {
					    				 $(".select_img img").attr("src", data.target.result).width(100);        
					   				}
									reader.readAsDataURL(this.files[0]);
					  		}
					  });
					 </script>
					</td>
				</tr>
			</tbody>
				<script type="text/javascript">
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : "pcomment",
						sSkinURI : "../se2/SmartEditor2Skin.html",
						fCreator : "createSEditor2"
					});
				</script>
				<script type="text/javascript">
					function doRun(){
						oEditors.getById["pcomment"].exec("UPDATE_CONTENTS_FIELD", []);
						
						var pcomment = document.getElementById("pcomment").value;
						
						alert("상품이 추가되었습니다.");
						$("#add").attr("action", "productAddProc.do");
						$("#add").submit();
					}
				</script>
			</table>
		<button type="submit" class="btn btn-primary" onclick="doRun();">등록</button>
		<button type="button" class="btn btn-primary" onclick="doBack();">뒤로가기</button>
		</form>
	</div>
</body>
</html>