package be.thomasmore.graduaten.playtime.repository;

import be.thomasmore.graduaten.playtime.entity.GebruikerBordspel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface GebruikerBordspelRepository extends JpaRepository<GebruikerBordspel, Long>
{

}
