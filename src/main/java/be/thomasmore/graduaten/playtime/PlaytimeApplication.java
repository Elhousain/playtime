package be.thomasmore.graduaten.playtime;

import be.thomasmore.graduaten.playtime.repository.GebruikerRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackageClasses = GebruikerRepository.class)
public class PlaytimeApplication {

    public static void main(String[] args) {
        SpringApplication.run(PlaytimeApplication.class, args);
    }

}
