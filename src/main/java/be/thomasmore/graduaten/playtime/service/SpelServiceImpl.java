package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Spel;
import be.thomasmore.graduaten.playtime.repository.SpelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpelServiceImpl implements SpelService  {

    @Autowired
    SpelRepository spelRepository;

    @Override
    public Spel getSpelById(Long id) {
        return spelRepository.getOne(id);
    }

    @Override
    public List<Spel> getSpellen(String keyword){
        if (keyword != null){
            return spelRepository.search(keyword);
        }
        return spelRepository.findAll();
    }

    @Override
    public List <Spel> getSpellenActief(String keyword){
        if (keyword != null){
            return spelRepository.getSpellenActief(keyword);
        }
        return spelRepository.getSpellenActief("");
    }

    @Override
    public Spel addSpel(Spel spel) {
        return spelRepository.save(spel);
    }

    @Override
    public void deleteSpel(Long id) { spelRepository.deleteById((long) id);
    }
}
