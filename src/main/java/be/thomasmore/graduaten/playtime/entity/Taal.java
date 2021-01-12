package be.thomasmore.graduaten.playtime.entity;

import javax.persistence.*;

@Entity
public class Taal {
    public static final String TAAL = "taal";
    public static final String ID = "id";
    public static final String BESCHRIJVING = "beschrijving";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String beschrijving;

    //Constructor
    public Taal()
    {

    }
    //id
    public void setId(Long id){this.id=id;}
    public Long getId() { return id; }
    //beschrijving

    public void setBeschrijving(String beschrijving) { this.beschrijving = beschrijving; }
    public String getBeschrijving() { return beschrijving; }
}


