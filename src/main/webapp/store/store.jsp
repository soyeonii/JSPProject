<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="mvc.model.ProductDTO"%>
<%@ page import="mvc.model.UserDTO"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productlist");
UserDTO user = (UserDTO) session.getAttribute("user");
String cartId = session.getId();
%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<title>스토어</title>
<script type="text/javascript">
	function sale() {
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: 'btn btn-secondary ms-3 mt-3',
				cancelButton: 'btn btn-danger me-3 mt-3'
			},
			buttonsStyling: false
		})
		
		swalWithBootstrapButtons.fire({
			title: '결제를 하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonText: '확인',
			cancelButtonText: '취소',
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
				swalWithBootstrapButtons.fire(
				'결제가 완료되었습니다',
				'',
				'success'
				).then((result) => {
					location.href='ProductSaleAction.do';
				})
			}
		})
	}
	
	function deleteProduct(code) {
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: 'btn btn-secondary ms-3 mt-3',
				cancelButton: 'btn btn-danger me-3 mt-3'
			},
			buttonsStyling: false
		})
		
		swalWithBootstrapButtons.fire({
			title: '상품을 삭제하시겠습니까?',
			text: "삭제한 상품은 복구할 수 없습니다",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '확인',
			cancelButtonText: '취소',
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
				swalWithBootstrapButtons.fire(
				'삭제가 완료되었습니다',
				'',
				'success'
				).then((result) => {
					location.href='ProductDeleteAction.do?code=' + code;
				})
			}
		})
	}
</script>
</head>
<body>
	<c:set var="right" value="<%=user.getRight()%>" />
	<jsp:include page="../menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div class="container">
			<div class="d-flex mt-5 pt-4" align="left">
				<div class="p-2 w-50 ms-1">
					<div style="height: 336px; overflow: auto">
						<table
							class="table table-light table-striped-columns table-bordered">
							<thead>
								<tr>
									<th scope="col"><fmt:message key="p_name" /></th>
									<th scope="col" width="20%"><fmt:message key="quantity" /></th>
									<th scope="col"><fmt:message key="price" /></th>
									<th scope="col" width="10%"><fmt:message key="note" /></th>
								</tr>
							</thead>
							<tbody>
								<%
								ArrayList<ProductDTO> cartList = (ArrayList<ProductDTO>) session.getAttribute("cartlist");
								if (cartList == null)
									cartList = new ArrayList<ProductDTO>();

								for (int i = 0; i < cartList.size(); i++) {
									ProductDTO product = cartList.get(i);
								%>
								<tr>
									<td><%=product.getName()%></td>
									<td><%=product.getQuantity()%></td>
									<td><%=product.getPrice()%></td>
									<td><a
										href="ProductRemoveCartAction.do?code=<%=product.getCode()%>"
										class="badge rounded-pill text-bg-secondary"><fmt:message
												key="cancel" /></a></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
					<div class="row row-cols-4 mt-5 mb-5">
						<c:choose>
							<c:when test="${right == 'manager'}">
								<div>
									<button type="button" class="btn btn-secondary ms-1 me-2"
										onclick="location.href='ProductDeleteCartAction.do'"
										style="width: 120px; height: 80px;" disabled>
										<fmt:message key="cancel_all" />
									</button>
								</div>
								<div>
									<button type="button" class="btn btn-danger ms-2"
										onclick="sale()" style="width: 120px; height: 80px;" disabled>
										<fmt:message key="payment" />
									</button>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<button type="button" class="btn btn-secondary ms-1 me-2"
										onclick="location.href='ProductDeleteCartAction.do'"
										style="width: 120px; height: 80px;">
										<fmt:message key="cancel_all" />
									</button>
								</div>
								<div>
									<button type="button" class="btn btn-danger ms-2"
										onclick="sale()" style="width: 120px; height: 80px;">
										<fmt:message key="payment" />
									</button>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="ms-auto p-2 w-50" align="right">
					<div class="row row-cols-4 ms-4">
						<c:choose>
							<c:when test="${right == 'manager'}">
								<%
								for (int i = 0; i < productList.size(); i++) {
									ProductDTO product = productList.get(i);
								%>
								<button type="button"
									class="btn btn-outline-danger ms-3 me-3 mb-5"
									onclick="deleteProduct('<%=product.getCode()%>')"
									style="width: 120px; height: 80px"><%=product.getName()%></button>
								<%
								}
								%>
								<button type="button"
									class="btn btn-outline-secondary ms-3 me-3 mb-5"
									onclick="location.href='ProductAddForm.do'"
									style="width: 120px; height: 80px;">+</button>
							</c:when>
							<c:otherwise>
								<%
								for (int i = 0; i < productList.size(); i++) {
									ProductDTO product = productList.get(i);
								%>
								<button type="button"
									class="btn btn-outline-danger ms-3 me-3 mb-5"
									onclick="location.href='ProductAddCartAction.do?code=<%=product.getCode()%>'"
									style="width: 120px; height: 80px"><%=product.getName()%></button>
								<%
								}
								%>
								<%
								for (int i = productList.size(); i < 16; i++) {
								%>
								<button type="button"
									class="btn btn-outline-secondary ms-3 me-3 mb-5" disabled
									style="width: 120px; height: 80px">
									<fmt:message key="preparing" />
								</button>
								<%
								}
								%>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
</body>
</html>