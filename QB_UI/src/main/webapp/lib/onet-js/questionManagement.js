/**
 * 18.10.15 재훈 questionManagement.js 파일 추가 
 */

/*문제 타입 변경 시 div 보여주기 시작*/
function questionType(id){
	if (id == "questionChoice") {
		document.all["questionChoice"].style.display = ''; // 보이게
		document.all["questionShortAnswer"].style.display = 'none'; // 안보이게
		
	} else {
		document.all["questionChoice"].style.display = 'none'; // 안보이게
		document.all["questionShortAnswer"].style.display = ''; // 보이게
	}
}
/* 문제 타입 변경 시 div 보여주기 끝 */

/*객관식 보기 개수 선택시 보기내용 입력창, 정답선택 버튼 갯수 조절 비동기 스크립트 시작 */

$(function() {
		$("#question_type_1").click(function(){ 
	        $("#questionAnswerRadio1").attr("disabled", false);
	        $("#questionAnswerRadio2").attr("disabled", false);
	        $("#questionAnswerRadio3").attr("disabled", false);
	        $("#questionAnswerRadio4").attr("disabled", false);
	        $("#questionAnswerRadio5").attr("disabled", false);
	        $("#questionType2Answer").attr("disabled", true);
	   });
            $("#question_type_2").click(function(){
			$("#questionAnswerRadio1").attr("disabled", true);
	        $("#questionAnswerRadio2").attr("disabled", true);
	        $("#questionAnswerRadio3").attr("disabled", true);
	        $("#questionAnswerRadio4").attr("disabled", true);
	        $("#questionAnswerRadio5").attr("disabled", true);
			$("#questionType2Answer").attr("disabled", false);
	   });
});
		
    
$(function() {
	$('#howManyChoices')
		.change(
			function() {
				var remove = document.getElementById("choiceInput");
				remove.innerHTML="";
				var remove1 = document.getElementById("answerChoiceText");
				remove1.innerHTML="";
							
				var _choiceInput1 ='<b><input type="text" name="question_choice_num" value="1" style="display: none">1.</b> <input type="text" name="question_choice_content" class="form-control-inline" placeholder="1번 보기 내용을 입력해주세요." required> <span class="fileupload fileupload-new imageup" data-provides="fileupload"> <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div> <span> <span class="btn btn-theme02 btn-file"> <span class="fileupload-new"> <i class="fa fa-paperclip"></i>image </span> <span class="fileupload-exists"><i class="fa fa-undo"></i>Change </span> <input type="file" class="default" /> </span> <a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a> </span> </span><br>'
				var _choiceInput2 ="<b><input type='text' name='question_choice_num' value='2' style='display: none'>2.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='2번 보기 내용을 입력해주세요.' required> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
				var _choiceInput3 ="<b><input type='text' name='question_choice_num' value='3' style='display: none'>3.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='3번 보기 내용을 입력해주세요.' required> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
				var _choiceInput4 ="<b><input type='text' name='question_choice_num' value='4' style='display: none'>4.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='4번 보기 내용을 입력해주세요.' required> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
				var _choiceInput5 ="<b><input type='text' name='question_choice_num' value='5' style='display: none'>5.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='5번 보기 내용을 입력해주세요.' required> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
				var _answerBtn1 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="1" >1번 </label>&nbsp;&nbsp;'
				var _answerBtn2 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="2" >2번 </label>&nbsp;&nbsp;'
				var _answerBtn3 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="3" >3번 </label>&nbsp;&nbsp;'
				var _answerBtn4 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="4" >4번 </label>&nbsp;&nbsp;'
				var _answerBtn5 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="5" >5번 </label>&nbsp;&nbsp;'
							
				if (document.getElementById("howManyChoices").value == "2") {
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
				}
				if (document.getElementById("howManyChoices").value == "3") {
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#choiceInput').append(_choiceInput3);
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
					$('#answerChoiceText').append(_answerBtn3);
				}
				if (document.getElementById("howManyChoices").value == "4") {
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#choiceInput').append(_choiceInput3);
					$('#choiceInput').append(_choiceInput4);
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
					$('#answerChoiceText').append(_answerBtn3);
					$('#answerChoiceText').append(_answerBtn4);
				}	
				if (document.getElementById("howManyChoices").value == "5") {
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#choiceInput').append(_choiceInput3);
					$('#choiceInput').append(_choiceInput4);
					$('#choiceInput').append(_choiceInput5);
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
					$('#answerChoiceText').append(_answerBtn3);
					$('#answerChoiceText').append(_answerBtn4);
					$('#answerChoiceText').append(_answerBtn5);
				}	
		})
});
/* 객관식 보기 개수 선택시 보기내용 입력창, 정답선택 버튼 갯수 조절 비동기 스크립트 끝 */
			

function check(){
	
	var _smCategory = $("#question_sm_category2 option:selected").val();
	var _questionLevel = $("#question_level option:selected").val();
	var _questionName = $("input[type=text][name=question_name]").val();
	var _questionChoiceAnswer = $("input[type=radio][name=question_answer]:checked").val();
	var _questionChoiceContent = $("#question_choice_content").val();
	
	var _QuesContValue = $("input[name='question_choice_conten'")
	
	alert("_smCategory value=[[ " + _smCategory + " ]]"
		+ "_questionLevel value=[[ " + _questionLevel + " ]]"
		+ "_questionChoiceAnswer value=[[ " + _questionChoiceAnswer + " ]]"
		+ "_questionChoiceContent value=[[ " +_questionChoiceContent + " ]]"
		+ "_questionName value=[[" + _questionName + " ]]"
 	);
	
	if ($.trim(_smCategory) == "") {
		alert("문제의 대,중,소 분류를 선택해주세요");
		document.getElementById("question_sm_category2").focus();
		return false;
	}else if ($.trim(_questionLevel) == "") {
		alert("문제의 난이도를 선택해주세요");
		document.getElementById("question_level").focus();
		return false;
		
	}else if($.trim(_questionChoiceAnswer) == ""){ 
		alert("객관식 문제의 정답을 선택해주세요.");
		document.getElementById("question_answer").focus();
		return false;
	
	}else {
		var questionInsertConfirm = confirm(
				"문제를 정말로 등록하시겠습니까?");
		if(questionInsertConfirm == true){
			return true;
		}else{
			return false;
		}
	}
};