package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.GebruikerBordspel;

import java.util.List;

public interface GebruikerBordspelService
{
    GebruikerBordspel getGebruikerBordspelById(Long id);
    List<GebruikerBordspel> getGebruikerBordspellen();
    List<GebruikerBordspel> getGebruikerBordspellenNietVerwerkt();
    GebruikerBordspel addGebruikerBordspel(GebruikerBordspel gebruikerBordspel);
    public void deleteGebruikerBordspel(Long id);
}
