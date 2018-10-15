/*
 * 한결
 * 10.13 pastExam.js 추가

 */
$(document).ready(function(){
	
	/*지난 시험지 보기*/
	$('.exam_rewind').click(function() {

		var popUrl = "pastExamPaper.do";
		var popOption = "width=1000px, resizable=no, location=no, left=50px, top=100px";

		window.open(popUrl, "지난 시험보기",popOption);
	});
	
	$('#search_btn').click(function(){
		alert($('#search_input').val()+" || 검색을 시작합니다.");
	});
	
});
