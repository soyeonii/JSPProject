package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class ProductDAO {
	private static ProductDAO instance;

	private ProductDAO() {
	}

	public static ProductDAO getInstance() {
		if (instance == null)
			instance = new ProductDAO();
		return instance;
	}

	public ArrayList<ProductDTO> getProductList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM product";

		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO movie = new ProductDTO();
				movie.setCode(rs.getString("code"));
				movie.setName(rs.getString("name"));
				movie.setPrice(rs.getInt("price"));
				list.add(movie);
			}
		} catch (Exception ex) {
			System.out.println("getProductList() 예외발생 : " + ex);
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

	public ProductDTO getProduct(String code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM product WHERE code = ?";

		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO movie = new ProductDTO();
				movie.setCode(rs.getString("code"));
				movie.setName(rs.getString("name"));
				movie.setPrice(rs.getInt("price"));
				list.add(movie);
			}
		} catch (Exception ex) {
			System.out.println("getProductList() 예외발생 : " + ex);
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

	// 상품 등록하기
	public void insertProduct(ProductDTO product) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "insert into product values(?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getCode());
			pstmt.setString(2, product.getName());
			pstmt.setInt(3, product.getPrice());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertProduct() 예외발생 : " + ex);
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

	// 상품 삭제하기
	public void deleteProduct(String code) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM product WHERE code = ?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteProduct() 예외발생 : " + ex);
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
