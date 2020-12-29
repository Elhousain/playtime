package be.thomasmore.graduaten.playtime.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;

@Entity
public class GebruikerBordspel
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long  id;
    private int ordernr;
    private int spelid;
    private int gebruikerid;
    private LocalDate afhaaldatum;
    private boolean verwerkt;
    private boolean ishuur;
    private int aantal;

    //constructor
    public GebruikerBordspel(){}

    //id
    public void setId(Long id) {this.id = id;}
    public Long getId() {return id;}

    //ordernr
    public int getOrdernr() { return ordernr;}
    public void setOrdernr(int ordernr) {this.ordernr = ordernr;}

    //spelid
    public void setSpelid(int spelid) {this.spelid = spelid;}
    public int getSpelid() {return spelid;}

    //gebruikerid
    public void setGebruikerid(int gebruikerid) {this.gebruikerid = gebruikerid;}
    public int getGebruikerid() {return gebruikerid;}

    //afhaaldatum
    public void setAfhaaldatum(LocalDate afhaaldatum) {this.afhaaldatum = afhaaldatum;}
    public LocalDate getAfhaaldatum() {return afhaaldatum;}

    //verwerkt
    public void setVerwerkt(boolean verwerkt) {this.verwerkt = verwerkt;}
    public boolean isVerwerkt() {return verwerkt;}

    //ishuur
    public void setIshuur(boolean ishuur) {this.ishuur = ishuur;}
    public boolean isIshuur() {return ishuur;}

    //aantal
    public void setAantal(int aantal) {this.aantal = aantal;}
    public int getAantal() {return aantal;}


}

