package me.manishcodes.connectsphere.service;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import me.manishcodes.connectsphere.repository.UserRepo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
    private final UserRepo userRepo;

    @Override
    public UserDetails loadUserByUsername(@NonNull String username) throws UsernameNotFoundException {
        return userRepo.findByUserName(username)
                .orElseThrow(() -> new UsernameNotFoundException(
                        "User not found with User name : " + username
                ));
    }
}
