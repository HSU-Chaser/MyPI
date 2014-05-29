package main.ranking;

import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import main.logon.LogonDataBean;

public class ExposureGraph {

	// getExprecord에 세션으로 email을 넣으면, 해당 세션에 해당하는

	private static Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:mysql://localhost:3306/debind?"
				+ "useUnicode=true&characterEncoding=UTF-8";

		return DriverManager.getConnection(jdbcDriver, "debind", "chaser/14");
	}

	// 넣을 때 멤버에 저장된 해당 멤버의 client_num, 노출도, 날짜를 셋팅한 객체를 넣어줘야함
	public static void insertExprecord(ExpDataBean expData) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select count(*) from exprecord");

			rs = pstmt.executeQuery();

			if (rs.next()) {

				if (rs.getInt(1) == 10) {

					// 가장 오래된 데이터 삭제

					pstmt = conn
							.prepareStatement("delete from exprecord where data_index = 1");
					pstmt.executeUpdate();

					pstmt = conn
							.prepareStatement("update exprecord set data_index = data_index - 1");
					pstmt.executeUpdate();

				}
				// 데이터 입력

				int count = rs.getInt(1);
				System.out.println(count);
				if (count < 10) {
					expData.setData_index(count + 1);
				} else if (count == 10) {
					expData.setData_index(count);
				}
				pstmt = conn
						.prepareStatement("insert into exprecord values(?,?,?,?)");

				pstmt.setInt(1, expData.getData_index());
				pstmt.setInt(2, expData.getClient_num());
				pstmt.setInt(3, expData.getExposure());
				pstmt.setString(4, expData.getDate());

			}
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	}

	// 해당그래프에서 전체를 긁어서 리스트를 가져옵니다.
	public ArrayList<ExpDataBean> getExprecord(String email) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ExpDataBean> expDataList = null;
		ExpDataBean expData = null;
		int client_num = 0;

		expDataList = new ArrayList<ExpDataBean>();

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select client_num from member where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				client_num = rs.getInt("client_num");
			}

			pstmt = conn
					.prepareStatement("select * from exprecord where client_num = ?");

			pstmt.setInt(1, client_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				expData = new ExpDataBean();

				expData.setExposure(rs.getInt("exposure"));
				expData.setDate(rs.getString("search_date"));
				expDataList.add(expData);

			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}

		}
		return expDataList;

	}

	public static void main(String[] args) {

		ExpDataBean expData = null;
		try {
			expData = new ExpDataBean();

			expData.setClient_num(8);
			expData.setDate("14.05.31");
			expData.setExposure(80);

			insertExprecord(expData);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}


