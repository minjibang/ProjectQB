/**
 * 18.10.21 재훈 questionUpdate.js 파일 추가 
 */

/*문제 수정 페이지 시작 */

/*페이지 로드시 수정할 문제 정보 관련 함수*/
$(function() {
		var _choiceInput1 ="<b><input type='text' name='question_choice_num' value='1' style='display: none'>1.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='1번 보기 내용을 입력해주세요.' id='question_choice_content1'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
		var _choiceInput2 ="<b><input type='text' name='question_choice_num' value='2' style='display: none'>2.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='2번 보기 내용을 입력해주세요.' id='question_choice_content2'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
		var _choiceInput3 ="<b><input type='text' name='question_choice_num' value='3' style='display: none'>3.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='3번 보기 내용을 입력해주세요.' id='question_choice_content3'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
		var _choiceInput4 ="<b><input type='text' name='question_choice_num' value='4' style='display: none'>4.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='4번 보기 내용을 입력해주세요.' id='question_choice_content4'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
		var _choiceInput5 ="<b><input type='text' name='question_choice_num' value='5' style='display: none'>5.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='5번 보기 내용을 입력해주세요.' id='question_choice_content5'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
		var _answerBtn1 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio" name="question_answer" value=""  > 1번 </label>&nbsp;&nbsp;'
		var _answerBtn2 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio2" name="question_answer" value="2"  >2번 </label>&nbsp;&nbsp;'
		var _answerBtn3 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio3" name="question_answer" value="3"  >3번 </label>&nbsp;&nbsp;'
		var _answerBtn4 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio4" name="question_answer" value="4"  >4번 </label>&nbsp;&nbsp;'
		var _answerBtn5 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio5" name="question_answer" value="5"  >5번 </label>&nbsp;&nbsp;'
		var qdto_question_answer = $("input[type=text][name=qdto_question_answer]").val();
		var _questionType = $("input[type=radio][name=question_type]:checked").val();
		
		if ($.trim(_questionType) == "단답형"){
			document.all["questionChoice"].style.display = 'none'; // 안보이게
			document.all["questionShortAnswer"].style.display = ''; // 보이게
			$("#questionAnswerRadio1").attr("disabled", true);
	        $("#questionAnswerRadio2").attr("disabled", true);
	        $("#questionAnswerRadio3").attr("disabled", true);
	        $("#questionAnswerRadio4").attr("disabled", true);
	        $("#questionAnswerRadio5").attr("disabled", true);
			$("#questionType2Answer").attr("disabled", false);
			$("#choiceInput").attr("disabled", true);
			
		} else if($.trim(_questionType) == "객관식"){
			
			document.all["questionChoice"].style.display = ''; // 보이게
			document.all["questionShortAnswer"].style.display = 'none'; // 안보이게
	        $("#questionAnswerRadio1").attr("disabled", false);
	        $("#questionAnswerRadio2").attr("disabled", false);
	        $("#questionAnswerRadio3").attr("disabled", false);
	        $("#questionAnswerRadio4").attr("disabled", false);
	        $("#questionAnswerRadio5").attr("disabled", false);
	        $("#questionType2Answer").attr("disabled", true);
	        $("#howManyChoices").attr("disabled",false);
	        $("#choiceInput").attr("disabled", false);
	        
			if (document.getElementById("howManyChoices").value == "2") {
				var cdto_qcc1 = document.getElementsByName("cdto_question_choice_content")[0].value;
				var cdto_qcc2 = document.getElementsByName("cdto_question_choice_content")[1].value;
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
					$('#question_choice_content1').val(cdto_qcc1);
					$('#question_choice_content2').val(cdto_qcc2);
				
					if($.trim(qdto_question_answer) == "1"){
						$('#questionAnswerRadio').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "2"){
						$('#questionAnswerRadio2').prop("checked",true);
					}
				}
			if (document.getElementById("howManyChoices").value == "3") {
				var cdto_qcc1 = document.getElementsByName("cdto_question_choice_content")[0].value;
				var cdto_qcc2 = document.getElementsByName("cdto_question_choice_content")[1].value;
				var cdto_qcc3 = document.getElementsByName("cdto_question_choice_content")[2].value;
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#choiceInput').append(_choiceInput3);
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
					$('#answerChoiceText').append(_answerBtn3);
					$('#question_choice_content1').val(cdto_qcc1);
					$('#question_choice_content2').val(cdto_qcc2);
					$('#question_choice_content3').val(cdto_qcc3);
					
					if($.trim(qdto_question_answer) == "1"){
						$('#questionAnswerRadio').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "2"){
						$('#questionAnswerRadio2').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "3"){
						$('#questionAnswerRadio3').prop("checked",true);
					}
				}
			if (document.getElementById("howManyChoices").value == "4") {
				var cdto_qcc1 = document.getElementsByName("cdto_question_choice_content")[0].value;
				var cdto_qcc2 = document.getElementsByName("cdto_question_choice_content")[1].value;
				var cdto_qcc3 = document.getElementsByName("cdto_question_choice_content")[2].value;
				var cdto_qcc4 = document.getElementsByName("cdto_question_choice_content")[3].value;
					$('#choiceInput').append(_choiceInput1);
					$('#choiceInput').append(_choiceInput2);
					$('#choiceInput').append(_choiceInput3);
					$('#choiceInput').append(_choiceInput4);
					$('#answerChoiceText').append(_answerBtn1);
					$('#answerChoiceText').append(_answerBtn2);
					$('#answerChoiceText').append(_answerBtn3);
					$('#answerChoiceText').append(_answerBtn4);
					$('#question_choice_content1').val(cdto_qcc1);
					$('#question_choice_content2').val(cdto_qcc2);
					$('#question_choice_content3').val(cdto_qcc3);
					$('#question_choice_content4').val(cdto_qcc4);
					
					if($.trim(qdto_question_answer) == "1"){
						$('#questionAnswerRadio').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "2"){
						$('#questionAnswerRadio2').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "3"){
						$('#questionAnswerRadio3').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "4"){
						$('#questionAnswerRadio4').prop("checked",true);
					}
				}	
			if (document.getElementById("howManyChoices").value == "5") {
				var cdto_qcc1 = document.getElementsByName("cdto_question_choice_content")[0].value;
				var cdto_qcc2 = document.getElementsByName("cdto_question_choice_content")[1].value;
				var cdto_qcc3 = document.getElementsByName("cdto_question_choice_content")[2].value;
				var cdto_qcc4 = document.getElementsByName("cdto_question_choice_content")[3].value;
				var cdto_qcc5 = document.getElementsByName("cdto_question_choice_content")[4].value;
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
					$('#question_choice_content1').val(cdto_qcc1);
					$('#question_choice_content2').val(cdto_qcc2);
					$('#question_choice_content3').val(cdto_qcc3);
					$('#question_choice_content4').val(cdto_qcc4);
					$('#question_choice_content5').val(cdto_qcc5);
					
					if($.trim(qdto_question_answer) == "1"){
						$('#questionAnswerRadio').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "2"){
						$('#questionAnswerRadio2').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "3"){
						$('#questionAnswerRadio3').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "4"){
						$('#questionAnswerRadio4').prop("checked",true);
					}
					if($.trim(qdto_question_answer) == "5"){
						$('#questionAnswerRadio5').prop("checked",true);
					}
					
				}
		}
})

/*문제 타입 (객관식, 단답형) 변경 시 정답 입력 div 변경*/
$(function() {
	$("#question_type_1").click(function(){ 
		document.all["questionChoice"].style.display = ''; // 보이게
		document.all["questionShortAnswer"].style.display = 'none'; // 안보이게
        $("#questionAnswerRadio1").attr("disabled", false);
        $("#questionAnswerRadio2").attr("disabled", false);
        $("#questionAnswerRadio3").attr("disabled", false);
        $("#questionAnswerRadio4").attr("disabled", false);
        $("#questionAnswerRadio5").attr("disabled", false);
        $("#questionType2Answer").attr("disabled", true);
        $("#howManyChoices").attr("disabled",false);
        $("#choiceInput").attr("disabled", false);
        $("#howManyChoices").val("10");
        
   });
   $("#question_type_2").click(function(){
		document.all["questionChoice"].style.display = 'none'; // 안보이게
		document.all["questionShortAnswer"].style.display = ''; // 보이게
		$("#questionAnswerRadio1").attr("disabled", true);
        $("#questionAnswerRadio2").attr("disabled", true);
        $("#questionAnswerRadio3").attr("disabled", true);
        $("#questionAnswerRadio4").attr("disabled", true);
        $("#questionAnswerRadio5").attr("disabled", true);
		$("#questionType2Answer").attr("disabled", false);
		$("#howManyChoices").attr("disabled",true);
		$("#choiceInput").attr("disabled", true);
   });
});



/*객관식 문제 보기 개수 변경 함수*/
$('#howManyChoices').change(
		function() {
			
			var remove = document.getElementById("choiceInput");
			remove.innerHTML="";
			var remove1 = document.getElementById("answerChoiceText");
			remove1.innerHTML="";
														
			var _choiceInput1 ="<b><input type='text' name='question_choice_num' value='1' style='display: none'>1.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='1번 보기 내용을 입력해주세요.' id='question_choice_content1'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
			var _choiceInput2 ="<b><input type='text' name='question_choice_num' value='2' style='display: none'>2.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='2번 보기 내용을 입력해주세요.' id='question_choice_content2'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
			var _choiceInput3 ="<b><input type='text' name='question_choice_num' value='3' style='display: none'>3.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='3번 보기 내용을 입력해주세요.' id='question_choice_content3'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
			var _choiceInput4 ="<b><input type='text' name='question_choice_num' value='4' style='display: none'>4.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='4번 보기 내용을 입력해주세요.' id='question_choice_content4'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
			var _choiceInput5 ="<b><input type='text' name='question_choice_num' value='5' style='display: none'>5.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='5번 보기 내용을 입력해주세요.' id='question_choice_content5'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
			var _answerBtn1 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio" name="question_answer" value=""  > 1번 </label>&nbsp;&nbsp;'
			var _answerBtn2 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio2" name="question_answer" value="2"  >2번 </label>&nbsp;&nbsp;'
			var _answerBtn3 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio3" name="question_answer" value="3"  >3번 </label>&nbsp;&nbsp;'
			var _answerBtn4 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio4" name="question_answer" value="4"  >4번 </label>&nbsp;&nbsp;'
			var _answerBtn5 ='<label class="questionChoiceRadioButton"> <input type="radio" id="questionAnswerRadio5" name="question_answer" value="5"  >5번 </label>&nbsp;&nbsp;'
			var qdto_question_answer = $("input[type=text][name=qdto_question_answer]").val();
			console.log($.trim(qdto_question_answer));
									
			if (document.getElementById("howManyChoices").value == "2") {
				$('#choiceInput').append(_choiceInput1);
				$('#choiceInput').append(_choiceInput2);
				$('#answerChoiceText').append(_answerBtn1);
				$('#answerChoiceText').append(_answerBtn2);
									
				if($.trim(qdto_question_answer) == "1"){
					$('#questionAnswerRadio').prop("checked",true);
				}
				if($.trim(qdto_question_answer) == "2"){
					$('#questionAnswerRadio2').prop("checked",true);
				}
			}
			
			if (document.getElementById("howManyChoices").value == "3") {
				$('#choiceInput').append(_choiceInput1);
				$('#choiceInput').append(_choiceInput2);
				$('#choiceInput').append(_choiceInput3);
				$('#answerChoiceText').append(_answerBtn1);
				$('#answerChoiceText').append(_answerBtn2);
				$('#answerChoiceText').append(_answerBtn3);
									
				if($.trim(qdto_question_answer) == "1"){
					$('#questionAnswerRadio').prop("checked",true);
				}
				if($.trim(qdto_question_answer) == "2"){
					$('#questionAnswerRadio2').prop("checked",true);
				}
				if($.trim(qdto_question_answer) == "3"){
					$('#questionAnswerRadio3').prop("checked",true);
				}
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
			
				
				if($.trim(qdto_question_answer) == "1"){
					$('#questionAnswerRadio').prop("checked",true);
				}
				if($.trim(qdto_question_answer) == "2"){
					$('#questionAnswerRadio2').prop("checked",true);
				}
				if($.trim(qdto_question_answer) == "3"){
					$('#questionAnswerRadio3').prop("checked",true);
				}
				if($.trim(qdto_question_answer) == "4"){
					$('#questionAnswerRadio4').prop("checked",true);
				}
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
		
				if($.trim(qdto_question_answer) == "1"){
					$('#questionAnswerRadio').prop("checked",true);
				}
				if($.trim(qdto_question_answer) == "2"){
					$('#questionAnswerRadio2').prop("checked",true);
				}
				if($.trim(qdto_question_answer) == "3"){
					$('#questionAnswerRadio3').prop("checked",true);
				}
				if($.trim(qdto_question_answer) == "4"){
					$('#questionAnswerRadio4').prop("checked",true);
				}
				if($.trim(qdto_question_answer) == "5"){
					$('#questionAnswerRadio5').prop("checked",true);
				}
										
			}
	})	



/* 문제 등록 버튼 - 유효성 검사 */
function check(){
	
	var _smCategory = $("#question_sm_category2 option:selected").val();
	var _questionLevel = $("#level_type2 option:selected").val();
	var _questionName = $("input[type=text][name=question_name]").val();
/*	var _questionName1 = $("input[type=text][name=question_name]").val();
	var _questionName = _questionName1.value.replace(/(\n|\r|\r\n|)/g,'<br>');*/

	var _questionChoiceAnswer = $("input[type=radio][name=question_answer]:checked").val();
	var _questionChoiceContent1 = $("input[type=text][id=question_choice_content1]").val();
	var _questionChoiceContent2 = $("input[type=text][id=question_choice_content2]").val();
	var _questionChoiceContent3 = $("input[type=text][id=question_choice_content3]").val();
	var _questionChoiceContent4 = $("input[type=text][id=question_choice_content4]").val();
	var _questionChoiceContent5 = $("input[type=text][id=question_choice_content5]").val();
	var _shortAnswerQuestion = $("input[type=radio][name=question_type]:checked").val();
	var _choiceQuantity = document.getElementById("howManyChoices").value;
	alert( "=== 문제 생성 입력값 확인용 alert ==="
			  + "문제 타입: " 			+ _shortAnswerQuestion
			  + "\n 소분류: " 		+ _smCategory
			  + "\n 난이도: " 		+ _questionLevel
			  + "\n 문제내용: " 		+ _questionName
			  + "\n 정답: " 			+ _questionChoiceAnswer
			  + "\n 객관식보기1번: " 	+ _questionChoiceContent1
			  + "\n 객관식보기2번: " 	+ _questionChoiceContent2
			  + "\n 객관식보기3번: " 	+ _questionChoiceContent3
			  + "\n 객관식보기4번: " 	+ _questionChoiceContent4
			  + "\n 객관식보기5번: " 	+ _questionChoiceContent5
			  + "\n 객관식보기갯수: " 	+ _choiceQuantity
	   		);
	
	if ($.trim(_shortAnswerQuestion) == "객관식") {
		/*객관식 문제 생성 유효성검사*/
		if ($.trim(_smCategory) == "") {
			swal("문제의 대,중,소 분류를 선택해주세요");
			document.getElementById("question_sm_category2").focus();
			return false;
		} else if ($.trim(_questionChoiceAnswer) == "") {
			swal("문제의 정답을 선택해주세요");
			return false;
		} else if ($.trim(_questionLevel) == "") {
			swal("문제의 난이도를 선택해주세요");
			document.getElementById("level_type2").focus();
			return false;
		//객관식 문제 보기가 5개일때 
		} else if ($.trim(_choiceQuantity) == "5"){
			if ($.trim(_questionChoiceContent1) == "") {
				swal("객관식 1번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent2) == "") {
				swal("객관식 2번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent3) == "") {
				swal("객관식 3번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent4) == "") {
				swal("객관식 4번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent5) == "") {
				swal("객관식 5번 보기를 입력해주세요");
			} else {
				var questionInsertConfirm = confirm(
				"문제를 정말로 등록하시겠습니까?");
				if(questionInsertConfirm == true){
					alert("새로운 문제가 등록되었습니다.")
					return true;
				}else{
					return false;
				}
			} 
		//객관식 문제 보기가 4개일때	
		} else if ($.trim(_choiceQuantity) == "4"){
			if ($.trim(_questionChoiceContent1) == "") {
				swal("객관식 1번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent2) == "") {
				swal("객관식 2번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent3) == "") {
				swal("객관식 3번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent4) == "") {
				swal("객관식 4번 보기를 입력해주세요");
				return false;
			} else {
				var questionInsertConfirm = confirm(
				"문제를 정말로 등록하시겠습니까?");
				if(questionInsertConfirm == true){
					alert("새로운 문제가 등록되었습니다.")
					return true;
				}else{
					return false;
				}
			} 
		//객관식 문제 보기가 3개일때
		} else if ($.trim(_choiceQuantity) == "3"){
			if ($.trim(_questionChoiceContent1) == "") {
				swal("객관식 1번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent2) == "") {
				swal("객관식 2번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent3) == "") {
				swal("객관식 3번 보기를 입력해주세요");
				return false;
			}else {
				var questionInsertConfirm = confirm(
				"문제를 정말로 등록하시겠습니까?");
				if(questionInsertConfirm == true){
					alert("새로운 문제가 등록되었습니다.")
					return true;
				}else{
					return false;
				}
			} 
			
		//객관식 문제 보기가 2개일때	
		} else if ($.trim(_choiceQuantity) == "2"){
			if ($.trim(_questionChoiceContent1) == "") {
				swal("객관식 1번 보기를 입력해주세요");
				return false;
			} else if ($.trim(_questionChoiceContent2) == "") {
				swal("객관식 2번 보기를 입력해주세요");
				return false;
			}else {
				var questionInsertConfirm = confirm(
				"문제를 정말로 등록하시겠습니까?");
				if(questionInsertConfirm == true){
					alert("새로운 문제가 등록되었습니다.")
					return true;
				}else{
					return false;
				}
			} 
			
		} 
	}else {
		/*주관식 문제 생성 유효성검사*/
		if ($.trim(_smCategory) == "") {
			swal("문제의 대,중,소 분류를 선택해주세요");
			document.getElementById("question_sm_category2").focus();
			return false;
		} else if ($.trim(_questionLevel) == "") {
			swal("문제의 난이도를 선택해주세요");
			document.getElementById("level_type2").focus();
			return false;
		}else{
			var questionInsertConfirm = confirm(
					"문제를 정말로 등록하시겠습니까?");
			if(questionInsertConfirm == true){
				alert("새로운 문제가 등록되었습니다.")
				return true;
			}else{
				return false;
			}
		}
	}
}
