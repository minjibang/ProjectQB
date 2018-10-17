/**
 * 18.10.15 영준 examManagement.js 파일 추가 
 */

$(document).ready(function() {

	/* 내 시험지 삭제 버튼 구현 */
	var exam_paper_name;
	
	$('#deleteExamPaperBtn').click(function(){
		action = 'delete';
		type = 'PUT';
		exampapername = this.value;
		var row = $(this).parent('#examPaperDiv').remove();
		console.log('삭제할 시험지 값 : ' + exampapername);
	});
	$('#deletebtn').click(function(){
		var _param = {exam_paper_name:$('#exam_paper_name').val()}
		
		var _data = JSON.stringify(_param);
		
		$.ajax({
			type : "post",
			url : "teacherMyExamDelete.do",
			cache : false,
			dataType : "json",
			data : _data,
			processData : false,
			contentType : "application/json; charset=utf-8",
			success : function(data, status){
				alert("삭제되었습니다");
				location.href="examManagement.do";
			},
			error: function(request, status, error){
				alert("에러에러에러에러에러에러");
			}
		});
	});

});


