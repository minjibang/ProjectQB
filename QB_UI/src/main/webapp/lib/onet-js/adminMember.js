/*
 	@JSP:adminMember.js
 	@DATE:2018.10.16
 	@Author:유영준
 	@Desc:회원관리 js(스토리보드 10 of 41)
 */


$(document).ready(function(){
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
	$("[name=checkall]").click(function(){
		allCheckFunc( this );
	});
	$("[name=chk]").each(function(){
		$(this).click(function(){
			oneCheckFunc( $(this) );
		});
	});
});
/* 선택 회원 일괄 학생등록 및 삭제 구현 */

	$("input[name='chk']").click(function(){
		var rowData = new Array();
		var tdArr = new Array();
        var checkbox = $("input[name=chk]:checked");

        checkbox.each(function(i) {
            
            // checkbox.parent() : checkbox의 부모는 <td>이다.
            // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
        	var row =$(this).parent().parent();
    		var tr = row.children();
            
       	    // 체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text());        
            
            // 가져온 값을 배열에 담는다.
			tdArr.push(member_id);
			
			 console.log("체크된 값 : " + tr.eq(2).text());
        });
	});

	/* 선택회원 일괄학생 등록 */
	$("button[name='selectInsertbtn']").click(function(){
		
		var checkbox = $("input[name=chk]:checked").length;
		
		  if(checkbox == 0){  
			  	swal("등록할 회원을 선택해주세요");
			  	return false;
		  }
		  else {
			 return true;
		  }
	});			
	$("#InsertMemberModal").click(function(){
		var roleCode = "";
					$.ajax({
			   			  type : "post",
			   			  url : "adminMemberInsert.do",
			   			  cache: false,
			   			  dataType: "html",
			   			  data:{
			   				  "role_code":roleCode
			   			  },
			   			  processData: false,
			   			  contentType: "application/json; charset=utf-8",
			   			  success : function(data, status){
			   					 console.log("등록 성공 : " + data);
			   					if(data == "ROLE_STUDENT"){
				   					  swal("이미 등록된 학생입니다");
				   				  } 
			   					 location.href="adminMember.do";
			   				  
			   			  },
			   			  error: function(request, status, error){	   				  
			   				  swal("에러에러");
			   			  }
			   		});
					
				});
		/* 선택회원 일괄 삭제*/
		$("button[name='selectDeletebtn']").click(function(){
			
			var role_code_val;
			var checkbox = $("input[name=chk]:checked").length;
			
			  if(checkbox == 0){  
				  	swal("삭제할 회원을 선택해주세요");
				  	return false;
			  }
			  else {
				 return true;
			  }
		});			
		
			$("#DeleteMemberModal").click(function(){
				
			var _param = {role_code_val:$("#role_code").val(),
						  member_enable_val:$("#member_enable").val()
			}
			
			var _data = JSON.stringify(_param); //jsonString으로 변환	                                                      
			$.ajax({
	   			  type : "post",
	   			  url : "adminMemberDelete.do",
	   			  cache: false,
	   			  dataType: "json",
	   			  data:_data,  
	   			  processData: false,
	   			  contentType: "application/json; charset=utf-8",
	   			  success : function(data, status){
	   				 if(data == "ROLE_MEMBER" && "0"){
	   					  swal("이미 삭제된 회원입니다");
	   				  } 
	   				 
	   				  location.href="adminMember.do";
	   				  
	   			  },
	   			  error: function(request, status, error){
	   			  }
	   		});
			
		});





$(function(){
	/*수정버튼 눌렀을때 부모창 값을 모달창에 가져오기*/
	$("button[name='updatebtn']").click(function(){
		action='modify';
		type='PUT';
		memberid=this.value;
		
		console.log("불러오는 아이디 값 : " + memberid);
		
		var row =$(this).parent().parent();
		var tr = row.children();
		
		var member_id_modal=tr.eq(2).text();
		var member_email_modal=tr.eq(4).text();
		var member_phone_modal=tr.eq(5).text();
		var member_name_modal=tr.eq(3).text();
		var member_enable_modal = tr.eq(7).text();
		var class_name_modal = tr.eq(1).text();
		var role_code_modal = tr.eq(6).text();
		
		$('#cid').val(member_id_modal);
		$('#cemail').val(member_email_modal);
		$('#curl').val(member_phone_modal);
		$('#cname').val(member_name_modal);
		$('#class_name').val(class_name_modal);
		
		if(role_code_modal == "학생"){
			$("#agree_s").attr("checked", true);
			$("#agree_t").attr("checked", false);
		}
		else if(role_code_modal == "선생님"){
			$("#agree_t").attr("checked", true);
			$("#agree_s").attr("checked", false);
		} 
		else if(role_code_modal == "일반회원"){
			$("#agree_t").attr("checked", false);
			$("#agree_s").attr("checked", false);
		} 
		// 관리자일 경우
		else{
			$("#agree_t").attr("checked", false);
			$("#agree_s").attr("checked", false);
		}

		
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
		var _param = {member_email:$("#cemail").val(), member_phone:$("#curl").val()
				, member_id:$("#cid").val(), class_name:$("#class_name option:selected").text()
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
   				  location.href="adminMember.do";
   			  },
   			  error: function(request, status, error){
   				  
   				  if($("#agree_s").attr("checked", false) && $("#agree_t").attr("checked", false)){
   					  
   				  swal("권한을 확인해주세요");
   				  }
   			  }
   		});
		
	});	
});

$(function(){
	/* 멤버 삭제(실제 삭제X) */
	var role_code_table;
	var role_code_table_value;
	var member_enable_table;
	var member_enable_table_value;
	$("button[name='deletebtn']").click(function(){
		action='modify';
		type='PUT';
		memberid=this.value;
		member_id_table=memberid;
		console.log('삭제할 테이블 아이디값 : ' + memberid);
		var row =$(this).parent().parent();
		var tr = row.children();
		
		var role_code_modal=tr.eq(6).val();
		var member_enable_modal = tr.eq(7).val();
		
		role_code_table_value=role_code_modal;
		member_enable_table_value=member_enable_modal;
		
		
		/*action = 'modify';
		type = 'PUT';
		memberid = this.value;
		
		var row =$(this).parent().parent();
		var tr = row.children();
		
		var role_code_modal = tr.eq(6).text();
		var member_enable_modal = tr.eq(7).text();
		
		$('#role_code').role_code_modal;
		$('#member_enable').member_enable_modal;
		
		console.log("변경할 값 : " + memberid);*/
	});	
	$('#deleteMemberBtn').click(function() {
		
		var _param = {role_code:role_code_table_value,
					  member_enable:member_enable_table_value};
		
		var _data = JSON.stringify(_param); //jsonString으로 변환	
		$.ajax({
			type : "post",
			url : "adminMemberDelete.do",
			cache : false,
			dataType : "json",
			data : _data,
			processData : false,
			contentType : "application/json; charset=utf-8",
			success : function(data, status){
					alert("삭제 성공");
					location.href="adminMember.do";
				
			},
			error: function(request, status, error){
				swal("에러에러에러에러에러");
			}
		});
	});
});


function oneCheckbox(a){

    var obj = document.getElementsByName("agree");

    for(var i=0; i<obj.length; i++){

        if(obj[i] != a){

            obj[i].checked = false;

        }

    }

}
});	

