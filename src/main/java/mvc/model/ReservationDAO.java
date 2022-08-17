package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class ReservationDAO {
	private static ReservationDAO instance;

	private ReservationDAO() {
	}

	public static ReservationDAO getInstance() {
		if (instance == null)
			instance = new ReservationDAO();
		return instance;
	}

	public ArrayList<String> getSeatList(String code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT seat FROM reservation WHERE code = ? ORDER BY seat";

		ArrayList<String> list = new ArrayList<String>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String seat = rs.getString("seat");
				list.add(seat);
			}
		} catch (Exception ex) {
			System.out.println("getSeatList() 예외발생 : " + ex);
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

	public ArrayList<ReservationDTO> getReservationList(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT number, movie.code, title, GROUP_CONCAT('[', seat, ']' SEPARATOR ', ') AS 'list', reservationDate FROM reservation, movie WHERE reservation.code = movie.code and id = ? GROUP BY reservationDate ORDER BY reservationDate";

		ArrayList<ReservationDTO> list = new ArrayList<ReservationDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReservationDTO reservation = new ReservationDTO();
				reservation.setNumber(rs.getInt("number"));
				reservation.setCode(rs.getString("code"));
				reservation.setTitle(rs.getString("title"));
				reservation.setList(rs.getString("list"));
				reservation.setReservationDate(rs.getTimestamp("reservationDate"));
				list.add(reservation);
			}
		} catch (Exception ex) {
			System.out.println("getReservationList() 예외발생 : " + ex);
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

		String sql = "SELECT number FROM reservation ORDER BY number DESC LIMIT 1";

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

	public void insertReservation(ReservationDTO reservation) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();

			String sql = "INSERT INTO reservation VALUES(?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reservation.getNumber());
			pstmt.setString(2, reservation.getId());
			pstmt.setString(3, reservation.getCode());
			pstmt.setString(4, reservation.getSeat());
			pstmt.setTimestamp(5, reservation.getReservationDate());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertReservation() 예외발생 : " + ex);
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

	public void deleteReservation(int number) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM reservation WHERE number = ?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteReservation() 예외발생 : " + ex);
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
