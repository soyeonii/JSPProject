<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>오류 페이지</title>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div align="center">
			<div class="jumbotron mt-5 mb-5">
				<div class="container">
					<h2 class="alert alert-danger">
						<br> <b>ERROR</b> <br> <br>
						<fmt:message key="error_message" />
						<br> <br>
					</h2>
				</div>
			</div>
			<div class="container">
				<p><%=request.getRequestURL()%></p>
				<p>
					<a href="MovieTopListView.do" class="btn btn-secondary mt-4 mb-4"> <fmt:message
							key="startPage" /></a>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="./footer.jsp" />
</body>
</html>