$(document).ready(function(){
	$("button[name='updatebtn']").click(function(){
		action='modify';
		type='PUT';
		memberid=this.value;
		
		var row =$(this).parent().parent();
		var tr = row.children();
		
		var member_id_modal=tr.eq(1).text();
		var member_email_modal=tr.eq(3).text();
		var member_phone_modal=tr.eq(4).text();
		
		$('#member_id').val(member_id_modal);
		$('#member_email').val(member_email_modal);
		$('#member_phone').val(member_phone_modal);
	});
	
	$('#classUpdateMemberBtn').click(function() {

	console.log($("#class_name option:selected").text());
		var _param = {member_email:$("#member_email").val(), member_phone:$("#member_phone").val(),member_id:$("#member_id").val(), class_name:$("#class_name option:selected").text()};
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

