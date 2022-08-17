<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="mvc.model.MovieDTO"%>
<%@ page import="mvc.model.UserDTO"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
List<MovieDTO> movieList = (List<MovieDTO>) request.getAttribute("movielist");
UserDTO user = (UserDTO) session.getAttribute("user");
HashMap<String, Double> rateMap = (HashMap<String, Double>) request.getAttribute("rate");
%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<title>영화 목록</title>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<script type="text/javascript">
	function deleteMovie(code) {
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: 'btn btn-secondary ms-3 mt-3',
				cancelButton: 'btn btn-danger me-3 mt-3'
			},
			buttonsStyling: false
		})
		
		swalWithBootstrapButtons.fire({
			title: '영화를 삭제하시겠습니까?',
			text: "삭제한 영화는 복구할 수 없습니다",
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
					location.href='MovieDeleteAction.do?code=' + code;
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
		<section class="text-center container">
			<div class="row py-lg-5">
				<img src="./resources/images/main.jpg">
			</div>
		</section>
		<div class="album py-5 container">
			<div
				class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-md-4 g-5">
				<%
				for (int i = 0; i < movieList.size(); i++) {
					MovieDTO movie = (MovieDTO) movieList.get(i);
				%>
				<div class="col">
					<div class="card shadow-sm">
						<img src="./resources/images/<%=movie.getFileName()%>"
							width="100%">
						<div class="card-body">
							<p class="card-text"><%=movie.getTitle()%></p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<c:choose>
										<c:when test="${right == 'manager'}">
											<button type="button"
												class="btn btn-sm btn-outline-secondary"
												onclick="location.href='./MovieUpdateForm.do?code=<%=movie.getCode()%>'">
												<fmt:message key="modify" />
											</button>
											<button type="button" class="btn btn-sm btn-outline-danger"
												onclick="deleteMovie('<%=movie.getCode()%>')">
												<fmt:message key="delete" />
											</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-sm btn-outline-danger"
												onclick="location.href='./MovieDetailView.do?code=<%=movie.getCode()%>'">
												<fmt:message key="detail" />
											</button>
										</c:otherwise>
									</c:choose>
								</div>
								<small class="text-muted"><fmt:message
										key="reservationRate" /> <%=rateMap.get(movie.getCode())%>% </small>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
				<c:if test="${right == 'manager'}">
					<div class="col">
						<div class="card shadow-sm">
							<button type="button" onClick="location.href='./MovieAddForm.do'"
								class="btn btn-sm btn-outline-secondary"
								style="font-size: 100px; height: 512px;">+</button>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
</body>
</html>