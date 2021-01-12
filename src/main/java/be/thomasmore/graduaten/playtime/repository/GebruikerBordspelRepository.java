package be.thomasmore.graduaten.playtime.repository;

import be.thomasmore.graduaten.playtime.entity.GebruikerBordspel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface GebruikerBordspelRepository extends JpaRepository<GebruikerBordspel, Long>
{
    @Query(value = "SELECT g FROM GebruikerBordspel g WHERE g.verwerkt = false ")
    List<GebruikerBordspel> getGebruikerBordspellenNietVerwerkt();

}
