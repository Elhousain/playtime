package be.thomasmore.graduaten.playtime.entity;



import java.util.*;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class ShopmeUserDetails implements UserDetails {
    private Gebruiker user;

    public ShopmeUserDetails(Gebruiker user) {
        this.user = user;
    }

    public String getFullName() {
        return this.user.getVoornaam() + " " + this.user.getAchternaam();
    }



    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
       // Set<Role> roles = user.getRoles();
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();

        /*for (Role role : roles) {
            authorities.add(new SimpleGrantedAuthority(role.getName()));
        }*/
        return authorities;
    }

    @Override
    public String getPassword() {
        return user.getPaswoord();
    }

    @Override
    public String getUsername() {
        return user.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return user.isEnabled();
    }
}