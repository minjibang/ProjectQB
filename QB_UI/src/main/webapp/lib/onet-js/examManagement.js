/**
 * 18.10.15 영준 examManagement.js 파일 추가 
 */

$(document).ready(function() {

	/* 내 시험지 페이지 삭제 버튼 구현 */
	
	
	$("button[name='deleteExamPaperBtn']").click(function(){
		var index = $("button[name='deleteExamPaperBtn']").index(this);
		
		console.log("시험지 이름 가져오기 : " + index);
		

	});
		/* 시험지 삭제 모달창 */
		$("#deletebtn").click(function(){		
		
		
			var examName = $("#exam_paper_name").text();
			var class_num_parameter=$('#hidden_class_num').val();
			
			console.log("시험지 이름 왜 이렇게 나오냐 : " + examName);

				
				$.ajax({
					type : "post",
					url : "teacherMyExamDelete.do",
					data : {"exam_paper_name":examName
						
					},
					contentType : "application/json; charset=utf-8",
					success : function(data){
		
						/*$(".exam_paper_name:eq(" + index + ")").remove();
						$(".exam_paper_name:eq(" + index + ")").submit();*/
						alert("삭제 성공");
						location.href="examManagement.do?class_num="+class_num_parameter;
					},
					error: function(error){
						alert("에러에러에러에러에러에러");
					}
				});
			
					
		});
		
		
		
		
		/* 시험 일정 페이지 삭제 버튼 구현 */

		/*$("button[name='deleteExamScheduleBtn']").click(function(){
			action = 'delete';
			type = 'PUT';
			examinfoname = this.value;
			
			var row = $(this);
			var p = row.children();
			
			
		});
			 시험 일정 삭제 모달창 
			$('#deletebtn').click(function(){
				var _param = {exam_info_name:$("#exam_info_name").val()};
				
				var _data = JSON.stringify(_param); //jsonString으로 변환
				
				$.ajax({
					type : "post",
					url : "teacherExamSchedultDelete.do",
					cache : false,
					dataType : "json",
					data : _data,
					processData : false,
					contentType : "application/json; charset=utf-8",
					success : function(data, status){
						$('').remove();
						alert("삭제된 시험 일정 값 : " + exam_info_name);
						location.href="examManagement.do";
					},
					error: function(request, status, error){
						alert("에러에러에러에러에러에러");
					}
				});
			});*/
		
	});