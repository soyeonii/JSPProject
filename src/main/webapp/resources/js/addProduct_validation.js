function CheckAddProduct() {
	var code = document.getElementById("code");
	var name = document.getElementById("name");
	var price = document.getElementById("price");

	// 상품 코드 체크
	if (!check(/^P[0-9]{4}$/, code, "🚫 [상품 코드] 🚫\nP와 숫자를 조합하여 5자를 입력해주세요\n첫 글자는 반드시 P로 시작해주세요"))
		return false;

	// 상품명 체크
	if (name.value.length == 0) {
		alert("🚫 [상품명] 🚫\n최소 1자 이상 입력해주세요");
		name.select();
		name.focus();
		return false;
	}

	// 가격 체크
	if (price.value.length == 0 || price.value % 500 != 0) {
		alert("🚫 [가격] 🚫\n최소 1000원 이상 500원 단위로 입력해주세요");
		price.select();
		price.focus();
		return false;
	}

	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	document.addProductForm.submit();
}