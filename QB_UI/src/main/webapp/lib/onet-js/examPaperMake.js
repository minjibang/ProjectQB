/**
 * 18.10.10 현이 teacherMyExamPaper.js 파일 추가
 * 18.10.16 한결 선택문제 출제 및 삭제 
 */

jQuery(document).ready(function() {

	TaskList.initTaskWidget();
	
	/*선택문제 출제 + 문제 수 +카운트*/
	$('#pickQuestionBtn').click(function(){
		/*문제 수*/
		var sortable_li_num = $('#qnum').text();
		/*선택한 애들의 순서 지정할 배열 생성*/
		var selected = new Array();
		
		/*선택된 애들의 html 끌어오기*/
		$('input[name="checkbox[]"]:checked').each(function() {
			selected.push("<li><div class='row'>" 
					+ $(this).parents(".qnumdiv").parents(".questionDiv").html()
					+ "<hr><div class='col-lg-12 qscore'>배점:&nbsp; <input type='number' " +
							"class='form-control questionScoreInputTag' id='qqq' name='quantity' min='1' max='5'  " +
							"onchange='plusqcore()' /><hr></div></div></li>");
			/*문제 수 +1*/
			sortable_li_num++;
		});
		/*오른쪽 구역으로 이동*/
		$('.task-list').append(selected);
		/*선택한 애들 선택해제*/
		$('input[name="checkbox[]"]:checked').prop('checked',false);
		/*이동한 문제수 만큼 문제 개수 카운트*/
		$('#qnum').text(sortable_li_num);
		
		/*$('#qcore').text(qcore);*/
	});
	
	/*선택문제 삭제 + 문제 수 -카운트 / 점수 -카운트*/
	$('#pickQuestionDeleteBtn').click(function(){
		/*문제 수*/
		var sortable_li_num = $('#qnum').text();
		/*점수 카운트*/
		var qc = Number($('#qcore').text());
		
		/*체크된 애들만 실행*/
		$('input[name="checkbox[]"]:checked').each(function() {
			/*선택문제 삭제부분*/
			$(this).closest("li").remove();
			sortable_li_num--;
			
			/*점수 -카운트*/
			qc = qc - Number($(this).parents('.qnumdiv').siblings(".qscore").children("#qqq").val());
		});
		$('#qnum').text(sortable_li_num);
		$('#qcore').text(qc);
	});
	
	$('#pickQuestionTempSaveModalBtn').click(function(){
		if($('#qcore').val() >= 101){
			alert("총 배점이 100점을 넘을 수 없습니다.");
			return false;
		};
		$('div.modal').modal();
	});
});

function plusqcore(){
	var qc = Number($('#qcore').val());
	$('.questionScoreInputTag').each(function(){
		if($(this).val()>=101){
			alert("한 문제당 최대 배점은 5점까지 인정됩니다.");
			$(this).val(5);
			qc += Number(5);
		} else {
			qc += Number($(this).val());
		}
	});
		if(qc > 100){
			alert("총 점수가 100점이 넘을 수 없습니다.");
			$('#qcore').text(qc);
		}
		$('#qcore').text(qc);
};

$(function() {
	$("#sortable").sortable();
	$("#sortable").disableSelection();
});