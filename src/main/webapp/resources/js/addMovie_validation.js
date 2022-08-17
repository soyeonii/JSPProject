function CheckAddMovie() {
	var code = document.getElementById("code");
	var title = document.getElementById("title");
	var director = document.getElementById("director");
	var actor = document.getElementById("actor");
	var genre = document.getElementById("genre");
	var rating = document.getElementById("rating");
	var runningTime = document.getElementById("runningTime");
	var country = document.getElementById("country");
	var releaseDate = document.getElementById("releaseDate");
	var fileName = document.getElementById("fileName");

	// 영화 코드 체크
	if (!check(/^M[0-9]{4}$/, code, "🚫 [영화 코드] 🚫\nM과 숫자를 조합하여 5자를 입력해주세요\n첫 글자는 반드시 M으로 시작해주세요"))
		return false;

	// 제목 체크
	if (title.value.length == 0) {
		alert("🚫 [제목] 🚫\n최소 1자 이상 입력해주세요");
		title.select();
		title.focus();
		return false;
	}

	// 감독 체크
	if (director.value.length == 0) {
		alert("🚫 [감독] 🚫\n최소 1자 이상 입력해주세요");
		director.select();
		director.focus();
		return false;
	}

	// 배우 체크
	if (!check(/^[가-힣a-zA-Z\s]+, [가-힣a-zA-Z\s]+, [가-힣a-zA-Z\s]+$/, actor, "🚫 [배우] 🚫\n총 3명을 입력해주세요\n구분자는 ', '를 사용해주세요"))
		return false;

	// 장르 체크
	if (genre.selectedIndex == 0) {
		alert("🚫 [장르] 🚫\n한 가지를 선택해주세요");
		return false;
	}

	// 상영 등급 체크
	if (rating.selectedIndex == 0) {
		alert("🚫 [상영 등급] 🚫\n한 가지를 선택해주세요");
		return false;
	}

	// 상영 시간 체크
	if (runningTime.value.length == 0) {
		alert("🚫 [상영 시간] 🚫\n최소 1분 이상 입력해주세요");
		runningTime.select();
		runningTime.focus();
		return false;
	}

	// 제작 국가 체크
	if (country.value.length == 0) {
		alert("🚫 [제작 국가] 🚫\n최소 1자 이상 입력해주세요");
		country.select();
		country.focus();
		return false;
	}

	// 개봉일 체크
	if (releaseDate.value.length == 0) {
		alert("🚫 [개봉일] 🚫\n날짜를 선택해주세요");
		releaseDate.select();
		releaseDate.focus();
		return false;
	}

	// 이미지 체크
	if (fileName.value.length == 0) {
		alert("🚫 [이미지] 🚫\n파일을 선택해주세요");
		fileName.select();
		fileName.focus();
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

	document.addMovieForm.submit();
}