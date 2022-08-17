<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.MovieDTO"%>
<%@ page import="mvc.model.ReviewDTO"%>
<%@ page import="mvc.model.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
MovieDTO movie = (MovieDTO) request.getAttribute("movie");
List<ReviewDTO> reviewList = (List<ReviewDTO>) request.getAttribute("reviewlist");
UserDTO user = (UserDTO) session.getAttribute("user");
String[][] seats = {{"L1", "L2", "L3", "L4", "L5"}, {"S1", "S2", "S3", "S4", "S5"}, {"Y1", "Y2", "Y3", "Y4", "Y5"}};
List<String> seatList = (List<String>) request.getAttribute("seatlist");
Double starAvg = (Double) request.getAttribute("starAvg");
%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<title>영화 상세 정보</title>
<script type="text/javascript">
	function deleteReview() {
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
				confirmButton: 'btn btn-secondary ms-3 mt-3',
				cancelButton: 'btn btn-danger me-3 mt-3'
			},
			buttonsStyling: false
		})
		
		swalWithBootstrapButtons.fire({
			title: '리뷰를 삭제하시겠습니까?',
			text: "삭제한 리뷰는 복구할 수 없습니다",
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
					location.href='MovieReviewDeleteAction.do?code=<%=movie.getCode()%>';
				})
			}
		})
	}
</script>
<style>
.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: #fff58c;
}

.star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent;
	-webkit-text-stroke-width: 1.3px;
	-webkit-text-stroke-color: #2b2a29;
	color: #aaa9a9;
}

.star-ratings-fill {
	color: #fff58c;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: gold;
}

.star-ratings-base {
	z-index: 0;
	padding: 0;
}
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div class="container">
			<div class="p-5 mb-4 bg-light rounded-3">
				<div class="container-fluid py-5">
					<div class="row">
						<div class="col-md-4 ms-5">
							<img src="./resources/images/<%=movie.getFileName()%>"
								style="width: 100%">
						</div>
						<div class="col-md-6 ms-5">
							<h3>
								<b><%=movie.getTitle()%></b>
							</h3>
							<br>
							<p>
								<fmt:message key="director" />
								:
								<%=movie.getDirector()%>
								/
								<fmt:message key="actor" />
								:
								<%=movie.getActor()%>
							<p>
								<fmt:message key="genre" />
								:
								<%=movie.getGenre()%>
								/
								<fmt:message key="basics" />
								:
								<%=movie.getRating()%>,
								<%=movie.getRunningTime()%><fmt:message key="minute" />
								,
								<%=movie.getCountry()%>
							<p>
								<fmt:message key="releaseDate" />
								:
								<%=movie.getReleaseDate()%>
							</p>
							<hr>
							<br>
							<p>
								<%=movie.getPlot()%>
							</p>
							<br>
							<div>
								<button type="button" class="btn btn-danger me-1"
									data-bs-toggle="modal" data-bs-target="#reservationModal">
									<fmt:message key="reservation" />
								</button>
								<div class="modal fade" id="reservationModal" tabindex="-1"
									aria-labelledby="reservationModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="reservationModalLabel">
													<fmt:message key="movieReservation" />
												</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<form
												action="MovieReservationAddAction.do?code=<%=request.getParameter("code")%>"
												method="post">
												<div class="modal-body" align="center">
													<div>
														💖
														<fmt:message key="reservation_message" />
														💖
													</div>
													<br>
													<hr>
													<fmt:message key="screen" />
													<div class="mt-3">
														<%
														for (String[] seat : seats) {
															for (String s : seat) {
														%>
														<div class="form-check form-check-inline mt-4">
															<%
															if (!seatList.contains(s)) {
															%>
															<input type="checkbox" class="btn-check" id="<%=s%>"
																name="seat" value="<%=s%>" autocomplete="off"> <label
																class="btn btn-outline-danger" for="<%=s%>"><%=s%></label>
															<%
															} else {
															%>
															<input type="checkbox" class="btn-check" id="<%=s%>"
																name="seat" value="<%=s%>" autocomplete="off" disabled>
															<label class="btn btn-outline-secondary" for="<%=s%>"><%=s%></label>
															<%
															}
															%>
														</div>
														<%
														}
														}
														%>
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-danger">
														<fmt:message key="submit" />
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								<a href="MovieListView.do" class="btn btn-secondary ms-1"><fmt:message
										key="back" /></a>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="d-flex mt-4 mb-4">
					<div class="p-2" align="left">
						<b><fmt:message key="movieRating" /></b>
					</div>
					<div class="p-2" align="left">
						<div class="star-ratings">
							<div class="star-ratings-fill space-x-2 text-lg"
								style="width: <%=starAvg * 20%>%">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
							<div class="star-ratings-base space-x-2 text-lg">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
						</div>
					</div>
					<div class="p-2" align="left">
						<b><%=starAvg%></b>
					</div>
					<div class="ms-auto p-2" align="right">
						<button type="button" class="btn btn-outline-danger"
							data-bs-toggle="modal" data-bs-target="#reviewModal">
							<fmt:message key="createReview" />
						</button>
					</div>
				</div>
				<div class="modal fade" id="reviewModal" tabindex="-1"
					aria-labelledby="reviewModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="reviewModalLabel">
									<fmt:message key="movieReview" />
								</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<form
								action="MovieReviewAddAction.do?code=<%=request.getParameter("code")%>"
								method="post">
								<div class="modal-body">
									<div class="star-rating space-x-4 mx-auto">
										<input type="radio" id="5-stars" name="star" value="5"
											v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
										<input type="radio" id="4-stars" name="star" value="4"
											v-model="ratings" /> <label for="4-stars" class="star">★</label>
										<input type="radio" id="3-stars" name="star" value="3"
											v-model="ratings" /> <label for="3-stars" class="star">★</label>
										<input type="radio" id="2-stars" name="star" value="2"
											v-model="ratings" /> <label for="2-stars" class="star">★</label>
										<input type="radio" id="1-star" name="star" value="1"
											v-model="ratings" /> <label for="1-star" class="star">★</label>
									</div>
									<div class="mt-3 mb-3">
										<label for="message-text" class="col-form-label"><fmt:message
												key="review" /></label>
										<textarea class="form-control" id="message-text"
											name="content" style="height: 150px"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-secondary">
										<fmt:message key="submit" />
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<c:if test="${not empty reviewlist}">
					<div style="height: 500px; overflow: auto">
						<table class="table table-borderless"
							style="border-collapse: separate; border-spacing: 0 35px;">
							<thead>
								<tr>
									<th scope="col" width="10%"><fmt:message key="id" /></th>
									<th scope="col" width="10%"><fmt:message key="starRating" /></th>
									<th scope="col" width="7%"></th>
									<th scope="col" width="44%"><fmt:message key="review" /></th>
									<th scope="col" width="4%"></th>
									<th scope="col" width="19%"><fmt:message key="createDate" /></th>
									<th scope="col" width="5%"><fmt:message key="note" /></th>
								</tr>
							</thead>
							<tbody>
								<%
								for (int i = 0; i < reviewList.size(); i++) {
									ReviewDTO review = (ReviewDTO) reviewList.get(i);
								%>
								<tr>
									<td><%=review.getId().substring(0, review.getId().length() - 4) + "****"%>
									</td>
									<td>
										<div class="star-ratings">
											<div class="star-ratings-fill space-x-2 text-lg"
												style="width: <%=review.getStar() * 20%>%">
												<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
											</div>
											<div class="star-ratings-base space-x-2 text-lg">
												<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
											</div>
										</div>
									</td>
									<th scope="row"><%=review.getStar()%></th>
									<td><%=review.getContent()%></td>
									<td></td>
									<td><%=review.getCreateDate()%></td>
									<td>
										<%
										if (review.getId().equals(user.getId())) {
										%> <span onclick="deleteReview()" style="cursor: pointer;"
										class="badge rounded-pill text-bg-warning"><fmt:message
												key="del" /></span> <%
 }
 %>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</c:if>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
</body>
</html>