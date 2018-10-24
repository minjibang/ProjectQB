function deleteExamInfo(){
	
	var exam_info_num = window.event.target.id;
	
	var deleteconfirm = confirm("정말로 삭제하시겠습니까?");
	if(deleteconfirm == true){
		$.ajax({
			  type : "post",
   			  url : "teacherExamSchedultDelete.do",
   			  dataType : "json",
   			  data:{'exam_info_num':exam_info_num},
   			  success : function(data){
				alert("시험 일정 삭제성공");
				$('#'+exam_info_num).parent().parent(".exam_info_name").remove();
				},
				error: function(request, status, error){
				alert("시험 일정 삭제 실패");
			}
		});
	}else{
		
	}

};