<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="mvc.model.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
UserDTO user = (UserDTO) session.getAttribute("user");
%>
<fmt:setLocale value='<%=session.getAttribute("language")%>' />
<fmt:bundle basename="bundle.message">
	<script type="text/javascript">
	function signInCheck() {	
		if (${user == null}) {
			alert("🔒  " + '<fmt:message key="login_message" />' + " 🔒");
			return false;
		}
	}
</script>
	<style>
@import
	url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css')
	;

* {
	font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui,
		Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo',
		'Noto Sans KR', 'Malgun Gothic', sans-serif;
	font-size: 101%;
}
</style>
	<div class="container">
		<header
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
			<a href="MovieTopListView.do"
				class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
				<img src="./resources/images/logo.png" width="30%">
			</a>

			<ul
				class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="MovieListView.do" onclick="return signInCheck()"
					class="nav-link px-2 link-dark" style="font-size: 110%;"><fmt:message
							key="movie" /></a></li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li><a href="ProductListView.do" onclick="return signInCheck()"
					class="nav-link px-2 link-dark" style="font-size: 110%;"><fmt:message
							key="store" /></a></li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li><a href="CustomerSeviceForm.do"
					onclick="return signInCheck()" class="nav-link px-2 link-dark"
					style="font-size: 110%;"><fmt:message key="customerService" /></a></li>
			</ul>

			<div class="col-md-3 text-end">
				<c:choose>
					<c:when test="${empty user}">
						<button type="button" class="btn btn-outline-danger me-2"
							onclick="location.href='./UserSignInForm.do'">
							<fmt:message key="signIn" />
						</button>
						<button type="button" class="btn btn-danger"
							onclick="location.href='./UserSignUpForm.do'">
							<fmt:message key="signUp" />
						</button>
					</c:when>
					<c:otherwise>
						<fmt:message key="welcome" />,
				<%
						if (user.getRight().equals("user")) {
						%>
						<button type="button" class="btn btn-link"
							onclick="location.href='MyCGVView.do'">
							[<%=user.getName()%><fmt:message key="sir" />
							]
						</button>
						<%
						} else {
						%>
						<button type="button" class="btn btn-link"
							onclick="location.href='MyCGVView.do'">
							[
							<fmt:message key="manager" />
							<fmt:message key="sir" />
							]
						</button>
						<%
						}
						%>
						<button type="button" class="btn btn-danger"
							onclick="location.href='./UserLogoutAction.do'">
							<fmt:message key="logout" />
						</button>
					</c:otherwise>
				</c:choose>
			</div>
		</header>
	</div>
</fmt:bundle>
