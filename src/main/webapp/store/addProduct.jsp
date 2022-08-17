<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="./resources/js/addProduct_validation.js"></script>
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div class="container">
			<div class="my-5 text-center">
				<div class="jumbotron mb-5">
					<h1 class="display-5">
						<fmt:message key="registrationProduct" />
					</h1>
				</div>
				<div align="center">
					<form name="addProductForm"
						action="<c:url value="ProductAddAction.do"/>">
						<div class="row g-3">
							<div>
								<div class="col-lg-4 mt-3">
									<label for="code" class="form-label"><fmt:message
											key="p_code" /></label> <input type="text" class="form-control"
										id="code" name="code">
								</div>
							</div>
							<div>
								<div class="col-lg-4 mt-3">
									<label for="name" class="form-label"><fmt:message
											key="p_name" /></label> <input type="text" class="form-control"
										id="name" name="name">
								</div>
							</div>
							<div>
								<div class="col-lg-4 mt-3">
									<label for="price" class="form-label"><fmt:message
											key="price" /></label> <input type="number" min="1000" step="500"
										class="form-control" id="price" name="price">
								</div>
							</div>
							<div class="mt-5">
								<div class="col-lg-4">
									<input type="button" class="btn btn-danger"
										value="<fmt:message key="submit" />"
										onclick="CheckAddProduct()">
									<button class="btn btn-secondary ms-2" type="button"
										onclick="location.href='ProductListView.do'">
										<fmt:message key="back" />
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
</body>
</html>