package com.anup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.anup.security.custom.auth.handler.CustomAuthenticationHandler;

/**
 *
 * @author Raichand
 */

@EnableWebSecurity
@EnableTransactionManagement
@EnableJpaRepositories("com.anup.repositories")
@ComponentScan("com.anup.*,com.anup.service.UserDetailsServiceImpl")
@Configuration
public class MyWebSecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	UserDetailsService userDetailsService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/View/UnSecured/**").permitAll()
				.antMatchers("/resources/**").permitAll()
				.antMatchers("/css/**", "/js/**", "/images/**", "/resources/**").permitAll()
				.antMatchers("/View/UnSecured/login.jsf").permitAll().antMatchers("/javax.faces.resource/**")
				.permitAll()// for Primefaces
				.antMatchers("/View/Secured/Admin/**").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/View/Secured/User/**").access("hasRole('ROLE_USER')").anyRequest().authenticated().and()
				.formLogin().loginPage("/View/UnSecured/login.jsf")
				.failureUrl("/View/UnSecured/login.jsf?auth=fail")// login
																	// configuration
				.usernameParameter("username").passwordParameter("password")
				.successHandler(customAuthenticationHandler()).permitAll()
				// remember me configuration
				.and().rememberMe().useSecureCookie(true).key("rem-me-key")// It
																			// specifies
																			// the
																			// key
																			// to
																			// identify
																			// token
				.rememberMeParameter("remember-me_input")// remember me field in
															// login form &
															// Primefaces adds
															// '_input' suffix
															// to remember-me
															// parameter from
															// Login Form
				.rememberMeCookieName("remember-me")// It specifies the cookie
													// name stored in browser
				.tokenValiditySeconds(86400)// Specifies the time in seconds
											// after which token expires.key to
											// identify token keep for one day
				.alwaysRemember(false).and().logout() // logout configuration
				// .logoutUrl("/logout")
				.logoutSuccessUrl("/View/UnSecured/login.jsf")
				// .logoutSuccessUrl("/index.xhtml")
				.invalidateHttpSession(true).deleteCookies("JSESSIONID").permitAll().and().csrf().disable(); // Permissions
																												// here

	}
	/*
	 * Meaning of important terminology in above method authorizedRequests(): It
	 * allows restricted access.HTTP requests are authorized before being served.
	 * antMatcher():It matches the URL with given pattern. Access():It checks USER
	 * has provoided role. formLogin():Enables form based authentication.
	 * loginPage():It specifies the custom login page URL. LoginProcessingURL():It
	 * specifies the URL using which username and password is validated
	 * usernameParameter():It specifies the field name to enter user name which is
	 * used by spring security to validate.If not specified then default is
	 * username. passwordParameter ():It specifies the field name to enter password
	 * which is used by spring security to validate.If not specified then default is
	 * password. defaultSuccessUrl ():It specifies the default URL which is used by
	 * spring security after successful authentication. logout():It supports the
	 * login functionality in spring security application. logoutUrl():If defines
	 * the URL for logout.If CSRF protection is enabled,logout request must be POST.
	 * logoutSuccessUrl ():It specifies the URL which is used by spring security
	 * after successful logout. configureGlobal ():It configures
	 * AuthenticationManager.
	 */

	/* Use above USERDETAILSERVICE for Authentication */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());

	}

	@Bean
	public CustomAuthenticationHandler customAuthenticationHandler() {
		return new CustomAuthenticationHandler();
	}

}
