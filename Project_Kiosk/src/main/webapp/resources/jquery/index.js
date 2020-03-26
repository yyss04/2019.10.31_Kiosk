var product = [];
var totalprice = 0;
function doRemove(seq, orderprice){				// 제품 삭제 함수
	var number = $(".cnt"+seq).val();
	$("."+seq).remove();
	product.splice(product.indexOf(seq),1);
	totalprice = parseInt(totalprice) - parseInt(orderprice)*parseInt(number);
	$(".tp").html(totalprice);
	$(".tp").val(totalprice);
}
function doAdd(seq, orderprice){				// 수량 추가 함수
	var number = $(".cnt"+seq).val();
    $(".cnt"+seq).val(parseInt(number) + 1);
    $(".total"+seq).val(parseInt(orderprice)*(parseInt(number)+1));
    totalprice = parseInt(totalprice) + parseInt(orderprice);
    $(".tp").html(totalprice);
    $(".tp").val(totalprice);
}
function doSub(seq, orderprice){				// 수량 감소 함수
	var number = $(".cnt"+seq).val();
	if(number>1){
	    $(".cnt"+seq).val(parseInt(number) - 1);
	    $(".total"+seq).val(parseInt(orderprice)*(parseInt(number)-1));
	    totalprice = parseInt(totalprice) - parseInt(orderprice);
	    $(".tp").html(totalprice);
	    $(".tp").val(totalprice);
	}
}
$(document).ready(function() {
	$(".flip").click(function() {
		$(".panel").slideToggle("fast");
	});
	$(".product").click(function(){
		var seq = $.trim($(this).attr("seq"));
		var ordername = $(this).attr("ordername");
		var orderimage = $(this).attr("orderimage");
		var orderprice = $(this).attr("orderprice");
		if(product.indexOf(seq) == -1){
			$("#price").before(
				"<tr class='"+seq+"'><td></td>"+
					"<td class='text-center'><img src='resources/"+orderimage+"'class='center-block' style='height: 30px'/></td>"+
					"<td class='text-center'>"+ordername+"<input type='hidden' value=\""+ordername+"\" name='ordername'></td>"+
					"<td class='text-center'>"+
						"<input type='text' value='1' class=\"cnt"+seq+"\" name='ordercount'>"+
						"<button class='btn btn-md btn-success bt_up' orderprice='"+orderprice+"'type='button' onclick='doAdd(\""+seq+"\", \""+orderprice+"\");'>＋</button>&nbsp;"+
						"<button class='btn btn-md btn-success bt_dn' orderprice='"+orderprice+"'type='button' onclick='doSub(\""+seq+"\", \""+orderprice+"\");'>－</button></td>"+
					"<td class='text-center'>"+orderprice+"<input type='hidden' value=\""+orderprice+"\" name='orderprice'></td>"+
					"<td class='text-center'><input type='text' value=\""+orderprice+"\" class=\"total"+seq+"\" name='ordertotal' readonly></td>"+
					"<td class='text-center'>"+
						"<button class='btn btn-md btn-success' id='"+seq+"' onclick='doRemove(this.id, \""+orderprice+"\");'>×</button></td>"+
				"<td></td></tr>"
			);
			product.push(seq);
			totalprice = parseInt(totalprice) + parseInt(orderprice);
		}else{
			var number = $(".cnt"+seq).val();
		    $(".cnt"+seq).val(parseInt(number) + 1);
		    $(".total"+seq).val(parseInt(orderprice)*(parseInt(number)+1));	
		    totalprice = parseInt(totalprice) + parseInt(orderprice);
		}
		$(".tp").html(totalprice);
		$(".tp").val(totalprice); 
	});
});

////order.jsp 주문하기 버튼
//function doOrder() {
//	alert('주문이 완료되었습니다.');
//}

//메뉴 탭
$(function(){
    $(".container").hide();
    $(".container:first").show();
    $("ul.nav li").click(function () {
        $("ul.nav li").removeClass("active").css("color", "#333");
        $(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        //$(this).addClass("active").css("color", "darkred");
        $(".container").hide();
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn();
    });
});

// 주문 모달창
function submitOk(){	
	if(product.length === 0){ //product : 상품이 담긴 배열 
		// 제품을 다시 고르라고 표시함 
		$(function(){
			$('#retry').trigger("click"); // 자동클릭 이벤트 : 모달2 주문실패 팝업 
			
		});
	} else if (product.length > 0) {
		// 자동클릭 이벤트 : 모달3 주문성공 팝업 
		$(function(){
			$('#ordersuc').trigger("click"); 
		});	
	}
}
 
function submitOk2(){
	$("#orderform").attr("action", "insertOrder.do");
	$("#orderform").submit(); 
}