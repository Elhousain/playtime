package be.thomasmore.graduaten.playtime.entity;

import javax.persistence.*;

@Entity
public class Categorie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String beschrijving;

    public Categorie() {
    }

    public Categorie(String beschrijving) {
        this.beschrijving = beschrijving;
    }

    public Categorie(Long id) {
        this.id = id;
    }

    public Categorie(Long id, String beschrijving) {
        this.id = id;
        this.beschrijving = beschrijving;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBeschrijving() {
        return beschrijving;
    }

    public void setBeschrijving(String beschrijving) {
        this.beschrijving = beschrijving;
    }
}
