/**
 * 18.10.10 현이 teacherMyExamPaper.js 파일 추가
 * 18.10.16 한결 선택문제 출제 및 삭제 
 */

jQuery(document).ready(function() {
	TaskList.initTaskWidget();
	
	/*선택문제 출제*/
	$('#pickQuestionBtn').click(function(){

		var selected = new Array();
		$('input[name="checkbox[]"]:checked').each(function() {
			selected.push("<li><div class='row'>" + $(this).parents(".qnumdiv").parents(".questionDiv").html()+ "<hr><div class='col-lg-12 qscore'>배점:&nbsp; <input type='number' class='form-control questionScoreInputTag' name='quantity' min='1' max='5' /><hr></div></div></li>");
		});
		$('.task-list').append(selected);
		
		$('input[name="checkbox[]"]:checked').prop('checked',false);
	});
	
	/*선택문제 삭제*/
	$('#pickQuestionDeleteBtn').click(function(){
		
		alert($('input[name="checkbox[]"]:checked').length);
		$('input[name="checkbox[]"]:checked').each(function() {
			$(this).parents(".qnumdiv").parents(".row").empty();
		});
	});
});

$(function() {
	$("#sortable").sortable();
	$("#sortable").disableSelection();
});