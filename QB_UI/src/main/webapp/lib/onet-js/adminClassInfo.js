/*
	@JSP:adminClassInfo.js
	@DATE:2018-10-13
	@Author:방민지
	@Desc:클래스관리 js(스토리보드 ??of 41)
*/

$(document).ready(function(){
	
	/*수정버튼 눌렀을때 부모창 값을 모달창에 가져오기*/
	$("button[name='updatebtn']").click(function(){
		
		
		action='modify';
		type='PUT';
		memberid=this.value;
		
		var row =$(this).parent().parent();
		var tr = row.children();
		
		var member_id_modal=tr.eq(1).text();
		var member_email_modal=tr.eq(3).text();
		var member_phone_modal=tr.eq(4).text();
		var member_name_modal=tr.eq(2).text();
		var role_code_modal = tr.eq(5).text();
		
		$('#cid').val(member_id_modal);
		$('#cemail').val(member_email_modal);
		$('#curl').val(member_phone_modal);
		$('#cname').val(member_name_modal);
		
		if(role_code_modal == '학생'){
			$("#agree_s").attr("checked", true);
			$("#agree_t").attr("checked", false);
		}
		else if(role_code_modal == '선생님'){
			$("#agree_t").attr("checked", true);
			$("#agree_s").attr("checked", false);
		}
		
		
		
	});
	
	/*클래스 멤버 수정*/
	$('#classUpdateMemberBtn').click(function() {
		var role_code_val;
		
		if ($('#agree_s').is(":checked"))
		{
		  role_code_val=$('#agree_s').val();
		}
		else if($('#agree_t').is(":checked")){
			role_code_val=$('#agree_t').val();
		}
		else if($("#agree_s").attr("checked", false) && $("#agree_t").attr("checked", false)){
			alert('권한을 체크해주세요.');
		}
		
		
	
		var _param = {member_email:$("#cemail").val(), member_phone:$("#curl").val()
				, member_id:$("#cid").val(), class_name:$("#class_name option:selected").text()
				, role_code:role_code_val }

		var _data = JSON.stringify(_param); //jsonString으로 변환	                                                      
		$.ajax({
   			  type : "post",
   			  url : "adminClassMemberUpdate.do",
   			  cache: false,
   			  dataType: "json",
   			  data:_data,  
   			  processData: false,
   			  contentType: "application/json; charset=utf-8",
   			  success : function(data, status){
<<<<<<< .merge_file_a08884
   				  alert("수정성공");
   				  location.href="adminClassInfo.do";
   			  }
=======
   				  alert("해당아이디값"+memberid);
   				  location.href="adminMember.do";
   			  },
   			  error: function(request, status, error){
   				  console.log("request 값이 뭐냐  >>>> "+ request);
   				  alert("에러야!");
   			 }
>>>>>>> .merge_file_a02876
   		});
		
	});	
	
	/*클래스멤버 삭제 */
	var member_id_table;
	var member_id_table_value;
	$("button[name='deletebtn']").click(function(){
		action='delete';
		type='PUT';
		memberid=this.value;
		member_id_table=memberid;
		console.log('삭제할 테이블 아이디값' + memberid);
		var row =$(this).parent().parent();
		var tr = row.children();
		
		var member_id_modal=tr.eq(1).text();
		
		member_id_table_value=member_id_modal;
		
	});
	
	
	$('#classDeleteMemberBtn').click(function() {
		
		
		var _param = {member_id:member_id_table_value};

		var _data = JSON.stringify(_param); //jsonString으로 변환	                                                      
		$.ajax({
   			  type : "post",
   			  url : "adminClassMemberDelete.do",
   			  cache: false,
   			  dataType: "json",
   			  data:_data,  
   			  processData: false,
   			  contentType: "application/json; charset=utf-8",
   			  success : function(data, status){
   				  alert("삭제 성공");
   				  location.href="adminClassInfo.do";
   			  },
   			  error: function(request, status, error){
   				  alert("에러야!");
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

