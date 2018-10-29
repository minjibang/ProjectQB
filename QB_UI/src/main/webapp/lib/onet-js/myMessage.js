$(document).ready(function(){
	
	/*체크박스*/
	 function allCheckFunc( obj ) {
			$("[name=chk]").prop("checked", $(obj).prop("checked") );
	}
		
		
	function oneCheckFunc( obj )
	{
		var allObj = $("#agreeAll");
		var objName = $(obj).attr("name");

		if( $(obj).prop("checked") )
		{
			checkBoxLength = $("[name="+ objName +"]").length;
			checkedLength = $("[name="+ objName +"]:checked")
			.length;

			if( checkBoxLength == checkedLength ) {
				allObj.prop("checked", true);
			} else {
				allObj.prop("checked", false);
			}
		}
		else
		{
			allObj.prop("checked", false);
		}
	}

	$("#agreeAll").click(function(){
		allCheckFunc( this );
	});
	
	$("[name=chk]").each(function(){
		$(this).click(function(){
			oneCheckFunc( $(this) );
		});
	});

	
	
});
