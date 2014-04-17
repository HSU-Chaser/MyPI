package fourleaf.logon;

import java.sql.*;
import java.util.Vector;

public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean();

	public static LogonDBBean getInstance() {
		return instance;
	}

	private LogonDBBean() {
	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:mysql://localhost:3306/mypi?"
				+"useUnicode=true&characterEncoding=UTF-8";

		return DriverManager.getConnection(jdbcDriver,"root","root");
	}

	// 
	public void insertMember(LogonDataBean member) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("insert into member values(?,?)");
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

	// 
	public LogonDataBean getMember(String email) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean member = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member where email = ?");
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
					.prepareStatement("update member set email=?, passwd=?" );
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
					pstmt = conn.prepareStatement("delete from member where email = ?");
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

	/*
	// �̸��� ã��
	public LogonDataBean searchId(String name, String jumin1, String jumin2)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean sid = null;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select id from member where name = ? "
							+ "and jumin1 =? and jumin2 = ?");
			pstmt.setString(1, name);
			pstmt.setString(2, jumin1);
			pstmt.setString(3, jumin2);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sid = new LogonDataBean();
				sid.setId(rs.getString("id"));
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
		return sid;
	}

	// ��й�ȣ ã��
	public LogonDataBean searchPw(String id, String jumin1, String jumin2)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean spw = null;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select passwd from member where id = ? "
							+ "and jumin1 =? and jumin2 = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, jumin1);
			pstmt.setString(3, jumin2);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				spw = new LogonDataBean();
				spw.setPassword(rs.getString("passwd"));
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
		return spw;
	}
	*/
}
