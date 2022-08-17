<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.MovieDTO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
List<MovieDTO> movieList = (List<MovieDTO>) request.getAttribute("movielist");
%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>CGV</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div align="center">
			<div class="container">
				<div id="carouselExampleCaptions" class="carousel slide"
					data-bs-ride="false">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<video autoplay muted style="width: 100%">
								<source
									src='https://adimg.cgv.co.kr/images/202205/Witch2/220527_Witch2_1080x608.mp4'
									type='video/mp4'>
							</video>
							<div class="carousel-caption d-none d-md-block text-start">
								<h1>
									<fmt:message key="witch2" />
								</h1>
								<p>
									<fmt:message key="witch2_intro_1" />
									<br>
									<fmt:message key="witch2_intro_2" />
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<video autoplay muted style="width: 100%">
								<source
									src='http://h.vod.cgv.co.kr/vodCGVa/85829/85829_203060_1200_128_960_540.mp4'
									type='video/mp4'>
							</video>
							<div class="carousel-caption d-none d-md-block text-start">
								<h1>
									<fmt:message key="broker" />
								</h1>
								<p>
									<fmt:message key="broker_intro_1" />
									<br>
									<fmt:message key="broker_intro_2" />
									<br>
									<fmt:message key="broker_intro_3" />
								</p>
							</div>
						</div>
						<div class="carousel-item">
							<video autoplay muted style="width: 100%">
								<source
									src='http://h.vod.cgv.co.kr/vodCGVa/85813/85813_202591_1200_128_960_540.mp4'
									type='video/mp4'>
							</video>
							<div class="carousel-caption d-none d-md-block text-start">
								<h1>
									<fmt:message key="theRoundup" />
								</h1>
								<p>
									<fmt:message key="theRoundup_intro_1" />
									<br>
									<fmt:message key="theRoundup_intro_2" />
								</p>
							</div>
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="my-5 text-center">
				<div class="container px-5">
					<h3 class="display-15 fw-bold">
						🏆&nbsp;&nbsp;
						<fmt:message key="movieChart" />
						&nbsp;&nbsp;🏆
					</h3>
				</div>
				<div class="container pt-4">
					<%
					for (int i = 0; i < movieList.size(); i++) {
						MovieDTO movie = (MovieDTO) movieList.get(i);
					%>
					<img src="./resources/images/<%=movie.getFileName()%>"
						class="img-fluid border rounded-3 shadow-lg mb-4 ms-2 me-2"
						width="15%">
					<%
					}
					%>
				</div>
			</div>
		</div>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
