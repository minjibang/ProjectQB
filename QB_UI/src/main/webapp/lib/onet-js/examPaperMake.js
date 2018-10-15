/**
 * 18.10.10 현이 teacherMyExamPaper.js 파일 추가 
 */

jQuery(document).ready(function() {
	TaskList.initTaskWidget();
	
	var question_num = $('.question_num').val();
	console.log(question_num);
	$.ajax(
		{
			type:"POST",
	        url:"examPaperMake.do",
	        data : {question_num : question_num},
	        dataType : "JSON",
	        success: function(xml){
	            console.log(xml);
	        },
	        error: function(xhr, status, error) {
	            alert(error);
	        }  
		}	
	);
	
});

$(function() {
	$("#sortable").sortable();
	$("#sortable").disableSelection();
});