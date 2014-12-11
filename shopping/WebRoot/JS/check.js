//判断用户的输入是否合法
function check(){
	if (myform.username.value==""){
		alert("Please input username！");myform.username.focus();return;
	}
	if (myform.truename.value==""){
		alert("Please input realname！");myform.truename.focus();return;
	}
	if (myform.pwd.value==""){
		alert("Please input password！");myform.pwd.focus();return;
	}
	if (myform.pwd.value.length<1){
		alert("The password should be at least 6 character！");myform.pwd.focus();return;
	}		
	if (myform.pwd1.value==""){
		alert("Please confirm the password！");myform.pwd1.focus();return;
	}
	if (myform.pwd.value!=myform.pwd1.value){
		alert("The password is not the same, please input again！");myform.pwd.focus();return;
	}
	if(myform.cardno.value==""){
		alert("Please input the ID number！");myform.cardno.focus();return;
	}		
	if (myform.email.value==""){
		alert("Please input the Email！");myform.email.focus();return;
	}
	var i=myform.email.value.indexOf("@");
	var j=myform.email.value.indexOf(".");
	if((i<0)||(i-j>0)||(j<0)){
		alert("The Email addresss is not correct, please input again！");myform.email.value="";myform.email.focus();return;
	}
	myform.submit();		
}
function check_modi(){
	if (myform.truename.value==""){
		alert("Please input realname！");myform.truename.focus();return;
	}
	if (myform.oldpwd.value==""){
		alert("Please input original password！");myform.oldpwd.focus();return;
	}
	if(myform.holdpwd.value!=myform.oldpwd.value){
		alert("The password is not correct, please input again！");myform.oldpwd.value="";myform.oldpwd.focus();return;
	}
	if (myform.pwd.value==""){
		alert("Please input new password！");myform.pwd.focus();return;
	}
	if (myform.pwd.value.length<1){
		alert("The password should be at least 6 character！");myform.pwd.focus();return;
	}		
	if (myform.pwd1.value==""){
		alert("Please confirm the password！");myform.pwd1.focus();return;
	}
	if (myform.pwd.value!=myform.pwd1.value){
		alert("The password is not the same, please input again！");myform.pwd.focus();return;
	}
	if(myform.cardno.value==""){
		alert("Please input the ID number！");myform.cardno.focus();return;
	}		
	if (myform.email.value==""){
		alert("Please input the Email！");myform.email.focus();return;
	}
	var i=myform.email.value.indexOf("@");
	var j=myform.email.value.indexOf(".");
	if((i<0)||(i-j>0)||(j<0)){
		alert("The Email addresss is not correct, please input again！");myform.email.value="";myform.email.focus();return;
	}
	myform.submit();		
}
function checkU(myform){
	if(myform.username.value==""){
		alert("Please input username!");myform.username.focus();return;
	}
	if(myform.PWD.value==""){
		alert("Please input password!");myform.PWD.focus();return;
	}
	myform.submit();
}

function checkM(myform){
	if(myform.manager.value==""){
		alert("Please input administrator name!");myform.manager.focus();return;
	}
	if(myform.PWD.value==""){
		alert("Please input administrator password!");myform.PWD.focus();return;
	}
	myform.submit();
}
function CheckAll(elementsA,elementsB){
	for(i=0;i<elementsA.length;i++){
		elementsA[i].checked = true;
	}
	if(elementsB.checked ==false){
		for(j=0;j<elementsA.length;j++){
			elementsA[j].checked = false;
		}
	}
}
//判断用户是否选择了要删除的记录，如果是，则提示“是否删除”；否则提示“请选择要删除的记录”
function checkdel(delid,formname){
	var flag = false;
	for(i=0;i<delid.length;i++){
		if(delid[i].checked){
			flag = true;
			break;
		}
	}
	if(!flag){
		alert("Please select the record need to be deleted！");
		return false;
	}else{
			if(confirm("Are you sure to delete？")){
				formname.submit();
		}
	}
}