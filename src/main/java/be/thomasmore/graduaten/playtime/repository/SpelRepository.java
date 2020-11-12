package be.thomasmore.graduaten.playtime.repository;

import be.thomasmore.graduaten.playtime.entity.Spel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SpelRepository extends JpaRepository<Spel, Long> {
}
