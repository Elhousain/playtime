package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import be.thomasmore.graduaten.playtime.entity.GebruikerBordspel;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface GebruikerBordspelService
{
    GebruikerBordspel getGebruikerBordspelById(Long id);
    List<GebruikerBordspel> getGebruikerBordspellen();
    List<GebruikerBordspel> getGebruikerBordspellenNietVerwerkt();

    GebruikerBordspel addGebruikerBordspel(GebruikerBordspel gebruikerBordspel);
    public void deleteGebruikerBordspel(Long id);

  //  List<GebruikerBordspel> getGebruikerBordspellenPerGebruiker(Long id);
}
