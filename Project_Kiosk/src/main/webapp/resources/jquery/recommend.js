var checklist = [];

function doRemove(seq, orderprice, checkname){				// 제품 삭제 함수
	$("input:checkbox[value='"+seq+"']").prop("checked", false);
	$("."+seq).remove();
	checklist.splice(checklist.indexOf(checkname),1);
}

function doBack(){								// 뒤로가기
	$("#myform").attr("action", "managerMode.do");
	$("#myform").submit();
}

function doRun(){								// 추천메뉴 등록
	var seq = $(this).attr("value");
	$("#myform").attr("action", "success.do");
	$("#myform").submit();
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
			var number = $(".cnt"+seq).val();
			$("."+seq).remove();
			checklist.splice(checklist.indexOf(checkname),1);
		}
	});
});