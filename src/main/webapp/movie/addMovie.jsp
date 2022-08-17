<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="./resources/js/addMovie_validation.js"></script>
<title>영화 등록</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<fmt:setLocale value='<%=session.getAttribute("language")%>' />
	<fmt:bundle basename="bundle.message">
		<div class="container">
			<div class="my-5 text-center">
				<div class="jumbotron mb-5">
					<h1 class="display-5">
						<fmt:message key="registrationMovie" />
					</h1>
				</div>
				<div align="center">
					<form name="addMovieForm"
						action="<c:url value="MovieAddAction.do"/>"
						enctype="multipart/form-data" method="post">
						<div class="row g-3">
							<div>
								<div class="col-lg-4 mt-2">
									<label for="code" class="form-label"><fmt:message
											key="m_code" /></label> <input type="text" class="form-control"
										id="code" name="code">
								</div>
							</div>
							<div>
								<div class="col-lg-4">
									<label for="title" class="form-label"><fmt:message
											key="title" /></label> <input type="text" class="form-control"
										id="title" name="title">
								</div>
							</div>
							<div>
								<div class="col-lg-4">
									<label for="director" class="form-label"><fmt:message
											key="director" /></label> <input type="text" class="form-control"
										id="director" name="director">
								</div>
							</div>
							<div>
								<div class="col-lg-4">
									<label for="actor" class="form-label"><fmt:message
											key="actor" /></label> <input type="text" class="form-control"
										id="actor" name="actor">
								</div>
							</div>
							<div>
								<div class="col-lg-4">
									<label for="genre" class="form-label"><fmt:message
											key="genre" /></label> <select class="form-select" id="genre"
										name="genre">
										<option value="none">--
											<fmt:message key="choose" /> --
										</option>
										<option>액션</option>
										<option>모험</option>
										<option>판타지</option>
										<option>SF</option>
										<option>범죄</option>
										<option>전쟁</option>
										<option>공포</option>
										<option>스릴러</option>
										<option>미스터리</option>
										<option>로맨스/멜로</option>
										<option>코미디</option>
										<option>드라마</option>
										<option>애니메이션</option>
									</select>
								</div>
							</div>
							<div>
								<div class="col-lg-4">
									<label for="rating" class="form-label"><fmt:message
											key="rating" /></label> <select class="form-select" id="rating"
										name="rating">
										<option value="none">--
											<fmt:message key="choose" /> --
										</option>
										<option>전체관람가</option>
										<option>12세이상관람가</option>
										<option>15세이상관람가</option>
										<option>청소년관람불가</option>
										<option>제한상영가</option>
									</select>
								</div>
							</div>
							<div>
								<div class="col-lg-4">
									<label for="runningTime" class="form-label"><fmt:message
											key="runningTime" /></label> <input type="number"
										class="form-control" id="runningTime" name="runningTime">
								</div>
							</div>
							<div>
								<div class="col-lg-4">
									<label for="country" class="form-label"><fmt:message
											key="country" /></label> <input type="text" class="form-control"
										id="country" name="country">
								</div>
							</div>
							<div>
								<div class="col-lg-4">
									<label for="releaseDate" class="form-label"><fmt:message
											key="releaseDate" /></label> <input type="date" class="form-control"
										id="releaseDate" name="releaseDate">
								</div>
							</div>
							<div>
								<div class="col-lg-4">
									<label for="plot" class="form-label"><fmt:message
											key="plot" /></label>
									<textarea class="form-control" id="plot" name="plot"
										style="height: 100px"></textarea>
								</div>
							</div>
							<div>
								<div class="col-lg-4">
									<label for="fileName" class="form-label"><fmt:message
											key="image" /></label> <input class="form-control" type="file"
										id="fileName" name="fileName">
								</div>
							</div>
							<div class="mt-5">
								<div class="col-lg-4">
									<input type="button" class="btn btn-danger me-2"
										value="<fmt:message key="submit" />" onclick="CheckAddMovie()">
									<button class="btn btn-secondary ms-2" type="button"
										onclick="location.href='MovieListView.do'">
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