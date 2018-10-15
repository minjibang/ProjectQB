
function allCheckFunc( obj ) {
		$("[name=chk]").prop("checked", $(obj).prop("checked") );
}

/* 체크박스 체크시 전체선택 체크 여부 */
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
$(function(){
	$("#checkall").click(function(){
		allCheckFunc( this );
	});
	$("[name=chk]").each(function(){
		$(this).click(function(){
			oneCheckFunc( $(this) );
		});
	});
});

<<<<<<< .merge_file_a08080

/* 회원정보 수정 시작 */
$(function(){
	$('#updatebtn').click(function(){
		
		
		
		
	}); // updatebtn 끝
}); // function 끝
=======
/* 수정버튼 눌렀을때 그에 대한 값을 가져오도록 구현 */
$(document).ready(function(){
	
	/*수정버튼 눌렀을때 부모창 값을 모달창에 가져오기*/
	$("button[name='updatebtn']").click(function(){
		action='modify';
		type='PUT';
		memberid=this.value;
		
		var row =$(this).parent().parent();
		var tr = row.children();
		
		var member_id_modal=tr.eq(2).text();
		var member_email_modal=tr.eq(4).text();
		var member_phone_modal=tr.eq(5).text();
		var member_name_modal=tr.eq(3).text();
		
		$('#member_id').val(member_id_modal);
		$('#member_email').val(member_email_modal);
		$('#member_phone').val(member_phone_modal);
		$('#member_name').val(member_name_modal);
		
	});
	
	/*멤버 수정*/
	$('#updateMemberBtn').click(function() {
		var role_code_val;
		
		if ($('#agree_s').is(":checked"))
		{
		  role_code_val=$('#agree_s').val();
		}
		else if($('#agree_t').is(":checked")){
			role_code_val=$('#agree_t').val();
		}
		
	console.log("바뀌는 권한 값 ??>>>" + role_code_val);
		var _param = {member_email:$("#member_email").val(), member_phone:$("#member_phone").val()
				, member_id:$("#member_id").val(), class_name:$("#class_name option:selected").text()
				, role_code:role_code_val }

		var _data = JSON.stringify(_param); //jsonString으로 변환	                                                      
		$.ajax({
   			  type : "post",
   			  url : "adminMemberUpdate.do",
   			  cache: false,
   			  dataType: "json",
   			  data:_data,  
   			  processData: false,
   			  contentType: "application/json; charset=utf-8",
   			  success : function(data, status){
   				  alert("해당아이디값"+memberid);
   				  location.href="adminMember.do";
   			  },
   			  error: function(request, status, error){
   				  console.log("request 값이 뭐냐  >>>> "+ request);
   				  alert("에러야!");
   			 }
   		});
		
	});	
	
});
>>>>>>> .merge_file_a00380
