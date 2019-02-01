package security.core.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import security.core.model.User;

@Repository
public class UserRepository {

	@Autowired
	private DataSource dataSource;

	public User findByUserName(String userName) {

		String sql = "SELECT u.username, u.password, auth.authority FROM users u LEFT JOIN authorities auth ON u.username=auth.username WHERE u.username=?";

		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;

		try {
			conn = dataSource.getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, userName);
			preparedStatement.executeQuery();

			resultSet = preparedStatement.getResultSet();
			user = getUser(resultSet);
		} catch (SQLException e) {
			throw new RuntimeException("Exception while extracting userInfo from database", e);
		} finally {
			if (resultSet != null) {
				try {
					resultSet.close();
				} catch (SQLException e) {
					throw new RuntimeException("Exception while closing resultSet", e);
				}
			}
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					throw new RuntimeException("Exception while closing preparedStatement", e);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					throw new RuntimeException("Exception while closing connection", e);
				}
			}
		}

		return user;
	}

	private User getUser(ResultSet resultSet) throws SQLException {
		User user = null;
		while (resultSet.next()) {

			if (user == null) {
				user = new User();
			}

			if (user.getUsername() == null)
				user.setUsername(resultSet.getString("username"));

			if (user.getPassword() == null)
				user.setPassword(resultSet.getString("password"));

			String authority = resultSet.getString("authority");
			if (authority != null) {
				if (user.getRoles() == null) {
					user.setRoles(new ArrayList<String>());
				}
				user.getRoles().add(authority);
			}

		}

		return user;
	}
}
