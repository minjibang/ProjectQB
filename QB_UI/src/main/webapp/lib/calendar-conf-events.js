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

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var string = "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getJMList?jmCd=1320&serviceKey=bE%2BMHNWc5Mt6LzYVw%2BLeZmthCrGWctkYd%2F6FOUod7Vz4BTcOaljwRzx2fuRqduyJormhYl%2BAgvIU2sZcA%2FQW%2Bw%3D%3D&_type=json";
    var json;
    var exName = [];
    var exStart = [];
    var exEnd = [];
    
    $.getJSON(string, function(data){
    	if(data.body){
			console.log("body");
		}else if(data.response){
			console.log("response");
			console.log("data.response.body >> "+data.response.body);
			console.log("일부 >> " + data.response.body.items.item);
			console.log("확실히 나옵니다");
			
			$.each(data.response.body.items.item,function(index,obj){
				
				if(index == 0){
					json += "{";
					console.log("{");
				}
				
				
				console.log(index+" || 종목명>> "+ obj.implplannm +" "+obj.jmfldnm);
				exName.push("title:"+obj.implplannm +" "+obj.jmfldnm);
				console.log(obj.docregstartdt);
				/*console.log("start : new Date("+ y+","+"m"+","+ obj.docregstartdt);*/
				exStart.push(obj.docregstartdt);
				console.log(index+" || 필기시험시험원서접수종료일>>"+obj.docregenddt+"<<" );
				var text = obj.docregenddt;
				console.log();
				/*console.log(text.substr(0,4)+"년 " + text.substr(5,7) +"월 "+ text.substr(8,10)+"일");*/
				exEnd.push(obj.docregenddt);
				console.log(index+" || 필기시험 시작일자 >> " + obj.docexamstartdt);
				
				if(index + 1 == data.response.body.items.item.length){
					
					console.log("}");
					json += "}";
				}
	           });
		}
    	console.log("name >> "+exName);
    	console.log("start >> " + exStart);
    	console.log("end >> " + exEnd);
    });
    
    
    
    $('#calendar').fullCalendar({
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
    });


}();