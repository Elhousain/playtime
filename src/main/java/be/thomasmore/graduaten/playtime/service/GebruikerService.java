package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface GebruikerService {
    Gebruiker getGebruikerById(Long id);
    List<Gebruiker> getGebruikers();
    Gebruiker addGebruiker (Gebruiker gebruiker);
}
