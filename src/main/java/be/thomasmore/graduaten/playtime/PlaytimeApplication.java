package be.thomasmore.graduaten.playtime;

import be.thomasmore.graduaten.playtime.repository.GebruikerRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import javax.mail.MessagingException;

@SpringBootApplication
@EnableJpaRepositories(basePackageClasses = GebruikerRepository.class)
public class PlaytimeApplication {

    public static void main(String[] args) throws MessagingException {

        SpringApplication.run(PlaytimeApplication.class, args);
        System.out.println("Started!");

    }

}
