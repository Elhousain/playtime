package be.thomasmore.graduaten.playtime.entity;

import javax.persistence.*;

public class SpelError {
    public static final String SPEL = "spel_error";
    public boolean hasErrors;

    public String naam;
    public String prijs;
    public String beschrijving;
    public String categorie;
    public String min_spelers;
    public String max_spelers;
    public String min_leeftijd;
    public String taal;
    public String uitgever;
    public String status;
    public String voorraad_huur;
    public String voorraad_koop;
}
