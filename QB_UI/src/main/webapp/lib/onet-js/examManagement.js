/**
 * 18.10.15 영준 examManagement.js 파일 추가 
 */


$(document).ready(function(){

		/* 내 시험지 페이지 삭제 버튼 구현 */

		$("button[name='deleteExamPaperBtn']").click(function(){
			var index = $("button[name='deleteExamPaperBtn']").index(this);
		
			console.log("시험지 이름 가져오기 : " + index);
		
		});
		
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
						location.href="examManagement.do?class_num="+class_num_parameter;
					},
					error: function(error){
						alert("에러에러에러에러에러에러");
					}
				});		
			});

	
		/* 시험 일정 페이지 삭제 버튼 구현 */
		
		$("button[name='deleteExamScheduleBtn']").click(function(){
			
			var index = $("button[name='deleteExamScheduleBtn']").index(this);
			
			console.log("시험 일정 이름 가져오기 : " + index);	
			
		});
			/* 시험 일정 삭제 모달창  */
			$('#examScheduleDeletebtn').click(function(){
				
				var _param = {examInfoNum:$('#exam-info-num')};
				
				var _data = JSON.stringify(_param); // jsonString으로 변환
				
				var class_num_parameter=$('#hidden_class_num').val();
				
				$.ajax({
					type : "post",
					url : "teacherExamSchedultDelete.do",
					dataType: "json",
					cache: false,
					processData: false,
					data :_data,
					contentType : "application/json; charset=utf-8",
					success : function(data){
						alert("시험 일정 삭제성공");
						location.href="examManagement.do?class_num="+class_num_parameter;
					},
					error: function(request, status, error){
						alert("에러에러에러에러에러에러");
					}
				});
			});
	});