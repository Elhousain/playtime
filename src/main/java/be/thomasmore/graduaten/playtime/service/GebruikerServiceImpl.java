package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import be.thomasmore.graduaten.playtime.repository.GebruikerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GebruikerServiceImpl implements GebruikerService {

    @Autowired
    GebruikerRepository gebruikerRepository;

    @Override
    public Gebruiker getGebruikerById(Long id) {
        return gebruikerRepository.getOne(id);
    }

    @Override
    public Gebruiker getGebruikerByEmail(String email) {
        return gebruikerRepository.getGebruikerByEmail(email);
    }

    @Override
    public List<Gebruiker> getGebruikers() {
        return gebruikerRepository.findAll();
    }

    @Override
    public Gebruiker addGebruiker(Gebruiker gebruiker) {
        return gebruikerRepository.save(gebruiker);
    }

    @Override
    public void deleteGebruiker(Long id) { gebruikerRepository.deleteById((long) id);
    }




}
