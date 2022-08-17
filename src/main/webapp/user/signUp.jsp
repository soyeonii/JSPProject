<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/signUp_validation.js"></script>
<title>회원가입</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div class="container" style="width: 400px; text-align: center;">
			<div class="mt-5 mb-5">
				<form name="signUpForm" action="UserSignUpAction.do">
					<h1 class="h1 mb-5 fw-normal">
						<fmt:message key="signUp" />
					</h1>
					<div class="form-floating mb-4">
						<input type="text" class="form-control form-control-sm" id="id"
							name="id" placeholder="<fmt:message key="id" />"> <label
							for="floatingInput"><fmt:message key="id" /></label>
					</div>
					<div class="form-floating mb-4">
						<input type="password" class="form-control form-control-sm"
							id="password" name="password"
							placeholder="<fmt:message key="password" />"> <label
							for="floatingPassword"><fmt:message key="password" /></label>
					</div>
					<div class="form-floating mb-4">
						<input type="password" class="form-control form-control-sm"
							id="passwordConfirm"
							placeholder="<fmt:message key="passwordConfirm" />"> <label
							for="floatingPassword"><fmt:message key="passwordConfirm" /></label>
					</div>
					<div class="form-floating mb-4">
						<input type="text" class="form-control form-control-sm" id="name"
							name="name" placeholder="<fmt:message key="name" />"> <label
							for="floatingInput"><fmt:message key="name" /></label>
					</div>
					<div class="form-floating mb-4">
						<input type="email" class="form-control form-control-sm"
							id="email" name="email" placeholder="<fmt:message key="email" />">
						<label for="floatingInput"><fmt:message key="email" /></label>
					</div>
					<div class="form-check mb-4">
						<label><input type="radio" id="right" name="right"
							value="user" checked="checked"> <fmt:message key="user" /></label>&nbsp;&nbsp;&nbsp;&nbsp;<label><input
							type="radio" id="right" name="right" value="manager"> <fmt:message
								key="manager" /></label>
					</div>
					<div>
						<input type="button" class="w-100 btn btn-lg btn-danger mb-3"
							value="<fmt:message key="signUp" />" onclick="CheckSignUp()">
					</div>
				</form>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
</body>
</html>