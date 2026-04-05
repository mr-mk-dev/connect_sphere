package me.manishcodes.connectsphere.config;

import java.io.IOException;

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

    private final UserRepo userRepo;
    private final AuthUtil authUtil;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException {

        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();

        String email = oAuth2User.getAttribute("email");
        String name = oAuth2User.getAttribute("name");
        String picture = oAuth2User.getAttribute("picture");

        User user = userRepo.findByEmail(email)
                .orElseGet(() -> {
                    User newUser = User.builder()
                            .email(email)
                            .userName(email.split("@")[0]) 
                            .password("")                  
                            .fullName(name)
                            .profilePic(picture)
                            .role(UserRole.USER)
                            .status(AccountStatus.ACTIVE)
                            .build();
                    return userRepo.save(newUser);
                });

        
        String token = authUtil.getToken(user);

        String redirectUrl = "http://localhost:3000/oauth2/callback?token=" + token;
        getRedirectStrategy().sendRedirect(request, response, redirectUrl);
    }
}

