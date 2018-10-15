/*민지*/
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
		
		$('#member_id').val(member_id_modal);
		$('#member_email').val(member_email_modal);
		$('#member_phone').val(member_phone_modal);
		$('#member_name').val(member_name_modal);
		
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
		
	console.log("바뀌는 권한 값 ??>>>" + role_code_val);
		var _param = {member_email:$("#member_email").val(), member_phone:$("#member_phone").val()
				, member_id:$("#member_id").val(), class_name:$("#class_name option:selected").text()
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
   				  alert("해당아이디값"+memberid);
   				  location.href="adminMember.do";
   			  },
   			  error: function(request, status, error){
   				  console.log("request 값이 뭐냐  >>>> "+ request);
   				  alert("에러야!");
   			 }
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
   				  console.log("request 값이 뭐냐  >>>> "+ request);
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

