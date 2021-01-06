package be.thomasmore.graduaten.playtime.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;

@Entity
public class GebruikerBordspel
{
    public static final String NAME = "gebruikerbordspel";
    public static final String GEBRUIKER = "Gebruikerbordspel";
    public static final String ID = "Id";
    public static final String ORDERNR = "Ordernr";
    public static final String SPEL = "Spel";
    public static final String GEBRUIKERID = "Gebruikerid";
    public static final String AFHAALDATUM = "Afhaaldatum";
    public static final String VERWERKT = "Verwerkt";
    public static final String ISHUUR = "Ishuur";
    public static final String AANTAL = "Aantal";


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long  id;
    private int ordernr;
    @ManyToOne
    @JoinColumn(name = "spelid")
    private Spel spel;
    @ManyToOne
    @JoinColumn(name = "gebruikerid")
    private Gebruiker gebruiker;
    private LocalDate afhaaldatum;
    private boolean verwerkt;
    private boolean ishuur;
    private int aantal;

    //constructor
    public GebruikerBordspel() {}

    public GebruikerBordspel(int ordernr, Spel spel, Gebruiker gebruiker, LocalDate afhaaldatum, boolean verwerkt, boolean ishuur, int aantal) {
        this.ordernr = ordernr;
        this.spel = spel;
        this.gebruiker = gebruiker;
        this.afhaaldatum = afhaaldatum;
        this.verwerkt = verwerkt;
        this.ishuur = ishuur;
        this.aantal = aantal;
    }

    //id
    public void setId(Long id) {this.id = id;}
    public Long getId() {return id;}

    //ordernr
    public int getOrdernr() { return ordernr;}
    public void setOrdernr(int ordernr) {this.ordernr = ordernr;}

    //spel
    public Spel getSpel() { return spel;}
    public void setSpel(Spel spel) { this.spel = spel;}

    //gebruiker
    public Gebruiker getGebruiker() { return gebruiker; }
    public void setGebruiker(Gebruiker gebruiker) { this.gebruiker = gebruiker; }

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

