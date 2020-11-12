package be.thomasmore.graduaten.playtime.entity;

import javax.persistence.*;
import java.sql.Date;

@Entity

public class Spel
{
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    private String naam;
    private String foto;
    private double prijs;
    private String beschrijving;
    private int categorie;
    private int min_spelers;
    private int max_spelers;
    private int min_leeftijd;
    private int taal;
    private int uitgever;
    private int status;
    private int voorraad_huur;
    private int voorraad_koop;


    //constructor
    public Spel()
    {

    }

    //id
    public void setId(Long id){this.id = id;}
    public Long getId() { return id; }
    //naam
    public void setNaam(String naam) { this.naam = naam; }
    public String getNaam() { return naam; }
    //foto
    public void setFoto(String foto) { this.foto = foto; }
    public String getFoto() { return foto; }
    //prijs
    public void setPrijs(double prijs) { this.prijs = prijs; }
    public double getPrijs() { return prijs;}
    //beschrijving
    public void setBeschrijving(String beschrijving) { this.beschrijving = beschrijving; }
    public String getBeschrijving() { return beschrijving; }
    //catagorie
    public void setCategorie(int categorie) { this.categorie = categorie;}
    public int getCategorie() { return categorie; }
    //min_spelers
    public void setMin_spelers(int min_spelers) { this.min_spelers = min_spelers; }
    public int getMin_spelers() { return min_spelers; }
    //max_spelers
    public void setMax_spelers(int max_spelers) { this.max_spelers = max_spelers; }
    public int getMax_spelers() { return max_spelers; }
    //min_leeftijd
    public void setMin_leeftijd(int min_leeftijd) { this.min_leeftijd = min_leeftijd; }
    public int getMin_leeftijd() { return min_leeftijd; }
    //taal
    public void setTaal(int taal) { this.taal = taal; }
    public int getTaal() { return taal; }
    //uitgever
    public void setUitgever(int uitgever) { this.uitgever = uitgever; }
    public int getUitgever() { return uitgever; }
    //status
    public void setStatus(int status) { this.status = status; }
    public int getStatus() { return status; }
    //voorraad_huur
    public void setVoorraad_huur(int voorraad_huur) { this.voorraad_huur = voorraad_huur; }
    public int getVoorraad_huur() { return voorraad_huur; }
    //voorraad_koop
    public void setVoorraad_koop(int voorraad_koop) { this.voorraad_koop = voorraad_koop; }
    public int getVoorraad_koop() { return voorraad_koop; }
}
