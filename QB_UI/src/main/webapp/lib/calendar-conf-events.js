var Script = function () {


    /* initialize the external events
     -----------------------------------------------------------------*/

    $('#external-events div.external-event').each(function() {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
            title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
        });

    });


    /* initialize the calendar
     -----------------------------------------------------------------*/
    var title = "";
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    /*var string = "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getJMList?jmCd=1320&serviceKey=bE%2BMHNWc5Mt6LzYVw%2BLeZmthCrGWctkYd%2F6FOUod7Vz4BTcOaljwRzx2fuRqduyJormhYl%2BAgvIU2sZcA%2FQW%2Bw%3D%3D&_type=json";*/
    var string = "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getEList?serviceKey=bE%2BMHNWc5Mt6LzYVw%2BLeZmthCrGWctkYd%2F6FOUod7Vz4BTcOaljwRzx2fuRqduyJormhYl%2BAgvIU2sZcA%2FQW%2Bw%3D%3D&_type=json";
    var json;
    var exName = [];
    var StartD;
    var EndD;
    $.getJSON(string, function(data){
    	
    	if(data.response){
    		
    		/*$.each(data.response.body.items.item,function(index,obj){
				title = obj.implplannm +" "+obj.jmfldnm + " 원서접수";
				exName.push( obj.implplannm +" "+obj.jmfldnm + " 원서접수");
				
				var startDate = obj.docregstartdt + "";
				StartD = startDate.substr(0,4) + "-" + startDate.substr(4,2)+"-" + startDate.substr(6,2);
				
				var endDate = obj.docregenddt + "";
				EndD = endDate.substr(0,4) + "-" + endDate.substr(4,2)+"-" + endDate.substr(6,2);
	        })*/
    		$.each(data.response.body.items.item,function(index,obj){
				title = obj.description;
				
				
				var startDate = obj.pracexamstartdt + "";
				StartD = startDate.substr(0,4) + "-" + startDate.substr(4,2)+"-" + startDate.substr(6,2);
				
				var endDate = obj.pracpassdt + "";
				EndD = endDate.substr(0,4) + "-" + endDate.substr(4,2)+"-" + endDate.substr(6,2);
	        })
    		
    		
			/*$.each(data.response.body.items.item,function(index,obj){
				
				if(index == 0){
					json += "{";
					console.log("{");
				}
				console.log("title:'"+obj.implplannm +" "+obj.jmfldnm + " 원서접수',");
				json += "title:'"+obj.implplannm +" "+obj.jmfldnm + " 원서접수',";
				title = obj.implplannm +" "+obj.jmfldnm + " 원서접수";
				console.log("title >>" + title);
				
				var startDate = obj.docregstartdt + "";
				console.log("start : new Date("+ startDate.substr(0,4)+","+startDate.substr(4,2)+","+ startDate.substr(6,2)+")");
				json +="start : new Date("+ startDate.substr(0,4)+","+startDate.substr(4,2)+","+ startDate.substr(6,2)+"),";
				sy = startDate.substr(0,4);
				sm = startDate.substr(4,2);
				sd = startDate.substr(6,2);
				
				var endDate = obj.docregenddt + "";
				console.log("end : new Date("+ endDate.substr(0,4)+","+endDate.substr(4,2)+","+ endDate.substr(6,2)+")");
				json +="end : new Date("+ endDate.substr(0,4)+","+endDate.substr(4,2)+","+ endDate.substr(6,2)+")";
				ey = endDate.substr(0,4);
				em = endDate.substr(4,2);
				ed = endDate.substr(6,2);
				
				exName.push("{ title:'"+obj.implplannm +" "+obj.jmfldnm + " 원서접수',"+"start : new Date("+ startDate.substr(0,4)+","+startDate.substr(4,2)+","+ startDate.substr(6,2)+"),"+"end : new Date("+ endDate.substr(0,4)+","+endDate.substr(4,2)+","+ endDate.substr(6,2)+") }");
				if(index + 1 == data.response.body.items.item.length){
					
					console.log("}");
					json += "}";
				}else if(index + 1 != data.response.body.items.item.length){
					console.log("}");
					json += "},";
				}
	           });
			JSON.stringify(exName);
			console.log("jsonstinrg>>> " + exName);*/
		
    	/*console.log("name >> "+exName);
    	console.log("start >> " + exStart);
    	console.log("end >> " + exEnd);*/
    	/*console.log("json >>>>>>>>> "+json);
    	console.log("exName >>>>>>>>>>>> " + exName);*/
    	
			$('#calendar').fullCalendar({
		        header: {
		            left: 'prev,next today',
		            center: 'title',
		            right: 'month,basicWeek,basicDay'
		        },
		        editable: false,
		        titleFormat: {
		        	   month: "yyyy년 MMMM",
		        	   week: "yyyy년 MMM",
		        	   day: "yyyy년 MMM d일 dddd"
		        	   },
		        monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		        monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		        dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		        dayNamesShort: ["일","월","화","수","목","금","토"],
		        buttonText: {
		        	   today : "오늘",
		        	   month : "월별",
		        	   week : "주별",
		        	   day : "일별",
		        	   },
		        events:
		        	
		        [
		        	
		        	{
		        		title:title,
		        		start:StartD,
		        		end:EndD
		        	}
		        ]
		    });
    	
		}
    });
    
    
    /*$('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek,basicDay'
        },
        editable: false,
        droppable: true, // this allows things to be dropped onto the calendar !!!
        drop: function(date, allDay) { // this function is called when something is dropped

            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');

            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);

            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;

            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }

        },
        events: [
        	
            {
                title: 'All Day Event',
                start: new Date(y, m, 1)
            },
            {
                title: 'Long Event',
                start: new Date(y, m, d-5),
                end: new Date(y, m, d-2)
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: new Date(y, m, d-3, 16, 0),
                allDay: false
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: new Date(y, m, d+4, 16, 0),
                allDay: false
            },
            {
                title: 'Meeting',
                start: new Date(y, m, d, 10, 30),
                allDay: false
            },
            {
                title: 'Lunch',
                start: new Date(y, m, d, 12, 0),
                end: new Date(y, m, d, 14, 0),
                allDay: false
            },
            {
                title: 'Birthday Party',
                start: new Date(y, m, d+1, 19, 0),
                end: new Date(y, m, d+1, 22, 30),
                allDay: false
            }
        ]
    });*/


}();