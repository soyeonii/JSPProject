<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="mvc.model.UserDTO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
UserDTO user = (UserDTO) session.getAttribute("user");
%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="./resources/js/updateUser_validation.js"></script>
<title>회원정보수정</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div class="container" style="width: 400px; text-align: center;">
			<div class="mt-5 mb-5">
				<form name="updateUserForm" action="UserUpdateAction.do">
					<h1 class="h1 mb-5 fw-normal">
						<fmt:message key="modifyMemberInformation" />
					</h1>
					<div class="form-floating mb-4">
						<input type="text" class="form-control form-control-sm" id="id"
							name="id" placeholder="<fmt:message key="id" />"
							value="<%=user.getId()%>" readonly> <label
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
							name="name" placeholder="<fmt:message key="name" />"
							value="<%=user.getName()%>"> <label for="floatingInput"><fmt:message
								key="name" /></label>
					</div>
					<div class="form-floating mb-4">
						<input type="email" class="form-control form-control-sm"
							id="email" name="email" placeholder="<fmt:message key="email" />"
							value="<%=user.getEmail()%>"> <label for="floatingInput"><fmt:message
								key="email" /></label>
					</div>
					<div class="form-check mb-4">
						<%
						if (user.getRight().equals("user")) {
						%>
						<label><input type="radio" name="right" value="user"
							checked disabled> <fmt:message key="user" /></label>&nbsp;&nbsp;&nbsp;&nbsp;<label><input
							type="radio" name="right" value="user" disabled> <fmt:message
								key="user" /></label>
						<%
						} else {
						%>
						<label><input type="radio" name="right" value="manager"
							disabled> <fmt:message key="user" /></label>&nbsp;&nbsp;&nbsp;&nbsp;<label><input
							type="radio" name="right" value="manager" checked disabled>
							<fmt:message key="manager" /></label>
						<%
						}
						%>
					</div>
					<div>
						<input type="button" class="btn btn-lg btn-danger mb-3 me-2"
							onclick="CheckUpdateUser()" value="<fmt:message key="submit" />"
							style="font-size: 15px"> <input type="button"
							onclick="location.href='MyCGVView.do'"
							class="btn btn-lg btn-secondary mb-3 ms-2"
							value="<fmt:message key="cancel" />" style="font-size: 15px">
					</div>
				</form>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
</body>
</html>