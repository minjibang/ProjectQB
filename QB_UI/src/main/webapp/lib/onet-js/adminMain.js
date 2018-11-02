$(function() {
	// fancybox
	/*jQuery(".fancybox").fancybox();*/
	
	// deleteClass Form submit
	$(document).on("click", "button[class='deleteClass']", function(){
		
		var class_name= $(this).parent().find($("input[name='class_name']")).val();
		$('#class_name_modal').val(class_name);
		
		//var class_name = $(this).find($("input[name='class_name']")).val();
		
		
		//var class_name = $(this).find($("input[name='class_name']")).val();
		//var class_id = $(this).find($("input[name='class_name']")).attr("id");
		 
		//alert('class_name : ');
		
		//$("input[name='EMAIL']").eq(i).attr("value") )

		
		/*$('#deleteClassForm').action = "deleteClass.do" + ;
		$('#deleteClassForm').submit();*/
	});
	
	
	/*$(document).on("click","button[name='updatebtn']",function(){
		var tdArr=$(this).parent().parent().children();
		rowIndex=$(this).parent().parent().index();
		console.log("인덱스?:"+rowIndex);
		var role_code_modal = tdArr.eq(6).text();
		
		$('#cid').val(tdArr.eq(2).text());
		$('#cemail').val(tdArr.eq(4).text());
		$('#curl').val(tdArr.eq(5).text());
		$('#cname').val(tdArr.eq(3).text());
		$('#class_name').val(tdArr.eq(1).text());
	});*/
	
	
});
