<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="mvc.model.UserDTO"%>
<%@ page import="mvc.model.SaleDTO"%>
<%@ page import="mvc.model.ReservationDTO"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
List<SaleDTO> saleList = (List<SaleDTO>) request.getAttribute("salelist");
List<ReservationDTO> reservationList = (List<ReservationDTO>) request.getAttribute("reservationlist");
UserDTO user = (UserDTO) session.getAttribute("user");
%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<title>MY CGV</title>
<script type="text/javascript">
	function deleteReservation(number) {
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: 'btn btn-secondary ms-3 mt-3',
				cancelButton: 'btn btn-danger me-3 mt-3'
			},
			buttonsStyling: false
		})
		
		swalWithBootstrapButtons.fire({
			title: '예매를 취소하시겠습니까?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '확인',
			cancelButtonText: '취소',
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
				swalWithBootstrapButtons.fire(
				'예매가 취소되었습니다',
				'',
				'success'
				).then((result) => {
					location.href = 'MovieReservationCancelAction.do?number=' + number;
				})
			}
		})
	}
	
	function deleteSale(number) {
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: 'btn btn-secondary ms-3 mt-3',
				cancelButton: 'btn btn-danger me-3 mt-3'
			},
			buttonsStyling: false
		})
		
		swalWithBootstrapButtons.fire({
			title: '결제를 취소하시겠습니까?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '확인',
			cancelButtonText: '취소',
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
				swalWithBootstrapButtons.fire(
				'결제가 취소되었습니다',
				'',
				'success'
				).then((result) => {
					location.href = 'ProductSaleCancelAction.do?number=' + number;
				})
			}
		})
	}
	
	function deleteUser() {
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: 'btn btn-secondary ms-3 mt-3',
				cancelButton: 'btn btn-danger me-3 mt-3'
			},
			buttonsStyling: false
		})
		
		swalWithBootstrapButtons.fire({
			title: '회원 탈퇴하시겠습니까?',
			text: "탈퇴 시 작성된 리뷰는 자동으로 삭제됩니다",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '확인',
			cancelButtonText: '취소',
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
				swalWithBootstrapButtons.fire(
				'회원탈퇴가 완료되었습니다',
				'그동안 CGV서비스를 이용해 주셔서 감사합니다',
				'success'
				).then((result) => {
					location.href = 'UserDeleteAction.do';
				})
			}
		})
	}
</script>
<style type="text/css">
#backslash {
	background:
		url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><line x1="0" y1="0" x2="100%" y2="100%" stroke="gray" /></svg>'),
		url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><line x1="0" y1="100%" x2="100%" y2="0" stroke="gray" /></svg>');
	position: relative;
	opacity: 0.5;
}
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div class="container">
			<div class="jumbotron mb-4">
				<h1 class="display-3">MY CGV</h1>
			</div>
			<div style="text-align: center">
				<%
				if (user.getRight().equals("user")) {
				%>
				<div class="p-5 mb-4 bg-light rounded-3">
					<%
					} else {
					%>
					<div class="p-5 mb-4 bg-light rounded-3" id="backslash">
						<%
						}
						%>
						<div class="mb-4">
							<h3>
								🎫
								<fmt:message key="reservationDetails" />
								🎫
							</h3>
						</div>
						<div style="height: 310px; overflow: auto">
							<table
								class="table table-light table-striped-columns table-bordered">
								<thead>
									<tr>
										<th scope="col" width="30%"><fmt:message key="title" /></th>
										<th scope="col"><fmt:message key="seat" /></th>
										<th scope="col" width="20%"><fmt:message
												key="reservationDate" /></th>
										<th scope="col" width="5%"><fmt:message key="note" /></th>
									</tr>
								</thead>
								<tbody>
									<%
									for (int i = 0; i < reservationList.size(); i++) {
										ReservationDTO reservation = reservationList.get(i);
									%>
									<tr>
										<td><%=reservation.getTitle()%></td>
										<td><%=reservation.getList()%></td>
										<td><%=reservation.getReservationDate()%></td>
										<td><a style="cursor: pointer;"
											onclick="deleteReservation('<%=reservation.getNumber()%>')"
											class="badge rounded-pill text-bg-secondary"><fmt:message
													key="cancel" /></a></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
					<%
					if (user.getRight().equals("user")) {
					%>
					<div class="p-5 mb-4 bg-light rounded-3">
						<%
						} else {
						%>
						<div class="p-5 mb-4 bg-light rounded-3" id="backslash">
							<%
							}
							%>
							<div class="mb-4">
								<h3>
									🧾
									<fmt:message key="paymentDetails" />
									🧾
								</h3>
							</div>
							<div style="height: 310px; overflow: auto">
								<table
									class="table table-light table-striped-columns table-bordered">
									<thead>
										<tr>
											<th scope="col"><fmt:message key="paymentList" /></th>
											<th scope="col" width="10%"><fmt:message key="sum" /></th>
											<th scope="col" width="20%"><fmt:message
													key="paymentDate" /></th>
											<th scope="col" width="5%"><fmt:message key="note" /></th>
										</tr>
									</thead>
									<tbody>
										<%
										for (int i = 0; i < saleList.size(); i++) {
											SaleDTO sale = saleList.get(i);
										%>
										<tr>
											<td><%=sale.getList()%></td>
											<td><%=sale.getSum()%><fmt:message key="won" /></td>
											<td><%=sale.getSaleDate()%></td>
											<td><a style="cursor: pointer;"
												onclick="return deleteSale('<%=sale.getNumber()%>')"
												class="badge rounded-pill text-bg-secondary"><fmt:message
														key="cancel" /></a></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
						<div align="right">
							<button type="button" class="btn btn-danger btn-lg me-2"
								onclick="location.href='UserUpdateForm.do'">
								<fmt:message key="modifyMemberInformation" />
							</button>
							<button type="button" class="btn btn-danger btn-lg ms-2"
								onclick="deleteUser()">
								<fmt:message key="membershipWithdrawal" />
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
</body>
</html>