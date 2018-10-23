

$(document).ready(function(){
	
	
	
		/* 시험지 삭제 모달창 */
		$("#examPaperDeletebtn").click(function(){	
			
			var _param = {examNum:$("#exam-paper-num")
						  };
			
			var _data = JSON.stringify(_param); // jsonString으로 변환
			
			var class_num_parameter=$('#hidden_class_num').val();
				
				$.ajax({
					type : "post",
					url : "teacherMyExamDelete.do",
					dataType: "json",
					cache: false,
					processData: false,
					data :_data,
					contentType : "application/json; charset=utf-8",
					success : function(data){
						$("#exam-paper-name").remove();
					
						/*$(".exam-paper-name:eq(" + index + ")").remove();
						$(".exam-paper-name:eq(" + index + ")").submit();*/
						
						alert("시험지 삭제 성공");
						location.href="examManagement.do";
					},
					error: function(error){
						alert("에러에러에러에러에러에러");
					}
				});		
			});

	
		/* 시험 일정 페이지 삭제 버튼 구현 */

			/* 시험 일정 삭제 모달창  */

			
			
	});

function deleteExamInfo(){
	
	var button_id = window.event.target.id;
	
	console.log("exam_info_num>>>>"+button_id);
	var deleteconfirm = confirm("정말로 삭제하시겠습니까?");
	if(deleteconfirm == true){
		$.ajax({
			type : "post",
   			  url : "teacherExamSchedultDelete.do",
   			  dataType : "json",
   			  data:{'exam_info_num':button_id},
   			  success : function(data){
				alert("시험 일정 삭제성공");
				location.href="examManagement.do";
				},
				error: function(request, status, error){
				alert("시험 일정 삭제 실패");
			}
		});
	}else{
		
	}

};