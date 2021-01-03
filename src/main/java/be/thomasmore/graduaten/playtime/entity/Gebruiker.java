package be.thomasmore.graduaten.playtime.entity;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@Entity
public class Gebruiker {
    public static final String NAME = "gebruiker";
    public static final String GEBRUIKER = "Gebruiker";
    public static final String ID = "Id";
    public static final String VOORNAAM = "Voornaam";
    public static final String ACHTERNAAM = "Familienaam";
    public static final String ROL = "Rol";
    public static final String EMAIL = "E-mailadres";
    public static final String PASWOORD = "Wachtwoord";
    public static final String GEBOORTEDATUM = "Geboortedatum";
    public static final String WOONPLAATS = "Gemeente";
    public static final String POSTCODE = "Postcode";
    public static final String STRAAT = "Straat";
    public static final String HUISNUMMER = "Huisnummer";
    public static final String TELEFOON = "Telefoon";


    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id;

    private String voornaam;
    private String achternaam;
    private String rol;
    private LocalDate geboortedatum;
    //private Date geboortedatum;
    private String email;
    private String paswoord;
    private String telefoon;
    private String woonplaats;
    private String postcode;
    private String straat;
    private String huisnummer;

    public Gebruiker() {
    }

    public Gebruiker(String voornaam, String achternaam, String rol, LocalDate geboortedatum, String email, String paswoord, String telefoon, String woonplaats, String postcode, String straat, String huisnummer) {
        //this.id = id;
        this.voornaam = voornaam;
        this.achternaam = achternaam;
        this.rol=rol;
        this.geboortedatum = geboortedatum;
        this.email = email;
        this.paswoord = paswoord;
        this.telefoon = telefoon;
        this.woonplaats = woonplaats;
        this.postcode = postcode;
        this.straat = straat;
        this.huisnummer = huisnummer;
    } //Elhousain: Hebben we deze constructor nodig? Ik had em toegevoegd, omda k denk dat we em nodig hebbe

    public void setId(Long id) {this.id = id;}

    public Long getId() {
        return id;
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

    public LocalDate getGeboortedatum() {
        return geboortedatum;
    }

    public void setGeboortedatum(LocalDate geboortedatum) {
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

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    @Override
    public String toString() {
        return voornaam +" " + achternaam;
    }

    public boolean isEnabled() {
        return true;
    }




    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Gebruiker gebruiker = (Gebruiker) o;
        return id.equals(gebruiker.id);
    }




    @Override
    public int hashCode() {
        return Objects.hash(id);
    }









}
