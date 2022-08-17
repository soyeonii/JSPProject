function CheckSignIn() {
	var id = document.getElementById("id");
	var password = document.getElementById("password");

	if (id.value.length == 0) {
		alert("⚠ [아이디] ⚠\n최소 1자 이상 입력해주세요");
		id.select();
		id.focus();
		return false;
	}
	
	if (password.value.length == 0) {
		alert("⚠ [비밀번호] ⚠\n최소 1자 이상 입력해주세요");
		password.select();
		password.focus();
		return false;
	}
	
	document.SignInForm.submit();
}