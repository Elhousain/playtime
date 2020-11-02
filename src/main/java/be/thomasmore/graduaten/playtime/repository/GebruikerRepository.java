package be.thomasmore.graduaten.playtime.repository;

import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GebruikerRepository extends JpaRepository<Gebruiker, Long> {
}
