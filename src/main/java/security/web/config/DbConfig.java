package security.web.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class DbConfig {

	@Bean
	public DataSource datasource() {

		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/springlab?useSSL=false&useTimezone=true&serverTimezone=UTC");
		dataSource.setUsername("adpguima");
		dataSource.setPassword("@ndre00sec");

		return dataSource;
	}

}
