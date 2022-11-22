$(document).ready(function(){
	function login(){
		if($("#id").val() == ""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		}else if($("#pass").val() == ""){
			alert("패스워드를 입력해주세요");
			$("#pass").focus();
			return false;
		}else{
			//서버전송
			loginForm.submit();
		}
	}
	
	$("#pass").keyup((e)=>{
		if(e.keyCode == 13){
			login();
		}
	});
	
	$("#id").keyup((e)=>{
		if(e.keyCode == 13){
			login();
		}
	});
});