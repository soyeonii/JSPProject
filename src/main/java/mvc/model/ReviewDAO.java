package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class ReviewDAO {
	private static ReviewDAO instance;

	private ReviewDAO() {
	}

	public static ReviewDAO getInstance() {
		if (instance == null)
			instance = new ReviewDAO();
		return instance;
	}
	
	public ArrayList<ReviewDTO> getReviewList(String code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM review WHERE code = ? ORDER BY createDate DESC";

		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewDTO review = new ReviewDTO();
				review.setId(rs.getString("id"));
				review.setStar(rs.getInt("star"));
				review.setContent(rs.getString("content"));
				review.setCreateDate(rs.getTimestamp("createDate"));
				list.add(review);
			}
		} catch (Exception ex) {
			System.out.println("getReviewList() 예외발생 : " + ex);
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
	
	public double getStarAvg(String code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT ROUND(SUM(star) / COUNT(*), 1) AS 'avg' FROM review WHERE code = ?";

		ArrayList<Double> list = new ArrayList<Double>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				double avg = rs.getDouble("avg");
				list.add(avg);
			}
		} catch (Exception ex) {
			System.out.println("getStarAvg() 예외발생 : " + ex);
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
		return list.isEmpty() ? 0.0 : list.get(0);
	}
	
	public void insertReview(ReviewDTO review) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "INSERT INTO review VALUES(?, ?, ?, ?, now())";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getCode());
			pstmt.setString(2, review.getId());
			pstmt.setInt(3, review.getStar());
			pstmt.setString(4, review.getContent());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertReview() 예외발생 : " + ex);
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
	
	public void deleteReview(String code, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM review WHERE code = ? and id = ?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteReview() 예외발생 : " + ex);
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
