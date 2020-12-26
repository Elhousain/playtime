package be.thomasmore.graduaten.playtime.entity;

import be.thomasmore.graduaten.playtime.repository.GebruikerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;

public class ShopmeUserDetailsService implements UserDetailsService {

    @Autowired
    private GebruikerRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Gebruiker gebruiker = userRepository.getGebruikerByEmail(email);
        if (gebruiker == null) {
            throw new UsernameNotFoundException("Could not find user with that email");
        }

        return new ShopmeUserDetails(gebruiker);
    }
}