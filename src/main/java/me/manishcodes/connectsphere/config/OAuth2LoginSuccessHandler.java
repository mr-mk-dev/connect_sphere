package me.manishcodes.connectsphere.config;

import java.io.IOException;

import org.redisson.api.RBloomFilter;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import me.manishcodes.connectsphere.entity.User;
import me.manishcodes.connectsphere.enums.AccountStatus;
import me.manishcodes.connectsphere.enums.UserRole;
import me.manishcodes.connectsphere.repository.UserRepo;

@Component
@RequiredArgsConstructor
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private final RBloomFilter<String> bloomFilter;
    private final UserRepo userRepo;
    private final AuthUtil authUtil;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException {

        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();

        String email = oAuth2User.getAttribute("email");
        String googleId = oAuth2User.getAttribute("sub");
        String name = oAuth2User.getAttribute("name");
        String picture = oAuth2User.getAttribute("picture");
        if (email == null || googleId == null) {
            throw new RuntimeException("Invalid data from Google");
        }

        String baseUsername = email.split("@")[0];
        String tokenToFrontend;
        User existingUser = userRepo.findByEmail(email).orElse(null);

        if (existingUser != null) {
            tokenToFrontend = authUtil.getToken(existingUser);
        } else {
            String username = generateUsername(baseUsername);

            User newUser = User.builder()
                    .email(email)
                    .userName(username)
                    .password(null) // IMPORTANT
                    .fullName(name != null ? name : "User")
                    .profilePic(picture)
                    .emailVerified(true)
                    .build();

            User savedUser = saveUser(newUser); 

            tokenToFrontend = authUtil.getToken(savedUser);
        }

        String redirectUrl = "http://localhost:3000/oauth2/callback?token=" + tokenToFrontend;
        getRedirectStrategy().sendRedirect(request, response, redirectUrl);
    }

    public String generateUsername(String base) {

        int suffix = 0;

        while (true) {
            String username = (suffix == 0) ? base : base + suffix;

            // ✅ Bloom says definitely NOT exists
            if (!bloomFilter.contains(username)) {
                return username;
            }

            // ❗ Bloom says maybe → confirm with DB
            if (!userRepo.existsByUserName(username)) {
                return username;
            }

            suffix++;
        }
    }

    public User saveUser(User user) {

        int attempts = 0;
        String base = user.getUsername();

        while (attempts < 10) {
            try {
                User saved = userRepo.save(user);
                bloomFilter.add(saved.getUsername());

                return saved;

            } catch (DataIntegrityViolationException e) {

                String newUsername = generateUsername(base);
                user.setUserName(newUsername);

                attempts++;
            }
        }

        throw new RuntimeException("Failed to save user after retries");
    }
}