/**
 * 18.10.15 재훈 questionManagement.js 파일 추가 
 */
function check() {

	var pwd = document.getElementById("member_pwd");
	var pwdcheck = document.getElementById("member_pwd_check");
	var mailnumber = document.getElementById("textmail");

	console.log("======" + pwd);
	console.log("======" + mailnumber);
	if (idcheck == false) {
		document.getElementById("iddiv").innerHTML = "아이디 중복 검사를 통과하지 못하였습니다.";
		document.getElementById("iddiv").style.color = 'red';
		document.getElementById("member_id").focus();

		return false;
	} else if (pwdcheck == false || pwdcheck2 == false) {
		document.getElementById("member_pwd").focus();
		return false;
	} else if (mailcheck == false) {
		alert("메일인증을 해주세요.");
		document.getElementById("textmail").focus();
		return false;
	} else if (mailnumber.value != mailtonumber) {
		alert("인증번호가 일치하지 않습니다.");
		document.getElementById("textmail").focus();
		return false;
	} else {
		var joinconfirm = confirm("회원가입 하시겠습니까");
		if (joinconfirm == true) {
			return true;
		} else {
			return false;
		}
	}
};
	

/*객관식 보기 개수 선택시 보기내용 입력창, 정답선택 버튼 갯수 조절 비동기 스크립트 시작 */

	$(function() {
		$('#howManyChoices')
				.change(
						function() {
							var remove = document.getElementById("choiceInput");
							remove.innerHTML="";
							var remove1 = document.getElementById("answerChoiceText");
							remove1.innerHTML="";
							
							var _choiceInput1 ='<b><input type="text" name="question_choice_num" value="1" style="display: none">1.</b> <input type="text" name="question_choice_content" class="form-control-inline" placeholder="1번 보기 내용을 입력해주세요."> <span class="fileupload fileupload-new imageup" data-provides="fileupload"> <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div> <span> <span class="btn btn-theme02 btn-file"> <span class="fileupload-new"> <i class="fa fa-paperclip"></i>image </span> <span class="fileupload-exists"><i class="fa fa-undo"></i>Change </span> <input type="file" class="default" /> </span> <a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a> </span> </span><br>'
							var _choiceInput2 ="<b><input type='text' name='question_choice_num' value='2' style='display: none'>2.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='2번 보기 내용을 입력해주세요.'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
							var _choiceInput3 ="<b><input type='text' name='question_choice_num' value='3' style='display: none'>3.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='3번 보기 내용을 입력해주세요.'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
							var _choiceInput4 ="<b><input type='text' name='question_choice_num' value='4' style='display: none'>4.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='4번 보기 내용을 입력해주세요.'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
							var _choiceInput5 ="<b><input type='text' name='question_choice_num' value='5' style='display: none'>5.</b> <input type='text' name='question_choice_content' class='form-control-inline' placeholder='5번 보기 내용을 입력해주세요.'> <span class='fileupload fileupload-new imageup' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
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
	})


/* 객관식 보기 개수 선택시 보기내용 입력창, 정답선택 버튼 갯수 조절 비동기 스크립트 끝 */