package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Taal;


import java.util.List;

public interface TaalService
{
    Taal getTaalById(Long id);
    List<Taal> getTalen();
    Taal addTaal(Taal taal);
}
