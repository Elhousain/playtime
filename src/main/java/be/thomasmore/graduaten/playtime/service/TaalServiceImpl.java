package be.thomasmore.graduaten.playtime.service;


import be.thomasmore.graduaten.playtime.entity.Taal;
import be.thomasmore.graduaten.playtime.repository.TaalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TaalServiceImpl implements TaalService {

    @Autowired
    TaalRepository taalRepository;

    @Override
    public Taal getTaalById(Long id) { return taalRepository.getOne(id); }

    @Override
    public List<Taal> getTalen() {
        return taalRepository.findAll();
    }

    @Override
    public Taal addTaal(Taal taal) {
        return taalRepository.save(taal);
    }
}

