function CheckSignUp() {
	var id = document.getElementById("id");
	var password = document.getElementById("password");
	var passwordConfirm = document.getElementById("passwordConfirm");
	var name = document.getElementById("name");
	var email = document.getElementById("email");

	// 아이디 체크
	if (!check(/^[a-zA-Z]\w{3,9}$/, id, "⚠ [아이디] ⚠\n영어와 숫자를 조합해 4~10자까지 입력해주세요\n문자로 시작해주세요"))
		return false;

	// 비밀번호 체크
	if (!check(/^[a-zA-Z]\w{3,14}$/, password, "⚠ [비밀번호] ⚠\n영어와 숫자를 조합해 4~15자까지 입력해주세요\n문자로 시작해주세요"))
		return false;
		
	// 비밀번호 재확인 체크
	if (password.value != passwordConfirm.value) {
		alert("⚠ [비밀번호 재확인] ⚠\n비밀번호를 동일하게 입력해주세요");
		passwordConfirm.select();
		passwordConfirm.focus();
		return false;
	}
	
	// 이름 체크
	if (name.value.length == 0) {
		alert("⚠ [이름] ⚠\n최소 1자 이상 입력해주세요");
		name.select();
		name.focus();
		return false;
	}

	// 이메일 체크
	if (!check(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/, email, "⚠ [이메일] ⚠\n입력을 확인해주세요"))
		return false;

	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	document.signUpForm.submit();
}