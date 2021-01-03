package be.thomasmore.graduaten.playtime.entity;

import javax.persistence.*;


@Entity

public class Spel
{
    public static final String GAME = "spel";
    public static final String ID = "Id";
    public static final String NAAM = "Naam";
    public static final String PRIJS = "Prijs";
    public static final String BESCHRIJVING = "Beschrijving";
    public static final String CATEGORIE = "Categorie";
    public static final String MIN_SPELERS = "Min_spelers";
    public static final String MAX_SPELERS = "Max_spelers";
    public static final String MIN_LEEFTIJD = "Min_leeftijd";
    public static final String TAAL = "Taal";
    public static final String UITGEVER = "Uitgever";
    public static final String STATUS = "Status";
    public static final String VOORRAAD_HUUR = "Voorraad_huur";
    public static final String VOORRAAD_KOOP = "Voorraad_koop";



    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    private String naam;
    private String foto;
    private double prijs;
    private String beschrijving;
    @ManyToOne
    @JoinColumn(name = "categorie")
    private Categorie categorie;
    private int min_spelers;
    private int max_spelers;
    private int min_leeftijd;
    @ManyToOne
    @JoinColumn(name = "taal")
    private Taal taal;
    @ManyToOne
    @JoinColumn(name = "uitgever")
    private Uitgever uitgever;
    @ManyToOne
    @JoinColumn(name = "status")
    private Status status;
    private int voorraad_huur;
    private int voorraad_koop;



    //constructor
    public Spel()
    {
    }

    public Spel(Long id, String naam, double prijs, String beschrijving, Categorie categorie, int min_spelers, int max_spelers, int min_leeftijd, Taal taal, Uitgever uitgever, Status status, int voorraad_huur, int voorraad_koop) {
        this.id = id;
        this.naam = naam;
        this.prijs = prijs;
        this.beschrijving = beschrijving;
        this.categorie = categorie;
        this.min_spelers = min_spelers;
        this.max_spelers = max_spelers;
        this.min_leeftijd = min_leeftijd;
        this.taal = taal;
        this.uitgever = uitgever;
        this.status = status;
        this.voorraad_huur = voorraad_huur;
        this.voorraad_koop = voorraad_koop;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNaam() {
        return naam;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public double getPrijs() {
        return prijs;
    }

    public void setPrijs(double prijs) {
        this.prijs = prijs;
    }

    public String getBeschrijving() {
        return beschrijving;
    }

    public void setBeschrijving(String beschrijving) {
        this.beschrijving = beschrijving;
    }

    public Categorie getCategorie() {
        return categorie;
    }

    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }

    public int getMin_spelers() {
        return min_spelers;
    }

    public void setMin_spelers(int min_spelers) {
        this.min_spelers = min_spelers;
    }

    public int getMax_spelers() {
        return max_spelers;
    }

    public void setMax_spelers(int max_spelers) {
        this.max_spelers = max_spelers;
    }

    public int getMin_leeftijd() {
        return min_leeftijd;
    }

    public void setMin_leeftijd(int min_leeftijd) {
        this.min_leeftijd = min_leeftijd;
    }

    public Taal getTaal() {
        return taal;
    }

    public void setTaal(Taal taal) {
        this.taal = taal;
    }

    public Uitgever getUitgever() {
        return uitgever;
    }

    public void setUitgever(Uitgever uitgever) {
        this.uitgever = uitgever;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public int getVoorraad_huur() {
        return voorraad_huur;
    }

    public void setVoorraad_huur(int voorraad_huur) {
        this.voorraad_huur = voorraad_huur;
    }

    public int getVoorraad_koop() {
        return voorraad_koop;
    }

    public void setVoorraad_koop(int voorraad_koop) {
        this.voorraad_koop = voorraad_koop;
    }
}
