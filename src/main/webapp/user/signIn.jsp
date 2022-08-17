<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/signIn_validation.js"></script>
<title>로그인</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div class="container" style="width: 400px; text-align: center;">
			<div class="mt-5 mb-5 pt-5 pb-5">
				<form name="SignInForm" action="UserSignInAction.do">
					<h1 class="h1 mb-5 fw-normal">
						<fmt:message key="signIn" />
					</h1>
					<%
					String error = request.getParameter("error");
					if (error != null) {
						out.println("<div class='alert alert-danger'>");
						out.println("아이디와 비밀번호를 확인해 주세요");
						out.println("</div>");
					}
					%>
					<div class="form-floating mb-4">
						<input type="text" class="form-control" id="id" name="id"
							placeholder="<fmt:message key="id" />"> <label
							for="floatingInput"><fmt:message key="id" /></label>
					</div>
					<div class="form-floating mb-5">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="<fmt:message key="password" />">
						<label for="floatingPassword"><fmt:message key="password" /></label>
					</div>
					<input type="button" class="w-100 btn btn-lg btn-danger mb-3"
						onclick="CheckSignIn()" value="<fmt:message key="signIn" />">
				</form>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
</body>
</html>