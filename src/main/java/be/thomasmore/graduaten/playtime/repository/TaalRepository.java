package be.thomasmore.graduaten.playtime.repository;

import be.thomasmore.graduaten.playtime.entity.Taal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface TaalRepository extends JpaRepository<Taal, Long> {
}

