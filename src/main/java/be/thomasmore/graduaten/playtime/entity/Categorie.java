package be.thomasmore.graduaten.playtime.entity;

import javax.persistence.*;

@Entity
public class Categorie {
    public static final String CATEGGORIE = "categorie";
    public static final String ID = "id";
    public static final String BESCHRIJVING = "beschrijving";


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
