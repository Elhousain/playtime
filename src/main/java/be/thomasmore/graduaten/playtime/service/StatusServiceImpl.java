package be.thomasmore.graduaten.playtime.service;

import be.thomasmore.graduaten.playtime.entity.Status;
import be.thomasmore.graduaten.playtime.repository.StatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class StatusServiceImpl implements StatusService{

    @Autowired
    StatusRepository statusRepository;

    @Override
    public Status getStatusById(Long id) {
        return statusRepository.getOne(id);
    }

    @Override
    public List<Status> getStatussen() {
        return statusRepository.findAll();
    }

    @Override
    public Status addStatus(Status status) {
        return statusRepository.save(status);
    }
}
