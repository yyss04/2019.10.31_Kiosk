var checklist = [];

function doBack(){		// 뒤로가기
	$("#product").attr("action", "../manager/managerMode.do");
	$("#product").submit();
	
	$("#update").attr("action", "productManager.do");
	$("#update").submit();
	
	$("#add").attr("action", "productManager.do");
	$("#add").submit();
}


function doRemove(seq, orderprice){				// 삭제목록에 있는 제품 삭제 함수
	var checkname = $(this).attr("checkname");
	$("input:checkbox[value='"+seq+"']").prop("checked", false);
	$("."+seq).remove();
	checklist.splice(checklist.indexOf(checkname),1);
}

function doAdd(){		// 제품 등록 화면 이동
	$("#product").attr("action", "productAdd.do");
	$("#product").submit();
}

function doDelete(){	// 메뉴삭제
	var test = confirm("삭제 하시겠습니까?");
	if(test){
		$("#product").attr("action","productDel.do");
		$("#product").submit();
	}else{
		return false;
	}
}

function doRun(){	// 메뉴수정
	$("#update").attr("action", "productUpdateProc.do");
	$("#update").submit();
}

$(document).ready(function(){
	$(".inputbox").css("cursor", "pointer");
	$(".inputbox").click(function(e){
		var seq = $(this).attr("value");
		var image = $(this).attr("image");
		var checkname = $(this).attr("checkname");
		var check = $("input:checkbox[checkname='"+checkname+"']").is(":checked");
		if(check == true){
			checklist.push(checkname);
			$("#hidden").before(
				"<tr class=\""+seq+"\">"+
					"<td><img src=\"../resources/"+image+"\" class=\"center-block\" style=\"height: 30px\"/></td>"+
					"<td>"+checkname+"</td>"+
					"<td class=\"text-center\">"+
						"<button class=\"btn btn-md \" id=\""+seq+"\" onclick=\"doRemove(this.id);\" style=\"" +
								"text-decoration: bold; background-color: white; border: 0; color: red;\">×</button>"+
					"</td>"+
				"</tr>"
			);
		}else{
			$("."+seq).remove();
			checklist.splice(checklist.indexOf(checkname),1);
		}
	});
	
	$(".mytr").css("cursor","pointer");	// 커서 올리면 손가락표시
	$(".mytr").on('click', function(e){	// 메뉴수정 화면으로 이동
		var seq = $(this).attr("seq");
		location.href="productUpdate.do?seq="+seq;
	});
	
	$(".inputbox").on('click', function(e){	// 부모태그 이벤트제거
		e.stopPropagation(); 
	});
	
	
});