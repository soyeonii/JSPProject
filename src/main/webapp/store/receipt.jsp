<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="mvc.model.ProductDTO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>결제 정보</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div class="jumbotron mb-4">
			<div class="container">
				<h1 class="display-3">결제 정보</h1>
			</div>
		</div>
		<div class="container col-8 alert alert-secondary mb-5">
			<div class="mt-5">
				<table class="table table-hover">
					<tr>
						<th class="text-center"><fmt:message key="p_name" /></th>
						<th class="text-center">#</th>
						<th class="text-center"><fmt:message key="price" /></th>
						<th class="text-center"><fmt:message key="smallSum" /></th>
					</tr>
					<%
					int sum = 0;
					ArrayList<ProductDTO> cartList = (ArrayList<ProductDTO>) request.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<ProductDTO>();
					for (int i = 0; i < cartList.size(); i++) {
						ProductDTO product = cartList.get(i);
						int total = product.getPrice() * product.getQuantity();
						sum = sum + total;
					%>
					<tr>
						<td class="text-center"><em><%=product.getName()%></em></td>
						<td class="text-center"><%=product.getQuantity()%></td>
						<td class="text-center"><%=product.getPrice()%><fmt:message
								key="won" /></td>
						<td class="text-center"><%=sum%><fmt:message key="won" /></td>
					</tr>
					<%
					}
					%>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td class="text-center"><strong><fmt:message
									key="sum" />: </strong></td>
						<td class="text-center text-danger"><strong><%=sum%><fmt:message
									key="won" /></strong></td>
					</tr>
				</table>
				<div align="right">
					<a href="ProductDeleteCartAction.do" class="btn btn-secondary"
						role="button"><fmt:message key="confirm" /></a>
				</div>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
</body>
</html>