package be.thomasmore.graduaten.playtime.entity;

import javax.persistence.*;
import java.sql.Date;

@Entity
public class Taal {
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


