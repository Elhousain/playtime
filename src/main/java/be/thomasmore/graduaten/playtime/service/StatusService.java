package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Status;
import java.util.List;

public interface StatusService {
    Status getStatusById(Long id);
    List<Status> getStatussen();
    Status addStatus(Status status);

}
