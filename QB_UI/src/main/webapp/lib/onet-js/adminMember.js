/*
 	@JSP:adminMember.js
 	@DATE:2018.10.16
 	@Author:유영준
 	@Desc:회원관리 js(스토리보드 10 of 41)
 */

$(document).ready(function(){
	//영준 - 관리자 회원관리 DataTable
	//양회준 10.31-관리자 회원관리 DataTable 수정
	var memberTable=$('#adminMemberTable').DataTable( {
		"ordering":true,
		"paging": true,
		"ordering":true,
		"searching": true,
		"bLengthChange" : false,
		 "language": {
             "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Korean.json"
         },
         "processing":true,
         "deferRender": true,
		"ajax": {
            url: 'adminMemberAjax.do',
            method: "post",
            dataSrc:"",
            xhrFields: {
                withCredentials: true
            }
        },
        "columnDefs":[
        	{"orderable":false, "targets":0}
        	],
        "columns":
        [
        	{defaultContent:"<input type='checkbox' id='chk' name='chk' value='chk'>"},
            {data: "class_name" },
            {data: "member_id" },
            {data: "member_name" },
            {data: "member_email" },
            {data: "member_phone" },
            {data: "role_desc" },
            {data: "member_enable" },
            {defaultContent:"<button type='button' class='btn btn-info'id='updatebtn' name='updatebtn' data-toggle='modal'data-target='#UpdateModal'><i class='fa fa-pencil'></i></button><button type='button' class='btn btn-danger deletebtn' id='deletebtn' name='deletebtn'><i class='fa fa-trash-o'></i></button>"}
        ]
    } );
	//양회준 10.31 DataTable 검색 구현
	//권한 검색
	$("#searchRole").on("change", function(){
		memberTable.column(6).search(this.value).draw();
	});
	//클래스 검색
	$("#searchClassName").on("change", function(){
		memberTable.column(1).search(this.value).draw();
	});
	//이름, id, email 검색설정
	$("#searchMemberInfo").on("change", function(){
		if(this.value=="name"){
			memberTable.columns(3).search($("#searchBox").val()).draw();
		}else if(this.value=="id"){
			memberTable.columns(2).search($("#searchBox").val()).draw();
		}else if(this.value=="email"){
			memberTable.columns(4).search($("#searchBox").val()).draw();
		}else{}
	});
	//단어검색
	$("#searchBox").on("keyup", function(){
		memberTable.search($("#searchBox").val()).draw();
	});
	//양회준 10.31 검색 초기화
	$("#memberSearchBtn").click(function(){
		$("#searchRole option").prop("selected", false);
		$("#searchClassName option").prop("selected", false);
		$("#searchMemberInfo option").prop("selected", false);
		memberTable.search("").columns().search("").draw();
	});
	//양회준 10.31 삭제버튼
	$(document).on("click", ".deletebtn", function(){
		var deleteAuth = $(this).parent().prev();
		var deleteId = $(this).parent().prev().prev().prev().prev().prev().prev().text();
		swal({
			  title:"삭제 확인",
			  text: "정말 삭제 하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {				  
				  $.ajax({
						type : "post",
						url : "adminMemberDelete.do",
						data : {"member_id":deleteId},
						dataType : "json",						
						success : function(data, status){
							deleteAuth.text("0");
						},
						error: function(request, status, error){
							swal("에러에러에러에러에러");
						}
					});
				    swal("성공적으로 삭제하였습니다.", {
				      icon: "success",					      
				    });
				  } else {
				    swal("삭제가 취소되었습니다.");
				  }
				});
		
	});
	
	function allCheckFunc( obj ) {
		$("[name=chk]").prop("checked", $(obj).prop("checked") );
	}

/* 체크박스 체크시 전체선택 체크 여부 */
	function oneCheckFunc( obj ){
		var allObj = $("#checkall");
		var objName = $(obj).attr("name");
	
		if( $(obj).prop("checked") ){
			checkBoxLength = $("[name="+ objName +"]").length;
			checkedLength = $("[name="+ objName +"]:checked").length;
	
			if( checkBoxLength == checkedLength ) {
				allObj.prop("checked", true);
			} else {
				allObj.prop("checked", false);
			}
		}else{
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

	/*수정버튼 눌렀을때 부모창 값을 모달창에 가져오기*/
	//양회준 10.31 수정	
	var rowIndex;//수정 버튼 및 모달창 사용
	$(document).on("click","button[name='updatebtn']",function(){				
		var tdArr=$(this).parent().parent().children();
		rowIndex=$(this).parent().parent().index();
		console.log("인덱스?:"+rowIndex);
		var role_code_modal = tdArr.eq(6).text();
		
		$('#cid').val(tdArr.eq(2).text());
		$('#cemail').val(tdArr.eq(4).text());
		$('#curl').val(tdArr.eq(5).text());
		$('#cname').val(tdArr.eq(3).text());
		$('#class_name').val(tdArr.eq(1).text());
		
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
		var role_code_val=$("input[name=agree]:checked").val();	
		console.log("여기서는?"+rowIndex);
		var _param = {member_email:$("#cemail").val(), member_phone:$("#curl").val()
				, member_id:$("#cid").val(), class_name:$("#class_name option:selected").text()
				, role_code:role_code_val }
		var _data = JSON.stringify(_param); //jsonString으로 변환

		if($('#cemail').val()==""||$('#curl').val()==""){
			swal("실패", "입력칸을 채워주세요.", "error");
		}else{
			$.ajax({
   			  type : "post",
   			  url : "adminMemberUpdate.do",
   			  cache: false,
   			  dataType: "json",
   			  data:_data,  
   			  processData: false,
   			  contentType: "application/json; charset=utf-8",
   			  success : function(data, status){
   				  swal({
   					  title: "수정 되었습니다",
   					  text: "",
   					  icon:"success"
   				  }).then(function() {   					  
   					  $("#adminMemberTable>tbody>tr:eq("+rowIndex+")").children().eq(4).text(_param.member_email);
   					  $("#adminMemberTable>tbody>tr:eq("+rowIndex+")").children().eq(5).text(_param.member_phone);
   					  $("#adminMemberTable>tbody>tr:eq("+rowIndex+")").children().eq(6).text(_param.role_code);
   					  $("#UpdateModal").modal("hide");
   				  });
   			  },
   			  error: function(request, status, error){   				  
   				  if($("#agree_s").attr("checked", false) && $("#agree_t").attr("checked", false)){   					  
   					  swal("실패!","권한을 확인해주세요","error");
   				  }
   			  }
	   		});
		}
	});	

	var rowMemberAuth;
	var rowMemberId;
	//체크박스값 가져와 일괄학생등록
	$(document).on("click","#selectInsertbtn", function(){
		var checkbox = $("input[name=chk]:checked").length;
		if(checkbox == 0){
			swal("실패!","등록할 회원을 선택해주세요","error");
		} else{}
		var rowMemberAuth="";
		var rowMemberId="";
		var updateStudentArr = new Array();
		var rowMemberAuthArr = new Array();		
		$("input[name=chk]:checked").each(function(i){
			rowMemberId = $("input[name=chk]:checked:eq("+i+")").parent().parent().children().eq(2).text();
			rowMemberAuth = $("input[name=chk]:checked:eq("+i+")").parent().parent().children().eq(6).text();
			updateStudentArr.push(rowMemberId);	
			rowMemberAuthArr.push(rowMemberAuth);
		});
				
		if(rowMemberAuthArr.toString().match("ROLE_STUDENT")){
			swal("실패!","이미 학생으로 등록된 회원이 있습니다","error");
		}else{			
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url : "updateStudentsAjax.do",
				type : "post",
				data : {
					"updateStudentArr" : updateStudentArr
				},
				dataType : "text",
				success:function(data){
					$("input[name=chk]:checked").each(function(i){
						rowMemberAuth = $(this).parent().parent().children().eq(6).text("ROLE_STUDENT");
					});
					swal("성공!","학생으로 등록 되었습니다","success");
				},
				error : function(error){
					swal("실패!","등록할 회원을 선택해주세요","error");
				}
			});
		}
		console.log(updateStudentArr);
		console.log(JSON.stringify(updateStudentArr));
	});
	/*
	$("#insertMembersPermit").click(function(){	
		var updateStudentArr = new Array();
		var rowMemberAuthArr = new Array();
		$("input[name=chk]:checked").each(function(i){
			rowMemberId = $(this).parent().parent().children(".member_id").text().trim();
			rowMemberAuth = $(this).parent().parent().children(".role_code").text().trim();
			updateStudentArr.push(rowMemberId);	
			rowMemberAuthArr.push(rowMemberAuth);
		});
		
		if(rowMemberAuthArr.toString().match("학생")){
			swal("이미 학생으로 등록된 회원이 있습니다");
		}else{
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url : "updateStudentsAjax.do",
				type : "post",
				data : {
					"updateStudentArr" : updateStudentArr
				},
				dataType : "text",
				success:function(data){
					$("input[name=chk]:checked").each(function(i){
						rowMemberAuth = $(this).parent().parent().children(".role_code").text("학생");
					});
					swal("학생으로 등록 되었습니다");
					console.log("성공한 값 : " + data);
				},
				error : function(error){
					swal("에러가 발생했습니다.");
				}
			});
		}
		console.log(updateStudentArr);
		console.log(JSON.stringify(updateStudentArr));
		
	});*/
	//체크박스 값 일괄 삭제
	$("#selectDeletebtn").click(function(){
		var checkbox = $("input[name=chk]:checked").length;
		if(checkbox == 0){
			swal("실패!","삭제할 회원을 선택해주세요","error");
		} else{}
		var deleteStudentArr = new Array();
		var memberEnableArr = new Array();
		var rowMemberId="";
		var memberEnable="";
		$("input[name=chk]:checked").each(function(i){
			rowMemberId = $("input[name=chk]:checked:eq("+i+")").parent().parent().children().eq(2).text();
			memberEnable = $("input[name=chk]:checked:eq("+i+")").parent().parent().children().eq(7).text();
			deleteStudentArr.push(rowMemberId);		
			memberEnableArr.push(memberEnable);			
		});
		if(memberEnableArr.toString().match("0")){
			swal("실패!","이미 삭제된 회원이 포함되어 있습니다.","error");
		}else{
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url : "deleteStudentsAjax.do",
				type : "post",
				data : {
					"deleteStudentArr" : deleteStudentArr
				},
				dataType : "text",
				success:function(data){
					swal("선택한 회원들이 삭제되었습니다.");
					$("input[name=chk]:checked").each(function(i){
						var rowMemberEnabled = $(this).parent().parent().children().eq(7).text("0");
					});
				},
				error : function(error){
					swal("실패!","삭제할 회원을 선택해주세요","error");
				}
			});
		}
	});
	
	$("#deleteMembersPermit").click(function(){
		var deleteStudentArr = new Array();
		var memberEnableArr = new Array();
		var rowMemberId="";
		var memberEnable="";
		$("input[name=chk]:checked").each(function(i){
			rowMemberId = $(this).parent().parent().children(".member_id").text().trim();
			memberEnable = $(this).parent().parent().children(".member_enable").text().trim();
			deleteStudentArr.push(rowMemberId);		
			memberEnableArr.push(memberEnable);			
		});
		
		if(memberEnableArr.toString().match("0")){
			swal("실패!","이미 삭제된 회원이 포함되어 있습니다.","error");
		}else{
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url : "deleteStudentsAjax.do",
				type : "post",
				data : {
					"deleteStudentArr" : deleteStudentArr
				},
				dataType : "text",
				success:function(data){
					swal("성공","선택한 회원들이 삭제되었습니다.","success");
					$("input[name=chk]:checked").each(function(i){
						var rowMemberEnabled = $(this).parent().parent().children().eq(7).text("0");
					});
				},
				error : function(error){
					swal("에러가 발생했습니다.");
				}
			});
		}		
	});
})