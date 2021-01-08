package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.GebruikerBordspel;
import be.thomasmore.graduaten.playtime.entity.Spel;
import be.thomasmore.graduaten.playtime.repository.GebruikerBordspelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.io.Serializable;
import java.util.List;

@Service

public class GebruikerBordspelServiceImpl implements GebruikerBordspelService, Serializable {

    @Autowired
    GebruikerBordspelRepository gebruikerBordspelRepository;

    @Override
    public  GebruikerBordspel getGebruikerBordspelById(Long id){
        return gebruikerBordspelRepository.getOne(id);
    }

    @Override
    public List<GebruikerBordspel>getGebruikerBordspellen(){ return gebruikerBordspelRepository.findAll(); }

    @Override
    public List<GebruikerBordspel> getGebruikerBordspellenNietVerwerkt() {
        return gebruikerBordspelRepository.getGebruikerBordspellenNietVerwerkt();
    }

  /*  @Override
    public List<GebruikerBordspel> getGebruikerBordspellenPerGebruiker(Long id) {
        return gebruikerBordspelRepository.getGebruikerBordspellenPerGebruiker();
    }*/



    @Override
    public GebruikerBordspel addGebruikerBordspel(GebruikerBordspel gebruikerBordspel){
        return gebruikerBordspelRepository.save(gebruikerBordspel);
    }
    @Override
    public  void  deleteGebruikerBordspel(Long id){
        gebruikerBordspelRepository.deleteById((long)id);
    }

}
