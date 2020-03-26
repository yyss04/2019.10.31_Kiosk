<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form id="orderform" action="">
<div class="container-fluid">
	<div>
		<table class="table table-striped table table-hover">
			<thead>
				<tr>
					<th scope="col" class="text-center col-md-2"></th>
					<th scope="col" class="text-center col-md-1">이미지</th>
					<th scope="col" class="text-center col-md-1">제품명</th>
					<th scope="col" class="text-center col-md-2">수량</th>
					<th scope="col" class="text-center col-md-2">단가</th>
					<th scope="col" class="text-center col-md-1">가격</th>
					<th scope="col" class="text-center col-md-1"></th>
					<th scope="col" class="text-center col-md-2"></th>
				</tr>
			</thead>
			<tbody>
				<tr id="price">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="text-right"><h4><strong>총가격 :</strong></h4></td>
					<td class="text=left">
					<h4><strong class="tp"></strong><strong>원</strong></h4>
					<input type="hidden" class="tp" name="totalprice"/>
					</td>
					<td>
						<button type="button" class="btn btn-info btn-lg" data-toggle="modal" 
						data-target="#myModal1">주문하기</button> <!-- 모달1 팝업  --> 
					</td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<!--모달1 : 주문확인-->
<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">주문확인</h4>
        </div>
        <div class="modal-body">
          <p>주문하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="submitOk();">네</button>  
          <button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
        </div>
      </div>
    </div>
 </div>
 
<!-- 모달2 : 주문 제품이 없는 경우  --> 
<div style="display: none;">
	<!-- 버튼 숨김 --> 
 <button type="button" class="btn btn-info btn-lg" data-toggle="modal" id="retry"
						data-target="#myModal2"></button>
</div>
 
<div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">주문확인</h4>
        </div>
        <div class="modal-body">
          <p>제품을 선택하세요</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
 </div>
 
 <!-- 모달3 : 주문 성공  --> 
<div style="display: none;">
	<!-- 버튼 숨김 --> 
 <button type="button" class="btn btn-info btn-lg" data-toggle="modal" id="ordersuc"
			 data-target="#myModal3">주문 성공</button>
</div>
 
<div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">주문확인</h4>
        </div>
        <div class="modal-body">
          <p>주문이 완료되었습니다.</p>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-default" data-dismiss="modal" onclick="submitOk2();">확인</button>
        </div>
      </div>
    </div>
 </div>
 
</form>