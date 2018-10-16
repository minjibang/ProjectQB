/**
 * 18.10.10 현이 teacherMyExamPaper.js 파일 추가 
 */

jQuery(document).ready(function() {
	TaskList.initTaskWidget();
	$('#pickQuestionBtn').click(function(){

	      var selected = new Array();
	      $('input[name="checkbox[]"]:checked').each(function() {
	         selected.push("<li><div class='row'>" + $(this).parents(".qnumdiv").parents(".questionDiv").html()+ "배점: <input type='number' class='form-control questionScoreInputTag' name='quantity' min='1' max='5' /><hr></div></li>");
	      });
	      $('.task-list').append(selected);
	      
	      $('input[name="checkbox[]"]:checked').prop('checked',false);
	   });
	
});

$(function() {
	$("#sortable").sortable();
	$("#sortable").disableSelection();
});