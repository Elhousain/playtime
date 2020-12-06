package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.GebruikerBordspel;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


public interface GebruikerBordspelService
{
    GebruikerBordspel getGebruikerBordspelById(Long id);
    List<GebruikerBordspel> getGebruikerBordspellen();
    GebruikerBordspel addGebruikerBordspel(GebruikerBordspel gebruikerBordspel);
    public void deleteGebruikerBordspel(Long id);
}
