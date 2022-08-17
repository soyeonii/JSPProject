package mvc.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.model.MovieDAO;
import mvc.model.MovieDTO;
import mvc.model.ProductDAO;
import mvc.model.ProductDTO;
import mvc.model.ReservationDAO;
import mvc.model.ReservationDTO;
import mvc.model.ReviewDAO;
import mvc.model.ReviewDTO;
import mvc.model.SaleDAO;
import mvc.model.SaleDTO;
import mvc.model.UserDAO;
import mvc.model.UserDTO;

@SuppressWarnings("serial")
public class MainController extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		if (request.getParameter("language") != null)
			request.getSession().setAttribute("language", request.getParameter("language"));

		if (command.equals("/MovieTopListView.do")) { // 메인 화면 출력
			requestMovieTopList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./movie/welcome.jsp");
			rd.forward(request, response);
		} else if (command.equals("/MovieListView.do")) { // 영화 목록 출력
			requestMovieList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./movie/movies.jsp");
			rd.forward(request, response);
		} else if (command.equals("/MovieDetailView.do")) { // 영화 상세 정보 보여주기
			requestMovieDetail(request);
			RequestDispatcher rd = request.getRequestDispatcher("./movie/movie.jsp");
			rd.forward(request, response);
		} else if (command.equals("/MovieAddForm.do")) { // 영화 등록 폼
			RequestDispatcher rd = request.getRequestDispatcher("./movie/addMovie.jsp");
			rd.forward(request, response);
		} else if (command.equals("/MovieAddAction.do")) { // 영화 등록 처리
			requestMovieAdd(request);
			RequestDispatcher rd = request.getRequestDispatcher("MovieListView.do");
			rd.forward(request, response);
		} else if (command.equals("/MovieUpdateForm.do")) { // 영화 수정 폼
			requestMovieDetail(request);
			RequestDispatcher rd = request.getRequestDispatcher("./movie/updateMovie.jsp");
			rd.forward(request, response);
		} else if (command.equals("/MovieUpdateAction.do")) { // 영화 수정 처리
			requestMovieUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("MovieListView.do");
			rd.forward(request, response);
		} else if (command.equals("/MovieDeleteAction.do")) { // 영화 삭제 처리
			requestMovieDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("MovieListView.do");
			rd.forward(request, response);
		} else if (command.equals("/MovieReviewAddAction.do")) { // 영화 리뷰 등록
			requestMovieReviewAdd(request);
			RequestDispatcher rd = request.getRequestDispatcher("MovieDetailView.do");
			rd.forward(request, response);
		} else if (command.equals("/MovieReviewDeleteAction.do")) { // 영화 리뷰 삭제
			requestMovieReviewDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("MovieDetailView.do");
			rd.forward(request, response);
		} else if (command.equals("/MovieReservationAddAction.do")) { // 영화 예매
			requestMovieReservationAdd(request);
			RequestDispatcher rd = request.getRequestDispatcher("MovieDetailView.do");
			rd.forward(request, response);
		} else if (command.equals("/MovieReservationCancelAction.do")) { // 영화 예매 취소
			requestMovieReservationCancel(request);
			RequestDispatcher rd = request.getRequestDispatcher("MyCGVView.do");
			rd.forward(request, response);
		} else if (command.equals("/ProductListView.do")) { // 등록된 상품 목록 출력
			requestProductList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./store/store.jsp");
			rd.forward(request, response);
		} else if (command.equals("/ProductAddForm.do")) { // 상품 등록 폼
			RequestDispatcher rd = request.getRequestDispatcher("./store/addProduct.jsp");
			rd.forward(request, response);
		} else if (command.equals("/ProductAddAction.do")) { // 상품 등록 처리
			requestProductAdd(request);
			RequestDispatcher rd = request.getRequestDispatcher("ProductListView.do");
			rd.forward(request, response);
		} else if (command.equals("/ProductDeleteAction.do")) { // 상품 삭제 처리
			requestProductDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("ProductListView.do");
			rd.forward(request, response);
		} else if (command.equals("/ProductAddCartAction.do")) { // 장바구니에 추가
			requestProductAddCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("ProductListView.do");
			rd.forward(request, response);
		} else if (command.equals("/ProductRemoveCartAction.do")) { // 장바구니에서 선택 상품 삭제
			requestProductRemoveCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("ProductListView.do");
			rd.forward(request, response);
		} else if (command.equals("/ProductDeleteCartAction.do")) { // 장바구니에서 전체 상품 삭제
			requestProductDeleteCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("ProductListView.do");
			rd.forward(request, response);
		} else if (command.equals("/ProductSaleAction.do")) { // 결제 처리
			requestProductSale(request);
			requestProductDeleteCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("./store/receipt.jsp");
			rd.forward(request, response);
		} else if (command.equals("/ProductSaleCancelAction.do")) { // 결제 취소
			requestProductSaleCancel(request);
			RequestDispatcher rd = request.getRequestDispatcher("MyCGVView.do");
			rd.forward(request, response);
		} else if (command.equals("/UserSignInForm.do")) { // 로그인 폼 이동
			RequestDispatcher rd = request.getRequestDispatcher("./user/signIn.jsp");
			rd.forward(request, response);
		} else if (command.equals("/UserSignInAction.do")) { // 로그인 처리
			RequestDispatcher rd;
			if (requestUserSignIn(request))
				rd = request.getRequestDispatcher("MovieTopListView.do");
			else
				rd = request.getRequestDispatcher("./user/signIn.jsp?error=1");
			rd.forward(request, response);
		} else if (command.equals("/UserSignUpForm.do")) { // 회원가입 폼 이동
			RequestDispatcher rd = request.getRequestDispatcher("./user/signUp.jsp");
			rd.forward(request, response);
		} else if (command.equals("/UserSignUpAction.do")) { // 회원가입 처리
			requestUserSignUp(request);
			RequestDispatcher rd = request.getRequestDispatcher("UserSignInForm.do");
			rd.forward(request, response);
		} else if (command.equals("/UserLogoutAction.do")) { // 로그아웃
			requestUserLogout(request);
			RequestDispatcher rd = request.getRequestDispatcher("MovieTopListView.do");
			rd.forward(request, response);
		} else if (command.equals("/CustomerSeviceForm.do")) { // 고객센터 폼 이동
			RequestDispatcher rd = request.getRequestDispatcher("./user/customerService.jsp");
			rd.forward(request, response);
		} else if (command.equals("/MyCGVView.do")) { // My CGV 페이지 이동
			requestMyCGV(request);
			RequestDispatcher rd = request.getRequestDispatcher("./user/myCGV.jsp");
			rd.forward(request, response);
		} else if (command.equals("/UserUpdateForm.do")) { // 회원정보수정 폼 이동
			RequestDispatcher rd = request.getRequestDispatcher("./user/updateUser.jsp");
			rd.forward(request, response);
		} else if (command.equals("/UserUpdateAction.do")) { // 회원정보수정 폼 이동
			requestUserUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("MyCGVView.do");
			rd.forward(request, response);
		} else if (command.equals("/UserDeleteAction.do")) { // 회원탈퇴
			requestUserDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("UserLogoutAction.do");
			rd.forward(request, response);
		}
	}

	// -----------------------------------------------------------
	// MovieController
	// -----------------------------------------------------------
	// 예매율 TOP 5 영화 목록 가져오기
	public void requestMovieTopList(HttpServletRequest request) {
		MovieDAO dao = MovieDAO.getInstance();
		request.setAttribute("movielist", dao.getMovieTopList());
	}

	// 예매율 순으로 모든 영화 목록 가져오기
	public void requestMovieList(HttpServletRequest request) {
		MovieDAO dao = MovieDAO.getInstance();
		request.setAttribute("movielist", dao.getMovieList());
		request.setAttribute("rate", dao.getRate());
	}

	// 영화 등록
	public void requestMovieAdd(HttpServletRequest request) throws IOException {
		ServletContext cxt = getServletContext();
		String dir = cxt.getRealPath("resources/images");
		int maxSize = 5 * 1024 * 1024;
		String encType = "utf-8";

		MultipartRequest multi = new MultipartRequest(request, dir, maxSize, encType, new DefaultFileRenamePolicy());

		Enumeration<?> files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);

		MovieDAO dao = MovieDAO.getInstance();
		MovieDTO movie = new MovieDTO();
		movie.setCode(multi.getParameter("code"));
		movie.setTitle(multi.getParameter("title"));
		movie.setDirector(multi.getParameter("director"));
		movie.setActor(multi.getParameter("actor"));
		movie.setGenre(multi.getParameter("genre"));
		movie.setRating(multi.getParameter("rating"));
		movie.setRunningTime(Integer.valueOf(multi.getParameter("runningTime")));
		movie.setCountry(multi.getParameter("country"));
		movie.setReleaseDate(java.sql.Date.valueOf(multi.getParameter("releaseDate")));
		movie.setPlot(multi.getParameter("plot"));
		movie.setFileName(fileName);

		dao.insertMovie(movie);
	}

	// 영화 수정
	public void requestMovieUpdate(HttpServletRequest request) throws IOException {
		ServletContext cxt = getServletContext();
		String dir = cxt.getRealPath("resources/images");
		int maxSize = 5 * 1024 * 1024;
		String encType = "utf-8";

		MultipartRequest multi = new MultipartRequest(request, dir, maxSize, encType, new DefaultFileRenamePolicy());

		Enumeration<?> files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);

		MovieDAO dao = MovieDAO.getInstance();
		MovieDTO movie = new MovieDTO();
		movie.setCode(multi.getParameter("code"));
		movie.setTitle(multi.getParameter("title"));
		movie.setDirector(multi.getParameter("director"));
		movie.setActor(multi.getParameter("actor"));
		movie.setGenre(multi.getParameter("genre"));
		movie.setRating(multi.getParameter("rating"));
		movie.setRunningTime(Integer.valueOf(multi.getParameter("runningTime")));
		movie.setCountry(multi.getParameter("country"));
		movie.setReleaseDate(java.sql.Date.valueOf(multi.getParameter("releaseDate")));
		movie.setPlot(multi.getParameter("plot"));
		movie.setFileName(fileName);

		dao.updateMovie(movie);
	}

	// 영화 삭제
	public void requestMovieDelete(HttpServletRequest request) {
		MovieDAO dao = MovieDAO.getInstance();
		String code = request.getParameter("code");
		dao.deleteMovie(code);
	}

	// 영화 상세 정보
	public void requestMovieDetail(HttpServletRequest request) {
		String code = request.getParameter("code");

		MovieDAO movieDao = MovieDAO.getInstance();
		MovieDTO movie = movieDao.getMovie(code);
		request.setAttribute("movie", movie);

		ReviewDAO reviewDao = ReviewDAO.getInstance();
		List<ReviewDTO> reviewlist = (List<ReviewDTO>) reviewDao.getReviewList(code);
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("starAvg", reviewDao.getStarAvg(code));

		ReservationDAO reservationDao = ReservationDAO.getInstance();
		List<String> seatlist = (List<String>) reservationDao.getSeatList(code);
		request.setAttribute("seatlist", seatlist);

	}

	// -----------------------------------------------------------
	// ReviewController
	// -----------------------------------------------------------
	// 리뷰 등록
	public void requestMovieReviewAdd(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ReviewDAO dao = ReviewDAO.getInstance();
		ReviewDTO review = new ReviewDTO();
		review.setCode(request.getParameter("code"));
		review.setId(((UserDTO) session.getAttribute("user")).getId());
		String star = request.getParameter("star");
		if (star == null)
			review.setStar(0);
		else
			review.setStar(Integer.valueOf(star));
		review.setContent(request.getParameter("content"));
		dao.insertReview(review);
	}

	// 리뷰 삭제
	public void requestMovieReviewDelete(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ReviewDAO dao = ReviewDAO.getInstance();
		String code = request.getParameter("code");
		String id = ((UserDTO) session.getAttribute("user")).getId();
		dao.deleteReview(code, id);
	}

	// -----------------------------------------------------------
	// ReservationController
	// -----------------------------------------------------------
	// 영화 예매
	public void requestMovieReservationAdd(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ReservationDAO dao = ReservationDAO.getInstance();
		ReservationDTO reservation = new ReservationDTO();
		reservation.setNumber(dao.getNumber());
		reservation.setCode(request.getParameter("code"));
		reservation.setId(((UserDTO) session.getAttribute("user")).getId());
		reservation.setReservationDate(new Timestamp(System.currentTimeMillis()));
		String[] seats = request.getParameterValues("seat");
		for (String seat : seats) {
			reservation.setSeat(seat);
			dao.insertReservation(reservation);
		}
	}

	// 예매 취소
	public void requestMovieReservationCancel(HttpServletRequest request) {
		ReservationDAO dao = ReservationDAO.getInstance();
		dao.deleteReservation(Integer.valueOf(request.getParameter("number")));
	}

	// -----------------------------------------------------------
	// ProductController
	// -----------------------------------------------------------
	// 상품 목록 가져오기
	public void requestProductList(HttpServletRequest request) {
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> productlist = dao.getProductList();
		request.setAttribute("productlist", productlist);
	}

	// 상품 등록
	public void requestProductAdd(HttpServletRequest request) {
		ProductDAO dao = ProductDAO.getInstance();

		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String price = request.getParameter("price");

		ProductDTO product = new ProductDTO();
		product.setCode(code);
		product.setName(name);
		product.setPrice(Integer.valueOf(price));

		dao.insertProduct(product);
	}

	// 상품 삭제
	public void requestProductDelete(HttpServletRequest request) {
		ProductDAO dao = ProductDAO.getInstance();
		String code = request.getParameter("code");
		dao.deleteProduct(code);
	}

	// 장바구니 추가
	@SuppressWarnings("unchecked")
	public void requestProductAddCart(HttpServletRequest request) {
		ProductDAO dao = ProductDAO.getInstance();
		String code = request.getParameter("code");

		ProductDTO goods = dao.getProduct(code);

		HttpSession session = request.getSession();
		ArrayList<ProductDTO> cartlist = (ArrayList<ProductDTO>) session.getAttribute("cartlist");
		if (cartlist == null) {
			cartlist = new ArrayList<ProductDTO>();
			session.setAttribute("cartlist", cartlist);
		}

		int cnt = 0;
		ProductDTO goodsQnt = new ProductDTO();
		for (int i = 0; i < cartlist.size(); i++) {
			goodsQnt = cartlist.get(i);
			if (goodsQnt.getCode().equals(code)) {
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuantity);
				break;
			}
		}

		if (cnt == 0) {
			goods.setQuantity(1);
			cartlist.add(goods);
		}
	}

	// 장바구니에 있는 상품 삭제
	@SuppressWarnings("unchecked")
	public void requestProductRemoveCart(HttpServletRequest request) {
		String code = request.getParameter("code");
		HttpSession session = request.getSession();
		ArrayList<ProductDTO> cartList = (ArrayList<ProductDTO>) session.getAttribute("cartlist");

		ProductDTO goodsQnt = new ProductDTO();
		for (int i = 0; i < cartList.size(); i++) {
			goodsQnt = cartList.get(i);
			if (goodsQnt.getCode().equals(code)) {
				cartList.remove(goodsQnt);
			}
		}
	}

	// 장바구니 전체 취소
	public void requestProductDeleteCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("cartlist");
	}

	// 상품 결제
	@SuppressWarnings("unchecked")
	public void requestProductSale(HttpServletRequest request) {
		HttpSession session = request.getSession();
		SaleDAO dao = SaleDAO.getInstance();
		ArrayList<ProductDTO> cartList = (ArrayList<ProductDTO>) session.getAttribute("cartlist");
		if (cartList != null) {
			SaleDTO sale = new SaleDTO();
			sale.setNumber(dao.getNumber());
			sale.setId(((UserDTO) session.getAttribute("user")).getId());
			sale.setSaleDate(new Timestamp(System.currentTimeMillis()));
			for (ProductDTO product : cartList) {
				sale.setCode(product.getCode());
				sale.setQuantity(product.getQuantity());
				dao.insertSale(sale);
			}
		}
		request.setAttribute("cartlist", cartList);
	}

	// 결제 취소
	public void requestProductSaleCancel(HttpServletRequest request) {
		SaleDAO dao = SaleDAO.getInstance();
		dao.deleteSale(Integer.valueOf(request.getParameter("number")));
	}

	// -----------------------------------------------------------
	// UserController
	// -----------------------------------------------------------
	// 로그인
	public boolean requestUserSignIn(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDAO dao = UserDAO.getInstance();

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserDTO user = dao.getUser(id, password);

		if (user != null) {
			session.setAttribute("user", user);
			return true;
		} else
			return false;
	}

	// 회원가입
	public void requestUserSignUp(HttpServletRequest request) {
		UserDAO dao = UserDAO.getInstance();
		UserDTO user = new UserDTO();
		user.setId(request.getParameter("id"));
		user.setPassword(request.getParameter("password"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setRight(request.getParameter("right"));
		dao.insertUser(user);
	}

	// 로그아웃
	public void requestUserLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
	}

	// 마이페이지
	public void requestMyCGV(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = ((UserDTO) session.getAttribute("user")).getId();
		SaleDAO saleDao = SaleDAO.getInstance();
		ArrayList<SaleDTO> salelist = saleDao.getSaleList(id);
		request.setAttribute("salelist", salelist);

		ReservationDAO reservationDao = ReservationDAO.getInstance();
		ArrayList<ReservationDTO> reservationlist = reservationDao.getReservationList(id);
		request.setAttribute("reservationlist", reservationlist);
	}

	// 회원 정보 수정
	public void requestUserUpdate(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDAO dao = UserDAO.getInstance();
		UserDTO user = new UserDTO();
		user.setId(request.getParameter("id"));
		user.setPassword(request.getParameter("password"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setRight(((UserDTO) session.getAttribute("user")).getRight());
		dao.updateUser(user);
		session.setAttribute("user", user);
	}

	// 회원 탈퇴
	public void requestUserDelete(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDAO dao = UserDAO.getInstance();
		dao.deleteUser(((UserDTO) session.getAttribute("user")).getId());
	}
}