package be.thomasmore.graduaten.playtime.entity;

import javax.persistence.*;
import java.sql.Date;
        import java.util.List;

@Entity
public class Gebruiker {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;
    private String voornaam;
    private String achternaam;
    private Date geboortedatum;
    private String email;
    private String paswoord;
    private String telefoon;
    private String woonplaats;
    private String postcode;
    private String straat;
    private String huisnummer;
    //moet hier nog een verwijzing komen?


    public Gebruiker() {
    }

    public Gebruiker(String voornaam, String achternaam,  String email, String paswoord, String telefoon, String woonplaats, String postcode, String straat, String huisnummer) {
        //this.id = id;
        this.voornaam = voornaam;
        this.achternaam = achternaam;
        //this.geboortedatum = geboortedatum;
        this.email = email;
        this.paswoord = paswoord;
        this.telefoon = telefoon;
        this.woonplaats = woonplaats;
        this.postcode = postcode;
        this.straat = straat;
        this.huisnummer = huisnummer;
    } //Elhousain: Hebben we deze constructor nodig? Ik had em toegevoegd, omda k denk dat we em nodig hebbe

    public void setID(Long id) {this.id = id;}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getVoornaam() {
        return voornaam;
    }

    public void setVoornaam(String voornaam) {
        this.voornaam = voornaam;
    }

    public String getAchternaam() {
        return achternaam;
    }

    public void setAchternaam(String achternaam) {
        this.achternaam = achternaam;
    }

    public Date getGeboortedatum() {
        return geboortedatum;
    }

    public void setGeboortedatum(Date geboortedatum) {
        this.geboortedatum = geboortedatum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPaswoord() {
        return paswoord;
    }

    public void setPaswoord(String paswoord) {
        this.paswoord = paswoord;
    }

    public String getTelefoon() {
        return telefoon;
    }

    public void setTelefoon(String telefoon) {
        this.telefoon = telefoon;
    }

    public String getWoonplaats() {
        return woonplaats;
    }

    public void setWoonplaats(String woonplaats) {
        this.woonplaats = woonplaats;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getStraat() {
        return straat;
    }

    public void setStraat(String straat) {
        this.straat = straat;
    }

    public String getHuisnummer() {
        return huisnummer;
    }

    public void setHuisnummer(String huisnummer) {
        this.huisnummer = huisnummer;
    }

    @Override
    public String toString() {
        return voornaam +" " + achternaam;
    }
}
