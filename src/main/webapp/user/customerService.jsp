<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="mvc.model.UserDTO"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
UserDTO user = (UserDTO) session.getAttribute("user");
%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>고객센터</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div class="container">
			<div class="my-5 text-center">
				<div class="jumbotron">
					<h1 class="display-5">
						<fmt:message key="customerService" />
					</h1>
				</div>
				<div align="center">
					<form method="post" class="gform"
						action="https://script.google.com/macros/s/AKfycbxDDArSFKWF7O5Yllj5yVK-xtUdkWXPf9NvT6juvzwVjaj4ItJ9/exec">
						<div class="form-elements">
							<div class="col-lg-4 mt-5">
								<label for="email" class="form-label col-lg-4"><fmt:message
										key="email" /></label> <input type="text" class="form-control"
									name="email" value="<%=user.getEmail()%>" readonly>
							</div>
							<div class="col-lg-4 mt-4">
								<label for="name" class="form-label col-lg-4"><fmt:message
										key="name" /></label> <input type="text" class="form-control"
									name="name" value="<%=user.getName()%>" readonly>
							</div>
							<div class="col-lg-4 mt-4">
								<label for="content" class="form-label"><fmt:message
										key="content" /></label>
								<textarea class="form-control" name="content"
									style="height: 200px"></textarea>
							</div>
							<div class="col-lg-4 mt-5">
								<button class="button-success btn btn-secondary">
									<i class="fa fa-paper-plane"></i>&nbsp;
									<fmt:message key="send" />
								</button>
							</div>
						</div>
						<div class="thankyou_message mt-5 pt-5 mb-5 pb-5"
							style="display: none;">
							<h2>
								<em><fmt:message key="email_message" /></em>
							</h2>
						</div>
					</form>
				</div>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
	<script data-cfasync="false"
		src="./resources/js/form-submission-handler.js"></script>
</body>
</html>