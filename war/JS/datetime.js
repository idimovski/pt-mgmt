function  getdate(){}
	var time = "";
	var currentDate = new Date()
	var day = currentDate.getDate()
	var month = currentDate.getMonth() + 1
	var year = currentDate.getFullYear()
	time =  + day + "/" + month + "/" + year + "</b>";


	var currentTime = new Date()
	var hours = currentTime.getHours()
	var minutes = currentTime.getMinutes()

	if (minutes < 10)
	minutes = "0" + minutes

	time = time + hours + ":" + minutes + " " + "</b>"
	document.getElementByID("datetime").setValue(time);
}

