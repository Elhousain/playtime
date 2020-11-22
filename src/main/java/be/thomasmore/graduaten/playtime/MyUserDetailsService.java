package be.thomasmore.graduaten.playtime;

import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import be.thomasmore.graduaten.playtime.entity.MyUserDetails;
import be.thomasmore.graduaten.playtime.repository.GebruikerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MyUserDetailsService implements UserDetailsService {
    @Autowired
    GebruikerRepository gebruikerRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Optional<Gebruiker> gebruiker = gebruikerRepository.findByEmail(email);

        gebruiker.orElseThrow(()-> new UsernameNotFoundException("not found: " + email));

        return gebruiker.map(MyUserDetails::new).get();
    }
}
