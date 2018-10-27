/**
 * 18.10.15 재훈 questionManagement.js 파일 추가 
 */



/*내가 만든 문제 탭 - 페이지 로드시 전체문제 보여주기*/
$(function() {
	var member_id = document.getElementById("member_id").value;
	
	$.ajax({
		url : "myQuestionView.do",
		type:'GET',
		data : {
			  'member_id' : member_id
		},
		dataType:"html",
		success:function(data){
			$('#myQuestions').html(data);
		}
	});
	
	
	/*내가 만든 문제 탭 - 전체조회 버튼*/
	$('#viewAll').click(function(){
		if($.trim(member_id) == "admin"){
			$.ajax({
			url : "myQuestionView.do",
			type:'GET',
			dataType:"html",
			success:function(data){
				$('#myQuestions').html(data);
			}
			});
			
		}else{
			$.ajax({
				url : "myQuestionView.do",
				type:'GET',
				data : {
					  'member_id' : member_id
				},
				dataType:"html",
				success:function(data){
					$('#myQuestions').html(data);
				}
			});
			
		}
	})
	
	/*내가 만든 문제 탭 - 검색 버튼*/
	$('#questionsearch').click(function(){
		   var lgsearchtype = document.getElementById("question_lg_category").value;
		   var mdsearchtype = document.getElementById("question_md_category").value;
		   var smsearchtype = document.getElementById("question_sm_category").value;
		   var leveltype = document.getElementById("level_type").value;
		   var questiontype = document.getElementById("questiontype").value;
		   var keyword = document.getElementById("keyword").value;
		   var member_id = document.getElementById("member_id").value;
		   
			$.ajax({
				  url : "myQuestionSearch.do",
				  type:'GET',
				  data : {
					  'lgsearchtype' : lgsearchtype,
					  'mdsearchtype' : mdsearchtype,
					  'smsearchtype' : smsearchtype,
					  'leveltype' : leveltype,
					  'questiontype' : questiontype,
					  'keyword': keyword,
					  'member_id': member_id
				  },
				  dataType:"html",
				  success:function(data){
					  $('#myQuestions').html(data);
				  }
			 });
	   });
	
	
})


$(function() {
	/* 문제 수정 버튼*/
	$('#singleUpdateModal').on('show.bs.modal', function(question_num){
		action='modify';
		type='PUT';
		var question_num = $(question_num.relatedTarget).data('modal-id'); //question_num 받아오기
		$('#singleUpdateConfirmBtn').val(question_num); //버튼에 value값을 가져온 question_num으로 넣어준다
	})
	
	$('#singleUpdateConfirmBtn').click(function(){
		var question_num = document.getElementById('singleUpdateConfirmBtn').value;
		
			$.ajax({
				url : "singleUpdateCheck.do",
				type:'get',
				data : {
					  'question_num' : question_num
				},
				success:function(data, question_num){
					if((data.result)=="삭제가능"){
						var question_num = document.getElementById('singleUpdateConfirmBtn').value;
						alert(question_num);
						$("#question_num").html(question_num);
						window.location.href = "questionUpdate.do?question_num=" + question_num
					}else{
						swal({
							title: "문제를 수정할 수 없습니다.",
							text: "해당 문제를 사용하는 시험지가 존재합니다.",
							icon: "error"
						});
					}
				},
				error: function(error){
					swal('문제 수정 도중 에러가 발생했습니다.')
				}
			})
	})	
	
	
	/* 문제 삭제 버튼*/
	
	$('#singleDeleteModal').on('show.bs.modal', function(question_num){
		action='modify';
		type='PUT';
		var question_num = $(question_num.relatedTarget).data('modal-id'); //question_num 받아오기
		$('#singleDeleteConfirmBtn').val(question_num); //버튼에 value값을 가져온 question_num으로 넣어준다
	})
	
	$('#singleDeleteConfirmBtn').click(function(){
		var question_num = document.getElementById('singleDeleteConfirmBtn').value;
		
			$.ajax({
				url : "singleQuestionDelete.do",
				type:'post',
				data : {
					  'question_num' : question_num
				},
				success:function(data){
					if((data.result)=="삭제가능"){
						swal({
							title: "문제가 삭제되었습니다.",
							text: "",
							icon: "success"
						}).then(function(){
							window.location = "questionManagement.do"
						});
					}else{
						swal("문제를 삭제 할 수 없습니다.", "해당 문제를 사용하는 시험지가 존재합니다", "error");
					}
				},
				error: function(error){
					swal('문제 삭제 도중 에러가 발생했습니다.')
				}
			})
		
	})	
		
})


/*새 문제 만들기 탭 - 문제 타입 (객관식, 단답형) 변경 시 정답 입력 div 변경 */
function questionType(id){
	if (id == "questionChoice") {
		$('#questionChoice').append('<div id="choiceInput"> <b><input type="text" name="question_choice_num" value="1" style="display: none">1.</b><input type="text" name="question_choice_content" id="question_choice_content1" class="form-control-inline" placeholder="1번 보기 내용을 입력해주세요."><span class="fileupload fileupload-new" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[0]" class="default"/></span><a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</a></span></span><br><b><input type="text" name="question_choice_num" value="2" style="display: none">2.</b><input type="text" name="question_choice_content" id="question_choice_content2" class="form-control-inline" placeholder="2번 보기 내용을 입력해주세요."><span class="fileupload fileupload-new" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[1]" class="default"/></span><a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</a></span></span><br><b><input type="text" name="question_choice_num" value="3" style="display: none">3.</b><input type="text" name="question_choice_content" id="question_choice_content3" class="form-control-inline" placeholder="3번 보기 내용을 입력해주세요."><span class="fileupload fileupload-new" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail"style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[2]" class="default"/></span><a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</a></span></span><br><b><input type="text" name="question_choice_num" value="4" style="display: none">4.</b><input type="text" name="question_choice_content" id="question_choice_content4" class="form-control-inline" placeholder="4번 보기 내용을 입력해주세요."><span class="fileupload fileupload-new" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[3]" class="default"/></span><a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</a></span></span><br><b><input type="text" name="question_choice_num" value="5" style="display: none">5.</b><input type="text" name="question_choice_content" id="question_choice_content5" class="form-control-inline" placeholder="5번 보기 내용을 입력해주세요."><span class="fileupload fileupload-new" data-provides="fileupload"><div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div><span><span class="btn btn-theme02 btn-file"><span class="fileupload-new"><i class="fa fa-paperclip"></i>image</span><span class="fileupload-exists"><i class="fa fa-undo"></i>Change</span><input type="file" name="question_choice_files[4]" class="default"/></span><a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i>Remove</a></span></span><br></div>');
		document.all["questionChoice"].style.display = ''; // 보이게
		document.all["questionShortAnswer"].style.display = 'none'; // 안보이게
		
	} else {
		document.all["questionChoice"].style.display = 'none'; // 안보이게
		$('#choiceInput').remove();
		document.all["questionShortAnswer"].style.display = ''; // 보이게
	}
}
$(function() {
		$("#question_type_1").click(function(){ 
	        $("#questionAnswerRadio1").attr("disabled", false);
	        $("#questionAnswerRadio2").attr("disabled", false);
	        $("#questionAnswerRadio3").attr("disabled", false);
	        $("#questionAnswerRadio4").attr("disabled", false);
	        $("#questionAnswerRadio5").attr("disabled", false);
	        $("#howManyChoices").prop("disabled", false);
	 
	        $("#questionType2Answer").attr("disabled", true);
	   
	        $("#choiceInput").attr("disabled", false);
	        var QCF = document.getElementsByName("question_choice_files");
	   		/*QCF.prop("disabled",false);*/
	   
	   });
       $("#question_type_2").click(function(){
			$("#questionAnswerRadio1").attr("disabled", true);
	        $("#questionAnswerRadio2").attr("disabled", true);
	        $("#questionAnswerRadio3").attr("disabled", true);
	        $("#questionAnswerRadio4").attr("disabled", true);
	        $("#questionAnswerRadio5").attr("disabled", true);
	        $("#howManyChoices").prop("disabled", true);
	        $("#howManyChoices5").removeAttr("selected");
	        $("#howManyChoices1").prop("selected", "selected");
	        
			$("#questionType2Answer").attr("disabled", false);
	
			$("#choiceInput").attr("disabled", true);
			 var QCF = document.getElementsByName("question_choice_files");
		   	alert("QCF: " + QCF);
			 /*QCF.prop("disabled",true);*/
	   });
});
		
/*새 문제 만들기 탭 - 객관식 보기 개수 선택시 보기내용 입력창, 정답선택 버튼 갯수 조절 */  
$(function() {
	$('#howManyChoices')
		.change(
			function() {
				var remove = document.getElementById("choiceInput");
				remove.innerHTML="";
				var remove1 = document.getElementById("answerChoiceText");
				remove1.innerHTML="";	

				var _choiceInput1 ="<b><input type='text' name='question_choice_num' value='1' style='display: none'>1.</b> <input type='text' name='question_choice_content' id='question_choice_content1' class='form-control-inline' placeholder='1번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[0]' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
				var _choiceInput2 ="<b><input type='text' name='question_choice_num' value='2' style='display: none'>2.</b> <input type='text' name='question_choice_content' id='question_choice_content2' class='form-control-inline' placeholder='2번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[1]' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
				var _choiceInput3 ="<b><input type='text' name='question_choice_num' value='3' style='display: none'>3.</b> <input type='text' name='question_choice_content' id='question_choice_content3' class='form-control-inline' placeholder='3번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[2]' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
				var _choiceInput4 ="<b><input type='text' name='question_choice_num' value='4' style='display: none'>4.</b> <input type='text' name='question_choice_content' id='question_choice_content4' class='form-control-inline' placeholder='4번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[3]' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"
				var _choiceInput5 ="<b><input type='text' name='question_choice_num' value='5' style='display: none'>5.</b> <input type='text' name='question_choice_content' id='question_choice_content5' class='form-control-inline' placeholder='5번 보기 내용을 입력해주세요.' > <span class='fileupload fileupload-new' data-provides='fileupload'> <div class='fileupload-preview fileupload-exists thumbnail' style='max-width: 300px; max-height: 180px; line-height: 20px;'></div> <span>  <span class='btn btn-theme02 btn-file'> <span class='fileupload-new'> <i class='fa fa-paperclip'></i>image </span> <span class='fileupload-exists'><i class='fa fa-undo'></i>Change </span>  <input type='file' name='question_choice_files[4]' class='default' /> </span> <a href='' class='btn btn-theme04 fileupload-exists' data-dismiss='fileupload'><i class='fa fa-trash-o'></i> Remove</a> </span> </span><br>"

				var _answerBtn1 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="1" >1번 </label>&nbsp;&nbsp;'
				var _answerBtn2 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="2" >2번 </label>&nbsp;&nbsp;'
				var _answerBtn3 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="3" >3번 </label>&nbsp;&nbsp;'
				var _answerBtn4 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="4" >4번 </label>&nbsp;&nbsp;'
				var _answerBtn5 ='<label class="questionChoiceRadioButton"> <input type="radio" name="question_answer" value="5" >5번 </label>&nbsp;&nbsp;'
				if (document.getElementById("howManyChoices").value == "1") {
					remove.innerHTML="";
					remove1.innerHTML="";	
				}			
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

/* 문제 등록 버튼 - 유효성 검사 */
function check(){
	console.log("check함수 진입");
	var _smCategory = $("#question_sm_category2 option:selected").val();
	var _questionLevel = $("#level_type2 option:selected").val();
	var _questionName = $("input[type=text][name=question_name]").val();
	var _questionChoiceAnswer = $("input[type=radio][name=question_answer]:checked").val();
	var _questionChoiceContent1 = $("input[type=text][id=question_choice_content1]").val();
	var _questionChoiceContent2 = $("input[type=text][id=question_choice_content2]").val();
	var _questionChoiceContent3 = $("input[type=text][id=question_choice_content3]").val();
	var _questionChoiceContent4 = $("input[type=text][id=question_choice_content4]").val();
	var _questionChoiceContent5 = $("input[type=text][id=question_choice_content5]").val();
	var _shortAnswerQuestion = $("input[type=radio][name=question_type]:checked").val();
	/*var _choiceQuantity = document.getElementById("howManyChoices").value;*/
	var _choiceQuantity = $("#howManyChoices option:selected").val()
	/*_questionName= _questionName.replace("\r\n|\r|\n","<br>");*/
	if ($.trim(_shortAnswerQuestion) == "객관식") {
		alert("객관식 문제 유효성 검사 진입 ");
		
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
		/*객관식 문제 보기 5개인 경우*/
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
					swal({
						title: "문제 등록",
						text: "새로운 문제가 등록되었습니다.",
						icon: "success"
					});
					return true;
				}else{
					return false;
				}
			} 
		/*객관식 문제 보기 4개인 경우*/	
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
					swal({
						title: "문제 등록",
						text: "새로운 문제가 등록되었습니다.",
						icon: "success"
					});
					return true;
				}else{
					return false;
				}
			} 
		/*객관식 문제 보기 3개인 경우*/
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
					swal({
						title: "문제 등록",
						text: "새로운 문제가 등록되었습니다.",
						icon: "success"
					});
					return true;
				}else{
					return false;
				}
			} 
			
		/*객관식 문제 보기 2개인 경우*/	
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
					swal({
						title: "문제 등록",
						text: "새로운 문제가 등록되었습니다.",
						icon: "success"
					});
					return true;
				}else{
					return false;
				}
			} 
			
		}
	/*주관식 문제 생성 유효성검사*/
	}else{
		alert("단답형 유효성검사 진입");
		alert("1:" + _smCategory  +"\n"+
				"2:" + _questionLevel  +"\n"+
				"3:" +   _questionName +"\n"+
				"4:" + _questionChoiceAnswer  +"\n"+
				"5:" + _questionChoiceContent1  +"\n"+
				"6:" + _questionChoiceContent2  +"\n"+
				"7:" + _questionChoiceContent3  +"\n"+
				"8:" + _questionChoiceContent4  +"\n"+
				"9:" +  _questionChoiceContent5 +"\n"+
				"10:" + _shortAnswerQuestion  +"\n"+
				"11:" + _choiceQuantity  +"\n");
				
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
				swal({
					title: "문제 등록",
					text: "새로운 문제가 등록되었습니다.",
					icon: "success"
				});
				return true;
			}else{
				return false;
			}
		}
	}
}

function removeImg(number){
	console.log($(this).text());
	alert(number);
	$(this).parent().siblings(".fileupload-preview").find("img").remove();
	alert($(this).parent().siblings(".fileupload-preview").find("img").html());
	return false
}


