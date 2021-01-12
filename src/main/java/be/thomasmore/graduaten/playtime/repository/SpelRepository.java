package be.thomasmore.graduaten.playtime.repository;

import be.thomasmore.graduaten.playtime.entity.Spel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SpelRepository extends JpaRepository<Spel, Long> {
    @Query(value = "SELECT s FROM Spel s  WHERE LOWER(CONCAT(s.naam, ' ', s.beschrijving)) LIKE %?1%")
    public List<Spel> search(String keyword);

    @Query(value = "SELECT s FROM Spel s WHERE s.status='3' AND LOWER(CONCAT(s.naam, ' ', s.beschrijving)) LIKE %?1%")
    List<Spel> getSpellenActief(String keyword);



}
