package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Spel;
import be.thomasmore.graduaten.playtime.entity.Uitgever;

import java.util.List;

public interface UitgeverService
{
    Uitgever getUitgeverById(Long id);
    List<Uitgever> getUitgevers();
    Uitgever addUitgever(Uitgever uitgever);
}
