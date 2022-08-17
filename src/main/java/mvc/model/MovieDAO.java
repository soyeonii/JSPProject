package mvc.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import mvc.database.DBConnection;

public class MovieDAO {
	private static MovieDAO instance;

	private MovieDAO() {
	}

	public static MovieDAO getInstance() {
		if (instance == null)
			instance = new MovieDAO();
		return instance;
	}
	
	public ArrayList<MovieDTO> getMovieTopList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT movie.*, ROUND((COUNT(seat) / (SELECT COUNT(*) FROM reservation) * 100), 1) AS 'rate' FROM movie LEFT OUTER JOIN reservation ON movie.code = reservation.code GROUP BY movie.code ORDER BY rate DESC, movie.title LIMIT 5";

		ArrayList<MovieDTO> list = new ArrayList<MovieDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieDTO movie = new MovieDTO();
				movie.setCode(rs.getString("code"));
				movie.setTitle(rs.getString("title"));
				movie.setDirector(rs.getString("director"));
				movie.setActor(rs.getString("actor"));
				movie.setGenre(rs.getString("genre"));
				movie.setRating(rs.getString("rating"));
				movie.setRunningTime(rs.getInt("runningTime"));
				movie.setCountry(rs.getString("country"));
				movie.setReleaseDate(rs.getDate("releaseDate"));
				movie.setPlot(rs.getString("plot"));
				movie.setFileName(rs.getString("fileName"));
				list.add(movie);
			}
		} catch (Exception ex) {
			System.out.println("getMovieTopList() 예외발생 : " + ex);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return list;
	}

	public ArrayList<MovieDTO> getMovieList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT movie.*, ROUND((COUNT(seat) / (SELECT COUNT(*) FROM reservation) * 100), 1) AS 'rate' FROM movie LEFT OUTER JOIN reservation ON movie.code = reservation.code GROUP BY movie.code ORDER BY rate DESC, movie.title";

		ArrayList<MovieDTO> list = new ArrayList<MovieDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieDTO movie = new MovieDTO();
				movie.setCode(rs.getString("code"));
				movie.setTitle(rs.getString("title"));
				movie.setDirector(rs.getString("director"));
				movie.setActor(rs.getString("actor"));
				movie.setGenre(rs.getString("genre"));
				movie.setRating(rs.getString("rating"));
				movie.setRunningTime(rs.getInt("runningTime"));
				movie.setCountry(rs.getString("country"));
				movie.setReleaseDate(rs.getDate("releaseDate"));
				movie.setPlot(rs.getString("plot"));
				movie.setFileName(rs.getString("fileName"));
				list.add(movie);
			}
		} catch (Exception ex) {
			System.out.println("getMovieList() 예외발생 : " + ex);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return list;
	}

	public MovieDTO getMovie(String code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM movie WHERE code = ?";

		ArrayList<MovieDTO> list = new ArrayList<MovieDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieDTO movie = new MovieDTO();
				movie.setCode(rs.getString("code"));
				movie.setTitle(rs.getString("title"));
				movie.setDirector(rs.getString("director"));
				movie.setActor(rs.getString("actor"));
				movie.setGenre(rs.getString("genre"));
				movie.setRating(rs.getString("rating"));
				movie.setRunningTime(rs.getInt("runningTime"));
				movie.setCountry(rs.getString("country"));
				movie.setReleaseDate(rs.getDate("releaseDate"));
				movie.setPlot(rs.getString("plot"));
				movie.setFileName(rs.getString("fileName"));
				list.add(movie);
			}
		} catch (Exception ex) {
			System.out.println("getMovie() 예외발생 : " + ex);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return list.get(0);
	}

	public HashMap<String, Double> getRate() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT movie.code, ROUND((COUNT(seat) / (SELECT COUNT(*) FROM reservation) * 100), 1) AS 'rate' FROM movie LEFT OUTER JOIN reservation ON movie.code = reservation.code GROUP BY movie.code";

		HashMap<String, Double> map = new HashMap<String, Double>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				map.put(rs.getString("code"), rs.getDouble("rate"));
			}
		} catch (Exception ex) {
			System.out.println("getMovie() 예외발생 : " + ex);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return map;
	}

	public void insertMovie(MovieDTO movie) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "INSERT INTO movie VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie.getCode());
			pstmt.setString(2, movie.getTitle());
			pstmt.setString(3, movie.getDirector());
			pstmt.setString(4, movie.getActor());
			pstmt.setString(5, movie.getGenre());
			pstmt.setString(6, movie.getRating());
			pstmt.setInt(7, movie.getRunningTime());
			pstmt.setString(8, movie.getCountry());
			pstmt.setDate(9, (Date) movie.getReleaseDate());
			pstmt.setString(10, movie.getPlot());
			pstmt.setString(11, movie.getFileName());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertMovie() 예외발생 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}

	// 상품 수정하기
	public void updateMovie(MovieDTO movie) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "UPDATE movie SET title=?, director=?, actor=?, genre=?, rating=?, runningTime=?, country=?, releaseDate=?, plot=?, fileName=? WHERE code=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, movie.getTitle());
			pstmt.setString(2, movie.getDirector());
			pstmt.setString(3, movie.getActor());
			pstmt.setString(4, movie.getGenre());
			pstmt.setString(5, movie.getRating());
			pstmt.setInt(6, movie.getRunningTime());
			pstmt.setString(7, movie.getCountry());
			pstmt.setDate(8, (Date) movie.getReleaseDate());
			pstmt.setString(9, movie.getPlot());
			pstmt.setString(10, movie.getFileName());
			pstmt.setString(11, movie.getCode());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateMovie() 예외발생 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}

	public void deleteMovie(String code) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM movie WHERE code = ?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteMovie() 예외발생 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
}
