package be.thomasmore.graduaten.playtime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    MyUserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/spel/*").hasRole("ADMIN")
                .antMatchers("/gebruiker/list").hasRole("ADMIN")
                .antMatchers("/gebruiker/*").hasAnyRole("ADMIN", "USER")
                .antMatchers("/gebruiker/eigendata").hasAnyRole("ADMIN", "USER")
                .antMatchers("/shoppingCart").hasAnyRole("ADMIN", "USER")
                .antMatchers("/eigenspellen").hasAnyRole("ADMIN", "USER")
                .antMatchers("/gebruikerBordspel/list").hasRole("ADMIN")

                .antMatchers("/").permitAll()
                .antMatchers("/overzichtSpellen").permitAll()
                .antMatchers("/registratie").permitAll()
                .and().formLogin()
                .and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/");

        http.authorizeRequests()
                .antMatchers("/h2-console/**").permitAll();
        //nodig om h2-console te bereiken
        http.csrf().disable();
        http.headers().frameOptions().disable();


    }

    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }



}
