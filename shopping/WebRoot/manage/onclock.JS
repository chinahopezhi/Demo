	function clockon(bgclock){
		var now=new Date();
		var year=now.getYear();
		var month=now.getMonth();
		var date=now.getDate();
		var day=now.getDay();
		var hour=now.getHours();
		var minu=now.getMinutes();
		var sec=now.getSeconds();
		var week;
		month=month+1;
		if(month<10) month="0"+month;
		if(date<10) date="0"+date;
		var arr_week=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
		week=arr_week[day];
		var time="";
		time=year+"Year"+month+"Month"+date+"Day ";
		if(document.all){
			bgclock.innerHTML="^_^ "+time
		}
	}  
