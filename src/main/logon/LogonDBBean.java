package main.logon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean();

	public static LogonDBBean getInstance() {
		return instance;
	}

	private LogonDBBean() {
	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:mysql://localhost:3306/debind?"
				+ "useUnicode=true&characterEncoding=UTF-8";

		return DriverManager.getConnection(jdbcDriver, "debind", "chaser/14");
	}

	//
	public void insertMember(LogonDataBean member) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into member values(?,?,?,?)");
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getCertKey());
			pstmt.setBoolean(4, false);

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
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

	//
	public int userCheck(String email, String password) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpasswd = "";
		int x = -1;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select password from member where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("password");

				if (dbpasswd.equals(password))
					x = 1; //
				else
					x = 0; //
			} else
				x = -1; //
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
		return x;
	}

	//
	public int confirmEmail(String email) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = -1;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select email from member where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = 1; //
			else
				x = -1; //
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
		return x;
	}

	public int certicateEmail(String email, String key) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = -1;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select mail_cert_key from member where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.getString(1) == key) {
				x = 1;
			} else {
				x = -1;
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
		return x;
	}

	//
	public LogonDataBean getMember(String email) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean member = null;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select * from member where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new LogonDataBean();
				member.setEmail(rs.getString("email"));
				member.setPassword(rs.getString("password"));
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
		return member;
	}

	//
	public void updateMember(LogonDataBean member) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("update member set email=?, passwd=?");
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPassword());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
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

	//
	public int deleteMember(String email, String password) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpasswd = "";
		int x = -1;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select password from member where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("password");

				if (dbpasswd.equals(password)) {
					pstmt = conn
							.prepareStatement("delete from member where email = ?");
					pstmt.setString(1, email);
					pstmt.executeUpdate();

					x = 1; //
				} else
					x = 0; //
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
		return x;
	}
}
