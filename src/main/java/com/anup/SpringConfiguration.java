package com.anup;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariDataSource;

@ComponentScan
@Configuration
@EnableTransactionManagement
@EnableJpaRepositories
@PropertySource(value = { "classpath:application_mysql.properties", "classpath:application_oracle.properties", "classpath:log4j.properties" })
public class SpringConfiguration {

	@Value("${jdbc.url}")
	private String jdbcUrl;

	@Value("${jdbc.user}")
	private String user;

	@Value("${jdbc.password}")
	private String password;

	@Value("${jdbc.show_sql}")
	private String show_sql;

	@Value("${jdbc.dialect}")
	private String dialect;

	@Value("${jdbc.hbm2ddl.auto}")
	private String hbm2ddl;

	@Value("${jdbc.format_sql}")
	private String format_sql;

	@Value("${jdbc.driveClassName}")
	private String driverClassName;

	@Value("${jdbc.packagesToScan}")
	private String packagesToScan;

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource) {
		LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
		entityManagerFactory.setDataSource(dataSource);
		Properties jpaProperties = new Properties();
		jpaProperties.put("hibernate.hbm2ddl.auto", hbm2ddl);
		jpaProperties.put("hibernate.show_sql", show_sql);
		jpaProperties.put("hibernate.dialect", dialect);
		jpaProperties.put("hibernate.format_sql", format_sql);
		entityManagerFactory.setJpaProperties(jpaProperties);
		entityManagerFactory.setPackagesToScan(packagesToScan);
		entityManagerFactory.setPersistenceProvider(new HibernatePersistenceProvider());
		return entityManagerFactory;
	}

	@Bean
	public JpaTransactionManager transactionManager(DataSource dataSource, EntityManagerFactory entityManagerFactory) {
		JpaTransactionManager transactionManager = new JpaTransactionManager(entityManagerFactory);
		transactionManager.setDataSource(dataSource);
		return transactionManager;
	}

	@Bean
	public DataSource dataSource() {
		HikariDataSource dataSource = new HikariDataSource();
		dataSource.setDriverClassName(driverClassName);
		dataSource.setJdbcUrl(jdbcUrl);
		dataSource.setUsername(user);
		dataSource.setPassword(password);
		return dataSource;
	}

}