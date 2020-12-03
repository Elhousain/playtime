package be.thomasmore.graduaten.playtime.repository;

import be.thomasmore.graduaten.playtime.entity.Categorie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategorieRepository extends JpaRepository<Categorie, Long> {
}
