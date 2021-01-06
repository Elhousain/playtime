package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Spel;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface SpelService {
    Spel getSpelById(Long id);

    List<Spel> getSpellen(String keyword);
    List<Spel> getSpellenActief(String keyword);

    Spel addSpel(Spel spel);

    public void deleteSpel(Long id);


}
