/* 체크박스 체크시 전체선택 체크 여부 */
$(document).ready(function(){
	function allCheckFunc( obj ) {
		$("[name=chk]").prop("checked", $(obj).prop("checked") );
}
	
	
function oneCheckFunc( obj )
{
	var allObj = $("#checkall");
	var objName = $(obj).attr("name");

	if( $(obj).prop("checked") )
	{
		checkBoxLength = $("[name="+ objName +"]").length;
		checkedLength = $("[name="+ objName +"]:checked")
		.length;

		if( checkBoxLength == checkedLength ) {
			allObj.prop("checked", true);
		} else {
			allObj.prop("checked", false);
		}
	}
	else
	{
		allObj.prop("checked", false);
	}
}

/* 각각의 체크박스를 클릭시 전체선택 체크박스도 선택 및 해제되도록 구현 */

	$("#checkall").click(function(){
		allCheckFunc( this );
	});
	$("[name=chk]").each(function(){
		$(this).click(function(){
			oneCheckFunc( $(this) );
		});
	});
	
	
	/*시험등록 버튼 */
/*	$('#examManagementBtn').click(function(){
		var class_num_url=$('#class_num').val();
		
		var _param = {exam_paper_name:$('#exam_paper_name').val(),exam_info_date:$('#exam_info_date').val(),
				      exam_info_start:$('#exam_info_start').val(),exam_info_end:$('exam_info_end').val(),
				      exam_info_time:$('#exam_info_time').val(),exam_info_member:$('#exam_info_member').val(),
				      exam_info_desc:$('#exam_info_desc').val(), class_num:$('#class_num').val(),
				      exam_paper_num:$('#exam_paper_num').val()
				      };
		var _data = JSON.stringify(_param);
		
		console.log("값>>"+_param);
		$.ajax({
			type : "post",
			url : "examInfoInsert.do",
			cache : false,
			dataType : "json",
			data : _data,
			processData : false,
			contentType : "application/json; charset=utf-8",
			success : function(data, status){
				alert("시험 등록 완료");
				location.href="examScheduleDetail.do?class_num="+class_num_url;
			},
			error: function(request, status, error){
				alert("시험 등록 실패");
			}
		});
	});*/
});
