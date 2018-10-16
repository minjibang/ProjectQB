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
	


/* 대분류 셀렉트메뉴 선택시 호출되는 함수 */

/*
$(function(){
   $('#question_lg_category').change(function(){
      $('#question_md_category').children('option:not(:first)').remove();
      <c:forEach items="${list2}" var="mdlist">
      if(document.getElementById("question_lg_category").value == "${mdlist.lg_category_code}"){
         $('#question_md_category').append("<option value=${mdlist.md_category_code}>${mdlist.md_category_name}</option>")
      }
      </c:forEach>
   });
   $('#question_md_category').change(function(){
      $('#question_sm_category').children('option:not(:first)').remove();
      <c:forEach items="${list3}" var="smlist">
      if(document.getElementById("question_md_category").value == "${smlist.md_category_code}"){
         $('#question_sm_category').append("<option>${smlist.sm_category_name}</option>")
      }
      </c:forEach>
   })
})*/


/*$("#lgCatSelect").change(function(){
	var lgCatSelect = $(this).val();
	console.log('lgCatSelect: ' + lgCatSelect)
	
	var lgCatCode = {
		lg_
	};
})

중분류 셀렉트메뉴 선택시 호출되는 함수
$("#mdCatSelect").change(function(){
	var mdCatSelect = $(this).val();
	console.log('mdCatSelect: ' + mdCatSelect)
})*/


/*$(function lgCatChange(element){
	var lgCatSelect = $(element).find("option:selected").data();
	console.log('lgCatSelect:'+lgCatSelect);
	
	var lgCatSelect = document.getElementById("lgCatSelect");
	
대분류 select element에서 선택된 option의 value (카테고리 코드)
	var lgCatCode = lgCatSelect.options[lgCatSelect.selectedIndex].value;
	console.log('lgCatCode:' + lgCatCode);
대분류 select element에서 선택된 option의 text (카테고리 이름)
	var lgCatName = lgCatSelect.options[lgCatSelect.selectedIndex].text;
	console.log('lgCatName:' + lgCatName);
	
});
*/
