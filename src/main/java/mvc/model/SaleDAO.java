package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class SaleDAO {
	private static SaleDAO instance;

	private SaleDAO() {
	}

	public static SaleDAO getInstance() {
		if (instance == null)
			instance = new SaleDAO();
		return instance;
	}

	public ArrayList<SaleDTO> getSaleList(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT number, GROUP_CONCAT(name, ' : ', quantity, '개' SEPARATOR ', ') AS 'list', SUM(price * quantity) 'sum', saleDate FROM sale, product WHERE sale.code = product.code and id = ? GROUP BY number ORDER BY number";

		ArrayList<SaleDTO> list = new ArrayList<SaleDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SaleDTO sale = new SaleDTO();
				sale.setNumber(rs.getInt("number"));
				sale.setList(rs.getString("list"));
				sale.setSum(rs.getInt("sum"));
				sale.setSaleDate(rs.getTimestamp("saleDate"));
				list.add(sale);
			}
		} catch (Exception ex) {
			System.out.println("getSaleList() 예외발생 : " + ex);
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
	
	public int getNumber() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT number FROM sale ORDER BY number DESC LIMIT 1";

		ArrayList<Integer> list = new ArrayList<Integer>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int number = rs.getInt("number");
				list.add(number);
			}
		} catch (Exception ex) {
			System.out.println("getNumber() 예외발생 : " + ex);
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
		return list.isEmpty() ? 1 : list.get(0) + 1;
	}

	public void insertSale(SaleDTO sale) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "INSERT INTO sale VALUES(?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  sale.getNumber());
			pstmt.setString(2, sale.getId());
			pstmt.setString(3, sale.getCode());
			pstmt.setInt(4, sale.getQuantity());
			pstmt.setTimestamp(5, sale.getSaleDate());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertSale() 예외발생 : " + ex);
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
	
	public void deleteSale(int number) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM sale WHERE number = ?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteSale() 예외발생 : " + ex);
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
