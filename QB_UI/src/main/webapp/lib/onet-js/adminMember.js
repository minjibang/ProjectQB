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
	
	var deleteId;
	var index;
	$(".deletebtn").click(function(){
		index = $(".deletebtn").index(this);	
		deleteId = $(this).parent().parent().children(".member_id").text();
		console.log("과연 index:"+index);
		console.log("과연:"+deleteId);
	});
	
	$('#deleteMemberBtn').click(function() {
		console.log("ajax:"+deleteId);
		$.ajax({
			type : "post",
			url : "adminMemberDelete.do",
			data : {"member_id":deleteId},
			dataType : "json",
			
			success : function(data, status){
				alert("삭제 성공");
				var test = $(".deletebtn:eq("+index+")").parent().parent().children(".member_enable").text("0");
				console.log("관리:"+test);
			},
			error: function(request, status, error){
				swal("에러에러에러에러에러");
			}
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
		
	/* 검색 버튼 구현 */
	$("#memberSearchBtn").click(function(){
		var html = "";
		var searchRole = $("#searchRole").val();			
		var searchClassName = $("#searchClassName").val();
		var searchMemberInfo = $("#searchMemberInfo").val();
		var searchBox = $("#searchBox").val();
		//검색조건 유효성
		if(searchRole==""&&searchClassName==""&&searchBox==""){
			swal("Error!", "검색값을 입력해주십시오.", "error");
		}else if(searchRole==""&&searchClassName==""&&searchMemberInfo==""){
			swal("Error!", "검색할 조건 입력해주십시오.", "error");
		}
		
		$.ajax({
			url : "memberSearchAjax.do",
			type : "post",
			data : {
					'searchRole' : searchRole,
					'searchClassName' : searchClassName,
					'searchMemberInfo' : searchMemberInfo,
					'searchBox' : searchBox
			},
			dataType : "json",
			success:function(data){
				console.log(data.length);
				if(data.length!=0){
					$(data).each(function(index, element){
						console.log(index+" : "+element.member_id);
						
						html += "<tr><td><input type='checkbox' id='chk' name='chk' value='chk'></td>";
						html += "<td id='class_name' class='class_name'>"+element.class_name+"</td>";
						html += "<td id='member_id' class='member_id' name='member_id'>"+element.member_id+"</td>";
						html += "<td id='member_name' class='member_name'>"+element.member_name+"</td>";
						html += "<td id='member_email' class='member_email'>"+element.member_email+"</td>";
						html += "<td id='member_phone' class='member_phone'>"+element.member_phone+"</td>";
						html += "<td id='role_code' class='role_code'>"+element.role_desc+"</td>";
						html += "<td id='member_enable' class='member_enable'>"+element.member_enable+"</td>";
						html += "<td><button type='button' class='btn btn-info' id='updatebtn' name='updatebtn' data-toggle='modal'";
						html += "data-target='#UpdateModal' value='"+element.member_id+"'><i class='fa fa-pencil'> </i></button>'";
						html += "<button type='button' class='btn btn-danger' id='deletebtn' name='deletebtn' data-toggle='modal'";
						html += "data-target='#DeleteModal' value='"+element.member_id+"'><i class='fa fa-trash-o'></i></button></td></tr>'";
						
						$("#memberListView").empty().append(html);
					});
				}else{
					swal("Error!", "검색된 데이터가 없습니다.", "error");
				}
			},
			error : function(error){
				console.log("실패....");
			}
		});		
	});
	
	//체크박스값 가져와 일괄학생등록
	$("#insertMembersPermit").click(function(){
		var updateStudentArr = new Array();
		$("input[name=chk]:checked").each(function(i){
			var rowMemberId = $(this).parent().parent().children(".member_id").text().trim();
			updateStudentArr.push(rowMemberId);			
		});
		console.log(updateStudentArr);
		console.log(JSON.stringify(updateStudentArr));
		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			url : "updateStudentsAjax.do",
			type : "post",
			data : {
				"updateStudentArr" : updateStudentArr
			},
			dataType : "text",
			success:function(data){
				console.log("성공");
				$("input[name=chk]:checked").each(function(i){
					var rowMemberAuth = $(this).parent().parent().children(".role_code").text("학생");
				});
			},
			error : function(error){
				console.log("헷갈림 실패....");
			}
		});
	});
	
	//체크박스 값 일괄 삭제
	$("#deleteMembersPermit").click(function(){
		var deleteStudentArr = new Array();
		$("input[name=chk]:checked").each(function(i){
			var rowMemberId = $(this).parent().parent().children(".member_id").text().trim();
			deleteStudentArr.push(rowMemberId);			
		});
		console.log(deleteStudentArr);
		console.log(JSON.stringify(deleteStudentArr));
		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			url : "deleteStudentsAjax.do",
			type : "post",
			data : {
				"deleteStudentArr" : deleteStudentArr
			},
			dataType : "text",
			success:function(data){
				console.log("성공");
				$("input[name=chk]:checked").each(function(i){
					var rowMemberEnabled = $(this).parent().parent().children(".member_enable").text("0");
				});
			},
			error : function(error){
				console.log("헷갈림 실패....");
			}
		});
	});
});	