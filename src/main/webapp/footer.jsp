<%@ page contentType="text/html; charset=utf-8"%>
<script type="text/javascript">
	function setLanguage(language) {
		sessionStorage.setItem("language", language);
	}
</script>
<div class="container">
	<footer
		class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
		<p class="col-md-4 mb-0 text-muted">&copy; 2020301054 이소연</p>

		<a href="MovieTopListView.do"
			class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
			<img src="./resources/images/logo.png" width="15%">
		</a>

		<div class="nav col-md-4 justify-content-end">
			<a
				href="?code=<%=request.getParameter("code")%>&id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>&language=ko"
				onclick="setLanguage('ko')">Korean</a>&nbsp;|&nbsp; <a
				href="?code=<%=request.getParameter("code")%>&id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>&language=en"
				onclick="setLanguage('en')">English</a>
		</div>
	</footer>
</div>