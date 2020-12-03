package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Categorie;

import java.util.List;

public interface CategorieService {
    Categorie getCategorieById(Long id);
    List<Categorie> getCategorien();
    Categorie addCategorie (Categorie categorie);
}
