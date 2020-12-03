package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Categorie;
import be.thomasmore.graduaten.playtime.repository.CategorieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategorieServiceImpl implements CategorieService{

    @Autowired
    CategorieRepository categorieRepository;

    @Override
    public Categorie getCategorieById(Long id) {
        return categorieRepository.getOne(id);
    }

    @Override
    public List<Categorie> getCategorien() {
        return categorieRepository.findAll();
    }

    @Override
    public Categorie addCategorie(Categorie categorie) {
        return categorieRepository.save(categorie);
    }
}
