package be.thomasmore.graduaten.playtime.repository;


import be.thomasmore.graduaten.playtime.entity.Uitgever;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UitgeverRepository extends JpaRepository<Uitgever, Long> {
}
