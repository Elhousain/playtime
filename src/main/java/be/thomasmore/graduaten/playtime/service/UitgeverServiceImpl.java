package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Uitgever;
import be.thomasmore.graduaten.playtime.repository.UitgeverRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class UitgeverServiceImpl implements UitgeverService {
    @Autowired
   UitgeverRepository uitgeverRepository;

    @Override
    public Uitgever getUitgeverById(Long id) {
        return uitgeverRepository.getOne(id);
    }

    @Override
    public List<Uitgever> getUitgevers() {
        return uitgeverRepository.findAll();
    }

    @Override
    public Uitgever addUitgever(Uitgever uitgever) {
        return uitgeverRepository.save(uitgever);
    }
}
